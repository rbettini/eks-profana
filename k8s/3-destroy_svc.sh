#!/bin/sh

kubectl delete --ignore-not-found=true -f loadbalancer/lb.yaml
kubectl delete --ignore-not-found=true -f kube-prometheus/manifests/grafana-service.yaml
kubectl delete --ignore-not-found=true -f kube-prometheus/manifests/prometheus-service.yaml 
kubectl delete svc kubernetes-dashboard -n kubernetes-dashboard