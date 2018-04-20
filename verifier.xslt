<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="grade">
        <xsl:value-of select="@type"/> <xsl:value-of select="."/>
        <xsl:if test="@type = 'complex'">
            <xsl:message>Found a complex grade. Checking value...</xsl:message>
            <xsl:if test=". &gt; 5.0 or . &lt; 1.0">
                <xsl:message terminate="yes">Grade <xsl:value-of select="."/> bad range</xsl:message>
            </xsl:if>
            is valid grade 
        </xsl:if>
        <xsl:if test="@type = 'simple'">
            <xsl:message>Found a simple grade. Checking value...</xsl:message>
            <xsl:if test=". != 1.0 and . != 1.3 and . != 1.7 and . != 2.0 and . != 2.3 and . != 2.7 and . != 3.0 and . != 3.3 and . != 3.7 and . != 4.0 and . != 4.3 and . != 4.7 and . != 5.0">
                <xsl:message terminate="yes">Grade <xsl:value-of select="."/> not of simple type</xsl:message>
            </xsl:if>
            is valid grade 
        </xsl:if>
        <xsl:if test="@attempt &gt; 1">
            <xsl:message>Found a non-1 attempt - checking parents for <xsl:value-of select="preceding-sibling::*[1]"/> and their attempt value is <xsl:value-of select="preceding-sibling::grade[ 1]/@attempt"/></xsl:message>"
            <xsl:if test="number(preceding-sibling::*[ 1]/@attempt) != (./[@attempt] - 1)">
                <xsl:message terminate="yes">Werte: Improper sequence of grades</xsl:message>
            </xsl:if>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
