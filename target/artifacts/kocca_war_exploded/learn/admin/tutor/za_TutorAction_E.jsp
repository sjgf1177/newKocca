<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%
	response.setHeader("Content-Disposition", "attachment; filename=TutorActionListEXE1.xls");   
	response.setHeader("Content-Description", "JSP Generated Data");

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    
	String  v_subj      = "";
    String  v_year      = "";
    String  v_subjnm    = "";
    String  v_subjseq   = "";
    String  v_tuuserid  = "";
	String  v_name		= "";
    String	v_isclosed  = "";
    int     v_stucnt	= 0;
    int		v_grayncnt	= 0;
    int     i           = 0;
    
    int v_dispnum = 0;

	ArrayList list = (ArrayList)request.getAttribute("actionlist");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
	        <table cellspacing="1" cellpadding="5" border="1">
          <tr> 
            <td class="table_title" rowspan="2">No</td>
            <td class="table_title" rowspan="2">�����׷�</td>
            <td class="table_title" rowspan="2">�����ڵ�</td>
            <td class="table_title" rowspan="2">������</td>            
            <td class="table_title" rowspan="2">����<br>����</td>
            <td class="table_title" rowspan="2">�Ѱ����</td>
			<td class="table_title" rowspan="2">�����</td>
			<td class="table_title" rowspan="2">�԰�<br>�ο�</td>
			<td class="table_title" rowspan="2">����<br>�ο�</td>
			<td class="table_title" rowspan="2">����<br>����Ƚ��</td>
			<td class="table_title" rowspan="2">����ԽðǼ�<br>(����/�ڷ�/���)</td>
			<td class="table_title" colspan="2">����Ʈ</td>
			<td class="table_title" colspan="2">Q & A</td>
          </tr>
          <tr> 
            <td class="table_title">����</td>
            <td class="table_title">����</td>            
            <td class="table_title">����</td>
            <td class="table_title">������</td>
          </tr>

<%                          
		for( i = 0 ; i < list.size() ; i++ ){
			DataBox dbox = (DataBox)list.get(i);		  
					
			v_subj		= dbox.getString("d_subj");  
			v_year		= dbox.getString("d_year");
			v_subjseq	= dbox.getString("d_subjseq");
			v_subjnm	= dbox.getString("d_subjnm");
			v_tuuserid	= dbox.getString("d_tuserid");
			v_name		= dbox.getString("d_name");
			v_stucnt	= dbox.getInt("d_stucnt");
			v_grayncnt  = dbox.getInt("d_grayncnt");
			v_isclosed  = dbox.getString("d_isclosed");	
			
            v_dispnum   = dbox.getInt("d_dispnum");
%>
			<tr> 
				<td class="table_02_1"><%=v_dispnum%></td>
				<td class="table_02_1"><%=GetCodenm.get_grcodenm(dbox.getString("d_grcode"))%></td>
				<td class="table_02_1"><%=v_subj%></td>
				<td class="table_02_2"><%=v_subjnm%></td>
				<td class="table_02_1"><%=v_subjseq%></td>
				<td class="table_02_1"><%=dbox.getString("d_ctutorcnt")%></td>
				<td class="table_02_1"><%=dbox.getString("d_name")%></td>
				<td class="table_02_1"><%=v_stucnt%></td>
				<td class="table_02_1"><%=v_isclosed.equals("Y")?v_grayncnt+"":"������"%></td>
				<td class="table_02_1"><%=dbox.getString("d_logincnt")%></td>
				<td class="table_02_1">
					<%=dbox.getInt("d_gongcnt")%>/<%=dbox.getInt("d_datacnt")%>/<%=dbox.getInt("d_toroncnt")%><%//=dbox.getInt("d_torontpcnt")%></td>
				<td class="table_02_1"><%=dbox.getString("d_repcnt")%></td>
				<td class="table_02_1"><%=dbox.getString("d_noscorecnt")%></td>
				<!--td class="table_02_1"><%=dbox.getString("d_examcnt")%></td-->
				<td class="table_02_1"><%=dbox.getString("d_qcnt")%></td>
				<td class="table_02_1"><%=dbox.getString("d_noanscnt")%></td>
			 </tr>
<%					
	    }		   
%>
		
		</table>
        

      </td>
  </tr>
</table>

</body>
</html>
