resource "aws_kms_key" "sops_key" {
  description = "KMS key to ecrypt secrets using SOPS"
}

resource "aws_kms_alias" "sops_key_alias" {
  name          = "alias/sops_key"
  target_key_id = aws_kms_key.sops_key.key_id
}

resource "aws_secretsmanager_secret" "secretsmanager_secrets" {
  name = "datadog_secrets"
}

resource "aws_secretsmanager_secret_version" "secretsmanager_secrets_version" {
  secret_id     = aws_secretsmanager_secret.secretsmanager_secrets.id
  secret_string = jsonencode(data.sops_file.sops_secret.data)
}