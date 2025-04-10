resource "aws_key_pair" "deployer" {
  key_name   = "deployer-keytf"
  public_key = tls_private_key.rsa.public_key_openssh
}


# # ECDSA key with P384 elliptic curve
# resource "tls_private_key" "ecdsa-p384-example" {
#   algorithm   = "ECDSA"
#   ecdsa_curve = "P384"
# }

# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# # ED25519 key
# resource "tls_private_key" "ed25519-example" {
#   algorithm = "ED25519"
# }

resource "local_file" "deployer-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}