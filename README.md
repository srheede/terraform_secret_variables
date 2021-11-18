Creates KMS key and SOPS data resource to encrypt JSON file.
Then creates secret in Secrets Manager and adds encrypted JSON values to secret.

To create JSON file with encrypted values run the following command:
sops --kms "ARN for KMS Key" --aws-profile "AWS Profile Name" secrets.json 