# Lab 1: Infrastructure as Code (AWS) - DevOps Nhóm 19

Dự án triển khai hạ tầng mạng (VPC), máy chủ (EC2) và NAT Gateway trên AWS sử dụng 2 công cụ IaC: **Terraform** và **CloudFormation**.



## Cấu trúc dự án

## 2. Cấu trúc dự án
```text
Lab1-DevOps-Nhom19/
├── cloudformation/     # Mã nguồn CloudFormation (YAML) & Scripts
├── terraform/          # Mã nguồn Terraform (HCL)
└── README.md           # Hướng dẫn sử dụng
```
3. Hướng dẫn chạy Terraform
Di chuyển vào thư mục Terraform:
cd terraform
Bước 1: Khởi tạo
terraform init

Bước 2: Xem trước kế hoạch (Plan)
terraform plan

Bước 3: Triển khai (Apply)
terraform apply -auto-approve

Bước 4: Hủy tài nguyên (Destroy)
terraform destroy -auto-approve

4. Hướng dẫn chạy CloudFormation
Di chuyển vào thư mục CloudFormation:
cd ../cloudformation

Bước 1: Triển khai (Deploy) Chạy script PowerShell (Windows):
.\deploy.ps1
Script sẽ tự động tạo S3 Bucket, đóng gói code (Nested Stacks) và deploy lên AWS.

Bước 2: Hủy tài nguyên (Destroy)
.\destroy.ps1

5. Kết quả kiểm thử (Test Cases)
Sau khi triển khai (bằng Terraform hoặc CloudFormation), hệ thống đạt được:

[] Public Subnet: Chứa Jump Server (Bastion Host).

[] Private Subnet: Chứa Database Server (Không có Public IP).

[] Connectivity:

SSH thành công vào Jump Server.

SSH từ Jump Server vào Database Server (sử dụng Key Pair).

Database Server kết nối được Internet thông qua NAT Gateway (Ping Google thành công).

