<%@ page contentType="text/html; charset=utf-8" %><%@ include file="../../content/common/parameter.jsp" %>
<%@ include file="../adultwaring_inner.jsp" %><table border="0" cellpadding="0" cellspacing="15" bgcolor="003366">
  <tr> 
    <td colspan="2" valign="top"><p class="biaoti" style="font-size: 16px;">คำเตือน : </p>
      <p class="weiwen">ช่องสำหรับผู้ใหญ่ที่คุณเลือกนี้ มีเนื้อหาที่ไม่เหมาะสมสำหรับคนทุกวัย ช่องนี้มีเนื้อหาสำหรับผู้ที่เป็นผู้ใหญ่แล้วเท่านั้น ถ้าคุณยังไม่เป็นผู้ใหญ่หรือต้องการหารายการสำหรับผู้ใหญ่ที่ไม่ถูกต้อง กรุณาหยุดการกระทำของคุณเสีย ช่องนี้ใช้บริการได้เฉพาะที่อยู่นอกจีนแผ่นดินใหญ่เท่านั้น</p>
      <p class="weiwen">เมื่อคลิกที่ปุ่ม "ทำต่อไป" ข้าพเจ้ารับรู้ว่าข้าพเจ้าอายุ 18 ปีบริบูรณ์ (21 ใน  AL, MS, NE, WY และพื้นที่อื่นๆที่อายุ 18 ปียังไม่ได้รับอนุญาต) และข้าพเจ้าได้อ่านและเห็นด้วยกับ   <a href="<%=basePath%>/static.jsp?fn=termsofuse" 
style="color:#FF9900;text-decoration: underline;">ข้อตกลงการให้บริการ</a> ของเว็บไซต์แห่งนี้แล้ว</p></td>
  </tr>
  <tr> 
    <td align="center"><button onclick="history.go(-1);">Cancel</button></td>
    <td align="center"><button onclick="window.location.href='<%=linkURI%>'">Proceed</button></td>
  </tr>
</table>
