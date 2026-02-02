 
## Introduction

The "Correspondence Metadata Interchange Format" (CMIF) enables scholars to create digital indexes of letters from their scholarly editions and provide them online. The CMIF has been developed by the TEI Correspondence SIG and is a highly reduced and restricted subset of the TEI Guidelines which is based mainly on the TEI element `correspDesc`.

The Basis of a digital index of letters according to the CMIF is a TEI-XML file. You can download [templates with short descriptions here](https://github.com/TEI-Correspondence-SIG/CMIF/tree/main/examples). An [RNG schema](https://github.com/TEI-Correspondence-SIG/CMIF/blob/main/schema/cmi-customization.rng), which you can use to validate your CMIF file, is also available.

## Overview

The TEI-XML file contains as many `correspDesc` elements as the provider have letters, postcards, etc. in his scholarly edition. A particular `correspDesc` element in CMI format is more restrictive and reduced with regard to its vocabulary than the TEI Guidelines generally allow. This enables interchange between the respective TEI documents.

For persons and places in the "correspondence description" (sender, addressee, senders place etc.) an ID from an authority file should be provided to identify these entities across projects and to use the correspondence metadata in network analysis or web services (e.g. [correspSearch](http://correspsearch.net)). Possible authority files for persons could be:

* [Virtual Authority File (VIAF)](http://viaf.org)
* [Gemeinsame Normdatei (GND)](http://www.dnb.de/gnd), Deutsche Nationalbibliothek
* [Autorités, Bibliothèque nationale de France](http://catalogue.bnf.fr/recherche-autorite.do) (BNF)
* [Library of Congress Authorities (LC)](http://authorities.loc.gov/)
* [Web NDL Authorities](http://id.ndl.go.jp/auth/ndla), National Diet Library (NDL), Japan

For places the TEI Correspondence SIG recommends to use the free licensed geographical database [GeoNames](http://www.geonames.org).

Please note: GeoNames categorises the stored locations using [‘feature classes’ / ‘feature codes’](https://www.geonames.org/export/codes.html). A place name can appear in several feature classes at the same time, which is particularly the case for larger cities. For example, Vienna appears as feature code `PPL` (Populated Place) in feature class "P" and as `ADM1` (first-order administrative division) in feature class "A". For location information such as cities and villages, the identifier of the feature class "A" should generally be used – not from class "A". This avoids ‘duplicates’ in aggregators such as correspSearch. Special locations such as estates, castles, lakes, etc. can of course be assigned the appropriate identifier from the respective feature class. The Advanced search on GeoNames.org can be limited to teh recommended feature class "P" for cities and villages.

## Details

### Correspondence Metadata

The following table offers detailed information about the particular parts of a `correspDesc` element in the CMI format:

|XPath (relative to `correspDesc`)|Description|Value(s) and Notes|
| --- | --- | --- |
|/@key|Number of the letter in the printed scholarly edition. If not available, page number can be noted.|E.g. `"128"` (or, if not available: "p. 56")|
|/@ref|URL of the letter, if available online. The URL should be an official and permanent link. If different versions of a letter are available, a canonical link should be used.|E.g. `"http://edition-humboldt.de/H0002656"`|
|/@source|Links with the help of an UUID (prefixed by "#") to the bibliographic information (i.e. where the correspondence metadata comes from). Form more information see `bibl/@xml:id` below.|E.g. `"#c3f497f0-488d-4233-9448-130ba8109bd8"`|
|/correspAction|Includes the data related to the sending/receiving process of a letter, postcard etc.|Only the following child elements (no text allowed): persName, orgName, placeName, date|
|/correspAction/@type|Type of the correspondence action|Allowed: `"sent", "received"`|
|/correspAction/persName|Personal name of sender or addressee|Mandatory; if the sender or addressee is unknown please indicate this by the string `"Unknown"`|
|/correspAction/persName/@ref|Authority controlled ID of sender or addressee|Strongly recommended, if available. Possible authority files: VIAF, GND, LC, BNF and NDL (see above) |
|/correspAction/persName/@evidence|The person is not stated in the source itself, but is based on the knowledge/research of the scholar.|`conjecture`|
|/correspAction/persName/@cert|The attribution of this person to this letter is uncertain.|`low`|
|/correspAction/orgName|Name of institution, company etc. The attributes @evidence and @cert are applicable, see `persName` for details.|Optional, if `persName` is not applicable|
|/correspAction/placeName|Name of the place a letter was sent from or where it is being sent to. The attributes @evidence and @cert are applicable, see `persName` for details.|If available.|
|/correspAction/placeName/@ref|Authority controlled ID of the place a letter was sent from or where it is being sent to|Strongly recommended, if available. Possible authority files: GeoNames. Please use the GeoNames ID from the correct feature class (see above for details).|
|/correspAction/date|Machine-readable date of when the letter was sent or received|If available. The CMIF supports the attributes `@when, @from, @to, @notBefore` and `@notAfter`. To facilitate the interchange, the CMIF supports (unlike the TEI Guidelines) only the following date formats: YYYY-MM-DD, e.g. 1804-03-01; YYYY-MM, e.g. 1804-03; YYYY, e.g. 1808; |
|/correspAction/date/text()|Human readable date of when the letter was sent or received. The date should only be provided in text form if it contains information that cannot be clearly or only partially reproduced in the (recommended) machine-readable form. However, please always include a machine-readable date (see above).|Any date|
|/note/ref|Here, using the CMIF v2 extension and the associated vocabulary, additional metadata about the letter can be noted, such as places or people mentioned in the letter text, the URL to the TEI-XML full text, or the language used in the letter. For encoding and vocabulary, see the section [“CMIF v2: Additional information on the letter and its content”](#cmif-v2) below.|Attribute `@type` with URIs from the CMIF v2 vocab and attribute `@target` with URIs from authority files (GND, Wikidata, GeoNames etc) or CMIF v2 vcoabulary. [Details see below](#cmif-v2).|

The `correspDesc` elements are noted inside `TEI/teiHeader/profileDesc` - as described in the TEI Guidelines.

### Information about the digital index of letters (CMIF file)

Besides the correspondence metadata, the provider have to include some information about the CMIF file and the digital index of letters itself in the `teiHeader/fileDesc` element. All elements there are mandatory if not stated otherwise.

|XPath|Description|Value(s) and Notes|
| --- | --- | --- |
|//titleStmt/title|Title of the digital index of letters|Free text field|
|//titleStmt/editor|Contact person concerning the digital index of letters|If available with an e-mail address in `editor/email`|
|//publicationStmt/publisher|Originator of the letter metadata as defined in the Creative Commons Licence CC-BY 4.0|Free text field|
|//publicationStmt/availability/licence|Licence statement|Mandatory: `"This file is licensed under the terms of the Creative Commons License CC-BY 4.0"`|
|//publicationStmt/availability/licence/@target|URL of the licence|Mandatory: `"https://creativecommons.org/licenses/by/4.0/"` or `"https://creativecommons.org/publicdomain/zero/1.0/"`|
|//publicationStmt/date/@when|Timestamp of the last update of this file|Format: xsd:dateTime|
|//publicationStmt/idno|URL of this digital index of letters|The URL serves as a unique identifier for the CMIF file and ensures that the file can always traced back to their origin|
|//publicationStmt/idno/@type|Type of the above mentioned identifier|Mandatory: `"URL"`|
|//sourceDesc/bibl|Bibliographic information about the scholarly edition from which the correspondence metadata is derived from.|No specifications.|
|//sourceDesc/bibl/@xml:id|Technical ID of the bibl element, i.e. the bibliographic information. An UUID has to be used. The correspDesc items have to be referenced by this UUID (see above @source).|E.g. `"c3f497f0-488d-4233-9448-130ba8109bd8"`. An UUID can easily be generated by [many online tools](https://www.google.de/search?q=uuid+generator). If the CMIF is created via a script (as common in digital scholarly editions), it is recommended to use a "static" UUID, i.e. which is not re-generated every time the CMIF data is updated.|
|//sourceDesc/bibl/@type|Type of scholarly edition|The following values are allowed: `"print", "online", "hybrid".`|

### CMIF v2: Additional information on the letter and its content

With CMIF v2 the correspondence metadata described above can be enhanced. The TEI XML encoding offered by CMIF v1 is used in the same way in CMIF v2. A CMIF v2 compliant file is simply supplemented with additional information, specifically the following (for each letter):

* Entities mentioned in the letter (persons, places, etc.).
* Language(s) in which the letter was mainly written
* The textual basis of the edited letter (draft, manuscript, copy, etc.)
* Link to the TEI-XML file of the edited letter containing the full text
* What type of information is provided in the scholarly resource (metadata only, transcription, facsimile, etc.)
* References to archival documents, other editions or records of the letter

The new information added in CMIF v2 will all be encoded as `ref` elements in each `correspDesc/note`. The ref elements each carry an attribute `@type` and an attribute `@target`. Both attributes usually have a URI as value, but the values for `@type` are always taken from the vocabulary developed specifically for CMIF v2 (see next paragraph). The attribute `@target` also contains a URI in nearly all cases, often from a authority file, to guarantee cross-project application. For some information in the `@target` attribute, the CMIF v2 vocabulary also provides specially defined URIs. For more information on the rationale behind the modelling of CMIF v2 features, see [Dumont et al. 2019](#dumont-etal2019).

The vocabulary for the attribute `@type` and the CMIF-specific parts of the attribute `@target` is published on [lod.academy](https://lod.academy), a service provided by the Academy of Sciences and Literature Mainz. Thus, a permanent, cross-institutional and project-independent availability is guaranteed. The official namespace [https://lod.academy/cmif/vocab/terms/](https://lod.academy/cmif/vocab/terms/) can also be accessed as HTML in the browser, so that the definition of the vocabulary can be viewed directly.

All possible information and their official URIs can be found in the [vocabulary documentation](https://lod.academy/cmif/vocab/terms/). The URIs that can be used for the ref/@type attribute can be found in the [‘Object Properties’ section](https://lod.academy/cmif/vocab/terms/#objectproperties), and those for the ref/@target attribute in [‘Named Individuals’](https://lod.academy/cmif/vocab/terms/#namedindividuals).

The namespace `https://lod.academy/cmif/vocab/terms/` can be specified completely or abbreviated with the prefix `cmif:`. In the latter case, it is recommended to define the namespace via `listPrefixDef` (see [https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SAPU](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SAPU)).

## Bibliography

Sorted by year (ascending)
Stadler, Peter. 2014. „Interoperabilität von digitalen Briefeditionen“. In Fontanes Briefe ediert, edited by Hanna Delf von Wolzhagen. Fontaneana 12. Königshausen & Neumann.Stadler, Peter, Marcel Illetschko, and Sabine Seifert. 2016. „Towards a Model for Encoding Correspondence in the TEI: Developing and Implementing <correspDesc>“. Journal of the Text Encoding Initiative [Online] 9. [https://dx.doi.org/10.4000/jtei.1742](https://dx.doi.org/10.4000/jtei.1742.).Dumont, Stefan. 2018. „correspSearch – Connecting Scholarly Editions of Letters“. Journal of the Text Encoding Initiative 10. [https://doi.org/10.4000/jtei.1742](https://doi.org/10.4000/jtei.1742).Dumont, Stefan, Ingo Börner, Dominik Leipold, Jonas Müller-Laackman, and Gerlinde Schneider. 2019. „Correspondence Metadata Interchange Format“. In Encoding Correspondence. A Manual for TEI-XML-Based Encoding of Letters and Postcards, edited by Stefan Dumont, Susanne Haaf, und Sabine Seifert. Berlin. [https://encoding-correspondence.bbaw.de/v1/CMIF.html](https://encoding-correspondence.bbaw.de/v1/CMIF.html).TEI Correspondence SIG. 2025. Correspondence Metadata Interchange Format (CMIF) vocabulary [https://lod.academy/cmif/vocab/terms](https://lod.academy/cmif/vocab/terms)