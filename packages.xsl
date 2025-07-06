<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Language parameter: default to 'en' -->
<xsl:param name="lang" select="'en'"/>

<xsl:template match="/">
<html>
  <head>
    <title>Theme Park Packages</title>
    <link rel="stylesheet" href="css/style.css"/>
    <style>
      body { background:rgb(41, 69, 126); }
      h1 { text-align: center; margin-top: 32px; }
      h2 { text-align: center; margin-top: 40px; }
      table.packages-table { margin: 0 auto 40px auto; background: #fff; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.07); border-collapse: separate; border-spacing: 0; overflow: hidden; }
      .packages-table th { background: #1e90ff; color: #fff; padding: 12px 8px; font-size: 1.1em; border-bottom: 2px solid #1565c0; }
      .packages-table td { background: #f9fbfd; color: #222; padding: 10px 8px; border-bottom: 1px solid #e0e7ef; }
      .packages-table tr:nth-child(even) td { background: #e3f0fa; }
      .packages-table tr:hover td { background: #b3e0ff; }
      .packages-table img.package-table-img { border-radius: 6px; border: 1px solid #cce4ff; width: 80px; height: auto; }
      .packages-table button { background: #1e90ff; color: #fff; border: none; padding: 7px 18px; border-radius: 4px; cursor: pointer; font-weight: bold; transition: background 0.2s; }
      .packages-table button:hover { background: #1565c0; }
      .lang-switch { text-align:center; margin: 24px 0 32px 0; }
      .lang-btn { background: #fff; color: #1e90ff; border: 2px solid #1e90ff; border-radius: 4px; padding: 7px 18px; margin: 0 8px; font-weight: bold; cursor: pointer; }
      .lang-btn.active, .lang-btn:hover { background: #1e90ff; color: #fff; }
    </style>
    <script>
      function switchLang(lang) {
        var url = window.location.href.split('?')[0] + '?lang=' + lang;
        window.location.href = url;
      }
    </script>
  </head>
  <body>
    <div class="lang-switch">
      <button class="lang-btn">
        <xsl:attribute name="class">
          lang-btn<xsl:if test="$lang='en'"> active</xsl:if>
        </xsl:attribute>
        <xsl:attribute name="onclick">switchLang('en')</xsl:attribute>
        English
      </button>
      <button class="lang-btn">
        <xsl:attribute name="class">
          lang-btn<xsl:if test="$lang='ms'"> active</xsl:if>
        </xsl:attribute>
        <xsl:attribute name="onclick">switchLang('ms')</xsl:attribute>
        Bahasa
      </button>
    </div>

    <h1>
      <xsl:choose>
        <xsl:when test="$lang='ms'">Pakej Taman Tema</xsl:when>
        <xsl:otherwise>Theme Park Packages</xsl:otherwise>
      </xsl:choose>
    </h1>

    <!-- Family Packages Table -->
    <h2>
      <xsl:choose>
        <xsl:when test="$lang='ms'">Pakej Keluarga</xsl:when>
        <xsl:otherwise>Family Packages</xsl:otherwise>
      </xsl:choose>
    </h2>
    <table border="1" class="packages-table">
      <tr>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Gambar</xsl:when>
            <xsl:otherwise>Image</xsl:otherwise>
          </xsl:choose>
        </th>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Nama Pakej</xsl:when>
            <xsl:otherwise>Package Name</xsl:otherwise>
          </xsl:choose>
        </th>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Termasuk</xsl:when>
            <xsl:otherwise>Includes</xsl:otherwise>
          </xsl:choose>
        </th>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Harga</xsl:when>
            <xsl:otherwise>Price</xsl:otherwise>
          </xsl:choose>
        </th>
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
          <td>
            <xsl:choose>
              <xsl:when test="$lang='ms'">
                <xsl:choose>
                  <xsl:when test="name='Family Fun Pack'">Pakej Keriangan Keluarga</xsl:when>
                  <xsl:when test="name=&quot;Kids' Day Out&quot;">Hari Kanak-Kanak</xsl:when>
                  <xsl:otherwise><xsl:value-of select="name"/></xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise><xsl:value-of select="name"/></xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="$lang='ms'">
                <xsl:call-template name="translate-includes">
                  <xsl:with-param name="inc" select="includes"/>
                  <xsl:with-param name="name" select="name"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="split-includes">
                  <xsl:with-param name="inc" select="includes"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="$lang='ms'">RM<xsl:value-of select="price"/></xsl:when>
              <xsl:otherwise>$<xsl:value-of select="price"/></xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <button>
              <xsl:choose>
                <xsl:when test="$lang='ms'">Tempah Sekarang</xsl:when>
                <xsl:otherwise>Book Now</xsl:otherwise>
              </xsl:choose>
            </button>
          </td>
        </tr>
      </xsl:for-each>
    </table>

    <!-- Individu Packages Table -->
    <h2>
      <xsl:choose>
        <xsl:when test="$lang='ms'">Pakej Individu</xsl:when>
        <xsl:otherwise>Individu Packages</xsl:otherwise>
      </xsl:choose>
    </h2>
    <table border="1" class="packages-table">
      <tr>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Gambar</xsl:when>
            <xsl:otherwise>Image</xsl:otherwise>
          </xsl:choose>
        </th>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Nama Pakej</xsl:when>
            <xsl:otherwise>Package Name</xsl:otherwise>
          </xsl:choose>
        </th>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Termasuk</xsl:when>
            <xsl:otherwise>Includes</xsl:otherwise>
          </xsl:choose>
        </th>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Harga</xsl:when>
            <xsl:otherwise>Price</xsl:otherwise>
          </xsl:choose>
        </th>
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
          <td>
            <xsl:choose>
              <xsl:when test="$lang='ms'">
                <xsl:choose>
                  <xsl:when test="name='Adventure Seeker'">Pencari Pengembaraan</xsl:when>
                  <xsl:when test="name='Solo Explorer'">Penjelajah Solo</xsl:when>
                  <xsl:when test="name=&quot;Couple's Escape&quot;">Percutian Pasangan</xsl:when>
                  <xsl:otherwise><xsl:value-of select="name"/></xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise><xsl:value-of select="name"/></xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="$lang='ms'">
                <xsl:call-template name="translate-includes">
                  <xsl:with-param name="inc" select="includes"/>
                  <xsl:with-param name="name" select="name"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="split-includes">
                  <xsl:with-param name="inc" select="includes"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="$lang='ms'">RM<xsl:value-of select="price"/></xsl:when>
              <xsl:otherwise>$<xsl:value-of select="price"/></xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <button>
              <xsl:choose>
                <xsl:when test="$lang='ms'">Tempah Sekarang</xsl:when>
                <xsl:otherwise>Book Now</xsl:otherwise>
              </xsl:choose>
            </button>
          </td>
        </tr>
      </xsl:for-each>
    </table>

    <!-- Season Packages Table -->
    <h2>
      <xsl:choose>
        <xsl:when test="$lang='ms'">Pakej Musim</xsl:when>
        <xsl:otherwise>Season Packages</xsl:otherwise>
      </xsl:choose>
    </h2>
    <table border="1" class="packages-table">
      <tr>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Gambar</xsl:when>
            <xsl:otherwise>Image</xsl:otherwise>
          </xsl:choose>
        </th>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Nama Pakej</xsl:when>
            <xsl:otherwise>Package Name</xsl:otherwise>
          </xsl:choose>
        </th>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Termasuk</xsl:when>
            <xsl:otherwise>Includes</xsl:otherwise>
          </xsl:choose>
        </th>
        <th>
          <xsl:choose>
            <xsl:when test="$lang='ms'">Harga</xsl:when>
            <xsl:otherwise>Price</xsl:otherwise>
          </xsl:choose>
        </th>
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
          <td>
            <xsl:choose>
              <xsl:when test="$lang='ms'">
                <xsl:choose>
                  <xsl:when test="name='Summer Splash'">Percikan Musim Panas</xsl:when>
                  <xsl:when test="name='Winter Wonderland'">Keajaiban Musim Sejuk</xsl:when>
                  <xsl:when test="name='Spring Bloom'">Mekar Musim Bunga</xsl:when>
                  <xsl:otherwise><xsl:value-of select="name"/></xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise><xsl:value-of select="name"/></xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="$lang='ms'">
                <xsl:call-template name="translate-includes">
                  <xsl:with-param name="inc" select="includes"/>
                  <xsl:with-param name="name" select="name"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="split-includes">
                  <xsl:with-param name="inc" select="includes"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <xsl:choose>
              <xsl:when test="$lang='ms'">RM<xsl:value-of select="price"/></xsl:when>
              <xsl:otherwise>$<xsl:value-of select="price"/></xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <button>
              <xsl:choose>
                <xsl:when test="$lang='ms'">Tempah Sekarang</xsl:when>
                <xsl:otherwise>Book Now</xsl:otherwise>
              </xsl:choose>
            </button>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
</html>
</xsl:template>

<!-- English: Split includes by comma -->
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

<!-- Bahasa Melayu: Translate and split includes -->
<xsl:template name="translate-includes">
  <xsl:param name="inc"/>
  <xsl:param name="name"/>
  <xsl:choose>
    <xsl:when test="contains($inc, ',')">
      <xsl:call-template name="translate-include-item">
        <xsl:with-param name="item" select="substring-before($inc, ',')"/>
        <xsl:with-param name="name" select="$name"/>
      </xsl:call-template><br/>
      <xsl:call-template name="translate-includes">
        <xsl:with-param name="inc" select="substring-after($inc, ',')"/>
        <xsl:with-param name="name" select="$name"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="translate-include-item">
        <xsl:with-param name="item" select="$inc"/>
        <xsl:with-param name="name" select="$name"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Translate each include item (add more as needed) -->
<xsl:template name="translate-include-item">
  <xsl:param name="item"/>
  <xsl:param name="name"/>
  <xsl:choose>
    <!-- Family -->
    <xsl:when test="normalize-space($item)='4 Entry Tickets'">4 Tiket Masuk</xsl:when>
    <xsl:when test="normalize-space($item)='Free Lunch Vouchers'">Baucar Makan Tengah Hari Percuma</xsl:when>
    <xsl:when test="normalize-space($item)='Photo Pass'">Pas Foto</xsl:when>
    <xsl:when test="normalize-space($item)='Fast Track Access'">Laluan Pantas</xsl:when>
    <xsl:when test="normalize-space($item)='1 Child Entry'">1 Tiket Masuk Kanak-Kanak</xsl:when>
    <xsl:when test="normalize-space($item)='Snack Pack'">Pek Snek</xsl:when>
    <xsl:when test="normalize-space($item)='Meet &amp; Greet with Mascots' or normalize-space($item)='Meet & Greet with Mascots'">Bertemu Maskot</xsl:when>
    <xsl:when test="normalize-space($item)='Free Toy'">Mainan Percuma</xsl:when>
    <!-- Individu -->
    <xsl:when test="normalize-space($item)='Unlimited Rides'">Permainan Tanpa Had</xsl:when>
    <xsl:when test="normalize-space($item)='1 Meal Included'">1 Hidangan Disediakan</xsl:when>
    <xsl:when test="normalize-space($item)='Souvenir Gift'">Hadiah Cenderamata</xsl:when>
    <xsl:when test="normalize-space($item)='Priority Entry'">Laluan Keutamaan</xsl:when>
    <xsl:when test="normalize-space($item)='1 Entry Ticket'">1 Tiket Masuk</xsl:when>
    <xsl:when test="normalize-space($item)='Snack Voucher'">Baucar Snek</xsl:when>
    <xsl:when test="normalize-space($item)='2 Entry Tickets'">2 Tiket Masuk</xsl:when>
    <xsl:when test="normalize-space($item)='Dinner for Two'">Makan Malam untuk Dua</xsl:when>
    <xsl:when test="normalize-space($item)='VIP Lounge Access'">Akses Lounge VIP</xsl:when>
    <xsl:when test="normalize-space($item)='Complimentary Photos'">Foto Percuma</xsl:when>
    <!-- Season -->
    <xsl:when test="normalize-space($item)='Entry Ticket'">Tiket Masuk</xsl:when>
    <xsl:when test="normalize-space($item)='Water Park Access'">Akses Taman Air</xsl:when>
    <xsl:when test="normalize-space($item)='Free Ice Cream'">Aiskrim Percuma</xsl:when>
    <xsl:when test="normalize-space($item)='Souvenir Towel'">Tuala Cenderamata</xsl:when>
    <xsl:when test="normalize-space($item)='Hot Chocolate Voucher'">Baucar Coklat Panas</xsl:when>
    <xsl:when test="normalize-space($item)='Snow Show Access'">Akses Pertunjukan Salji</xsl:when>
    <xsl:when test="normalize-space($item)='Photo with Santa'">Foto Bersama Santa</xsl:when>
    <xsl:when test="normalize-space($item)='Flower Garden Tour'">Lawatan Taman Bunga</xsl:when>
    <xsl:when test="normalize-space($item)='Picnic Set'">Set Berkelah</xsl:when>
    <xsl:otherwise><xsl:value-of select="$item"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>