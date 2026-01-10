# Lab 1: Infrastructure as Code (AWS) - DevOps Nhóm 19

Dự án triển khai hạ tầng mạng (VPC), máy chủ (EC2) và NAT Gateway trên AWS sử dụng 2 công cụ IaC: **Terraform** và **CloudFormation**.

1. Chuẩn bị
   - Tìm IP Public của máy mình
   - Tạo Key Pair Trên AWS


## Cấu trúc dự án

## 2. Cấu trúc dự án
```text
Lab1-DevOps-Nhom19/
├── cloudformation/     # Mã nguồn CloudFormation (YAML) & Scripts
├── terraform/          # Mã nguồn Terraform (HCL)
└── README.md           # Hướng dẫn sử dụng
```
3. Hướng dẫn chạy Terraform
Di chuyển vào thư mục Terraform (Đã có file key .pem trong folder):
```
cd terraform
```
Bước 1: Khởi tạo
```
terraform init
```
Bước 2: Xem trước kế hoạch (Plan)
```
terraform plan
```
Bước 3: Triển khai (Apply)
```
terraform apply -auto-approve
```
Bước 4: Dùng SSH Key để kết nối
```
# Add SSH key to agent for forwarding
ssh-add <YOUR_KEY_PAIR_NAME>.pem

# Connect to bastion host
ssh -A -i <YOUR_KEY_PAIR_NAME>.pem ec2-user@<PUBLIC_IP>
```
Bước 5: Hủy tài nguyên (Destroy)
```
terraform destroy -auto-approve
```
4. Hướng dẫn chạy CloudFormation 
Sau khi đã sửa thông tin trong cloudformation/parameters.json. Di chuyển vào thư mục CloudFormation:
```
cd ../cloudformation
```
Bước 1: Triển khai (Deploy) Chạy script PowerShell (Windows):
```
.\deploy.ps1
```
Script sẽ tự động tạo S3 Bucket, đóng gói code (Nested Stacks) và deploy lên AWS.

Bước 2: Hủy tài nguyên (Destroy)
```
.\destroy.ps1
```

5. Kết quả kiểm thử (Test Cases)
Sau khi triển khai (bằng Terraform hoặc CloudFormation), hệ thống đạt được:

[✅] Public Subnet: Chứa Jump Server (Bastion Host).

[✅] Private Subnet: Chứa Database Server (Không có Public IP).

[✅] Connectivity:

SSH thành công vào Jump Server.

SSH từ Jump Server vào Database Server (sử dụng Key Pair).

Database Server kết nối được Internet thông qua NAT Gateway (Ping Google thành công).

