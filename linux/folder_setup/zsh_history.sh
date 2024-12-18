[ 7 -gt 5 ] # this will return 0
[ 7 -lt 5 ] # this will return 1
[ "abc" = "def" ] # this will return 1
[ "abc" != "def" ] # this will return 0
[ "abc" != "abc" ] # this will return 1
[ -d "$HOME" ] # This will return 0 as directory exists
[ -n "$HOME" ] # This will return 0 as env var exists
[ -z "$HOME" ] # This will return 1 as env var exists

aws_sso_login
awscompleter

aws cloudwatch describe-alarms | jq '.MetricAlarms[] | select(.StateValue != "OK") | .AlarmName'

aws ec2 describe-instances help
aws ec2 describe-instances --filters Name=iam-instance-profile.arn,Values=<arn>
aws ec2 help
aws ec2 start-instances --instance-ids <instance_ids>
aws ec2 stop-instances --instance-ids <instance_id>

aws help --no-cli-pager

aws kafka describe-cluster-v2 --cluster-arn $(aws kafka list-clusters-v2 --no-cli-pager | jq -r '.ClusterInfoList[0].ClusterArn') | rg "State" # Get state of only

aws lambda get-function --function-name <function_name>

aws s3 cp fromFile s3://toBucket/toFileName
aws s3 cp s3://fromBucket/fromFolder/ toFolder/ --recursive
aws s3 ls s3://mybucket/path/ | awk '{print $4}'
aws s3 ls
aws s3 ls --recursive s3://bucket_name
aws s3 ls s3://bucket-name/
aws s3 ls s3://bucket-name/folder/
aws s3 sync myfolder s3://mybucket/myfolder --exclude *.tmp


aws sso login

aws secretsmanager get-secret-value --secret-id <secret_name> --no-cli-pager
aws secretsmanager list-secrets --filters Key=name,Values=<secret_name>

aws cloudtrail # eventnames => https://www.gorillastack.com/blog/real-time-events/cloudtrail-event-names/

aws ec2 describe-instances help
aws ec2 describe-instances --filters Name=iam-instance-profile.arn,Values=<arn>
aws ec2 describe-security-groups --filters "Name=group-name,Values=<sg_name>" --query="SecurityGroups[*].GroupId" | jq ".[0]"  | sed "s/\"//g"
aws ec2 help
aws ec2 start-instances --instance-ids <instance_ids>
aws ec2 stop-instances --instance-ids <instance_id>

aws eks describe-cluster --name <name of cluster>
aws eks list-clusters
aws eks list-clusters --no-cli-pager | jq -r '.clusters[]' | xargs -I {} sh -c "echo {}; aws eks describe-cluster --name {} | jq '.cluster.version'"
aws eks update-kubeconfig --name $(aws eks list-clusters --no-cli-pager | jq -r '.clusters[0]') # this will download the kubeconfig of the cluster to your config file if kubectx is activated

aws events list-rules --name-prefix <event-bridge-prefix>

aws help --no-cli-pager

aws iam attach-role-policy --role-name <role-name> --policy-arn arn:aws:iam::aws:policy/ElasticLoadBalancingReadOnly
aws iam get-role --role-name <role-name>
aws iam list-attached-role-policies --role-name <role-name>
aws iam list-groups # list all the user groups in your I my account
aws iam get-group # list the users in a specific user group
aws iam list-groups-for-user # To list all the user groups that a user is in

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
aws sts get-caller-identity > "$HOME/Desktop/temp_aws_sts.txt" || aws sso login

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

az login
az account list | jq '.[].name'
az account show | jq '.name'
az account set --subscription $(az account list | jq -r '.[0].name')
az --version
az storage account list | jq '.[].name' # List all storage accounts
az storage container list --account-name <StorageAccountName> --account-key <StorageAccountKey> --output table
az storage blob list --container-name <ContainerName> --account-name <StorageAccountName> --account-key <StorageAccountKey> --output table
az storage blob upload \
  --account-name mystorageaccount \
  --container-name mycontainer \
  --name myfile \
  --file /path/to/local/file


brew install aws-iam-authenticator
brew install awscli
brew install --cask docker
brew install gh && gh auth login && gh extension install github/gh-copilot && gh copilot explain "Did I get everything setup correctly?" && gh copilot suggest "Did I get everything setup correctly?"
brew install git
brew install jq
brew install kubernetes-cli
brew install kubectx
brew install kubens # this doesn't exist...there should be something else, right?
brew install kubent
brew install k9s
brew install python && python3 -m venv ~/.venv/py3venv1
brew install pipx && pipx install kube-shell
brew install rg
brew install stern
brew install zsh
brew install azure-cli && az login
brew update # update brew itself
brew upgrade # optional to specify a "package_name"

cat cert_file | openssl x509 -noout -enddate | sed -e 's/notAfter=//' # Certificate Age
cat > ~/Desktop/tempfiles/temp.json <<EOF\
{\
  "hello": "world"\
}\
EOF

cd ~/Code/
cdgitroot
chmod 0600 ~/.ssh/priv_key # User only read-4 and write-2
curl http://www.google.com/
curl wttr.in/Milton+KY
curl wttr.in/Santa+Clara
curl wttr.in/Xian
curl --socks5-hostname 127.0.0.1:<port_connected_on> <full_url_like_on_proxy_machine>
curl --netrc-file <netrc-cred-file> <URL>

declare -f # list all shell function names

date -u +"%Y-%m-%d--%T-%Z" # YYYY-MM-DD--HH-MM-SS-UTC
date +"%s" # epoch time
TZ=Asia/Shanghai date # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
dirname -- "${BASH_SOURCE[0]}" # In a script, list folder of script being run, different from pwd
dirname -- ~/.aws/config # List folder path for a specific file

# docker commands, a lot of them occur outside of actual docker application
docker pull docker.io/appdynamics/cluster-agent:latest # pull latest version of docker image
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin $ECR_URL # Docker login to AWS ECR
curl -s "https://registry.hub.docker.com/v2/repositories/appdynamics/cluster-agent/tags/" | jq '.results[].name' # list all tags for a docker image
aws ecr describe-images --repository-name $(aws ecr describe-repositories | jq -r '.repositories[0].repositoryName') | jq '.imageDetails[].imageTags' # list all tags for the first repo in AWS ECR
docker version
docker inspect $AWS_ECR_REF.dkr.ecr.us-west-2.amazonaws.com/$SPECIFIC_REPO:latest | grep Architecture # List architecture of docker image likely amd64 or arm64

sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder # Clear local DNS cache

echo "$?"
echo "defd" | grep -q "def" # returns true as def is a substring of defd
echo "Both stdout and stderr" &> file.txt # Note that you might need to be more explicit like "1>&2" to redirect stdout to stderr
export EXPORT_COMMAND_EX=$(date)
echo_exit_status
exit_status

for TEMP_FILE in "$HOME"/*;do; echo $TEMP_FILE; done

find ~/Code/1/techology-notes -iname '*md'
find ~/Code/1/techology-notes/ -name README.md

gh copilot explain "jq '.MetricAlarms[] | select(.StateValue != "OK") | .AlarmName'"
gh copilot suggest "Macbook sed command to remove ok_actions from terraform files"

git cherry-pick <git_commit_id>
git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
git reset --hard HEAD
gitpushall "commit_message" # git add . && git commit -m commit_message && git push
gitpush
gitpull
gitaddall
gitstatus
gitpullstash # stash, pull, stash pop
git stash
git stash pop
gitcommit
gitd
gitdiff
gitcheckpush "new_branch_name" # git checkout -b branch_name and git push to origin
gitcp git_commit_id # git cherry-pick git_commit_id
gitcherry # git cherry-pick git_commit_id
git reset --hard HEAD~1 # use this if git randomly says you are ahead by 1 commit and you don't care about the supposed commit

git clone https://github.com/JasonFaas/techology-notes.git
git clone https://github.com/JasonFaas/docker-experiment.git

grep # to compare 2 strings, start with echo command

helm status master
helm upgrade --help
helm ls -a # current state of cluster
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx # name of the repo is typically the final part of the path
helm search repo ingress-nginx/ingress-nginx --versions # list all versions of https://kubernetes.github.io/ingress-nginx (logged as ingress-nginx in "repo add" command) for chart "ingress-nginx"
helm search repo ingress-nginx/ingress-nginx # list most recent chart "ingress-nginx" for url https://kubernetes.github.io/ingress-nginx which the url was logged as ingress-nginx in "repo add" command
#

jq '.[1]' # after input
jq '.[0][2]' # after input
jq '.[0].[0:3]' # after input
jq '.apiVersion'
jq "['AttachedPolicies']"
jq ".SecretList[*]"
jq '.[] | select(.id==6912)'
jq -r ".SecretList[] | .Name=='secret_list_name'" # "-r" removes quotations
jq '.MetricAlarms[] | select(.StateValue == "ALARM") | select(.AlarmName | contains "lambda")' # hmm, may not work
jq '.MetricAlarms[] | select(.StateValue != "OK") | .AlarmName' # comes after `aws cloudwatch describe-alarms`
jq ".[0]"  | sed "s/\"//g" # comes after `aws ec2 describe-security-groups --filters "Name=group-name,Values=<sg_name>" --query="SecurityGroups[*].GroupId"`
jq -r '.ClusterInfoList[].ClusterArn | select(contains("cluster_name"))' # from aws kafka list-clusters-v2
jq '.results[] | {name: .name, size: .full_size}' # example for when you want to select multiple fields. This specific example is from curl -s "https://registry.hub.docker.com/v2/repositories/appdynamics/cluster-agent/tags/?page_size=100"
jq '.[] | select (.name == "value_of_map_key")' # example for when you want to select a specific map based on a key value pair
jq -r '.spec.template.spec.containers[] | keys' # get keys from a dictionary

kubectl create namespace <namespace>
kubectl get deployments -A -o custom-columns=NAME:.metadata.name --no-headers
kubectl config view # view config file, will list all context options
kubectl config get-contexts
kubectl config use-context <fill_in_from_kctx_options> # same as kctx <fill_in>
kubectl describe pod <pod-name> --namespace <namespace>
kubectl describe ns # list details for all namespaces
kubectl cluster-info
kubectl edit deployment.apps <pod-prefix> --namespace <namespace>
kubectl edit deployment <pod-prefix> --namespace <namespace>
kubectl get all
kubectl get cm -n <namespace>
kubectl get cm <vuln-feed-config> -n argento-system -o yaml
kubectl get deployment <pod_prefix> -o yaml
kubectl get events
kubectl get jobs -A
kubectl get cronjobs -A
kubectl get pods -A
kubectl get pods --namespace <namespace>
kubectl get nodes -A
kubectl get ns
kubectl get svc -n <hmm>
kubectl delete pod <pod_name> -n <namespace>
kubectl logs -p <pod-name> --namespace <namespace>
kubectl logs -f <some_pod_from "kctl get all">

kctx -c # only the current context
kctx <environment to switch to>
kctx

kctl describe pod <pod-name> --namespace <namespace>
kctl edit deployment <pod-prefix> --namespace <namespace>
kctl get all
kctl get cm -n <namespace>
kctl get cm <vuln-feed-config> -n argento-system -o yaml
kctl get pods -A
kctl get pods --namespace <namespace>
kctl get nodes -A
kctl logs -p <pod-name> --namespace <namespace>
kctl logs -f <some_pod_from "kctl get all">
kubectl get deployments -n master -o custom-columns=NAME:.metadata.name --no-headers | xargs -I {} kubectl scale deployment -n master {} --replicas=0 # Set all deployments in master namespace to 0 pods
kubectl scale deploy -n master <deployment> --replicas=0 # will scale pods to 0 for specific deployment
kubectl version | grep "Server" # List version of k8s on current context
kubectl describe nodes | grep "Architecture" # List architecture of nodes in current context, likely arm64 or amd64

kubent # list all k8s deprecations

kns <namespace>

mkdir -p ~/level_1/level_2/
mkdir -p ~/level_1/level_2/


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
pip freeze

printf "${On_Blue}${White}Background and text color changed for eye-catching terminal output${Color_Off}\n"

realpath ${HOME}/Desktop # Get full absolute path of folder or file

rm -rf .terraform;tg init && say "init complete";tg apply
rmtf # Delete Terraform State file - .terraform/terraform.tfstate
rmtfa # Delete all hidden terraform files - .terraform*
rmtf && tgplan -no-color > ~/Desktop/${TERRAFORM_LOGS}/terraform_plan--$(date -u +"%Y-%m-%d--%H-%M-%Z")--${PWD##*/}.txt && tgapply
rmtf && tgplan -no-color > ~/Desktop/${TERRAFORM_LOGS}/terraform_plan--$(date -u +"%Y-%m-%d--%H-%M-%Z")--${PWD##*/}.txt

say "Failed again, try again soon."
say "Good News, Everyone!"
sed -i '' "s/~ resource/  resource/g" input.txt # Update file in place
set -e # next non-zero exit code will exit terminal
set +e # terminal will continue on non-zero exit code
set -x # print all executed commands - helps with debugging
set +x # do not print all executed commands - less code output when running shell scripts
set -u # error message will display when using unconfigured variable
set +u # do not display error message with unconfigured variable
set -v # original command will be output before running
set +v # do not re-state command just specified
source ~/.venv/py3venv1/bin/activate  # Activate virtual environment
ssh -i <private_key_file> <user>@<ec2-instance-id> # have to have ssm setup
ssh -i <private_key_file> <user>@<ec2-instance-id> -D <random_port> # curl --socks5-hostname 127.0.0.1:<previous_port> <full_url_like_on_proxy_machine,including_port>
ssh <ip> "sudo -- sh -c 'date; whoami; pwd; cd ~; pwd'" # run ssh commands as `sudo`
ssh -p <port> <user>@<ip_address>
ssh <user>@<ip> "echo 'command_string';pwd;ls"
ssh-add -k ~/.ssh/id_rsa
ssh-add -l
say "Failed again, try again soon."
say "Good News, Everyone!"
set -e # next non-zero exit code will exit terminal
source ~/.venv/py3venv1/bin/activate  # Activate virtual environment
ssh -i <private_key_file> <user>@<ec2-instance-id> # have to have ssm setup
ssh -i <private_key_file> <user>@<ec2-instance-id> -D <random_port> # curl --socks5-hostname 127.0.0.1:<previous_port> <full_url_like_on_proxy_machine,including_port>
ssh <ip> "sudo -- sh -c 'date; whoami; pwd; cd ~; pwd'" # run ssh commands as `sudo`
ssh -p <port> <user>@<ip_address>
ssh <user>@<ip> "echo 'command_string';pwd;ls"
ssh-add -k ~/.ssh/id_rsa
ssh-add -l

sudo su # Option to get access switch to super user
sudo su - # Option to get access switch to super user, potentially within aws ec2 instance when connecting through session manager

terraform init
terraform plan
terraform plan --destroy
terraform -no-color > ~/Desktop/${TERRAFORM_LOGS}/terraform_plan--$(date -u +"%Y-%m-%d--%H-%M-%Z")--${PWD##*/}.txt
terraform apply
terraform apply -parallelism=1 # Changes default parallel tasks from 10 to 1
terraform destroy
terraform import <hmm> <something>
tf import aws_instance.web i-12345678 # example
tf import aws_cloudwatch_metric_alarm.my_alarm my_alarm_name # example
terraform state list # list all modules
terraform state mv <from> <to>
terraform state rm module.<fill_in_more_from_state_list> # remove a module, typically with prevent_destroy to skip over during tf destory
terraform state replace-provider registry.terraform.io/-/aws  registry.terraform.io/hashicorp/aws # Used commonly during terraform upgrades when providers update do not go through correctly

rmtf && tfi && tfplan

tga
tgimport
tgplan
tga1 # single threaded terragrunt apply
tg init
tg plan
tg plan --destroy
tg plan -no-color > ~/terraform_plan-$(date -u +"%Y-%m-%d--%T-%Z").txt
tg apply
tg apply -parallelism=1 # Changes default parallel tasks from 10 to 1
tg destroy
tg import '' ''
tg import <hmm> <something>
tg import "module.stuff.aws_cloudwatch_event_target.lambda_target" "<target_rule_name>/$(aws events list-targets-by-rule --rule <target_rule_name> | jq -r '.Targets[0].Id')" # Import aws_cloudwatch_event_target
tg state list # list all modules
tg state list > ~/Desktop/${TERRAFORM_LOGS}/terraform_state--$(date -u +"%Y-%m-%d--%H-%M-%Z")--${PWD##*/}.txt
tg state mv <from> <to>
tg state rm module.<fill_in_more_from_state_list> # remove a module, typically with prevent_destroy to skip over during tf destory
tgplan -no-color > ~/Desktop/${TERRAFORM_LOGS}/terraform_plan--$(date -u +"%Y-%m-%d--%H-%M-%Z")--${PWD##*/}.txt

test -d ${HOME}/Desktop # does the Desktop folder exist
test -e .git # True if file exists (regardless of type)
test -f ${HOME}/.zshrc # does the specific file exist

vagrant global-status
vagrant halt
vagrant plugin install plugin_name
vagrant scp local_file_or_dir vm_id:path_on_vm
vagrant ssh
vagrant ssh -c "pwd"
vagrant up

which python3
whoami

aws elbv2 describe-target-groups | jq -r '.TargetGroups[].TargetGroupArn' > ~/Desktop/tempfile.txt\
while IFS= read -r line; do\
  echo "$line"; aws elbv2 describe-target-health --target-group-arn=$line --no-cli-pager | jq '.TargetHealthDescriptions[].TargetHealth | select(.State != "healthy")'\
done < ~/Desktop/temp_elb_target_groups.txt

aws kafka list-clusters-v2 --no-cli-pager | jq -r '.ClusterInfoList[].ClusterArn' > $HOME/tempfile.txt;while IFS= read -r line; do\
  echo "$line"; aws kafka describe-cluster-v2 --cluster-arn $line | rg "State"\
done < $HOME/tempfile.txt

while IFS= read -r line; do\
  echo "$line"; aws elbv2 describe-target-health --target-group-arn=$line --no-cli-pager | jq '.TargetHealthDescriptions[].TargetHealth | select(.State != "healthy")'\
done < ~/Desktop/tempfile.txt


xargs -I {} echo {} # utilize this after a pipeline to take the multi-line output of previous command to run multiple commands here
xargs -I {} sh -c "echo {};ls -al {}" # utilize this command after a multi-line input. Running with sh allows for multiple commands to be run

yq e '.spec.template.spec.containers[0].args += ["-enable_offline_telemetry=true"]' -i inputfile.yaml # Add specific line to yaml file utilizing structure
yq e '.spec.template.spec.containers[0].args[] | select(. == "-cron_period=10m0s")' inputfile.yaml # Check if very specific line is a specific place in yaml structure
yq e '.spec.template.spec.containers[0].args[]' inputfile.yaml | grep -E '^-cron_period=' # Utilize yq to narrow down search if trying to be more generic and then utilize grep
grep -cron_period= inputfile.yaml # most generic search of yaml file instead of yq
