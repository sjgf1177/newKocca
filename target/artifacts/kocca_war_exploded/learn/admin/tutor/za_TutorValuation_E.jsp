<%
//**********************************************************
//  1. ��      ��: Ʃ���򰡰���
//  2. ���α׷���: za_TutorValuation_L.jsp
//  3. ��      ��: Ʃ���򰡰��� ��ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%
	response.setHeader("Content-Disposition", "attachment; filename=TutorValuationEXE1.xls");   
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
    String  v_tuuserid	= "";
	String  v_name		= "";
	String  v_malevel	= "";
    String	v_isclosed = "";
    int     v_stucnt	=  0;
    int		v_grayncnt	= 0;
    int     i           =  0;

	ArrayList list = (ArrayList)request.getAttribute("gradelist");

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
            <td class="table_title" width="5%">No</td>
            <td class="table_title">������</td>            
            <td class="table_title" width="7%">��������</td>
            <td class="table_title" width="7%">�Ѱ����</td>
			<td class="table_title" width="7%">�����</td>
			<td class="table_title" width="7%">�԰��ο�</td>
			<td class="table_title" width="7%">�����ο�</td>
			<td class="table_title" width="8%">����������</td>
			<td class="table_title" width="8%">�����</td>
			<td class="table_title" width="10%">���ޱݾ�</td>
          </tr>
<%
		for( i = 0 ; i < list.size() ; i++ ){
			DataBox dbox = (DataBox)list.get(i);		
			v_subj		= dbox.getString("d_subj");  
			v_year		= dbox.getString("d_year");
			v_subjseq	= dbox.getString("d_subjseq");
			v_tuuserid	= dbox.getString("d_tuserid");
			v_name		= dbox.getString("d_name");
			v_subjnm	= dbox.getString("d_subjnm");
			v_stucnt	= dbox.getInt("d_stucnt");
			v_grayncnt  = dbox.getInt("d_grayncnt");
			v_malevel	= dbox.getString("d_malevel");
			v_isclosed  = dbox.getString("d_isclosed");
%>

      <tr> 
            <td class="table_01"><%= list.size() - i %></td>
            <td class="table_02_2"><%=v_subjnm%></td>            
            <td class="table_02_1"><%=v_subjseq%></td>
            <td class="table_02_1"><%=dbox.getString("d_ctutorcnt")%></td>
            <td class="table_02_1"><%=v_name%></td>
            <td class="table_02_1"><%=dbox.getInt("d_stucnt")%></td>
            <td class="table_02_1"><%=v_isclosed.equals("Y")?v_grayncnt+"":"������"%></td>
            <td class="table_02_1"><%=dbox.getInt("d_sapoint")%></td>
            <td class="table_02_1"><%=v_malevel.equals("")?"<font color=red>ä��</font>":v_malevel%></td>           
            <td class="table_02_1"><%=NumberFormat.getInstance().format(dbox.getInt("d_jigubfee"))%></td>
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


