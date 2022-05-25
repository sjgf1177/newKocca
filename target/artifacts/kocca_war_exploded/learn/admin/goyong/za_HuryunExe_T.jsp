<%
/**
 * file name : za_HuryunExe_E.jsp
 * date      : 2004/12/29
 * programmer: Lee Chang Hun
 * function  : �ƷýǽýŰ� Text File ����
 */
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.FileNotFoundException" %>
<%@ page import = "java.io.FileOutputStream" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.scorm.*" %>
<%@ page import = "com.credu.goyong.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page contentType = "text/html;charset=MS949" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
	FileOutputStream stream= null; 
    PrintWriter writer = null; 
	
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    
    String v_subj	= box.getString("p_subj");
    String v_gyear	= box.getString("p_year");
    String v_subjseq = box.getString("p_subjseq");
    

	ArrayList list = (ArrayList)request.getAttribute("StudentList2");
   	int listsize = list.size();

   	try  
    {
    	//stream = new FileOutputStream("d:\\data2.txt"); 
    	stream = new FileOutputStream(conf.getProperty("dir.upload.default")+v_subj+v_gyear+v_subjseq+".txt");
        writer = new PrintWriter(stream);
%>

<html>
<head>
<title>�԰��ο� Text file ����</title>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table border="0" width="100%" height="100%">
	<tr>
		<td align="center" valign="middle">
			<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%=v_subj+v_gyear+v_subjseq%>.txt&p_realfile=<%=v_subj+v_gyear+v_subjseq%>.txt'><b>[<%=GetCodenm.get_subjnm(v_subj)%>]�ƷýǽýŰ�txt����</b></a></td>
		</td>
	</tr>
</table>
<%      int v_namelength=0;
        for(int i = 0; i < list.size(); i++) {
			DataBox dbox = (DataBox)list.get(i);
			
			v_namelength = dbox.getInt("d_namelength");
			
			 writer.print(dbox.getString("d_name"));	// ����
			 if (v_namelength == 0) {
			 	writer.print("                    ");	//�̸��� ������
			 } else if (v_namelength == 1) {
			 	writer.print("                  ");		//�̸��� �ѱ��ڸ� ������
			 } else if (v_namelength == 2) {			
				writer.print("                ");		//�̸��� �α��ڸ� ������
			 } else if (v_namelength == 3) {
			 	writer.print("              ");			//�̸��� �����ڸ� ������
			 } else if (v_namelength == 4) {			
			 	writer.print("            ");			//�̸��� �ױ��ڸ� ������
			 } else if (v_namelength == 5) {
			 	writer.print("          ");				//�̸��� �ټ����� ������
			 }
			 
			 if (dbox.getString("d_resno").equals("")){	//�ֹι�ȣ
			 	writer.print("             ");
			 }	else {
			 	writer.print(dbox.getString("d_resno"));	
			 }
			 
			 if (dbox.getString("d_office_gbn").equals("")){	//�����ڿ���
			 	writer.print("  ");
			 } else {
			 	writer.print(dbox.getString("d_office_gbn"));	
			 }
			 if (dbox.getString("d_acceace").equals("")){		//�����з�
			 	writer.print(" ");
			 } else {
			 	writer.print(dbox.getString("d_acceace"));	
			 }
			 writer.print("   ");								//����
			 writer.print("     ");								//��������
			 if (dbox.getString("d_jikup").equals("")){			//����
			 	writer.print("  ");
			 } else {
			 	writer.print(dbox.getString("d_jikup"));	
			 }
			 writer.print("03");								//�ִ�ٹ��ð�
			 writer.print("40                  ");				//�ִ�ٹ��ð��ؽ�Ʈ�Է�
			 writer.print("N");	//�Ǽ��ٷ���
			 writer.print("\r\n");
%>
		<br>
<% 		} 		%>
</body>
</html>
<%
} catch (FileNotFoundException e) { 
    e.printStackTrace(); 
} finally{ 
    writer.close();  
	stream.close(); 
} 
%>
