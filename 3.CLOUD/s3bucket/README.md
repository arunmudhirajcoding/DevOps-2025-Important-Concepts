
## S3 (Simple storage service)
- search and click s3 in aws console services
- select region
- click on create bucket
- click on bucket name
- check ACL enabled (not recommend for production) - ownership purpose. for production use IAM rules for access control
- uncheck block all public access (not recommed for production)
- enable versioning
- click on create bucket
- click on upload
- upload files
- click on file name
- click on make public using acl in actions
- click on copy url
- access the file using url

### addeding bucket policy
- select bucket and click on permission
- at bucket policy , click on edit
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowPublicRead",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:Getobject", #bucket store type
            "Resource": "arn:aws:s3:::devops-s3-354200/*" #source with bucket name
        }
    ]
}
```
### Integration of s3 in Nextjs app
- Build a nextjs app
- install aws-sdk package
- setup ENV
```
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
AWS_BUCKET_NAME=
```
- follow this blog: https://medium.com/@antoinewg/upload-a-file-to-s3-with-next-js-13-4-and-app-router-e04930601cd6


