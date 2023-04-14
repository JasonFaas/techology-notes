aws cloudtrail # eventnames => https://www.gorillastack.com/blog/real-time-events/cloudtrail-event-names/

aws ec2 describe-instances help
aws ec2 describe-instances --filters Name=iam-instance-profile.arn,Values=<arn>
aws ec2 describe-security-groups --filters "Name=group-name,Values=<sg_name>" --query="SecurityGroups[*].GroupId" | jq ".[0]"  | sed "s/\"//g"
aws ec2 help
aws ec2 start-instances --instance-ids <instance_ids>
aws ec2 stop-instances --instance-ids <instance_id>

aws events list-rules --name-prefix <event-bridge-prefix>

aws help --no-cli-pager

aws iam attach-role-policy --role-name <role-name> --policy-arn arn:aws:iam::aws:policy/ElasticLoadBalancingReadOnly
aws iam get-role --role-name <role-name>
aws iam list-attached-role-policies --role-name <role-name>

aws lambda get-function --function-name <function_name>

aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,DbiResourceId]"

aws s3 cp fromFile s3://toBucket/toFileName
aws s3 cp s3://fromBucket/fromFolder/ toFolder/ --recursive
aws s3 ls
aws s3 ls --recursive s3://bucket_name
aws s3 ls s3://bucket-name/
aws s3 ls s3://bucket-name/folder/
aws s3 sync myfolder s3://mybucket/myfolder --exclude *.tmp

aws sts get-caller-identity

aws secretsmanager get-secret-value --secret-id <secret_name> --no-cli-pager
aws secretsmanager list-secrets --filters Key=name,Values=<secret_name>

aws --query # Examples: https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html
aws ec2 describe-volumes --query 'Volumes[*]'
aws ec2 describe-volumes --query 'Volumes[0]'
aws ec2 describe-volumes --query 'Volumes[0:2:1]'
aws ec2 describe-volumes --query 'Volumes[::2]'
aws ec2 describe-volumes --query 'Volumes[::-2]'
aws ec2 describe-volumes --query 'Volumes[*].Attachments'
aws ec2 describe-volumes --query 'Volumes[*].Attachments[*].State'


break_noise script_name
brew install aws-iam-authenticator
brew install awscli
brew install stern
brew install kubent
brew update
brew upgrade package_name

cat cert_file | openssl x509 -noout -enddate | sed -e 's/notAfter=//' # Certificate Age
cat > ~/Desktop/tempfiles/temp.json <<EOF\
{\
  "hello": "world"\
}\
EOF
cd ~/Code/
chmod 0600 ~/.ssh/priv_key # User only read-4 and write-2
curl wttr.in/Milton+KY
curl wttr.in/Santa+Clara
curl wttr.in/Xian
curl --socks5-hostname 127.0.0.1:<port_connected_on> <full_url_like_on_proxy_machine>
curl --netrc-file <netrc-cred-file> <URL>

date -u +"%Y-%m-%d--%T-%Z" # YYYY-MM-DD--HH-MM-SS-UTC
date +"%s" # epoch time
TZ=Asia/Shanghai date # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
dirname -- "${BASH_SOURCE[0]}" # In a script, list folder of script being run, different from pwd
dirname -- ~/.aws/config # List folder path for a specific file

echo "$?"
export EXPORT_COMMAND_EX=$(date)

for TEMP_FILE in "$HOME"/*;do; echo $TEMP_FILE; done

find ~/Code/techology-notes -iname '*md'
find ~/Code/techology-notes/ -name README.md

git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
git reset --hard HEAD

helm status master
helm upgrade --help
helm ls -a # current state of cluster

kctl config view # view config file, will list all context options
kctl config use-context <fill_in_from_kctx_options> # same as kctx <fill_in>
kctl describe pod <pod-name> --namespace <namespace>
kctl describe ns # list details for all namespaces
kctl cluster-info
kctl edit deployment.apps <pod-prefix> --namespace <namespace>
kctl edit deployment <pod-prefix> --namespace <namespace>
kctl get all
kctl get cm -n <namespace>
kctl get cm <vuln-feed-config> -n argento-system -o yaml
kctl get deployment <pod_prefix> -o yaml
kctl get events
kctl get pods -A
kctl get pods --namespace <namespace>
kctl get nodes -A
kctl get ns
kctl get svc -n <hmm>
kctl delete pod <pod_name> -n <namespace>
kctl logs -p <pod-name> --namespace <namespace>
kctl logs -f <some_pod_from "kctl get all">
kctl get jobs

kctx -c # only the current context
kctx <environment to switch to>
kctx

kubent # list all k8s deprecations

kns <namespace>

mkdir -p ~/level_1/level_2/

rm -rf .terraform;tg init && say "init complete";tg apply

pip freeze
pip install --upgrade pip
pip install --upgrade pip
pip install -r requirements.txt
pip install <library>
pip install awscli
printenv
printenv PWD
ps -ax
ps -ef
python3 --version
python3 -m venv ~/.venv/py3venv1  # Create virtual environment

say "Failed again, try again soon."
say "Good News, Everyone!"
sed -i '' "s/~ resource/  resource/g" input.txt # Update file in place
set -e # next non-zero exit code will exit terminal
set +e # terminal will continue on non-zero exit code
set -x # print all executed commands - helps with debugging
set +x # do not print all executed commands - less code output when running shell scripts
set -u # error message will display when using unconfigured variable
set +u # do not display error message with unconfigured variable
set -v # original command will be outputed before running
set +v # do not re-state command just specified
source ~/.venv/py3venv1/bin/activate  # Activate virtual environment
ssh -i <private_key_file> <user>@<ec2-instance-id> # have to have ssm setup
ssh -i <private_key_file> <user>@<ec2-instance-id> -D <random_port> # curl --socks5-hostname 127.0.0.1:<previous_port> <full_url_like_on_proxy_machine,including_port>
ssh <ip> "sudo -- sh -c 'date; whoami; pwd; cd ~; pwd'" # run ssh commands as `sudo`
ssh -p <port> <user>@<ip_address>
ssh <user>@<ip> "echo 'command_string';pwd;ls"
ssh-add -k ~/.ssh/id_rsa
ssh-add -l

terraform init
terraform plan
terraform plan --destroy
terraform plan -no-color > ~/terraform_plan-$(date -u +"%Y-%m-%d--%T-%Z").txt
terraform apply
terraform destroy
terraform import <hmm> <something>
terraform state list # list all modules
terraform state mv <from> <to>
terraform state rm module.<fill_in_more_from_state_list> # remove a module, typically with prevent_destroy to skip over during tf destory

vagrant global-status
vagrant halt
vagrant plugin install plugin_name
vagrant scp local_file_or_dir vm_id:path_on_vm
vagrant ssh
vagrant ssh -c "pwd"
vagrant up

which python3
whoami
