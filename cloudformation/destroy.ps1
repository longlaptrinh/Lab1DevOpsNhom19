$StackName = "Stack-Nhom19-Pro"
Write-Host "Dang huy diet Stack $StackName..." -ForegroundColor Red
aws cloudformation delete-stack --stack-name $StackName
Write-Host "Da gui lenh xoa. Doi vai phut roi vao AWS check."