#!/bin/bash
# tested with the following version (aws --version) on macOS 10.12.3
# aws-cli/1.11.65 Python/2.7.10 Darwin/16.4.0 botocore/1.5.28

# the first argument should be the profile, the second argument should be the URL of the template
aws_profile=$1
cfn_template=$2

# the stack name is a 8 random alphanumeric characters
stack_name=`cat /dev/random |LC_CTYPE=C tr -dc "[:alpha:]" | head -c 8`

# the template file is assumed to be in the current directory
working_directory=`pwd`

aws --profile $1 --region us-east-1 cloudformation create-stack --stack-name $stack_name --template-body file://$working_directory//$2



