module "eks_blueprints_addons" {

  depends_on = [ module.eks ]

  source            = "aws-ia/eks-blueprints-addons/aws"
  version           = "1.16.3"
  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  enable_ingress_nginx = true

  enable_argocd = true

  argocd = {
    name          = "argocd"
    chart_version = "5.29.1"
    repository    = "https://argoproj.github.io/argo-helm"
    namespace     = "argocd"
  
  }

}

  








