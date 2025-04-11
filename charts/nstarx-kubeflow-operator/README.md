# Kubeflow Operator Helm Chart

This Helm chart deploys the Kubeflow Kubernetes Operator to manage Kubeflow deployments using Helm charts.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.0+

## Installing the Chart

To install the chart with the release name `kubeflow-operator`:

```bash
# First, create a Docker image for the operator
docker build -t kubeflow-operator:latest .

# Then, install the Helm chart
helm install kubeflow-operator ./kubeflow-operator
```

## Uninstalling the Chart

To uninstall/delete the `kubeflow-operator` deployment:

```bash
helm delete kubeflow-operator
```

## Configuration

The following table lists the configurable parameters of the Kubeflow Operator chart and their default values.

| Parameter                         | Description                                                  | Default                          |
|-----------------------------------|--------------------------------------------------------------|----------------------------------|
| `replicaCount`                    | Number of operator replicas                                  | `1`                              |
| `image.repository`                | Operator image repository                                    | `kubeflow-operator`              |
| `image.pullPolicy`                | Operator image pull policy                                   | `IfNotPresent`                   |
| `image.tag`                       | Operator image tag                                           | `latest`                         |
| `serviceAccount.create`           | If true, create a service account                            | `true`                           |
| `serviceAccount.name`             | The name of the service account to use                       | `nil`                            |
| `rbac.create`                     | If true, create RBAC resources                               | `true`                           |
| `rbac.useClusterAdmin`            | If true, use cluster-admin role for full permissions         | `true`                           |
| `defaultKubeflowConfig.releaseName` | Default Helm release name for Kubeflow                     | `nstarx-kubeflow-operator`          |
| `defaultKubeflowConfig.namespace`   | Default namespace for Kubeflow                             | `default`                        |
| `defaultKubeflowConfig.repoName`    | Default Helm repository name                               | `murthy-repo`                    |
| `defaultKubeflowConfig.repoUrl`     | Default Helm repository URL                                | `https://murthy-karra.github.io/helm` |
| `defaultKubeflowConfig.chartName`   | Default Helm chart name                                    | `nstarx-kubeflow-operator`          |
| `defaultKubeflowConfig.chartVersion`| Default Helm chart version                                 | `0.0.1`                         |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

For example:

```bash
helm install kubeflow-operator ./kubeflow-operator \
  --set image.tag=v1.0.0 \
  --set defaultKubeflowConfig.namespace=kubeflow
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart:

```bash
helm install kubeflow-operator ./kubeflow-operator -f values.yaml
```