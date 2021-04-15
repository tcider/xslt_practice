<?xml version="1.0" encoding="utf-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="xml" encoding="utf-8" indent="yes" />

<xsl:template match="/">
    <movies>
        <xsl:for-each select="//movie">
        <xsl:sort order="descending" select="number(year)" data-type="number"/>
            <xsl:sort order="ascending" select="title"/>
                <title><xsl:value-of select="title"/></title>
                <year><xsl:value-of select="year"/></year>
                <xsl:for-each select="country">
                <xsl:sort order="ascending" select="country" data-type="text"/>
                    <country><xsl:value-of select="text()"/></country>
                </xsl:for-each>
                <genre><xsl:value-of select="genre"/></genre>
                <xsl:if test="summary">
                    <summary>   
                        <xsl:value-of select="summary"/>
                    </summary>
                </xsl:if>
                <director>
                    <first_name><xsl:value-of select="director/first_name"/></first_name>
                    <last_name><xsl:value-of select="director/last_name"/></last_name>
                    <birth_date><xsl:value-of select="director/birth_date"/></birth_date>
                </director>
                <xsl:for-each select="actor">
                <xsl:sort order="ascending" select="last_name"/>
                    <actor>
                        <xsl:copy-of select="*"/>
                    </actor>
                </xsl:for-each>
        </xsl:for-each>
    </movies>
</xsl:template>
</xsl:transform>