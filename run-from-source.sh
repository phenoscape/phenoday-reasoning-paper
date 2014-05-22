#!/bin/bash

## Compile the demonstration script and package into a jar with its dependencies ##
## Build a version of the Phenoscape Knowledgebase from a single dataset ##
## Export a NeXML-formatted presence/absence matrix ##
## Output some summary information ##

# Assuming you are running this from within a clone of the source repository, for example obtained by `git clone https://github.com/phenoscape/phenoday-reasoning-paper.git`

# Download the dataset used within the paper
curl -O -L 'https://raw.githubusercontent.com/phenoscape/phenoscape-data/phenoday-2014/Curation%20Files/fin_limb-incomplete-files/Amphibians%20and%20transitional/Ruta_2011.xml'

# Build a jar of the script packaged with dependencies
mvn package

# Running the jar will execute the workflow in Main.scala; you may need to change the version number within the jar filename
java -Xmx30G -jar target/phenoday-reasoning-paper-1.0.one-jar.jar Ruta_2011.xml
