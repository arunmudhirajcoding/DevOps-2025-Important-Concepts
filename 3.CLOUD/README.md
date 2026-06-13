# aws(Amazon Web Services)
### how to create account on aws
- we have aws free tier - click on create free account and enter details 
- provide billing details via visa card or upi

### Installation of AWS CLI
- go to https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- go to windows installation and click on link given there
- download the installer and run it
- verify the installation by running `aws --version`
- To know the user identity `aws sts get-caller-identity`

## IAM (Identity and Access Management)
- search and click on IAM in aws console services
- click on users tab
- click on create user
- enter username and click on next permissions
- click on attach policies directly
- search for administrator access and select it
- click on next tags
- click on next review
- click on create user
- click on download .csv file
- save the csv file in a safe place

### creating access key
- click on the IAM user and scroll down . click on security
- click on access key and select `Application running outside aws`
- click on create access key

### configuration of aws cli
- enter `aws configure`
- enter access key and secret key 
- enter region - `ap-south-1`
- enter format - `json`
- to verify - `aws configure list`
