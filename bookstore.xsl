<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/">
    <ul><xsl:apply-templates select="Bookstore"/></ul>
</xsl:template>

<xsl:template match="Bookstore">
    <h2>Books</h2>
    <xsl:for-each select="Book">
    <xsl:sort order="ascending" select="number(@Price)" data-type="number"/>
        <h3><xsl:value-of select="Title"/></h3>
        <p><xsl:value-of select="@ISBN"/></p>
        <p>Price: <xsl:value-of select="@Price"/></p>
        <h4>Authors:</h4>
        <xsl:for-each select="Authors/Author">
            <ul><li>
                <xsl:if test="First_Name!='Jennifer'"><xsl:apply-templates select="First_Name"/></xsl:if>
                <xsl:if test="First_Name='Jennifer'"><xsl:text>Ms.</xsl:text></xsl:if>
                <xsl:text> </xsl:text><xsl:apply-templates select="Last_Name"/>
            </li></ul>
        </xsl:for-each>
        <p><xsl:value-of select="Remark"/></p>
    </xsl:for-each>
    <h2>Magazines</h2>
    <xsl:for-each select="Magazine">
    <xsl:sort order="descending" select="number(@Year)" data-type="number"/>
        <h3><xsl:value-of select="Title"/></h3>
        <p>Year: <xsl:value-of select="@Year"/>, Month: <xsl:value-of select="@Month"/></p>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>