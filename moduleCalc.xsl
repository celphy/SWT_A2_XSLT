<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="course">
        <xsl:if test="./@cid = 'IM130'">
            
            <xsl:variable name="complexGrade" select="sum(for $i in ./course/grade return $i) div count(./course/grade)"/>
            <xsl:message>Sum is <xsl:value-of select="sum(for $i in ./course/grade return $i)"/> and count is <xsl:value-of select="count(./course/grade)"/> </xsl:message>
            <xsl:for-each select="./grade/course">
                <xsl:if test="./@attempt = 3 and . &gt; 4.0">
                    <xsl:message terminate="yes">
                        IM130 has been failed with no recourse.
                    </xsl:message>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:message>Complexe Course Grade is <xsl:value-of select="$complexGrade"/> </xsl:message>
            
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
