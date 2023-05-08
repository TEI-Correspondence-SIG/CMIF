# CMIF – Correspondence Metadata Interchange Format

by TEI Correspondence SIG 2015-2018 ([see license](#license) and [see citation](#citation))

## About

The CMI format has been developed by the [TEI Correspondence SIG](http://www.tei-c.org/Activities/SIG/Correspondence/index.xml), and makes a standardized comparison of letter metadata possible. It does this by reducing the index to only the most essential elements—the sender, addressee, date, and location of a letter—as well as by regulating the inputted data. In addition to the benefits of TEI-XML encoding, this is greatly aided through authority files. Sender, addressee, and locations are identifiable independently of the specific project (for example through the [GND number from the German National Library](http://www.dnb.de/gnd)) and thus can be linked together. Finally, in CMI the individual letter is referenced for print editions by the letter identification number or bibliographical information and for digital editions by the URL.

The CMI format is based essentially on the TEI extension ‘[correspDesc](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ref-correspDesc.html)’ (Correspondence Description), a part of the [Text Encoding Initiative guidelines](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/index.html). The element correspDesc was developed by the TEI Correspondence Special Interest Group in order to record correspondence-specific metadata from letters, postcards, etc., in TEI-based editions. In April 2015 ‘correspDesc’ was officially added to the version 2.8 of TEI P5.

The CMI format is the underlying data format for the web service ‘[correspSearch](http://correspsearch.net/)’ (funded by the German Research Foundation) which enables scholars to search across diverse distributed scholarly editions of letters (both printed and digital). 

## How-to

* [Documentation of the CMIF](doc/documentation-en.md)
* [Template files](templates/)
* [Example files](examples/)

The research project "correspSearch" provides a [tutorial](http://correspsearch.net/index.xql?id=participate_steps&l=en) and an online tool, the [CMIF Creator](http://correspsearch.net/creator/index.xql), which allows scholars to create and edit CMIF files without any knowledge of TEI-XML.  

There are various ways of extracting CMIF from existing TEI collections via XSL-T or XQuery. Reusable examples include: 

* <https://github.com/QHOD/qhodCMIFxquery> a basic XQuery for the [QhoD project](https://qhod.net)
* [correspDesc.xql](https://github.com/Edirom/WeGA-WebApp/blob/develop/modules/correspDesc.xql): an XQuery script used within the [WeGA-WebApp](https://github.com/Edirom/WeGA-WebApp) for creating its [CMIF file](http://weber-gesamtausgabe.de/correspDesc.xml). 

## Discussion &  further development

See ["Dumont et al. 2019"](https://encoding-correspondence.bbaw.de/v1/CMIF.html) for the further development of the CMIF. Discuss there via Hypothes.is, in the section ["Issues"](https://github.com/TEI-Correspondence-SIG/CMIF/issues) in this repository or on the [Mailinglist](https://listserv.brown.edu/archives/cgi-bin/wa?A0=TEI-CORRESP-SIG) of the TEI Correspondence SIG. 

## Literature

- Peter Stadler, Marcel Illetschko, and Sabine Seifert, « Towards a Model for Encoding Correspondence in the TEI: Developing and Implementing <correspDesc> », Journal of the Text Encoding Initiative 9 (2016-2017) URL : http://journals.openedition.org/jtei/1433; DOI: 10.4000/jtei.1433
- Stefan Dumont, « Perspectives of the further development of the Correspondence Metadata Interchange Format (CMIF) — digiversity », 10.2015, URL: https://digiversity.net/2015/perspectives-of-the-further-development-of-the-correspondence-metadata-interchange-format-cmif/.
- Stefan Dumont, « correspSearch – Connecting Scholarly Editions of Letters », Journal of the Text Encoding Initiative 10 (2016). URL: http://journals.openedition.org/jtei/1742; DOI: 10.4000/jtei.1742 
- Stefan Dumont, Ingo Börner, Dominik Leipold, Jonas Müller-Laackman, Gerlinde Schneider: Correspondence Metadata Interchange Format, in: Encoding Correspondence. A Manual for Encoding Letters and Postcards in TEI-XML and DTABf, edited by Stefan Dumont, Susanne Haaf and Sabine Seifert. Berlin 2019. https://encoding-correspondence.bbaw.de/v1/CMIF.html  
- Stephan Kurz, « Correspondence Metadata Interchange Format (CMIF) », KONDE Weißbuch. Hrsg. v. Helmut W. Klug unter Mitarbeit von Selina Galka und Elisabeth Steiner im HRSM-Projekt Kompetenznetzwerk Digitale Edition. Graz 2021. https://hdl.handle.net/11471/562.50.42. 

## Citation

TEI Correspondence SIG. 2018. Correspondence Metadata Interchange Format (CMIF). v1.0.0. https://github.com/TEI-Correspondence-SIG/CMIF

## License

© TEI Correspondence SIG 2015-2018

This work is available under dual license: [BSD 2-Clause](http://opensource.org/licenses/BSD-2-Clause) and [Creative Commons Attribution 4.0 License (CC BY 4.0)](http://creativecommons.org/licenses/by/4.0/)
