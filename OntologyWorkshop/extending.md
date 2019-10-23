# Extending the eNanoMapper ontology

[prev](scholia.md) | [toc](./README.md) | [next](nanomaterial.md)

---

This section of this workshop will not focus on adding ontology terms from any of the supported
upstream ontology on which the eNanoMapper ontology is built. If you are interested in that,
please go to the [XXXX]() tutorial. In that situation, you basically only need to determine
the IRI of the term to add and where in the eNanoMapper ontology it should be placed.

## OWL for a metal nanomaterial

In this example, you will reproduce a bit OWL file that adds a nanomaterial to the ontology that
was not yet. We will first see the full example and then discuss the components bit by bit.

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



---

[prev](scholia.md) | [toc](./README.md) | [next](nanomaterial.md)

Copyright 2019 (C) Egon Willighagen - CC-BY Int. 4.0
