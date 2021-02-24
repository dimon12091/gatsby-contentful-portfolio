pulumi stack init $1
pulumi config set aws:region $2
pulumi up -y
aws s3 sync ./www s3://$(pulumi stack output | grep bucket_name | cut -b 18-)/ 