[![Build Status](https://dev.azure.com/eiti-demo/devops1/_apis/build/status/aws-apigwy-lambda-sam-terraform?branchName=master)](https://dev.azure.com/eiti-demo/devops1/_build/latest?definitionId=3&branchName=master)


# Pre-reqs:
Setup an s3 bucket for sam code
Setup an s3 bucket and DynamoDB table (key: LockID) for terraform state
Setup AWS IAM user and use the keys to add service connection in the azure devops project settings.

git clone <br>
cd sam/lambda-layer/nodejs<br>
npm init #Accept all defaults, package.json will be created<br>
npm install winston<br>
npm install jsonschema<br>
cd ../..  #From sam directory, make sure you have a sam code bucket and set it in tf var<br>
sam package --template-file sam-template.yaml --output-template-file sam-deploy.yaml --s3-bucket aws-sam-code-eiti<br>
cd ../terraform<br>
terraform init  #have another bucket ready for tf backend - <br>
terraform apply<br>
cd ../scripts<br>
npm install aws-sdk<br>
npm install ora<br>
export EMPLOYEES_DDB_TABLE="employees-api-table"<br>
export AWS_ACCESS_KEY_ID=""<br>
export AWS_SECRET_ACCESS_KEY=""<br>
export AWS_REGION="ap-southeast-2"<br>
node import-employees.js<br>

#
Test:<br>
curl -X POST \
  https://5pit40mft2.execute-api.ap-southeast-2.amazonaws.com/prod/getdata \
  -H 'Accept: application/json' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 37' \
  -H 'Content-Type: text/plain' \
  -H 'Host: g8teh3jbgd.execute-api.ap-southeast-2.amazonaws.com' \
  -H 'Postman-Token: 6e8bbb58-c87e-426a-a8a2-6fd5a918e053,1f2bdc04-c4a9-4824-9977-3cf8243ef5d4' \
  -H 'User-Agent: PostmanRuntime/7.15.2' \
  -H 'cache-control: no-cache' \
  -H 'x-api-key: F2iMhu5CLE6VwtBZ3eFp294QcYWOBsDc32wuSzsC' \
  -d '{
  "department": "Human Resources"
}'

curl -X POST \
  https://g8teh3jbgd.execute-api.ap-southeast-2.amazonaws.com/v1/putdata \
  -H 'Accept: application/json' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 131' \
  -H 'Content-Type: text/plain' \
  -H 'Host: g8teh3jbgd.execute-api.ap-southeast-2.amazonaws.com' \
  -H 'Postman-Token: a27962ad-48fe-4aeb-a9e2-b9194fc5206a,7b0c61d5-9a7b-453c-87b6-dd7666c0c454' \
  -H 'User-Agent: PostmanRuntime/7.15.2' \
  -H 'cache-control: no-cache' \
  -H 'x-api-key: 6cnwB3as2L8BUJKOcMrQu64UGNu9TgACefl5NYP3' \
  -d '{"firstname":"Kinna2","department":"Human Resources2","lastname":"Lugden","jobTitle":"Data Coordiator","email":"k2lugdeniw@goo.gl"}'
<br>
# Original repo:  https://github.com/kheriox-technologies/yt-lambda-rest-api-iac
