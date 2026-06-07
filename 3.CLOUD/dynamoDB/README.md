## AWS DynamoDB
- this is NoSQL DB with tables in it but no relationship like SQL
- Search and click dynamoDB in aws console services
- click on create table
- give table name
- give primary key (partition key and sort key) `EG. id-string`
- click on create table

### working with dynamoDB on Nextjs App
- create Nextjs App 
- install `@aws-sdk/client-dynamodb @aws-sdk/lib-dynamodb`
- create Access key in aws and store in env 
```
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
```
- follow up this blog: https://levelup.gitconnected.com/building-a-next-js-dynamodb-crud-app-4bb2afe0d2f6
9`