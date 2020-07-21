# Exercise 3: Looking up JRCNM01101a in Scholia

[prev](browsing2.md) | [toc](./README.md) | [next](extending.md)

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

---

Before we jump to the exercise, first a few pointers.
Scholia is a graphical user interface that visualizes data from the Wikidata knowledgebase.
Wikidata is a project under the umbreally of the Wikimedia Foundation and therefore a sister
project of Wikipedia [[0](https://www.biorxiv.org/content/10.1101/799684v1)].
Scholia uses web technologies to visualize the results queried
from Wikidata with the SPARQL query language [[1](https://riojournal.com/article/35820/)].

Like in the previous exercise, we start with an ontology code for `JRCNM01101a`: `ENM_9000086`.

## Searching in Scholia

* Step 1: Visit [https://scholia.toolforge.org/](https://scholia.toolforge.org/)
* Step 2: Search `ENM_9000086`

### Questions

1. The URL contains the Wikidata Q-identifier. What is it? <button onclick="toggleAnswer('q1')">Answer</button><span id="q1" style="visibility: hidden">Q47462008</span>
2. How many articles does Scholia show for `JRCNM01101a`? <button onclick="toggleAnswer('q2')">Answer</button><span id="q2" style="visibility: hidden">At the time of writing: six.</span>
3. Which four journals have these articles appeared in? <button onclick="toggleAnswer('q3')">Answer</button><span id="q3" style="visibility: hidden">Nanomaterials, Particle and Fibre Toxicology, Toxicology in Vitro, Scientific Reports, Regulatory Toxicology and Pharmacology, and PLoS ONE.</span>

---

[prev](browsing2.md) | [toc](./README.md) | [next](extending.md)

Copyright 2019 (C) Egon Willighagen - CC-BY Int. 4.0
