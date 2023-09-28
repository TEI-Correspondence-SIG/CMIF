# CMIF v2

## Background

The Correspondence Metadata Interchange Format was introduced in 2014-2015 by the TEI Correspondence SIG in the course of the development of the TEI element `correspDesc`, so that scholarly editions and other scholarly publiation of letters can make their most important correspondence metadata available for data exchange and cross-project use. For example, the web service [correspSearch](https://correspSearch.net) uses CMIF to aggregate metadata and make it available for central search. CMIF mainly based on the use of the TEI element `correspDesc`, so the correspondence metadata captured in CMIF so far include: sender, addressee, place of writing  and receiving, and dates. Wherever possible, places and persons should be identified by URIs from authority files. In addition, the CMIF also includes information on where the letter was published and a few meta-data on the CMIF file itself. Further information on the Correspondence Metadata Interchange Format can be found in the [current documentation](https://github.com/TEI-Correspondence-SIG/CMIF/blob/main/README.md). 

## General

In version 2, CMIF shall be extended in such a way that more information can be made available for data exchange. The development was guided by the principle of "keep it simple" in order to make CMIF v2 usable by as many projects as possible. With this in mind, an approach was chosen that notes all additional information in `correspDesc/note/ref`, inspired by triple notations of the Semantic Web. For a detailed discussion of this approach, see [Dumont et al. 2019](https://encoding-correspondence.bbaw.de/v1/CMIF.html). CMIF v2 is backwards compatible with CMIF v1.x, i.e. the information provided up to now will continue to be encoded in this way. 

## Information that shall be encodable in CMIF v2 

Specifically, the following information should be able to be provided in CMIF v2 by editions or other scholarly letter projects: 

* Entities mentioned in the letter (persons, places, etc.).
* References to archival documents or other editions on the letter 
* The textual basis of the edited letter (draft, manuscript, copy, etc.) 
* What type of information is provided in the scholarly resource (metadata only, transcription, facsimile, etc.) 
* Language(s) in which the letter was mainly written 
* Link to the TEI-XML file of the edited letter containing the full text.

## Encoding example 

The new information added in CMIF v2 will all be encoded as `ref` elements in `correspDesc/note`. The ref elements each carry an attribute `@type` and an attribute `@target`. Both attributes usually have a URI as value, but the values for `@type` are always taken from the vocabulary developed specifically for CMIF v2 (see next section). The attribute `@target` also contains a URI in nearly all cases, often from a authority file, to guarantee cross-project application. For some information in the `@target` attribute, the CMIF v2 vocabulary also provides specially defined URIs. 

An example based on the Weber-Gesamtausgabe:

```
<correspDesc ref="http://weber-gesamtausgabe.de/A046392" source="#e4c10c66-9b0b-4f2e-810c-669b0b2f2e20">
 <correspAction type="sent">
  <persName ref="http://d-nb.info/gnd/118816578">Weber, Caroline von</persName>
  <persName ref="http://weber-gesamtausgabe.de/A008673">Weber, Huberta von</persName>
  <placeName ref="http://www.geonames.org/2935022">Dresden</placeName>
  <date when="1852-01-20"/>
 </correspAction>
 <correspAction type="received">
  <persName ref="http://d-nb.info/gnd/11705867X">Jähns, Friedrich Wilhelm</persName>
  <persName ref="http://d-nb.info/gnd/11705870X">Jähns, Ida</persName>
  <placeName ref="http://www.geonames.org/2950159">Berlin</placeName>
 </correspAction>
 <! -- CMIF v2 extension starts here -->
 <note>
  <ref type="cmif:mentionsPerson" target="http://d-nb.info/gnd/119429829">Weber, Max Maria von</ref>
  <ref type="cmif:mentionsPerson" target="http://weber-gesamtausgabe.de/A008673">Weber, Katharina Huberta von</ref>
  <ref type="cmif:mentionsPerson" target="http://d-nb.info/gnd/118581945">Meyerbeer, Giacomo</ref>
  <ref type="cmif:mentionsPlace" target="http://www.geonames.org/2950159">Berlin</ref>
  <ref type="cmif:isAvailableAsTEIfile" target="http://weber-gesamtausgabe.de/A046392.xml" />
  <ref type="cmif:hasTextBase" target="cmif:Draft" />
  <ref type="cmif:hasTextBase" target="cmif:Copy" />
  <ref type="cmif:isPublishedWith" target"cmif:transcription" />
  <ref type="cmif:isPublishedWith" target"cmif:comment" />  
 </note>
</correspDesc>
```

The namespace `https://lod.academy/cmif/vocab/terms/` can be specified completely or abbreviated with the prefix `cmif:`. In the latter case, it is recommended to define the namespace via `listPrefixDef` (see https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SAPU).

## Vocabulary (Work in progress!)

The vocabulary for the attribute `@type` and the CMIF-specific parts of the attribute `@target` is published on [lod.academy](https://lod.academy), a service provided by the Academy of Sciences and Literature Mainz. Thus, a permanent, cross-institutional and project-independent availability is guaranteed. The official namespace https://lod.academy/cmif/vocab/terms/ can also be accessed as HTML in the browser, so that the definition of the vocabulary can be viewed directly. 

At present, the vocabulary is still to be understood as a draft.

## Unresolved questions and problems

* Martin Anton Müller [suggested](https://hyp.is/43z5ZpXgEeqz3V_IpQEY7w/encoding-correspondence.bbaw.de/v1/CMIF.html) that there should be the possibility to mark a publication as only partially recorded in a CMIF file
* Jakub Šimek [noted](https://hyp.is/J6-lyDbtEeqzned__Y4vpQ/encoding-correspondence.bbaw.de/v1/CMIF.html) that ref/@type is not explicitly suited for URIs. 
* Klaus Rettinghaus [noted](https://hyp.is/ZWAyOjV1EeqS6P8uqm6cGg/encoding-correspondence.bbaw.de/v1/CMIF.html) that there could be mixed cases of the text basis, e.g. the printing of a draft 
* Peter Stadler [noted](https://hyp.is/5qFUOO9rEe2PPuMlx9P4mA/encoding-correspondence.bbaw.de/v1/CMIF.html) that "typescript" or "computer printed letters" is missing from textbase.
* It is useful to note the supported version of CMIF somewhere? See [Issue #31](https://github.com/TEI-Correspondence-SIG/CMIF/issues/31)
* Should CMIF v2 provide a way to note DOI or ISBN in `sourceDesc/bibl`? See [Issue #14](https://github.com/TEI-Correspondence-SIG/CMIF/issues/14)

## References 

* Stefan Dumont, Ingo Börner, Jonas Müller-Laackman, Dominik Leipold, Gerlinde Schneider: Correspondence Metadata Interchange Format (CMIF). In: Encoding Correspondence. A Manual for Encoding Letters and Postcards in TEI-XML and DTABf. Edited by Stefan Dumont, Susanne Haaf, and Sabine Seifert. Berlin 2019–2020. URL: https://encoding-correspondence.bbaw.de/v1/CMIF.html 