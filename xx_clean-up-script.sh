#!/bin/bash

# WIP

set -xu

export _common='check-serverless-neg'

array-lb=(
    forwarding-rules delete ${_common}-https-content-rule --global
    target-https-proxies delete ${_common}-https-proxy
    ssl-certificates delete ${_common}-www-ssl-cert
    url-maps remove-path-matcher ${_common}-url-map --path-matcher-name=${_common}-path-matcher
    url-maps delete ${_common}-url-map
    backend-services delete ${_common}-backend-service-app  --global
    backend-services delete ${_common}-backend-service-func --global
    backend-services delete ${_common}-backend-service-run  --global
)

for i in ${array-lb[@]}; do
    echo "gcloud beta $i -q"
    sleep 5
done



# gcloud beta compute forwarding-rules delete ${_common}-https-content-rule --global && \

# gcloud beta compute target-https-proxies delete ${_common}-https-proxy

# gcloud beta compute ssl-certificates delete ${_common}-www-ssl-cert 

# gcloud beta compute url-maps remove-path-matcher ${_common}-url-map --path-matcher-name=${_common}-path-matcher

# gcloud beta compute url-maps delete ${_common}-url-map 

# gcloud beta compute backend-services delete ${_common}-backend-service-app  --global
# gcloud beta compute backend-services delete ${_common}-backend-service-func --global
# gcloud beta compute backend-services delete ${_common}-backend-service-run  --global

# ---

# gcloud beta compute network-endpoint-groups delete ${_common}-serverless-neg-app  --region=asia-northeast1 
# gcloud beta compute network-endpoint-groups delete ${_common}-serverless-neg-func --region=asia-northeast1 
# gcloud beta compute network-endpoint-groups delete ${_common}-serverless-neg-run  --region=asia-northeast1 

# gcloud beta app services delete ${_common}-app
# gcloud beta functions delete func --region asia-northeast1
# gcloud beta run services delete ${_common}-run --platform managed --region asia-northeast1

gcloud compute addresses delete ${_common}-example-ip --global
