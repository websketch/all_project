<td align="center">
<%
String teamUrl = "" ;
List hosts=mv.getHost();
if(hosts!=null){
	for(int k=0;k<hosts.size();k++)
	{
		IdName in=(IdName)hosts.get(k);	
		if( in.isTeam() )
			teamUrl = "TeamDetail.do?team_id";
		else
			teamUrl = "PlayerDetail.do?player_id";			
%>
	<a href="<%=basePath%>/sports/<%=teamUrl%>=<%=in.getId()%>" style="color: #000;text-decoration: underline;"><%=in.getName()%></a>
<%
	}
}
%>
</td>
<td align="center">
<%
List guests=mv.getGuest();
if(guests!=null){
	for(int k=0;k<guests.size();k++)
	{
		IdName in=(IdName)guests.get(k);
		if( in.isTeam() )
			teamUrl = "TeamDetail.do?team_id";
		else
			teamUrl = "PlayerDetail.do?player_id";			
%>
	<a href="<%=basePath%>/sports/<%=teamUrl%>=<%=in.getId()%>" style="color: #000;text-decoration: underline;"><%=in.getName()%></a>
<%
	}
}
%>
</td>
