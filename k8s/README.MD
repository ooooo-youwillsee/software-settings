# targetPath

`/etc/kubernetes/pki` -> `C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki`

# window api-server comman options

```
--advertise-address=192.168.1.5
--allow-privileged=true
--authorization-mode=Node,RBAC
--client-ca-file=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/ca.crt
--enable-admission-plugins=NodeRestriction
--enable-bootstrap-token-auth=true
--etcd-cafile=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/etcd/ca.crt
--etcd-certfile=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/apiserver-etcd-client.crt
--etcd-keyfile=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/apiserver-etcd-client.key
--etcd-servers=https://centos1:2379
--kubelet-client-certificate=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/apiserver-kubelet-client.crt
--kubelet-client-key=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/apiserver-kubelet-client.key
--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
--proxy-client-cert-file=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/front-proxy-client.crt
--proxy-client-key-file=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/front-proxy-client.key
--requestheader-allowed-names=front-proxy-client
--requestheader-client-ca-file=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/front-proxy-ca.crt
--requestheader-extra-headers-prefix=X-Remote-Extra-
--requestheader-group-headers=X-Remote-Group
--requestheader-username-headers=X-Remote-User
--secure-port=6443
--service-account-issuer=https://kubernetes.default.svc.cluster.local
--service-account-key-file=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/sa.pub
--service-account-signing-key-file=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/sa.key
--service-cluster-ip-range=10.96.0.0/12
--tls-cert-file=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/apiserver.crt
--tls-private-key-file=C:/Users/ooooo/Development/Code/Self/software-settings/k8s/pki/apiserver.key

```

# generator apiserver crt request

`openssl req -new -key apiserver.key -subj "/CN=kube-apiserver," -out apiserver.csr`

# assign ip address to apiserver.ext

`echo 'subjectAltName = DNS:ubuntu1, DNS:kubernetes, DNS:kubernetes.default, DNS:kubernetes.default.svc, DNS:kubernetes.default.svc.cluster.local, IP:10.96.0.1, IP:192.168.130.137' > apiserver.ext`

# sign apiserver.csr

`openssl x509 -req -in apiserver.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out apiserver.crt -days 365 -extfile apiserver.ext`
