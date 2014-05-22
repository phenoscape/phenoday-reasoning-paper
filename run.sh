#!/bin/bash

## Build a version of the Phenoscape Knowledgebase from a single dataset ##
## Export a NeXML-formatted presence/absence matrix ##
## Output some summary information ##

# Download the dataset used within the paper
curl -O -L 'https://raw.githubusercontent.com/phenoscape/phenoscape-data/phenoday-2014/Curation%20Files/fin_limb-incomplete-files/Amphibians%20and%20transitional/Ruta_2011.xml'

# Download a precompiled jar of all code packaged with dependencies
curl -O -L https://github.com/phenoscape/phenoday-reasoning-paper/releases/download/v1.0/phenoday-reasoning-paper-1.0.one-jar.jar

# Running the jar will execute the workflow in Main.scala
java -Xmx30G -jar phenoday-reasoning-paper-1.0.one-jar.jar Ruta_2011.xml
