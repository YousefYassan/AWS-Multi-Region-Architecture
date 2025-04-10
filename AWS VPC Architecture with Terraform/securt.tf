# resource "aws_secretsmanager_secret" "iti_sec" {
#   name = "iti_sec"
#   recovery_window_in_days  =0
# }
# resource "aws_secretsmanager_secret_version""iti_sec_v" {
#     secret_id = aws_secretsmanager_secret.iti_sec.id
#     secret_string = tls_private_key.rsa.private_key_pem

# }