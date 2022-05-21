<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <title>Schematron extension of the Correspondence Metadata Interchange Format (CMIF)</title>
    
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    
    <pattern id="uuid">
        <rule context="tei:bibl">
            <assert test="matches(@xml:id, '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}')" role="warning">
                [W0001] It is recommended to use an UUID for bibl/@xml.
            </assert>
        </rule>
    </pattern>
    
    <pattern id="correspDesc">
        <rule context="tei:correspDesc">
            <assert test="tei:correspAction[@type='sent']" role="error">
                [E0001] Element "&lt;correspAction type="sent"/>" must be present.
            </assert>
            <assert test="tei:correspAction[@type='received']" role="error">
                [E0002] Element "&lt;correspAction type="received"/>" must be present.
            </assert>
        </rule>
        <rule context="tei:correspDesc/@source">
            <assert test="substring-after(., '#')=ancestor::tei:TEI//tei:bibl/@xml:id" role="error">
                [E0003] correspDesc/@source does not correspond to a bibl/@xml:id.
            </assert>
        </rule>
    </pattern>    
    
    <pattern id="date">
        <rule context="tei:date">
            <assert test="@when or @from or @to or @notBefore or @notAfter" role="error">
                [E0004] At least one dating attribute (@when, @from etc.) must be present. 
            </assert>
        </rule>
    </pattern>
    
    <!-- fehlt: 
        - Warnung bei fehlendem ref (?) oder anders auswerten? 
        - Warnung bei nicht-unterstützter Normdatei 
        - nochmal Issue checken
        -->
    
</schema>