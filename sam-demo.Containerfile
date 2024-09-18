FROM public.ecr.aws/lambda/python:3.9-x86_64
ADD aws-lambda-rie-x86_64 /var/rapid/
RUN mv /var/rapid/aws-lambda-rie-x86_64 /var/rapid/aws-lambda-rie && chmod +x /var/rapid/aws-lambda-rie