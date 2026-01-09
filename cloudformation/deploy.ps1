# Script Deploy cho Nhom 19 (Windows)
$StackName = "Stack-Nhom19-Pro"
$S3Bucket = "cf-templates-nhom19-" + (Get-Random)
$Region = "us-east-1" 

Write-Host "1. Dang tao S3 Bucket tam thoi de chua code..." -ForegroundColor Cyan
aws s3 mb s3://$S3Bucket --region $Region

Write-Host "2. Dang dong goi (Package) code len S3..." -ForegroundColor Cyan
aws cloudformation package `
    --template-file main.yaml `
    --s3-bucket $S3Bucket `
    --output-template-file packaged.yaml

Write-Host "3. Dang Deploy Stack (Co NAT Gateway nen se lau, tam 5 phut)..." -ForegroundColor Cyan
aws cloudformation deploy `
    --template-file packaged.yaml `
    --stack-name $StackName `
    --parameter-overrides file://parameters.json `
    --capabilities CAPABILITY_IAM `
    --region $Region

Write-Host "4. DONE! Ket qua:" -ForegroundColor Green
aws cloudformation describe-stacks `
    --stack-name $StackName `
    --query "Stacks[0].Outputs" `
    --output table