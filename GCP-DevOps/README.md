# GOOGLE CLOUD PLATFORM
- GCP is a cloud computing platform that provides a range of services including compute, storage, networking, and machine learning.

# Adding security IAM
- Go to https://console.cloud.google.com
- Click on IAM & Admin
- click workload identity federation
- click create workload identity pool
- give it a name
- click create
- click create provider (OIDC)
- give it a name
- issuer URL: https://token.actions.githubusercontent.com
- configure provider attributes
```
Google1: assertion.sub
OIDC1: assertion.sub

Google2: attribute.repository
OIDC2: assertion.repository

Google3: attribute.actor
OIDC3: assertion.actor
```
- click next
- select google cloud
- click next
- click create
