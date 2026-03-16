<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ddrmenu="urn:ddrmenu">

  <xsl:output method="xml" omit-xml-declaration="yes" indent="no"/>

  <xsl:template match="/">
    <ol class="edsmm_root">
      <xsl:apply-templates select="menu/item" mode="level">
        <xsl:with-param name="level" select="0"/>
      </xsl:apply-templates>
    </ol>
  </xsl:template>

  <xsl:template match="item" mode="level">
    <xsl:param name="level"/>
    <li>
      <xsl:attribute name="class">
        <xsl:text>edsmm_menuItem</xsl:text>
        <xsl:if test="position() = 1"><xsl:text> edsmm_first</xsl:text></xsl:if>
        <xsl:if test="position() = last()"><xsl:text> edsmm_last</xsl:text></xsl:if>
        <xsl:if test="count(item) &gt; 0"><xsl:text> edsmm_hasChild</xsl:text></xsl:if>
        <xsl:if test="@selected = 'true'"><xsl:text> edsmm_active</xsl:text></xsl:if>
        <xsl:if test="@enabled = 'false'"><xsl:text> edsmm_disabled</xsl:text></xsl:if>
      </xsl:attribute>

      <span>
        <a class="edsmm_itemContainer">
          <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
          <xsl:if test="count(item) &gt; 0">
            <xsl:attribute name="aria-expanded">false</xsl:attribute>
          </xsl:if>
          <xsl:value-of select="@text"/>
        </a>
        <xsl:if test="count(item) &gt; 0">
          <span class="edsmm_childIndicator"></span>
        </xsl:if>
      </span>

      <xsl:if test="count(item) &gt; 0">
        <div>
          <xsl:attribute name="class">
            <xsl:text>edsmm_level_</xsl:text><xsl:value-of select="$level + 1"/>
          </xsl:attribute>
          <div class="edsmm_menuListsContainer">
            <ol>
              <xsl:apply-templates select="item" mode="level">
                <xsl:with-param name="level" select="$level + 1"/>
              </xsl:apply-templates>
            </ol>
          </div>
        </div>
      </xsl:if>
    </li>
  </xsl:template>

</xsl:stylesheet>
