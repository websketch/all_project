<%@ page import="java.io.*"%>
<%
    try {
        //download server
        String down_server_url = "http://download.mediazone.com";
              
        java.util.Enumeration e = request.getParameterNames();
        while (e.hasMoreElements()) {
            String paraName = (String)e.nextElement();
            if (paraName.compareToIgnoreCase("ItemUrl") == 0) {
                String file_name = request.getParameter(paraName); 
                response.setContentType("APPLICATION/OCTET-STREAM");
                response.addHeader("content-type", "application/x-msdownload;");
                response.setHeader("Content-disposition", "attachment; filename=" + filename+";"); 
                response.setHeader("Content-Transfer-Encoding","binary");
                File f = new File(down_server_url + file_name);
                Long len = new Long(f.length());
                response.setHeader("Content-Length",len.toString());
                //write logs
                //fwlog.write(basedir + dirandfile+" : len="+len.toString());
                PrintWriter out1 = response.getWriter();
                FileInputStream fis = null;
                int byteRead;
                fis = new FileInputStream(f.getPath());
                while ((byteRead = fis.read()) != -1) {
                    out1.write(byteRead);
                }
                out1.flush();
            }
            break;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>