#!/bin/bash

aws eks --region us-east-1 update-kubeconfig --name eks --profile default
kubectl apply -f loadbalancer/lb.yaml
kubectl apply -f dashboard/k8s_dashboard.yaml -n kubernetes-dashboard
kubectl create serviceaccount dashboard -n default
kubectl create clusterrolebinding dashboard-admin -n default --clusterrole=cluster-admin --serviceaccount=default:dashboard
#kubectl get secret $(kubectl get serviceaccount dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode
kubectl get svc -n kubernetes-dashboard
