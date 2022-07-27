# AWS Info

## Full command list
* https://docs.aws.amazon.com/cli/latest/reference/#available-services

## Set up
* `pip install awscli`
* Files in ~/.aws/
  * config
    ```
    [default]
    region = us-west-1
    output = json
    ```
    * if multiple configs/credentials change with
      * `export AWS_PROFILE=default`
  * credentials
    ```
    [default]
    aws_access_key_id = <info>
    aws_secret_access_key = <info>
    ```
* First test (nothing should be returned, and no error)
  * `aws s3 ls`

## AWS CLI S3 commands:
* `aws s3 ls --recursive s3://bucket_name`
* `aws s3 ls`
* `aws s3 ls s3://bucket_name/folder_name/folder_name`
* `aws s3 cp myfolder s3://mybucket/myfolder --recursive`
* `aws s3 sync <source_myfolder> s3://<target_bucket>/<target_folder> --exclude *.tmp`  # local and bucket sync
* `aws s3api list-objects-v2 --bucket "<bucket_name>" --query 'Contents[?LastModified > `YEAR-MONTH-DAY` && LastModified < `YEAR-MONTH-DAY`]' > ~/Desktop/out.txt` (one of those dates in inclusive, the other exclusive. believe a couple examples are "2020-05-13" and "2021-16-08:...somekind of date time")
* More info: https://www.shellhacks.com/aws-cli-s3-ls-list-buckets-objects-contents/

## AWS CLI Instance commands:
* `aws ec2 describe-instances`
* `aws ec2 start-instances --instance-ids i-1348636c`
* `aws sns publish --topic-arn arn:aws:sns:us-east-1:<rest_of_arn> --message "Script Failure"`
* `aws sqs receive-message --queue-url https://queue.amazonaws.com/<rest_of_url>`
* `aws help`
* `aws autoscaling help`
* `aws ec2 describe-volumes --region us-west-2 --filters Name=attachment.instance-id,Values=<instance_id>`
  * Describe current volume
* `aws ec2 create-snapshot --description “Hmm” --volume-id <old_volume_id> --tag-specifications 'ResourceType=snapshot,Tags=[ {Key=Creator,Value=JAFaas}]' --dry-run`
  * Create Snapshot volume
* `aws ec2 stop-instances --instance-ids <instance_id>`
  * Stop EC2 instance

## Vocab
* ALB vs ELB
