resource "yandex_kms_symmetric_key" "netology-key" {
  name              = "netology-key"
  default_algorithm = "AES_256"
  rotation_period  = "8760h"
}