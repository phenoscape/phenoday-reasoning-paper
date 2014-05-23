#!/bin/bash

########################################################################
## This script builds a version of the Phenoscape Knowledgebase from a #
## single dataset, generates, using inference, a presence/absence      #
## matrix from it, exports the matrix in NeXML format, and also        #
## outputs some summary information.                                   #
########################################################################
## By default, this script will run from a prebuilt JAR of the main    #
## program and all its dependencies, which will be downloaded from the #
## Github repository.                                                  #
##                                                                     #
## Alternatively, you can build this JAR from source. This requires    #
## you to have maven installed, as well as running this script from    #
## within a clone of the Git repository (see README). You can trigger  #
## building from source by supplying --from-source as argument on the  #
## command line.                                                       #
##                                                                     #
## By default, the script will run with the dataset reported in the    #
## paper. Use --dataset=<dataset-URL> to use another dataset (as URL   #
## to a NeXML-formatted file), or provide it as the last command line  #
## argument.                                                           #
##                                                                     #
## Finally, you can specify a different memory allocation for Java by  #
## --memory=<mem>, with the default being 30G.                         #
########################################################################

version="1.1.2"

# The dataset to be used, as a URL. Default is the one reported in the
# paper. The dataset will be downloaded by the script.
dataset='https://raw.githubusercontent.com/phenoscape/phenoscape-data/phenoday-2014/Curation%20Files/fin_limb-incomplete-files/Amphibians%20and%20transitional/Ruta_2011.xml'

# The JAR file containing the main program and all dependencies
onejar="phenoday-reasoning-paper-$version.one-jar.jar"

# We run from pre-built JAR by default
prebuilt=yes

# We allocate 30G RAM by default
mem="30G"

# parse command line
for arg in "$@" ; do
    case $arg in
    -d=*|--dataset=*)
        dataset="${arg#*=}"
        shift
        ;;
    --from-source)
        prebuilt=no
        shift
        ;;
    -m=*|--memory=*)
        mem="${arg#*=}"
        shift
        ;;
    *)
        # unknown option
        ;;
    esac
done

# dataset provided as last command line argument?
if [[ -n $1 ]] ; then
    dataset="$1"
fi

# Are we building from source?
if [ $prebuilt == "no" ] ; then
    mvn package
    onejar=target/$onejar
else
    # Download a precompiled jar of all code packaged with dependencies
    echo "Downloading prebuilt JAR"
    curl -O -L "https://github.com/phenoscape/phenoday-reasoning-paper/releases/download/v$version/phenoday-reasoning-paper-$version.one-jar.jar"
fi

# Download the dataset used within the paper
echo "Downloading dataset from $dataset"
curl -L -o dataset.xml "$dataset"

# Running the jar will execute the workflow in Main.scala
java -Xmx$mem -jar $onejar dataset.xml
