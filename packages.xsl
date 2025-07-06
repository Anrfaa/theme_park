<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
  <head>
    <title>Theme Park Packages</title>
    <link rel="stylesheet" href="css/style.css"/>
  </head>
  <body>
    <h1>Theme Park Packages</h1>
    <h2>Family Packages</h2>
    <table border="1" class="packages-table">
      <tr>
        <th>Image</th>
        <th>Package Name</th>
        <th>Includes</th>
        <th>Price</th>
        <th></th>
      </tr>
      <xsl:for-each select="packages/package[type='Family']">
        <tr>
          <td>
            <img>
              <xsl:attribute name="src"><xsl:value-of select="image"/></xsl:attribute>
              <xsl:attribute name="alt"><xsl:value-of select="name"/></xsl:attribute>
              <xsl:attribute name="class">package-table-img</xsl:attribute>
            </img>
          </td>
          <td><xsl:value-of select="name"/></td>
          <td>
            <xsl:call-template name="split-includes">
              <xsl:with-param name="inc" select="includes"/>
            </xsl:call-template>
          </td>
          <td>$<xsl:value-of select="price"/></td>
          <td><button>Book Now</button></td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
</html>
</xsl:template>

<!-- Template to split includes by comma and display as <br> -->
<xsl:template name="split-includes">
  <xsl:param name="inc"/>
  <xsl:choose>
    <xsl:when test="contains($inc, ',')">
      <xsl:value-of select="substring-before($inc, ',')"/><br/>
      <xsl:call-template name="split-includes">
        <xsl:with-param name="inc" select="substring-after($inc, ',')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$inc"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>