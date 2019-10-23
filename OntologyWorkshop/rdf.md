# Exercise 5: creating an eNanoMapper data set in RDF

[prev](nanomaterial.md) | [toc](./README.md)

---

In this final exercise, you are going to write a short data file capturing some minimal
metadata about a recently published study around nanosafety.

Take the situation you published a new nanosafety study about some nanoparticle. And you want people to discover
your new work if they search for studies on that nanoparticle. This Exercise will explain how to make your
article more findable, fulfilling one of the requirements of FAIR data.

We basically start with a nanoparticle, the DOI of the article, and some info of who you are. This information
can be submitted in various ways, but we here focus on a simple RDF-based file, which you can edit with a simple
text editor, like Notepad. This write up is a shorter version of [this longer tutorial](https://nanocommons.github.io/tutorials/enteringData/).

* Step 1: Open a text editor (e.g. `Notepad.exe` or TextMate)

After that, and because the document will be a valid RDF document, we need to specify a few shortcuts, which
are called `namespaces` in RDF documents.

* Step 2: Add the following namespace definitions to your document:

```turle
@prefix bao:   <http://www.bioassayontology.org/bao#> .
@prefix cito:  <http://purl.org/net/cito/>
@prefix dc:    <http://purl.org/dc/elements/1.1/> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix foaf:  <http://xmlns.com/foaf/0.1/> .
@prefix npo:   <http://purl.bioontology.org/ontology/npo#> .
@prefix obo:   <http://purl.obolibrary.org/obo/> .
@prefix owner: <https://openrisknet.github.io/workshops/demo/owner/> .
@prefix rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> .
@prefix sio:   <http://semanticscience.org/resource/> .
@prefix void:  <http://rdfs.org/ns/void#> .
@prefix xsd:   <http://www.w3.org/2001/XMLSchema#> .
```

## Info about us

The first bit of information that a FAIR data set needs, is a bit of information about the data set.

* Step 3: Use the below template to describe your data set:

```turtle
owner:DS1
        a                   void:Dataset ;
        dcterms:license     <https://creativecommons.org/publicdomain/zero/1.0/> ;
        dcterms:publisher   "Egon Willighagen"@en ;
        dcterms:description "Nanomaterials I am excited about."@en ;
        dcterms:title       "Exciting nanomaterials"@en .
```

* Step 4: Change the `dcterms:publisher`, `dcterms:description`, and `dcterms:title` values. For
  convenience, you can extend the description to include the citation to your research article.

## Info about your nanomaterial




## Uploading the RDF to the OpenRiskNet cloud

---

[prev](nanomaterial.md) | [toc](./README.md)

Copyright 2019 (C) Egon Willighagen - CC-BY Int. 4.0
