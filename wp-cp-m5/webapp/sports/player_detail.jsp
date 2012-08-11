<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>

<%@ include file="../content/common/parameter.jsp" %>

<%
ActorDetailDAO tdd=new ActorDetailDAO();

//ActorView av=tdd.getDetail("4848",new Integer(2));
ActorView av=tdd.getDetail(request.getParameter("player_id"), lang_id);

%>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<%@ include file="common/sports_banner.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
		    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
            <div style="float:left;padding-top:2px;">&nbsp;<bean:message key="label.player_detail" bundle="sports"/></div>
		    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
		</div>

		<div class="content">
			<div style="clear:both;float:left;padding:10px;">
				<img src="<%=largeImagePath%><%=av.getPhoto()%>" border="0" alt="">
			</div>
			<div style="float:left;padding-left:10px;padding-top:10px;">
				<b><bean:message key="table.title.name" bundle="sports"/>: </b><%=av.getName()%><br /><br />
			<%if(av.getDescription()==null || av.getDescription().equals("")){%>
				<b><bean:message key="table.title.num" bundle="sports"/>: </b><%=av.getNum()%><br /><br />
				<b><bean:message key="table.title.born" bundle="sports"/>: </b><%=av.getBorn()%><br /><br />
				<b><bean:message key="table.title.height" bundle="sports"/>(cm): </b><%=av.getHeight()%><br /><br />
				<b><bean:message key="table.title.weight" bundle="sports"/>(Kg): </b><%=av.getWeight()%><br /><br />
				<b><bean:message key="table.title.position" bundle="sports"/>: </b><%=av.getPosition()%><br /><br />
				<b><bean:message key="table.title.country" bundle="sports"/>&U20: </b><%=av.getCountry()!=null?av.getCountry():""%><br /><br />
				<b><bean:message key="table.title.certificate" bundle="sports"/>: </b><%=av.getCertificate()%><br /><br />
			<%}else{%>
			<b><bean:message key="table.title.country1" bundle="sports"/>: </b><%=av.getCountry()%><br /><br />
			<b><bean:message key="table.title.description" bundle="sports"/>:<br /><br />
			<%=av.getDescription().replaceAll("\n","<br>")%>
			<%}%>
				<!--b><{#lang_player_title_9#}>: </b><{$player.description}><br /><br /-->
			</div>
		</div>

		<%@ include file="../content/common/box_footer_blue.jsp" %>

	</div>

</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />