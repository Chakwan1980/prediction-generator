output "lambda_function_arn" {
    description = "The ARN of the Lambda function"
    value = aws_lambda_function.my_lambda_function.arn  // Cambia aquí
}
