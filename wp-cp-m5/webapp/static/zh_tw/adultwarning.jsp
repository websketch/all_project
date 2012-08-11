<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../content/common/parameter.jsp" %>
<%@ include file="../adultwaring_inner.jsp" %>
<table border="0" cellpadding="0" cellspacing="15">
<tr> 
    <td colspan="2" valign="top"><br> <p class="biaoti"  style="font-size: 16px;">警告: </p>
      <p class="weiwen">&nbsp;&nbsp;&nbsp;&nbsp;您選擇的成人頻道包含的節目只適合成人收看，並非適合所有的觀眾。如果您不是成人或不喜歡成人內容，請點擊「退出」鍵離開。本頻道僅對中國大陸以外地區開放。</p>
      <p class="weiwen">&nbsp;&nbsp;&nbsp;&nbsp;點擊「進入」鍵，我證明我已滿18歲(21在AL，MS，NE，WY和18歲，不是成人年齡的州)，已經閱讀並且完全同意本網站的 <a href="<%=basePath%>/static.jsp?fn=termsofuse" class="lianjie">服務條款</a>。</p></td>
  </tr>
  <tr> 
    <td align="center"><button onclick="window.location.href='<%=linkURI%>'">進入</button></td>
    <td align="center"><button onclick="history.go(-1);">退出</button></td>
  </tr>
</table>
