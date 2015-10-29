# CMIF
Correspondence Metadata Interchange Format

## News

2014-10-29: New blog post: [Perspectives of the further development of the Correspondence Metadata Interchange Format (CMIF)](http://digiversity.net/2015/perspectives-of-the-further-development-of-the-correspondence-metadata-interchange-format-cmif/)

## About

The CMI format is based essentially on the TEI extension ‘[correspDesc](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ref-correspDesc.html)’ (Correspondence Description), a part of the [Text Encoding Initiative guidelines](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/index.html). The element correspDesc was developed by the TEI Correspondence Special Interest Group in order to record correspondence-specific metadata from letters, postcards, etc., in TEI-based editions. In April 2015 ‘correspDesc’ was officially added to the version 2.8 of TEI P5.

The CMI format was developed by the TEI Correspondence SIG as well, and makes a standardized comparison of letter metadata possible. It does this by reducing the index to only the most essential elements—the sender, addressee, date, and location of a letter—as well as by regulating the inputted data. In addition to the benefits of TEI-XML encoding, this is greatly aided through authority files. Sender, addressee, and locations are identifiable independently of the specific project (for example through the [GND number from the German National Library](http://www.dnb.de/gnd)) and thus can be linked together. Finally, in CMI the individual letter is referenced for print editions by the letter identification number or bibliographical information and for digital editions by the URL.

The CMI format is the underlying data format for the web service ‘[correspSearch](http://correspsearch.bbaw.de/)’ which facilitates searching across diverse distributed letter repositories.

## License

This work is available under dual license: [BSD 2-Clause](http://opensource.org/licenses/BSD-2-Clause) and [Creative Commons Attribution 4.0 License (CC BY 4.0)](http://creativecommons.org/licenses/by/4.0/)
