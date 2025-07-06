<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
  <head>
    <title>Theme Park Packages</title>
    <link rel="stylesheet" href="css/style.css"/>
    <style>
        body { background:rgb(41, 69, 126); }
        h1 { text-align: center; margin-top: 32px; }
        h2 { text-align: center; margin-top: 40px; }
        table.packages-table { 
        margin: 0 auto 40px auto; 
        background: #fff; 
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        border-collapse: separate;
        border-spacing: 0;
        overflow: hidden;
        }
        .packages-table th {
        background: #1e90ff;
        color: #fff;
        padding: 12px 8px;
        font-size: 1.1em;
        border-bottom: 2px solid #1565c0;
        }
        .packages-table td {
        background: #f9fbfd;
        color: #222;
        padding: 10px 8px;
        border-bottom: 1px solid #e0e7ef;
        }
        .packages-table tr:nth-child(even) td {
        background: #e3f0fa;
        }
        .packages-table tr:hover td {
        background: #b3e0ff;
        }
        .packages-table img.package-table-img {
        border-radius: 6px;
        border: 1px solid #cce4ff;
        width: 80px;
        height: auto;
        }
        .packages-table button {
        background: #1e90ff;
        color: #fff;
        border: none;
        padding: 7px 18px;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        transition: background 0.2s;
        }
        .packages-table button:hover {
        background: #1565c0;
        }
    </style>
  </head>
  <body>
    <h1>Theme Park Packages</h1>

    <!-- Family Packages Table -->
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

    <!-- Individu Packages Table -->
    <h2>Individu Packages</h2>
    <table border="1" class="packages-table">
      <tr>
        <th>Image</th>
        <th>Package Name</th>
        <th>Includes</th>
        <th>Price</th>
        <th></th>
      </tr>
      <xsl:for-each select="packages/package[type='Individu']">
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

    <!-- Season Packages Table -->
    <h2>Season Packages</h2>
    <table border="1" class="packages-table">
      <tr>
        <th>Image</th>
        <th>Package Name</th>
        <th>Includes</th>
        <th>Price</th>
        <th></th>
      </tr>
      <xsl:for-each select="packages/package[type='Season']">
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