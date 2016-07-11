FROM registry.access.redhat.com/jboss-eap-7/eap70-openshift

MAINTAINER Mario Mendoza

# obtain artifact
#RUN curl -o /opt/eap/standalone/deployments/ROOT.war -fSL  "http://srkmcontdelivery.mutua.es/JINGA4X/oslog/raw/master/oslog.war"
COPY oslog.war /opt/eap/standalone/deployments/ROOT.war

# Enable binding to all network interfaces
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.node.name=webmutuaNode -Xms400m -Xmx400m\"" >> /opt/eap/bin/standalone.conf
