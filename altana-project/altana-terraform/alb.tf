module "load_balancer_controller" {
  source = "git::https://github.com/DNXLabs/terraform-aws-eks-lb-controller.git"

  #cluster_name = module.eks.cluster_id
  
  
  cluster_name = element(module.eks.*.cluster_id, 0)

  cluster_identity_oidc_issuer_arn = element(module.eks.*.oidc_provider_arn, 0)#module.eks.oidc_provider_arn
  cluster_identity_oidc_issuer     = element(module.eks.*.cluster_oidc_issuer_url, 0)#module.eks.cluster_oidc_issuer_url


}