<%
//**********************************************************
//  1. ��      ��: TUTOR LIST
//  2. ���α׷���: za_Tutor_LE.jsp
//  3. ��      ��: ���� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%
	response.setHeader("Content-Disposition", "attachment; filename=TutorListEXE1.xls");   
	response.setHeader("Content-Description", "JSP Generated Data");

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    
    String v_userid         = "";
    String v_pwd            = "";
    String v_name           = "";
    String v_comp           = "";
    String v_compnm			= "";
    String v_dept           = "";
    String v_handphone      = "";
    String v_email          = "";
    String v_isgubun        = "";
    String v_subj           = "";
    String v_subjnm         = "";
    String v_comp_value     = "";
    String v_isgubun_value  = "";
    String v_manager_value  = "";
    String v_subjclassnm    = "";
    String v_ismanager      = "";
    String v_fmon		    = "";
    String v_tmon		    = "";

    int    v_dispnum        =  0;
    int    v_totalpage      =  0;
    int    v_rowcount       =  0;
    int     i               =  0;

	ArrayList list = (ArrayList)request.getAttribute("tutorList");

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
            <td width="5%" class="table_title"><b>No</b></td>
            <td width="10%" class="table_title"><b>����</b></td>
            <td width="10%" class="table_title"><b>�����</b></td>
            <td width="13%" class="table_title"><b>���̵�</b></td>
            <td width="8%" class="table_title"><b>��й�ȣ</b></td>
<!-- 
            <td width="20%" class="table_title"><a href="javascript:whenOrder('subjclassnm')" class="e"><b>���Ǻо�</b></a></td>
 -->
            <td class="table_title"><b>ȸ��/�Ҽ�</b></td>
            <td width="10%" class="table_title"><b>����ó</b></td>
<!--            <td width="10%" class="table_title"><b>������</b></td>-->
            <td width="20%" class="table_title"><b>�������(�Ⱓ)</b></td>
          </tr>

        <% 
            for(i = 0; i < list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i);
				
                v_userid        = dbox.getString("d_userid");
                v_pwd           = dbox.getString("d_pwd");
                v_name          = dbox.getString("d_name");
                v_comp          = dbox.getString("d_comp");
                v_compnm        = dbox.getString("d_compnm");
                v_handphone     = dbox.getString("d_handphone");
                v_email         = dbox.getString("d_email");
                v_isgubun       = dbox.getString("d_isgubun");
                v_ismanager     = dbox.getString("d_ismanager");
                v_dispnum       = dbox.getInt("d_dispnum");
                v_totalpage     = dbox.getInt("d_totalpagecount");
                v_rowcount      = dbox.getInt("d_rowcount");
                v_fmon			= FormatDate.getFormatDate(dbox.getString("d_fmon"),"yyyy/MM/dd");
                v_tmon			= FormatDate.getFormatDate(dbox.getString("d_tmon"),"yyyy/MM/dd");

                if( v_handphone.length() <= 3 )     {   v_handphone = "";       }

                v_comp_value    = v_comp;
                if(v_isgubun.equals("1")){
                    v_isgubun_value = "����";
                }else if(v_isgubun.equals("2")){
                    v_isgubun_value = "����";
                }
                
        %>

			  <tr>
				<td class="table_01"><%= v_dispnum %></td>
				<td class="table_02_1"><%=v_isgubun_value%></td>
				<td class="table_02_1">	<%=v_name%></td>
				<td class="table_02_1"><%=v_userid%></td>
				<td class="table_02_1"><%=v_pwd%></td>
				<td class="table_02_1"><%=v_compnm%></td>
				<td class="table_02_1"><%=v_handphone%></td>
	<!--            <td class="table_02_1"></td>-->
				<td class="table_02_1"><%=v_ismanager%> 
				 <% if(!v_fmon.equals("") && !v_tmon.equals("")) out.println("("+v_fmon+" - "+v_tmon+")");%>
				</td>
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
