resource "helm_release" "argocd" {
  name             = "argocd-release"
  namespace        = "argocd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo/argo-cd"

  values = [
    templatefile("argocd-values.yaml",
      {
        hostName = var.argocd_hostname
        password = var.argocd_password
      }
    )
  ]

}
