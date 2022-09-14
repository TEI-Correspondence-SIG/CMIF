xquery version "3.0";
declare namespace functx = "http://www.functx.com";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare option omit-xml-declaration "yes";
declare variable $pdu external;

(: define some string constants :)
let $baseurl := 'https://qhod.net/'
let $uuid := 'c3a12a74-341f-11ed-a261-0242ac120002' (: option: call unparsed-text(doc('https://www.uuidgenerator.net/api/version1')) :)
let $projectname := 'QhoD project'

(: fallback if the Oxygen Scenario does not include a value for $pdu as a parameter :) 
let $pdu := '/home/skurz/Dokumente/git/qhod-data/TEI'
let $docs := collection(concat($pdu, "?select=*.xml;recurse=yes"))
let $letterlike := $docs[//tei:correspAction]//tei:teiHeader

(:
Quick XQuery to get all correspDesc elements of the QhoD project into a CMIF file according to the example files at https://github.com/TEI-Correspondence-SIG/CMIF/tree/main/examples
The actual loop fetching //correspAction starts in line 54

Output might need some XSL postprocessing in order to validate against the strict CMIF schema.
:)

    return 
    <TEI xmlns="http://www.tei-c.org/ns/1.0"><?xml-model href="https://raw.githubusercontent.com/TEI-Correspondence-SIG/CMIF/main/schema/cmi-customization.rng"?>
    <teiHeader>
    <fileDesc>
      <titleStmt>
        <title xml:lang="de">CMIF data for {$projectname}</title>
        <editor><persName ref="https://orcid.org/0000-0003-2546-2570 http://d-nb.info/gnd/13281899X">Stephan Kurz</persName></editor>
      </titleStmt>
      <publicationStmt>
        <publisher>Austrian Academy of Sciences, Institute for Habsburg and Balkan Studies</publisher>
        <idno type="PID">o:qhod.cmif</idno>
        <idno type="url">https://qhod.net/archive/objects/o:qhod.cmif/methods/sdef:TEI/getSource</idno>
        <date when="2022"/>
        <availability>
          <licence target="https://creativecommons.org/licenses/by/4.0/">CC-BY 4.0</licence>
        </availability>
      </publicationStmt>
      <!--<seriesStmt>
        <title xml:lang="de">Digitale Edition von Quellen zur habsburgisch-osmanischen Diplomatie 1500–1918</title>
        <title xml:lang="en">Digital Scholarly Edition of Habsburg-Ottoman Diplomatic Sources 1500–1918</title>
        <title xml:lang="tr">Habsburg-Osmanlı Diplomasisi Kaynakları Dijital Edisyonu 1500–1918</title>
        <respStmt>
          <resp>Projektleitung</resp>
          <persName>Arno Strohmeyer</persName>
        </respStmt>
      </seriesStmt>-->
      <sourceDesc>
        <bibl type="online" xml:id="{$uuid}">Digitale Edition von Quellen zur habsburgisch-osmanischen Diplomatie (1500–1918)</bibl>
      </sourceDesc>
    </fileDesc>
    <profileDesc>{
      for $letter in $letterlike
    let $filestring := concat($baseurl, $letter//tei:idno[@type='PID'])
    return <correspDesc ref="{$filestring}" source="{concat('#', $uuid)}">{$letter//tei:correspAction}</correspDesc>
        }</profileDesc>
    <!--<revisionDesc>
      <change><persName>Stephan Kurz</persName> <date when="{format-dateTime(current-dateTime(),'[Y0001]-[M01]-[D01]T[H01]:[m01]:[s]')}"></date> run XQuery</change>
    </revisionDesc>-->
  </teiHeader>
  <text><body><p/></body></text>
  </TEI>