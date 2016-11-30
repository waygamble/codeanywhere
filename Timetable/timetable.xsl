<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
        	<head>
				<title>Book Page</title>
			</head>
			<body>
				<!--1. All modules on the timetable-->
				<h2>All Modules on the timetable:</h2>
                <ul>
                <xsl:for-each select="/timetable/module">
                    <li><xsl:value-of select="name"/></li>
                </xsl:for-each>
    			</ul>
                
                <!--2. All modules with an exam-->
    			<h2>All modules with an exam:</h2>
                <ul>
                <xsl:for-each select="/timetable/module/exam">
                    <li><xsl:value-of select="../name"/></li>
                </xsl:for-each>
    			</ul>
                
                <!--3. Name, day time and room of all lab classes-->
        		<h2>Name, day time and room of all lab classes:</h2>
			    <table border="1">
                <tr bgcolor="#9acd32">
                     <th>Name</th>
                     <th>Day</th>
                     <th>Time</th>
                     <th>Room</th>
                 </tr>
				<xsl:for-each select="/timetable/module/classes/lab">
					<tr>
					  <td><xsl:value-of select="../../name"/></td>
					  <td><xsl:value-of select="day"/></td>
                      <td><xsl:value-of select="time"/></td>
                      <td><xsl:value-of select="room"/></td>
					</tr>
				</xsl:for-each>
                </table>
				<!--4. Details of any module with more than one lecture in a week-->
				<h2>Modules with more than one lecture in a week:</h2>
                <ul>
                <xsl:for-each select="/timetable/module/classes/lecture[@id>1]">
                    <li><xsl:value-of select="../../name"/></li>
                </xsl:for-each>
				</ul>
				<!--5. Day time and room of all classes taking place in computer labs-->
				<h2>Day time and room of all classes taking place in computer labs</h2>
               <table border="1">
                <tr bgcolor="#9acd32">
                     <th>Name</th>
                     <th>Day</th>
                     <th>Time</th>
                     <th>Room</th>
                 </tr>
    			<xsl:for-each select="/timetable/module//room[@type='computerLab']">
					<tr>
					  <td><xsl:value-of select="../../../name"/></td>
					  <td><xsl:value-of select="../day"/></td>
                      <td><xsl:value-of select="../time"/></td>
                      <td><xsl:value-of select="../room"/></td>
					</tr>
				</xsl:for-each>
                </table>
			
                 <!--6. All modules with class on a Monday-->
        		<h2>All modules with class on a Monday:</h2>
                <ul>
                <xsl:for-each select="/timetable/module//day[text()='Mon']">
                    <li><xsl:value-of select="../../../name"/></li>
                </xsl:for-each>
    			</ul>
			</body>
		</html>
	</xsl:template>
	
</xsl:transform>