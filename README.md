# oslog

Create a "demo" project using the OpenShift web console.

Create a new app running the following command (we use a "demo" project for this test)

`$ oc login`

Set "demo" as your active project
`$ oc project demo`

`$ oc new-app git://github.com/marmendo/oslog`
(Or use your own repository)

Open the the project on the OpenShift web console After some seconds it will launch a builder Once the builder finished you must create the route from the command line (you can do this from the web console too)

`$ oc expose service/oslog -l name=oslog`

From the OpenShift console go to overview and test the application
`http://oslog-demo.apps.example.com/sysout`

Refresh the page several times and check the log contents which would look like this

Now test with log4j
`http://oslog-demo.apps.example.com/log4j2`

```
13:20:57,032 INFO  [org.jboss.as.server] (ServerService Thread Pool -- 38) WFLYSRV0010: Deployed "activemq-rar.rar" (runtime-name : "activemq-rar.rar")
13:20:57,608 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0060: Http management interface listening on http://127.0.0.1:9990/management
13:20:57,608 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0051: Admin console listening on http://127.0.0.1:9990
13:20:57,609 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0025: JBoss EAP 7.0.0.GA (WildFly Core 2.1.2.Final-redhat-1) started in 14594ms - Started 415 of 810 services (504 services are lazy, passive or on-demand)
13:22:52,531 INFO  [stdout] (default task-1) -------------------> System out text <-------------------
13:22:55,991 INFO  [stdout] (default task-2) -------------------> System out text <-------------------
13:22:56,735 INFO  [stdout] (default task-3) -------------------> System out text <-------------------
13:22:57,462 INFO  [stdout] (default task-4) -------------------> System out text <-------------------
13:22:58,231 INFO  [stdout] (default task-5) -------------------> System out text <-------------------
13:22:58,999 INFO  [stdout] (default task-6) -------------------> System out text <-------------------
13:22:59,764 INFO  [stdout] (default task-7) -------------------> System out text <--------------------
```

In order to clean your demo project  ( BE CAREFUL if you selected a different project !! )

`$ oc delete all --all -n demo`
