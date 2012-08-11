<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
	<div style="float:left;padding-top:2px;">&nbsp;
	<script language="javascript">
		if( boxTitleUrl == "" )
			document.write(boxTitle);
		else
			document.write('<a href="'+boxTitleUrl+'" style="color:#FFF;text-decoration: underline;">'+boxTitle+'</a>');
	</script>
	</div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
	<script language="javascript">
	if( boxRightTitle != "" )
	{
		document.write('<div style="float:right;padding-top:2px;">&nbsp;');
		if( boxRightTitleUrl == "" )
			document.write(boxRightTitle);
		else
			document.write('<a href="'+boxRightTitleUrl+'" style="color:#FFF;text-decoration: underline;">'+boxRightTitle+'</a>');
		document.write('</div>');		
	}
	</script>
</div>
