const AWS = require('aws-sdk'); 
const dynamodb = new AWS.DynamoDB.DocumentClient();

const handler = async (event) => {
  const predictionID = `pred-${Date.now()}`;  // Corregido el uso de $ con - 
  const { question, prediction } = event; 

  const params = {
    TableName: process.env.DYNAMODB_TABLE,  // Corregido el nombre de la variable
    Item: {
      predictionID,
      question,
      prediction
    }
  };

  try {
    await dynamodb.put(params).promise();
    return  {
      statusCode: 200,
      body: JSON.stringify({ message: "Prediction saved successfully", predictionID })  // Agregado una coma después de statusCode
    };
    
  } catch (error) {
    return {
      statusCode: 500, 
      body: JSON.stringify({ message: "Error saving prediction", error })  // Corregido el mensaje de error
    };
  }
};
