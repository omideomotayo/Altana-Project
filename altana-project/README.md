# Run below commands to export environment variables for AWS Authentication
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"

# Terraform commands
Initialize directory and install necessary plugins
$ terraform init

Preview infrastructure to be deployed
$ terraform plan

Deploy infrastructure to AWS
$ terraform apply

# Deploy kubernetes resources
Command for search-api
$ helm install search-api altana-chart

Change the values in values.yaml for graph-api and run the below command
$ helm install graph-api altana-chart


If given more time, I would be able to troubleshoot any issues with the configurations by deploying to an AWS account and ensure everything was done correctly.

I would use more variables and place holders to improve usability of the code.
