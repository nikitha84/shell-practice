using ec2 instance create multiple instance through AWS CLI
# aws ec2 run-instances \
#     --image-id <ami-id> \
#     --count 1 \
#     --instance-type <instance-type> \
#     --key-name <key-pair-name> \
#     --security-group-ids <security-group-id> \
#     --subnet-id <subnet-id> \
#     --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=<instance-name>}]'

aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro --security-group-ids sg-07c8acf3fa6b923fa --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Linux}]'
