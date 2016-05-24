<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:foxml="info:fedora/fedora-system:def/foxml#" xmlns:dc="http://purl.org/dc/elements/1.1/"
    exclude-result-prefixes="xs foxml xsi"
    version="2.0">
    <xsl:output method="text" indent="no" media-type="string" />
    <xsl:strip-space elements="*"/>
    <xsl:template match="/resultPage/gfindObjects/objects">
        <xsl:text>"PID","Author Name","Date","Title"</xsl:text>
        <xsl:call-template name="newline"/>
        <xsl:apply-templates select="object"/>
    </xsl:template>
    
    <xsl:template match="object">
        <xsl:apply-templates select="field[@name='dc.creator']"/>
    </xsl:template>
    
    <xsl:template match="field[@name='dc.creator']">
        <xsl:text>"</xsl:text><xsl:value-of select="../field[@name='PID']"/><xsl:text>","</xsl:text><xsl:value-of select="."/><xsl:text>","</xsl:text><xsl:value-of select="../field[@name='dc.date']"/><xsl:text>","</xsl:text><xsl:value-of select="../field[@name='dc.title']"/><xsl:text>"</xsl:text><xsl:call-template name="newline"/>
    </xsl:template>
    
    <xsl:template match="field">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="text()" />
    
    <xsl:template name="newline">
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>
