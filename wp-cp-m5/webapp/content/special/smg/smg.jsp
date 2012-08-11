<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mediazone.bean.Category,com.chinaportal.portal.category.CategoryDAO"%>
<%@ page import="com.mediazone.bean.CategoryCaption,com.mediazone.bean.Photo" %>
<jsp:useBean id="category_childDAO" class="com.chinaportal.portal.category.CategoryDAO" scope="page"/>
<%@ include file="../../common/parameter.jsp" %>

<jsp:include page="../../common/header.jsp" />

<div class="category">

		<!-- Begin of Special Offer -->				
           <jsp:include page="special_offer_smg.jsp" />
		<!-- End of Special Offer -->

		<div style="clear:both;">&nbsp;</div>
		
	<!-- Begin SMG Category List -->
	<% 
		Integer langId=(Integer)request.getSession().getAttribute("chinaportal.local");	
		if(langId==null)
	    langId=new Integer(2);	   
		List categorysList = (List)request.getAttribute("categorys");		
		for(int i=0;i<categorysList.size();i++){
			Category category=(Category)categorysList.get(i);
			String category_id = category.getCategoryId().toString();
			//String description = category.getCaption(langId).getDescript();
			//CategoryCaption cc= (CategoryCaption)category.getCaptions();
			
			 String description="";
			  CategoryCaption cc=null;
		      Set set = category.getCaptions();
		      Iterator iterator = set.iterator();
		      while (iterator.hasNext()) {
		        CategoryCaption cat = (CategoryCaption)iterator.next();
		         if (langId.equals(cat.getLangId())) 
		        	  cc=cat; 		             
		     }
              if(cc!=null && cc.getDescript()!=null)
        	    description=cc.getDescript();
        	  if(description.length()>60)
        	   description = description.substring(0,60) + "...";
        	  
			//String photo = category.getPhoto();
			String photo="";
			
		   // Photo ph =(Photo) category.getPhotos();
			if(category.getPhotos()!=null && category.getPhotos().size()>0){
				Photo p=(Photo)category.getPhotos().get(0);
				photo=p.getPhoto();
			}

	%>
	<div class="stars_list" style="float:left;width:32.5%;margin-left:2px;margin-right:2px;background: #003366;">		
		
		
			<!--{include file="block_block_header_yellow.tpl"}-->
			<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
			<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
			<div style="float:left;padding-top:4px;">&nbsp;<%=category.getName()%></div>
			<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
			</div>
					<% 						
					  List childs = category_childDAO.getChildren(category_id, langId);
					  //category_childDAO.closeSession();					  					 
					  //Category firstChildCategory = (Category)childs.get(0);
					  //String firstDescription = firstChildCategory.getCaption(langId).getDescript();
					  //if(firstDescription!=null && firstDescription.length()>60){
					  //		firstDescription = firstDescription.substring(0,60) + "...";
					  //}		
					  //String firstId = firstChildCategory.getCategory_id().toString();
					  //String firstPhoto = firstChildCategory.getPhoto();
					%>
			<div class="content" style="clear:both;height:200px;padding:4px;">
				<a href="<%=request.getContextPath()%>/specialAction.do?tar=tomedia&category_id=<%=category_id%>"><img src="<%=request.getContextPath()%>/images/photo/small/<%=photo%>" width="80" height="120" style="margin-right:5px;" align="left" border="0" /><%=description%></a>
				<div style="clear:both;">&nbsp;</div>
				<div style="clear:both;padding-top:5px;">	
					<%  
					  for(int j=0; j<childs.size();j++){
					  	Category category_child=(Category)childs.get(j);
					  	String category_child_id = category_child.getCategoryId().toString();
					%>
					<a href="<%=request.getContextPath()%>/specialAction.do?tar=tomedia&category_id=<%=category_child_id%>">&middot;<%=	category_child.getName()%></a>
					<%}%>
				</div>
			</div>

		<!--start fileblock_block_footer_blue.tpl-->
		<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao1.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao2.jpg" height="7" width="7">
  	</div>	
  	<!--end block_block_footer_blue.tpl-->
   
		</div>
		<%if ((i+1) % 3 ==0){%>
			<div style="clear:both;">&nbsp;</div>
		<%}%>
	<%}%>
	<div style="clear:both;">&nbsp;</div>
<!-- End SMG Category List -->
</div>

<jsp:include page="../../common/footer.jsp" />