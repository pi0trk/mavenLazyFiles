#!/bin/bash
mvn archetype:generate -DgroupId=pl.karnas -Dversion=0.1 -DartifactId=$1 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
cat mvnPomExample.xml > $1/pom.xml
sed -i "s/<artifactId><\/artifactId>/<artifactId>$1<\/artifactId>/" $1/pom.xml
sed -i "s/<name><\/name>/<name>$1<\/name>/" $1/pom.xml
echo "# $1" > $1/README.md
cp .gitignore $1/
rm -f $1/src/test/java/pl/karnas/AppTest.java