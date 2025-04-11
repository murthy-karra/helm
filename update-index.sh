#!/bin/bash

# Package charts from charts directory
for dir in charts/*/; do
  # For standard chart structure
  if [ -f "$dir/Chart.yaml" ]; then
    helm package "$dir" -d releases/
  # For nested chart structure
  elif [ -d "$dir/$(basename "$dir")" ] && [ -f "$dir/$(basename "$dir")/Chart.yaml" ]; then
    helm package "$dir/$(basename "$dir")" -d releases/
  # For spark-admin structure
  elif [ -d "$dir/chart" ] && [ -f "$dir/chart/Chart.yaml" ]; then
    helm package "$dir/chart" -d releases/
  fi
done

# Update index.yaml
helm repo index releases/ --url https://murthy-karra.github.io/helm/releases
mv releases/index.yaml .
