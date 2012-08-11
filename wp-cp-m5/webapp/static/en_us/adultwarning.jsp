<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../content/common/parameter.jsp" %>
<%@ include file="../adultwaring_inner.jsp" %>
<table border="0" cellpadding="0" cellspacing="15">
  <tr> 
    <td colspan="2" valign="top"><p class="biaoti" style="font-size: 16px;">Warning: </p>
      <p class="weiwen">The adult channel you have selected contains content which is not suitable for all ages. It is intended for adult audiences only.  If you are not adult yet or find adult material offending to you, please stop here.This channel is only available out of China mainland.</p>
      <p class="weiwen">By clicking PROCEED I certify that I am 18 years of age 
        (21 in AL, MS, NE, WY and any other location where 18 is not the age of 
        majority) and I have read and fully agree to the <a href="<%=basePath%>/static.jsp?fn=termsofuse" class="lianjie">Terms 
        of Use</a> of this site.</p></td>
  </tr>
  <tr> 
    <td align="center"><button onclick="window.location.href='<%=linkURI%>'">Proceed</button></td>
    <td align="center"><button onclick="history.go(-1);">Cancel</button>
</td>
  </tr>
</table>
