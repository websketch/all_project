<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../content/common/parameter.jsp" %>
<%@ include file="../adultwaring_inner.jsp" %>
<table border="0" cellpadding="0" cellspacing="15">
  <tr> 
    <td colspan="2" valign="top"><br> <p class="biaoti">警告: </p>
      <p class="weiwen">&nbsp;&nbsp;&nbsp;&nbsp;您选择的成人频道包含的节目只适合成人收看，并非适合所有的观众。如果您不是成人或不喜欢成人内容，请点击“退出”键离开。本频道仅对中国大陆以外地区开放。</p>
      <p class="weiwen">&nbsp;&nbsp;&nbsp;&nbsp;点击“进入”键，我证明我已满18岁(21在AL，MS，NE，WY和18岁，不是成人年龄的州)，已经阅读并且完全同意本网站的<a href="<%=basePath%>/static.jsp?fn=termsofuse" 
style="color:#FF9900;text-decoration: underline;">服务条款</a>。</p></td>
  </tr>
  <tr> 
    <td align="center">
    	<button onclick="window.location.href='<%=linkURI%>'">进入</button>
    </td>
    <td align="center">
    	<button onclick="history.go(-1);">退出</button>
		</td>
  </tr>
</table>