About
-----

Demonstration code for paper submission to the Bio-ontologies SIG Phenotype Day at ISMB 2014:

> Presence-absence reasoning for evolutionary phenotypes  
> James P. Balhoff, T. Alexander Dececchi, Paula M. Mabee, and Hilmar Lapp

The paper explains the reasoning process used to infer presence and absence of anatomical structures within the Phenoscape Knowledgebase. The process involves generation and addition of supplemental axioms, as well as reasoning workarounds for classifying absences using the ELK reasoner. 
* These features are implmemented in Phenoscape kb-owl-tools project: https://github.com/phenoscape/phenoscape-owl-tools

As an application example the paper describes automated generation of a character matrix of presence/absence information from an example KB composed of data from a single study.
* The matrix generation process is implemented in the Phenoscape presence-absence-matrix project: https://github.com/phenoscape/presence-absence-matrix
* The example dataset was taken from the collection of Phenoscape-annotated morphological matrices: https://github.com/phenoscape/phenoscape-data

The code in this project implements a simple workflow which builds the Knowledgebase, performs the presence-absence matrix query, and prints some summary information.

Running
-------

You can run the example by downloading and executing the script `run.sh`. This requires a Unix environment (e.g. Mac OS X or Linux) with Java 7 and a large amount of memory (we tested successfully with 30 GB).

By default, this script downloads a pre-built and pre-packaged Java jar which includes all dependencies, and it will run with the dataset reported in the paper.

The defaults can be changed by passing command line argument to the
script. Use `--dataset=<dataset-URL>` to use another dataset (as URL
to a NeXML-formatted file), or provide it as the last command line
argument. The [Phenoscape data repository] on Github contains many
more NeXML files (`.xml`) with EQ phenotype annotations for published
matrices. To change the default heap memory allocation for Java (30G)
use `--memory=<mem>`.

Running from source
-------------------

To trigger a build from source instead of with the prebuilt JAR, pass `--from-source` to `run.sh` on the command line. This requires a Maven installation, and checking out the source code using Git: 

```
$ git clone https://github.com/phenoscape/phenoday-reasoning-paper.git
```

You then run `run.sh --from-source` From within the source directory. This will generate two jar files within the `target` folder (which will be created): one containing code for this project, the other ("one-jar") containing this code as well as all dependencies. The build process will download these dependencies, so an active internet connection is required.

[Phenoscape data repository]: https://github.com/phenoscape/phenoscape-data