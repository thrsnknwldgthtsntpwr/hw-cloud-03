terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = "ru-central1-a"
  token  = var.yc_token
  cloud_id  = "b1gmrdbulmjk5vov6tbl"
  folder_id = "b1g8idjusu652hr2ocgh"
}

resource "yandex_iam_service_account" "sa" {
     name        = "sa"
     description = "Сервисный аккаунт для hw-cloud-03"
   }

resource "yandex_resourcemanager_folder_iam_member" "sa-admin" {
  folder_id = "b1g8idjusu652hr2ocgh"
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_kms_symmetric_key_iam_binding" "encrypter_decrypter" {
  symmetric_key_id = yandex_kms_symmetric_key.netology-key.id
  role             = "kms.keys.encrypterDecrypter"
  members          = ["serviceAccount:${yandex_iam_service_account.sa.id}"]
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
}

variable "yc_token" {
  type = string
  sensitive = true
}