#!/bin/bash

echo Please provide project name:
read project_name
echo Please provide project description:
read project_description

# Generate mvn project
mvn archetype:generate -DgroupId=pl.karnas -Dversion=0.1 -DartifactId=$project_name -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false

# Create pom.xml with $project_name as artifactId and name
cat PomForMvn.xml > $project_name/pom.xml
sed -i "s/<artifactId><\/artifactId>/<artifactId>$project_name<\/artifactId>/" $project_name/pom.xml
sed -i "s/<name><\/name>/<name>$project_name<\/name>/" $project_name/pom.xml

# Create README.md
echo "# $project_name" > $project_name/README.md

# Copy .gitignore to project
cp .gitignore $project_name/

# Remove AppTest
rm -f $project_name/src/test/java/pl/karnas/AppTest.java

# Create project description in main App
sed -i "s/* Hello world\!/* $project_description \n *\n * @author pi0trk/" $project_name/src/main/java/pl/karnas/App.java
