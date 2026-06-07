## AWS Lambda (serverless service)
- search and click lambda in aws console services
- click on create function
- select author from scratch
- give function name
- select runtime (nodejs, python, java, etc)
- click on create function
- write code in inline editor or upload zip file
- click on deploy
- test the function

### implementing Lambda function with api gateway
- create a Lambda function
```js
exports.handler = async (event) => {
  let name = "User";
  try {
    const body = typeof event.body === 'string' ? JSON.parse(event.body) : event.body;
    name = body.name || "User";
    return {
      statusCode: 200,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
      body: JSON.stringify({
        message: `Hello ${name}, your contact form was submitted successfully!`
      })
    }
  } catch (error) {
    console.error("Error parsing Data: ",error);
    return {
      statusCode: 400,
      body: JSON.stringify({ message: "Invalid input data" })
    }
  }
}
```
- deploy the function and go to configuration 
- select triggers and add trigger
- select API Gateway
- select REST API
- click create
- select created api and create resource
- create method POST, Lambda function
- toggle Lambda proxy integration
- region
- enable cors and deploy the api 
- copy the endpoint url an use in frontend where fetch or axios need endpoints
