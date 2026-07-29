@echo off
echo [1/3] Installing Nginx Ingress Controller...
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace

echo [2/3] Deploying our Python App via Helm...
helm upgrade --install python-app ./path-to-your-python-app-chart

echo [3/3] Setting up port-forward...
start kubectl port-forward svc/ingress-nginx-ingress-nginx-controller -n ingress-nginx 80:80

echo Done! App is ready at http://localhost/api/v1/info