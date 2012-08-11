<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../trans.jsp" %>
<% 
	isAdultPage = true;
	Boolean iswarned = (Boolean)session.getAttribute("warned");
	//session.setAttribute("warned", new Boolean(false));
	if(iswarned==null || (iswarned!=null&&!iswarned.booleanValue())){
		//RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/static.jsp?fn=adultwarning");
		//dispatcher.forward(request, response);
		//<!--jsp:forward page="../static.jsp?fn=adultwarning"/-->
		String dispatcherURL = "/static.jsp?fn=adultwarning&para="+tranEncode(returnUrl);
		response.sendRedirect(request.getContextPath()+dispatcherURL);
	}
%>