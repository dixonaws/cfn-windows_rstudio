# cfn-windows_rstudio
Cloudformation template (JSON) for a Windows box with RStudio installed, intended for use with AWS Service Catalog

Included is a simple bash script, provisionCloudFormation, which is just a wrapper around the cloudformation CLI.
Example with your template in the current directory:
    ./provisionCloudformation.sh dixonaws@amazon.com cfn-windows_rstudio.template.json

You can tear down a stack using the cloudformation CLI:
    aws --profile dixonaws@amazon.com --region us-east-1 cloudformation delete-stack --stack name [foo]

Of course, you'll need to define your AWS credential in your profile, per http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

The template creates the following resources:
<ul>
    <li>One EC2 instance with Windows 2012 R2</li>
    <li>One security group</li>
    <li>One elastic IP</li>
</ul>
<p>


Installed software:
<ul>
  <li>RStudio 1.10</li>
  <li>R 2.11.1</li>
  <li>Firefox</li>
  <li>Chrome</li>
</ul>

Configuration
<ul>
  <li>Security group with access to port tcp/3389 for RDP from 0.0.0.0/0 (anywhere)</li>
  <li>Login as Administrator with default password 1loveAWS!@# via RDP</li>
  <li>Clock configured to EST</li>
  <li>IE ESC off</li>      
 </ul>

The only parameter supported is KeyName: the name of the private key that will be used to access the instances created by the template. This key must exist before running the template.
<p>

TODO: add puppet manifest to build Ubuntu AMI with R and R Studio installed