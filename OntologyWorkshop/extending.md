# Extending the eNanoMapper ontology

[prev](scholia.md) | [toc](./README.md) | [next](nanomaterial.md)

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

This section of this workshop will not focus on adding ontology terms from any of the supported
upstream ontologies on which the eNanoMapper ontology is built. If you are interested in that,
please go to the [Adding ontology terms](https://github.com/enanomapper/tutorials/tree/master/Added%20ontology%20terms) 
tutorial. In that situation, you basically only need to determine
the IRI of the term to add and where in the eNanoMapper ontology it should be placed.

## OWL for a metal nanomaterial

In this example, you will reproduce a small OWL file that adds a nanomaterial to the ontology that
was not included yet. We will first see the full example and then discuss the components bit by bit.

So, let's make the jump in and briefly look at the full example. It uses OWL Axioms to provide
additional meaning to the ontology, useful for reasoning later (why?). Here it is:

```xml
<owl:Class rdf:about="http://purl.enanomapper.org/onto/ENM_9000245">
  <rdfs:subClassOf rdf:resource="http://purl.bioontology.org/ontology/npo#NPO_1384"/>
  <npo-ext:code rdf:datatype="http://www.w3.org/2001/XMLSchema#string">titanium nanoparticle</npo-ext:code>
  <rdfs:label xml:lang="en">titanium nanoparticle</rdfs:label>
  <owl:equivalentClass>
    <owl:Class>
      <owl:intersectionOf rdf:parseType="Collection">
        <rdf:Description rdf:about="http://purl.bioontology.org/ontology/npo#NPO_707"/>
        <owl:Restriction>
          <owl:onProperty rdf:resource="http://purl.bioontology.org/ontology/npo#has_component_part"/>
          <owl:someValuesFrom rdf:resource="http://purl.obolibrary.org/obo/CHEBI_33341"/>
        </owl:Restriction>
      </owl:intersectionOf>
    </owl:Class>
  </owl:equivalentClass>
  <synonym rdf:datatype="http://www.w3.org/2001/XMLSchema#string">Ti nanoparticle</synonym>
</owl:Class>
```

This snippet of OWL is written in the eXtensible Markup Language (XML) serialization.

We now will discuss this snippet in more detail. First, the snippet defines a new OWL class with
these instructions:

```xml
<owl:Class rdf:about="http://purl.enanomapper.org/onto/ENM_9000245">
</owl:Class>
```

The `<owl:Class>` part indicates information about a (new) class is given, while the `rdf:about`
part describes the IRI of the class. Because this IRI has not been used elsewhere, it defines a new
class.

Because ontologies are not meant for only machines but also for humans, we will add a few human
readable names: a code, a label, and a synonym. These RDF/XML lines are added:

```xml
  <npo-ext:code rdf:datatype="http://www.w3.org/2001/XMLSchema#string">titanium nanoparticle</npo-ext:code>
  <rdfs:label xml:lang="en">titanium nanoparticle</rdfs:label>
  <synonym rdf:datatype="http://www.w3.org/2001/XMLSchema#string">Ti nanoparticle</synonym>
```

To introduce some structure, a hierarchical `subclass` link is added:

```xml
  <rdfs:subClassOf rdf:resource="http://purl.bioontology.org/ontology/npo#NPO_1384"/>
```

### OWL Axioms

The next step is to add a more complex ontological relation to the ontology. After all, a titanium
nanoparticle `is basically` just a compound with a titanium `part` and it a `nanoparticle`. To define
this combination of terms, OWL Axioms can be used.

Now, the `is basically` is encoded in OWL as an `owl:equivalentClass`:

```xml
  <owl:equivalentClass>
    <owl:Class>
    </owl:Class>
  </owl:equivalentClass>
```

And the combination of the two is encoded in OWL with the `owl:intersectionOf`:

```xml
      <owl:intersectionOf rdf:parseType="Collection">
      </owl:intersectionOf>
```

Then, we want to be our new OWL class to be a nanoparticle, so the interaction should
include that it is a nanoparticle. This is done with this line:

```xml
        <rdf:Description rdf:about="http://purl.bioontology.org/ontology/npo#NPO_707"/>
```

But because not every nanoparticle is a titanium nanoparticle, we should also add a restriction
that the material should include titanium. This is done with the last few lines from our
original OWL class snippet:

```xml
        <owl:Restriction>
          <owl:onProperty rdf:resource="http://purl.bioontology.org/ontology/npo#has_component_part"/>
          <owl:someValuesFrom rdf:resource="http://purl.obolibrary.org/obo/CHEBI_33341"/>
        </owl:Restriction>
```

### Questions

1. How would you use an OWL Axiom to define a nanomaterial descriptor? <button onclick="toggleAnswer('q1')">Answer</button><span id="q1" style="visibility: hidden">You can define an `owl:equivalentClass` that the thing is a descriptor, but with the restriction that it is only computed for things that are nanomaterials, rather than all chemicals.</span>

---

[prev](scholia.md) | [toc](./README.md) | [next](nanomaterial.md)

Copyright 2019 (C) Egon Willighagen - CC-BY Int. 4.0
