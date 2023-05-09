# # !/usr/bin/env bash

# echo "installing etcd operator"
# # kubectl  create -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/deployment.yaml
# # kubectl  rollout status -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/deployment.yaml
# kubectl  create -f scripts/deployment.yml
# kubectl  rollout status -f scripts/deployment.yml
# until kubectl  get thirdpartyresource cluster.etcd.coreos.com
# do
#     echo "waiting for operator"
#     sleep 2
# done

# echo "pausing for 10 seconds for operator to settle"
# sleep 10

# kubectl  create -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/example-etcd-cluster.yaml

# echo "installing etcd cluster service"
# kubectl  create -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/example-etcd-cluster-nodeport-service.json

# echo "waiting for etcd cluster to turnup"

# until kubectl  get pod example-etcd-cluster-0002
# do
#     echo "waiting for etcd cluster to turnup"
#     sleep 2
# done


echo "installing etcd operator"
kubectl create -f scripts/deployment.yml
kubectl rollout status deployment/etcd-operator
echo "pausing for 10 seconds for operator to settle"
sleep 10
kubectl create -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/example-etcd-cluster.yaml
echo "installing etcd cluster service"
kubectl create -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/example-etcd-cluster-nodeport-service.json
echo "waiting for etcd cluster to turnup"
until kubectl get pod example-etcd-cluster-0002
do
    echo "waiting for etcd cluster to turnup"
    sleep 2
done




# echo "installing etcd operator"
# kubectl apply -f https://raw.githubusercontent.com/coreos/etcd-operator/master/deploy/etcd-operator.yaml
# kubectl rollout status deployment/etcd-operator

# until kubectl get crd | grep cluster.etcd.coreos.com
# do
#     echo "waiting for operator"
#     sleep 2
# done

# echo "pausing for 10 seconds for operator to settle"
# sleep 10

# kubectl apply -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/example-etcd-cluster.yaml

# echo "installing etcd cluster service"
# kubectl apply -f https://raw.githubusercontent.com/coreos/etcd-operator/master/example/example-etcd-cluster-nodeport-service.yaml

# echo "waiting for etcd cluster to turn up"

# until kubectl get pod example-etcd-cluster-0002
# do
#     echo "waiting for etcd cluster to turn up"
#     sleep 2
# done

