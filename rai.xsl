<xsl:transform version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Created by Michael Lerman, Aug 2012 -->

  <xsl:strip-space  elements="*"/>

  <xsl:template match="space">
      <space>
	    <xsl:value-of select="token[2]"/>
	  </space>
  </xsl:template>

  <xsl:template match="title">
      <title>
	    <xsl:value-of select="token[1]"/>
	  </title>
  </xsl:template>

  <xsl:template match="size">
      <size>
	    <xsl:value-of select="token[1]"/>
	  </size>
  </xsl:template>
  
  <xsl:template match="rattribute">
      <rattribute>
	    <xsl:value-of select="token[1]"/>
	  </rattribute>
  </xsl:template>

  <xsl:template match="ftype">
    <xsl:choose>
      <xsl:when test="token[1]='ALPHA'">
	    <ALPHA>
			<xsl:for-each select="//fieldtexts/fieldtext">
				<fieldtext>
					<xsl:value-of select="quoted/token[1]"/>
				</fieldtext>
				<bitmatch>
					<xsl:value-of select="token[2]"/>
				</bitmatch>
			</xsl:for-each>
	    </ALPHA>
      </xsl:when>
      <xsl:otherwise>
	    <xsl:value-of select="token[1]"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="leftclause">
    <!-- leftclause becomes the tagname and right clause becomes the tag value -->
    <xsl:variable name="leftclausetagname" select="token[1]" />
    <xsl:element name="{$leftclausetagname}">
	  <xsl:value-of select="../rightclause/token[1]"/>
	</xsl:element>
  </xsl:template>
  <xsl:template match="field">
      <field>
		<fname>
			<xsl:value-of select="fname"/>
		</fname>
		<frange>
			<xsl:value-of select="frange/token[1]"/>
		</frange>
		<ftype>
			<xsl:apply-templates/>	<!-- allows the template with match="ftype" to apply for this content -->
		</ftype>
	  </field>
  </xsl:template>
  
  
  <!-- those matching elements are removed (empty template) -->
  <xsl:template match="token"/>
  


</xsl:transform>

