# Introduction

[toc](./README.md) | [next](browsing.md)

This workshop will give a short walkthrough of the eNanoMapper ontology, to remind you what the ontology
was about. Generally, it assumes you already have seen or read about the ontology, and maybe even read some
of the past tutorials:

* [Browsing the eNM ontology with BioPortal, AberOWL and Protégé](https://enanomapper.github.io/tutorials/BrowseOntology/readme.html)
* [Entering and analysing nano safety data](https://enanomapper.github.io/tutorials/Entering_and_analysing_nano_safety_data/readme.html)
* [Adding ontology terms](https://enanomapper.github.io/tutorials/Added%20ontology%20terms/README.html)

This workshop repeats some of the ontology basics and some of the browsing of a tutorial, preparing you
for the main aspects of this workshop: hands-on work on reusing the ontology.

## Why do we use ontologies?

The answer to the question what an ontology is, is a bit more abstract. We will focus, instead, on why
we use ontologies. The core reason is us to communicate in a precise way what we are talking about,
including being precise in uncertainty. For example, we can use ontologies to precisely represent these
concepts:

* a material entity
* a particle
* a metal oxide nanoparticle
* a zinc oxide nanoparticle
* JRCNM01101a

The first purpose of an ontology is to give each one of these concepts an identifier, an essential aspect
of FAIR data. Indeed, each of these terms have ontology identifiers, and each has a different identifier:

* a material entity: [BFO_0000040](http://bioportal.bioontology.org/ontologies/ENM/?p=classes&conceptid=http%3A%2F%2Fpurl.obolibrary.org%2Fobo%2FBFO_0000040) 
* a particle: [NPO_707](http://bioportal.bioontology.org/ontologies/ENM/?p=classes&conceptid=http%3A%2F%2Fpurl.bioontology.org%2Fontology%2Fnpo%23NPO_707)
* a metal oxide nanoparticle: [NPO_1541](http://bioportal.bioontology.org/ontologies/ENM/?p=classes&conceptid=http%3A%2F%2Fpurl.bioontology.org%2Fontology%2Fnpo%23NPO_1541)
* a zinc oxide nanoparticle: [NPO_1542](http://bioportal.bioontology.org/ontologies/ENM/?p=classes&conceptid=http%3A%2F%2Fpurl.bioontology.org%2Fontology%2Fnpo%23NPO_1542)
* JRCNM01101a: [ENM_9000086](http://bioportal.bioontology.org/ontologies/ENM/?p=classes&jump_to_nav=true&conceptid=http%3A%2F%2Fpurl.enanomapper.org%2Fonto%2FENM_9000086)

Furthermore, the ontology actually explains us the relation between these terms. But not only that,
as we will see later, when we talk about axioms.

## The eNanoMapper ontology

The eNanoMapper ontology was started by [the eNanoMapper project](http://enanomapper.net/), funded by
the EU FP7, see also [[0](https://jbiomedsem.biomedcentral.com/articles/10.1186/s13326-015-0005-5)].
The ontology aims at giving the European nanosafety community a common language allowing it
exchange and analyse data. It is now maintained by the NanoCommons project and sees contributions
from OpenRiskNet and a few EU NanoSafety Cluster projects.

### Used ontologies

The eNanoMapper ontology was not developed from scratch. That would not be feasible, is not practical,
and would not aid our community. Ontology development is complex and takes time. During daily research,
we do not commonly think about the meanings of words we use or use them casually, focusing on the
research question and answer, rather than formalizing what we study.
But for an ontology, this formal framework is important. 

The eNanoMapper reuses many external ontologies. Here is a list:

* [Adverse Outcome Pathways Ontology](https://github.com/DataSciBurgoon/aop-ontology) (AOP)
* [BioAssay Ontology](http://bioassayontology.org/) (BAO)
* [Basic Formal Ontology](http://basic-formal-ontology.org/) (BFO)
* [Cell Culture Ontology](http://bioportal.bioontology.org/ontologies/CCONT?p=summary) (CCONT)
* [Chemical Entities of Biological Interest](https://www.ebi.ac.uk/chebi/) (CHEBI)
* [Chemical Information Ontology](https://github.com/semanticchemistry/semanticchemistry/) (CHEMINF)
* [Chemical Methods Ontology](https://github.com/rsc-ontologies/rsc-cmo) (CHMO)
* [Experimental Factor Ontology](https://www.ebi.ac.uk/efo/) (EFO)
* [Environment Ontology](http://environmentontology.org/) (ENVO)
* [FRBR-aligned Bibliographic Ontology](https://sparontologies.github.io/fabio/current/fabio.html) (FABIO)
* [Gene Ontology](http://www.geneontology.org/) (GO)
* [Human Physiology Simulation Ontology](https://www.scai.fraunhofer.de/en/business-research-areas/bioinformatics/downloads.html) (HUPSON)
* [Information Artifact Ontology](https://github.com/information-artifact-ontology/IAO/) (IAO)
* [National Cancer Institute Thesaurus](https://nciterms.nci.nih.gov/) (NCIT)
* [NanoParticle Ontology](http://www.nano-ontology.org/) (NPO)
* [Ontology of Adverse Events](http://www.oae-ontology.org/) (OAE)
* [Ontology of Biological and Clinical Statistics](https://github.com/obcs/obcs) (OBCS)
* [Ontology for Biomedical Investigations](http://obi-ontology.org/) (OBI)
* [Phenotype And Trait Ontology](https://github.com/pato-ontology/pato) (PATO)
* [Semanticscience Integrated Ontology](https://github.com/micheldumontier/semanticscience) (SIO)
* [Unit Ontology](https://github.com/bio-ontology-research-group/unit-ontology) (UO)

This means that when assay data is annotated with eNanoMapper concepts, these are inherited from the BioAssay Ontology.
And when it describes nanoparticles/nanomaterials, the model for this is inherited from the NanoParticle Ontology.

---

[toc](./README.md) | [next](browsing.md)

Copyright 2019 (C) Egon Willighagen - CC-BY Int. 4.0
