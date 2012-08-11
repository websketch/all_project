<script language="javascript">
		if(average_rating == "" || average_rating==0){
			document.write("");
		}else{
			var i=0;
			for(i=0;i<parseInt(average_rating/10);i++){
				document.write('<img src="<%=themesPath%>icons/icon_stargrade_solid.jpg" border=0 height=13 width=16>');
			}
			if(average_rating%10>=4){
				document.write('<img src="<%=themesPath%>icons/icon_stargrade_half.jpg" border=0 height=13 width=16>');
				i++;
			}	
			for(var j=0;j<(5-i);j++){
				document.write('<img src="<%=themesPath%>icons/icon_stargrade_hollow.jpg" border=0 height=13 width=16>');
			}
			
		}	
</script>