locals {
  project    = "backstage-eks-test-2"
  aws_region = "ap-northeast-1"

  base_tags = {
    terraform = "true"
    eks       = "backstage-eks-test-2"
  }

  vpc = {
    name = "test-vpc"
    cidr = "10.0.0.0/16"

    azs = [
      "ap-northeast-1a",
      "ap-northeast-1c",
      "ap-northeast-1d"
    ]

    public_subnets = [
      "10.0.0.0/20",
      "10.0.16.0/20",
      "10.0.32.0/20",
    ]

    private_subnets = [
      "10.0.128.0/20",
      "10.0.144.0/20",
      "10.0.160.0/20",
    ]

    tags = {
      Terraform = "true",
    }
  }

  eks = {
    cluster_name    = "eks-test"
    cluster_version = "1.29"

    eks_managed_node_groups = {
      #"${local.project}" = {
      "example" = {
        min_size     = 1
        max_size     = 3
        desired_size = 3

        instance_types = [
          "m6i.xlarge"
        ]

        capacity_type = "SPOT"
      }
    }
  }
  
  eks_access_entry = {
    principal_type = "user"
    principal_name = "eks-test-user"
  }
}
