<?xml version="1.0" encoding="iso-8859-1"?>

<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;">
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
	<!ENTITY raquo  "&#187;">
]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="ReturnUp">
	<div align="center"><a href="#top"><img src="../../../basics/arrup.gif"/>&nbsp;
	<span class="ReturnUp">Return to Match Information</span>
	</a></div><br/>
</xsl:template>


<xsl:template name="FormatMS">
<xsl:param name="MS"/>
	<xsl:variable name="S">
		<xsl:value-of select="(($MS mod 60000) div 1000)"/>
	</xsl:variable>
	<xsl:variable name="M">
		<xsl:value-of select="(($MS - $S * 1000) div 60000)"/>
	</xsl:variable>
	<xsl:value-of select="$M"/>:<xsl:value-of select="format-number($S, '00.000')"/>
</xsl:template>


<xsl:template match="/">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-2" />
<title>Match Statistics</title>
<link href="../../../basics/stats141.css" type="text/css" rel="stylesheet" />
</head>
<body onLoad="parent.processFilter(this)">

<div><a name="top"></a>


<xsl:for-each select="match">
	<p class="SectionTitle">Match Details</p>

	<table class="MatchInfo">
	<tr>
		<td class="MatchInfoLabel">Date</td>
		<td class="MatchInfoValue"><xsl:value-of select="substring-before(@datetime,' ')"/></td>
	</tr>
	<tr>
		<td class="MatchInfoLabel">Time</td>
		<td class="MatchInfoValue"><xsl:value-of select="substring-after(@datetime,' ')"/></td>
	</tr>
	<tr>
		<td class="MatchInfoLabel">Map</td>
		<td class="MatchInfoValue"><xsl:value-of select="@map" /></td>
	</tr>
	<tr>
		<td class="MatchInfoLabel">Gametype</td>
		<td class="MatchInfoValue"><xsl:value-of select="@type" /></td>
	</tr>
	<tr>
		<td class="MatchInfoLabel">Server</td>
		<td class="MatchInfoValue"><xsl:value-of select="@server" /></td>
	</tr>
	</table>

	<p class="SectionTitle">
	<xsl:choose>
	<xsl:when test="@isTeamGame = 'true'">
		Showing <xsl:value-of select="count(team)" /> teams:
	</xsl:when>
	<xsl:otherwise>
		Showing <xsl:value-of select="count(player)" /> players:
	</xsl:otherwise>
	</xsl:choose>
	</p>

	<xsl:choose>
	<xsl:when test="@isTeamGame = 'true'">
		<table class="TeamScores">
		<xsl:for-each select="team">
			<td align="center">
			<table>
			<tr>
				<td class="TeamName"><xsl:value-of select="@name"/></td>
				<td />
				<td class="TeamScore"><xsl:value-of select="@score"/></td>
			</tr>
			<xsl:for-each select="player">
				<xsl:sort select="number(stat[@name='Net']/@value)" data-type="number" order="descending" />
				<tr>
					<td><a href="#{@name}" id="filterme" target="_self"><img src="../../../basics/arrdown.gif" /> &#160;<span class="PlayerHeaderName" id="filterme"><xsl:value-of select="@name" /></span> </a></td>
					<td class="PlayerHeaderScore"><xsl:value-of select="number(stat[@name='Net']/@value)" /></td>
					<td class="PlayerHeaderScore"><xsl:value-of select="number(stat[@name='Score']/@value)" /></td>
				</tr>
			</xsl:for-each>
			</table>
			</td>
			<td class="TeamScoresPad"/>
		</xsl:for-each>
		</table>

		<br/><hr/>

		<xsl:for-each select="team">
			<span class="SectionTitle"><xsl:value-of select="@name" /></span>
			<xsl:for-each select="player">
				<xsl:sort select="number(stat[@name='Net']/@value)" data-type="number" order="descending" />
				<xsl:apply-templates select=".">
					<xsl:with-param name="isTeamGame" select="1" />
				</xsl:apply-templates>
				<xsl:call-template name="ReturnUp"/>
			</xsl:for-each>
			<br />
		</xsl:for-each>
	</xsl:when>

	<xsl:otherwise>
		<table class="PlayerScores">
		<xsl:for-each select="player">
			<xsl:sort select="number(stat[@name='Score']/@value)" data-type="number" order="descending" />
			<tr>
				<td><a href="#{@name}" id="filterme"><img src="../../../basics/arrdown.gif" /> &#160;<span class="PlayerHeaderName" id="filterme"><xsl:value-of select="@name" /></span> </a></td>
				<td><p class="PlayerHeaderScore"><xsl:value-of select="stat[@name='Score']/@value" /></p></td>
			</tr>
		</xsl:for-each>
		</table>

		<br/><hr/>

		<xsl:for-each select="player">
			<xsl:sort select="number(stat[@name='Score']/@value)" data-type="number" order="descending" />
			<xsl:apply-templates select=".">
				<xsl:with-param name="isTeamGame" select="0" />
			</xsl:apply-templates>
			<xsl:call-template name="ReturnUp"/>
		</xsl:for-each>

	</xsl:otherwise>
	</xsl:choose>
</xsl:for-each>

</div>
</body>
</html>
</xsl:template>


<xsl:template match="player">
<xsl:param name="isTeamGame"/>

	<!-- populate all our synthetics NOW, instead of clustering them in with the display code -->
	<!-- we explicitly calc them AS vars rather than just emitting, so they can be used for sorting etc -->

	<xsl:variable name="EFF">
		<xsl:choose>
			<xsl:when test="stat[@name='Kills'] = 0">
				0
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="(round (100 * stat[@name='Kills']/@value div (stat[@name='Kills']/@value + stat[@name='Deaths']/@value) ) )" />%
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="DmgEFF">
		<xsl:choose>
			<xsl:when test="stat[@name='DamageGiven'] = 0">
				0
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="(round (100 * stat[@name='DamageGiven']/@value div (stat[@name='DamageGiven']/@value + stat[@name='DamageTaken']/@value) ) )" />%
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="DmgTeam">
		<xsl:choose>
			<xsl:when test="string(0 - stat[@name='TeamDamage']/@value) = 'NaN'">
				0
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="stat[@name='TeamDamage']/@value" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>


	<a name="{@name}"/>
	<td class="PlayerHeaderName" id="filterme"><xsl:value-of select="@name"/></td>
	<td class="PlayerHeaderScore"><xsl:value-of select="stat[@name='Score']/@value"/></td>

<!--
	<xsl:variable name="guid">
	<xsl:choose>
		<xsl:when test="@guid = ''">
			<xsl:value-of select="'none'" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="@guid" />
		</xsl:otherwise>
	</xsl:choose>
	</xsl:variable>
	<tr>
		<td><p class="playerGUID">GUID:<xsl:value-of select="$guid" />&#160;</p></td>
	</tr>
-->

	<xsl:if test="count(CTF/stat) != 0">
	<p class="SectionTitle">Flag Roles</p>
	<table class="Combat">
	<tr>
	<xsl:for-each select="CTF/stat">
		<td class="StatName"><xsl:value-of select="@name"/></td>
	</xsl:for-each>
	</tr>
	<tr>
	<xsl:for-each select="CTF/stat">
		<td class="StatValue"><xsl:value-of select="@value"/></td>
	</xsl:for-each>
	</tr>
	</table>
	</xsl:if>

	<p class="SectionTitle">Combat</p>
	<table class="Combat">
	<tr>
		<td><p class="StatName">
		<xsl:choose>
			<xsl:when test="$isTeamGame = 1">
				NET
			</xsl:when>
			<xsl:otherwise>
				Score
			</xsl:otherwise>
		</xsl:choose>
		</p></td>
		<td><p class="StatName">Kills</p></td>
		<td><p class="StatName">Deaths</p></td>
		<td><p class="StatName">Suicides</p></td>
		<td><p class="StatName">EFF</p></td>
		<xsl:if test="string(0 - stat[@name='TeamKills']/@value) != 'NaN'">
			<td><p class="StatName">TeamKills</p></td>
		</xsl:if>
	</tr>
	<tr>
		<td><p class="StatValue">
		<xsl:choose>
			<xsl:when test="$isTeamGame = 1">
				<xsl:value-of select="stat[@name='Net']/@value" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="stat[@name='Score']/@value" />
			</xsl:otherwise>
		</xsl:choose>
		</p></td>
		<td><p class="StatValue"><xsl:value-of select="stat[@name='Kills']/@value" /></p></td>
		<td><p class="StatValue"><xsl:value-of select="stat[@name='Deaths']/@value" /></p></td>
		<td><p class="StatValue"><xsl:value-of select="stat[@name='Suicides']/@value" /></p></td>
		<td><p class="StatValue"><xsl:value-of select="$EFF" /></p></td>
		<xsl:if test="string(0 - stat[@name='TeamKills']/@value) != 'NaN'">
			<td><p class="StatValue"><xsl:value-of select="stat[@name='TeamKills']/@value" /></p></td>
		</xsl:if>
	</tr>

	<tr>
		<td><p class="StatName">DmgEFF</p></td>
		<td><p class="StatName">DmgGiven</p></td>
		<td><p class="StatName">DmgTaken</p></td>
		<xsl:if test="$DmgTeam != 0">
			<td><p class="StatName">Team Damage</p></td>
		</xsl:if>
		<td><p class="StatName">DmgNET</p></td>
	</tr>
	<tr>
		<td><p class="StatValue"><xsl:value-of select="$DmgEFF" /></p></td>
		<td><p class="StatValue"><xsl:value-of select="stat[@name='DamageGiven']/@value" /></p></td>
		<td><p class="StatValue"><xsl:value-of select="stat[@name='DamageTaken']/@value" /></p></td>
		<xsl:if test="$DmgTeam != 0">
			<td><p class="StatValue"><xsl:value-of select="$DmgTeam" /></p></td>
		</xsl:if>
		<td><p class="StatValue"><xsl:value-of select="(stat[@name='DamageGiven']/@value - stat[@name='DamageTaken']/@value - $DmgTeam)" /></p></td>
	</tr>
	</table>

	<xsl:if test="count(powerups/item) != 0">	<!-- lol@xsl: count(SET) always returns 1, gg -->
	<p class="SectionTitle">Powerups</p>
	<table class="Powerups">
	<xsl:for-each select="powerups/item">
		<tr>
		<td class="StatName"><xsl:value-of select="@name"/></td>
		<td class="StatValue"><xsl:value-of select="@pickups"/></td>
		<td class="StatValue">
			<xsl:call-template name="FormatMS">
				<xsl:with-param name="MS" select="@time"/>
			</xsl:call-template>
		</td>
		</tr>
	</xsl:for-each>
	</table>
	</xsl:if>

	<p class="SectionTitle">Weapons</p>
	<table class="Weapons">
	<tr>
	<td><p class="StatName">Weapon</p></td>
	<td><p class="StatName">Kills</p></td>
	<td><p class="StatName">Acc</p></td>
	<td><p class="StatName">Hits</p></td>
	<td><p class="StatName">Shots</p></td>
	</tr>
	<xsl:for-each select="weapons/weapon">
		<tr>
		<td><xsl:value-of select="@name"/></td>
		<td><p class="StatValue"><xsl:value-of select="@kills" /></p></td>
		<td><p class="StatValue"><xsl:apply-templates select="." /></p></td>
		<td><p class="StatValue"><xsl:value-of select="@hits" /></p></td>
		<td><p class="StatValue"><xsl:value-of select="@shots" /></p></td>
		</tr>
	</xsl:for-each>
	</table>

	<xsl:if test="count(items) != 0">
	<p class="SectionTitle">Items</p>
	<table class="Items">
	<tr>
		<xsl:if test="string(0 - stat[@name='HealthTotal']/@value) != 'NaN'">
			<td class="StatName">Health</td>
		</xsl:if>
		<xsl:if test="string(0 - stat[@name='ArmorTotal']/@value) != 'NaN'">
			<td class="StatName">Armor</td>
		</xsl:if>
		<xsl:for-each select="items/item">
			<td class="StatName"><xsl:value-of select="@name"/></td>
		</xsl:for-each>
	</tr>
		<xsl:if test="string(0 - stat[@name='HealthTotal']/@value) != 'NaN'">
			<td class="StatValue"><xsl:value-of select="stat[@name='HealthTotal']/@value" /></td>
		</xsl:if>
		<xsl:if test="string(0 - stat[@name='ArmorTotal']/@value) != 'NaN'">
			<td class="StatValue"><xsl:value-of select="stat[@name='ArmorTotal']/@value" /></td>
		</xsl:if>
		<xsl:for-each select="items/item">
			<td class="StatValue"><xsl:value-of select="@pickups"/></td>
		</xsl:for-each>
	<tr>
	</tr>
	</table>
	</xsl:if>

</xsl:template>


<xsl:template match="weapon">
	<xsl:if test="@shots > 0">
		<xsl:value-of select="(round (@hits div @shots * 10000)) div 100" />%
	</xsl:if>
</xsl:template>


</xsl:stylesheet>
