terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.21.1"
    }
  }
}

provider "mongodbatlas" {
    public_key  = var.mongodb_atlas_public_key
    private_key = var.mongodb_atlas_private_key
}

resource "mongodbatlas_project" "project" {
    name = "My Project"
    org_id = var.mongodb_atlas_org_id
}

resource "mongodbatlas_cluster" "cluster" {
    project_id   = mongodbatlas_project.project.id
    name         = "MyCluster"
    cluster_type = "REPLICASET"
    provider_name = "AWS"
    provider_region_name = "US_EAST_1"
    provider_instance_size_name = "M10"
}

resource "mongodbatlas_database_user" "db_user" {
    project_id = mongodbatlas_project.project.id
    username   = "myUser"
    password   = "myPassword"
    auth_database_name = "admin"
    roles {
        role_name     = "readWrite"
        database_name = "admin"
    }
}

variable "mongodb_atlas_public_key" {}
variable "mongodb_atlas_private_key" {}
variable "mongodb_atlas_org_id" {}