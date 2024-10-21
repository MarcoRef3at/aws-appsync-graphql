
locals {
  api_key_expiration = timeadd(timestamp(), "8760h")  # Sets the expiration to one year from now
}