# Debugging NodeJS

## Inspector API (Node 6.3+)

## Legacy Debugger API (Node 6.3 or under)
1. Start an inspector inside the pod with `kubectl exec -it nodejs-legacy-demo node-inspector -p 9229`, using port 9229 to expose the NodeJS legacy inspector
2. Enter the pod `kubectl exec -it nodejs-legacy-demo bash`
3. Find the pid of the NodeJS process (e.g. `ps -ef | grep node`)
4. Start debug mode in the app with a SIGUSR1 signal `kubectl exec -it /bin/kill -s SIGUSR1`
5. Port forward the inspector port out with `kubectl port-forward nodejs-legacy-demo 9229`
6. Debug into it by browsing http://localhost:9229/?port=5858