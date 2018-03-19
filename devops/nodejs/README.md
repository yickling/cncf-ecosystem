# Debugging NodeJS

This is a generic terraform based kubernetes setup for demonstrating how to debug a NodeJS application in a Kubernetes environment.

## Inspector API (Node 6.3+)
1. Build the demo with Docker (on local minikube just run `./pushme.sh`). On other providers, modify references to `nodejs-demo:1.0` with the name of the built image in the respective docker registry in the terraform files
2. Enter the pod `kubectl exec -it nodejs-legacy-demo bash`
3. Find the pid of the NodeJS process (e.g. `ps -ef | grep node`)
4. Start debug mode in the app with a SIGUSR1 signal `kill -s SIGUSR1 <pid>`
5. On a separate terminal, port forward the inspector port out with `kubectl port-forward nodejs-demo 9229`
6. Configure Chrome to seek out the demo app by going to `about:inspect` in Chrome
7. Click on 'Open dedicated DevTools for Node'
8. Add a connection to `localhost:9229`
9. It will automatically connect and debug/inspect

## Legacy Debugger API (Node 6.3 or under)
1. Build the legacy demo with Docker (on local minikube just run `./pushme.sh`). On other providers, modify references to `nodejs-legacy-demo:1.0` with the name of the built image in the respective docker registry in the terraform files
2. Start an inspector inside the pod with `kubectl exec -it nodejs-legacy-demo node-inspector -p 9229`, using port 9229 to expose the NodeJS legacy inspector
3. On a separate terminal, enter the pod `kubectl exec -it nodejs-legacy-demo bash`
4. Find the pid of the NodeJS process (e.g. `ps -ef | grep node`)
5. Start debug mode in the app with a SIGUSR1 signal `kill -s SIGUSR1 <pid>`
6. On a separate terminal, port forward the inspector port out with `kubectl port-forward nodejs-legacy-demo 9229`
7. Debug into it by browsing http://localhost:9229/?port=5858