<%@ page contentType="text/html; charset=utf-8" %>
<%
  String result = request.getParameter("Result");
  String returnBack = request.getParameter("ReturnBack");
  if(result.equalsIgnoreCase("True")){
  	//if(returnBack!=null && !returnBack.equals("")){%>
			<script language="javascript">
			<!--
				//opener.location.reload();
				//location.replace(<%//=returnBack%>);
			//-->
			</script>
	  <%//}else{%>

		Success!!
		
    <script language="javascript">
    <!--
    window.setTimeout('executeLater()', 2000);
    function executeLater()
    {
    	opener.location.reload();	
    	window.close();
    }
    //-->
    </script>
<%//}
 }else{%>
	
	Fail!!
	
<%}%>