<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">
		<script language="javascript">document.write(boxTitle)</script>
	</div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
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
