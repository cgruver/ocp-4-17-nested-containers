```bash
cat << EOF | oc apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: openshift-kmm
---
apiVersion: operators.coreos.com/v1
kind: OperatorGroup
metadata:
  name: kernel-module-management
  namespace: openshift-kmm
---
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: kernel-module-management
  namespace: openshift-kmm
spec:
  channel: stable 
  installPlanApproval: Manual
  name: kernel-module-management
  source: redhat-operators
  sourceNamespace: openshift-marketplace
EOF
```

```bash
cat << EOF | oc apply -f -
apiVersion: kmm.sigs.x-k8s.io/v1beta1
kind: Module
metadata:
  name: module-tun
  namespace: openshift-kmm
spec:
  moduleLoader:
    container:
      modprobe:
        moduleName: tun
  selector:
    node-role.kubernetes.io/worker: ''
---
apiVersion: kmm.sigs.x-k8s.io/v1beta1
kind: Module
metadata:
  name: module-rtnl-link-bridge
  namespace: openshift-kmm
spec:
  moduleLoader:
    container:
      modprobe:
        moduleName: rtnl-link-bridge
  selector:
    node-role.kubernetes.io/worker: ''
---
apiVersion: kmm.sigs.x-k8s.io/v1beta1
kind: Module
metadata:
  name: module-ipt_addrtype
  namespace: openshift-kmm
spec:
  moduleLoader:
    container:
      modprobe:
        moduleName: ipt_addrtype
  selector:
    node-role.kubernetes.io/worker: ''
---
apiVersion: kmm.sigs.x-k8s.io/v1beta1
kind: Module
metadata:
  name: module-ipt_MASQUERADE
  namespace: openshift-kmm
spec:
  moduleLoader:
    container:
      modprobe:
        moduleName: ipt_MASQUERADE
  selector:
    node-role.kubernetes.io/worker: ''
EOF
```