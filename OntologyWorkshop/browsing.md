# Exercise 1: Browsing the eNanoMapper ontology

[prev](intro.md) | [toc](./README.md) | [next](browsing2.md)

<script>
  function toggleAnswer(id) {
  var answer = document.getElementById(id);
  if (answer.style.visibility === "hidden" ||
      answer.style.visibility === "none") {
    answer.style.visibility = "visible";
  } else {
    answer.style.visibility = "hidden";
  }
}
</script>

## Browsing the ontology with BioPortal

The purpose of this exercise is to see how BioPortal visualizes the eNanoMapper ontology.
A [detailed tutorial](https://enanomapper.github.io/tutorials/BrowseOntology/Tutorial%20browsing%20eNM%20ontology.html)
has been developed before.

Your task is to find the ontology term for JRCNM01000a, one of the
JRC representative industrial nanomaterials (see [[0](https://doi.org/10.1016/J.YRTPH.2016.08.008)]).

* Step 1: Visit [http://bioportal.bioontology.org/ontologies/ENM/](http://bioportal.bioontology.org/ontologies/ENM/)
* Step 2: Open the Classes tab
* Step 3: Search `JRCNM01000a`

### Questions

1. What is the ontology term IRI for JRCNM01000a? <button onclick="toggleAnswer('q1')">Answer</button><span id="q1" style="visibility: hidden">http://purl.enanomapper.org/onto/ENM_9000074</span>
2. What is the ontology super class of this term? And the IRI of that?<button onclick="toggleAnswer('q2')">Answer</button><span id="q2" style="visibility: hidden">titanium oxide nanoparticle, http://purl.bioontology.org/ontology/npo#NPO_1486</span>

---

[prev](intro.md) | [toc](./README.md) | [next](browsing2.md)

Copyright 2019 (C) Egon Willighagen - CC-BY Int. 4.0
