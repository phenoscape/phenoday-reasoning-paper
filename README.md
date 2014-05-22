##About##
Demonstration code for paper submission to the Bio-ontologies SIG Phenotype Day at ISMB 2014: 
Presence-absence reasoning for evolutionary phenotypes
James P. Balhoff, T. Alexander Dececchi, Paula M. Mabee, and Hilmar Lapp

This paper explains the reasoning process used to infer presence and absence of anatomical structures within the Phenoscape Knowledgebase. The process involves generation and addition of supplemental axioms, as well as reasoning workarounds for classifying absences using the ELK reasoner. 
* These features are implmemented in Phenoscape kb-owl-tools project: https://github.com/phenoscape/phenoscape-owl-tools

As an application example the paper describes automated generation of a character matrix of presence/absence information from an example KB composed of date from a single study.
* The matrix generation process is implemented in the Phenoscape presence-absence-matrix project: https://github.com/phenoscape/presence-absence-matrix
* The example dataset was taken from the collection of Phenoscape-annotated morphological matrices: https://github.com/phenoscape/phenoscape-data

This project implements a simple workflow which builds the Knowledgebase, performs the presence-absence matrix query, and prints some summary information.

##Requirements##
You can run the example by downloading and executing the script `run.sh`. This requires a Unix environment (e.g. Mac OS X or Linux) with Java 7 and a large amount of memory (we tested with 30 GB).

This script downloads a pre-packaged Java jar which includes all dependencies.

##Building from source##
Compiling the example source requires a Maven installation. Check out the source code using Git: `git clone https://github.com/phenoscape/phenoday-reasoning-paper.git`

From within the source directory, run `mvn package`. This will output two jar files: one containing code for this project, the other ("one-jar") containing this code as well as all dependencies.
