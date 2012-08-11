<%@ include file="parameter.jsp" %>

    </td>
    <!-- content end -->
</tr>
</table>

<!-- footer start -->
<div class="footer_nav width_760" style="background: url(<%=themesPath%>icons/icon_di.jpg);">
    <% if(currentSiteName.equals("japan")) { %>
    <a href="javascript:void(0)" onclick="jpPopup('http://www.keitainet.jp/contactus.html');"><bean:message key="footer.aboutus" /></a>
    
    <% }
        else {%>
    <a href="<%=basePath%>/static.jsp?fn=aboutus"><bean:message key="footer.aboutus"/></a> |
    <% }%>
    <a href="<%=basePath%>/static.jsp?fn=termsofuse"><bean:message key="footer.termsofuse"/></a> | 
    <a href="<%=basePath%>/static.jsp?fn=privatepolicy"><bean:message key="footer.privatepolicy"/></a> | 
    <a href="<%=basePath%>/static.jsp?fn=copyright"><bean:message key="footer.copyright"/></a> | 
    <a href="<%=basePath%>/static.jsp?fn=affiliate"><bean:message key="footer.affiliate"/></a>
</div>

<div class="footer_right width_760"><bean:message key="footer.copyright1"/></div>
<!-- footer end -->

<%
    String lang_chat;
    if( lang == "en_us" ) {
        lang_chat = "https://admin.instantservice.com/resources/smartbutton/5695/11683/SmartButton.js";
    } else if( lang == "zh_tw") {
        lang_chat = "https://admin.instantservice.com/resources/smartbutton/5695/11682/SmartButton.js";
    } else {
        lang_chat = "https://admin.instantservice.com/resources/smartbutton/5695/11684/SmartButton.js";
    }
    %>
    <div id="SmartButton" style="display:none; position:absolute; top:-1000; height:0; width:0; left:-1000; border:none thin gray">
        <script Language="javascript" src="<%=lang_chat%>"></script>
    </div>

<script language="javascript">
    var oChatTD			= document.getElementById("chatTD");
    var oSmartButton	= document.getElementById("SmartButton");
    oChatTD.innerHTML	= oSmartButton.innerHTML;
</script>

</body>
</html>