resource "yandex_storage_bucket" "nikiforov-roman-2025-07-31" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "nikiforov-roman-2025-07-31"
  acl = "public-read"
  folder_id = "b1g8idjusu652hr2ocgh"
  default_storage_class = "ICE"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.netology-key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
  website {
    index_document = "index.html"
    error_document = "error.html"
  } 
}

resource "yandex_storage_object" "image" {
  acl = "public-read"
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key 
  bucket = yandex_storage_bucket.nikiforov-roman-2025-07-31.bucket
  key    = "image.png"
  source = "./Screenshot_1.png"
}
resource "yandex_storage_object" "index" {
  acl = "public-read"
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key 
  bucket = yandex_storage_bucket.nikiforov-roman-2025-07-31.bucket
  key    = "index.html"
  source = "./index.html"
}
resource "yandex_storage_object" "error" {
  acl = "public-read"
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key 
  bucket = yandex_storage_bucket.nikiforov-roman-2025-07-31.bucket
  key    = "error.html"
  source = "./error.html"
}