# oslog

Enter a master node

Create a new app running the following command

`$ oc new-app git://github.com/marmendo/oslog  (Or use your own repository)`

Open the the project on the OpenShift web console After some seconds it will launch a builder Once the builder finished you must create the route from the command line (you can do this from the web console too)

`$ oc expose service/oslog -l name=oslog`

From the OpenShift console go to overview and test the application

In order to clean your test project  ( BE CAREFUL!! )

`$ oc delete all --all -n YOURPROJECT`
