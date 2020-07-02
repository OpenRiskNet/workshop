# Exercise 2: Browsing with the eNanoMapper ontology

[prev](browsing.md) | [toc](./README.md) | [next](scholia.md)

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

## Browsing nanosafety data with the eNanoMapper data platform

One reason why identifiers are central to FAIR data is that they make data findable, the first
aspect of FAIR. This exercise will demonstrate how eNanoMapper ontology identifiers, if used by
other resources, can be used to find information.

Therefore, in this exercise, we will use an ontology identifier (or, the `local part` of it),
to find nanosafety data for a nanomaterial in the public eNanoMapper and NANoREG data platforms.

So, we start with the ontology term code for the nanomaterial we looked up in Exercise 2, `ENM_9000074`.

### eNanoMapper

This part is about the original eNanoMapper database instance, set up by the
[eNanoMapper](http://enanomapper.net/) project.

* Step 1: Visit [https://data.enanomapper.net/](https://data.enanomapper.net/)
* Step 2: Search `ENM_9000074`

#### Questions

1. How many entries are found when searching with this ontology term? <button onclick="toggleAnswer('q1')">Answer</button><span id="q1" style="visibility: hidden">One</span>
2. And what if we search for the more general `NPO_1486` for titanium oxide nanoparticle? <button onclick="toggleAnswer('q2')">Answer</button><span id="q2" style="visibility: hidden">This finds 80 nanomaterials.</span>
3. And how many for `ENM_9000080`?<button onclick="toggleAnswer('q3')">Answer</button><span id="q3" style="visibility: hidden">Two materials, https://data.enanomapper.net/substance/ENM3-d4c0bc69-bdaf-372f-b8c4-73ea0c8f5a06, which came from a EU NSC Young Scientist conference contribution. And https://search.data.enanomapper.net/projects/enanomapper/study/?substanceUri=https%3A%2F%2Fdata.enanomapper.net%2Fsubstance%2FNWKI-78f103d7-ca6c-3515-acdf-c504d48c96f9, which came from NanoWiki.</span>

### NANoREG

* Step 1: Visit [https://search.data.enanomapper.net/projects/nanoreg/](https://search.data.enanomapper.net/projects/nanoreg/)
* Step 2: Search `ENM_9000074`

#### Questions

1. How many entries are found when searching with this ontology term? <button onclick="toggleAnswer('q4')">Answer</button><span id="q4" style="visibility: hidden">Also one</span>
2. And what if we search for the more general `NPO_1486` for titanium oxide nanoparticle? <button onclick="toggleAnswer('q5')">Answer</button><span id="q5" style="visibility: hidden">This finds 7 nanomaterials.</span>

---

[prev](browsing.md) | [toc](./README.md) | [next](scholia.md)

Copyright 2019 (C) Egon Willighagen - CC-BY Int. 4.0
