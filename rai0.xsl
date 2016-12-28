<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
<xsl:template match="/">
<greeting>
Gain is <xsl:value-of select="/root/@gain"/>
</greeting>
</xsl:template>
 
</xsl:stylesheet>