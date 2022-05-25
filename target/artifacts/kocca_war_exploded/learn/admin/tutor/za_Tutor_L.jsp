<%
//**********************************************************
//  1. ��      ��: TUTOR LIST
//  2. ���α׷���: za_Tutor_L.jsp
//  3. ��      ��: ���� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process       = box.getString("p_process");
    String v_gubun          = box.getString("p_gubun");         //���籸�� �˻�
    String v_select         = box.getString("p_select");        //�˻��׸�(������1,�����2)
    String v_selectvalue    = box.getString("p_selectvalue");   //�˻���
    int     v_pageno    = box.getInt("p_pageno")== 0 ? 1 : box.getInt("p_pageno");
    int     v_pagesize  = box.getInt("p_pagesize")== 0 ? 10 : box.getInt("p_pagesize");
	
	String  v_subjclass     = box.getString("p_subjclass"); //���Ǻо�
	String  v_orderColumn   = box.getString("p_orderColumn");       //�����÷�
	String  v_orderType     = box.getStringDefault("p_orderType"," asc"); //���ļ���

	
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
    int    v_total_rowcount =  0;
    int     i               =  0;
    //DEFINED class&variable END

    ArrayList list = (ArrayList)request.getAttribute("tutorList");
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
    <script language = "javascript">
    <!--
        function search() {
			 document.form1.p_pageno.value = 1;
             document.form1.target = "_self";
             document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
             document.form1.p_process.value = "TutorList";
             document.form1.submit();
        }
        function tutor_select(userid) {
            document.form1.target = "_self";
            document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
            document.form1.p_userid.value = userid;
            document.form1.p_process.value= "TutorSelect";
            document.form1.submit();
        }
        function insert() {
             document.form1.target = "_self";
             document.form1.p_process.value = "SaneTutorInsertPage";
             document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
             document.form1.submit();
        }

        function go(index) {
            document.form1.target = "_self";
             document.form1.p_pageno.value = index;
             document.form1.action = '/servlet/controller.tutor.TutorAdminServlet';
             document.form1.p_process.value = "TutorList";
             document.form1.submit();
        }
        function goPage(pageNum) {
            document.form1.target = "_self";
             document.form1.p_pageno.value = pageNum;
             document.form1.action = '/servlet/controller.tutor.TutorAdminServlet';
             document.form1.p_process.value = "TutorList";
             document.form1.submit();
        }

        function pagesize(pageSize) {
            document.form1.target = "_self";
            document.form1.p_pageno.value = 1;
            document.form1.p_pagesize.value = pageSize;
            document.form1.action = '/servlet/controller.tutor.TutorAdminServlet';
            document.form1.p_process.value = "TutorList";
            document.form1.submit();
        }
		
		
	function whenExcel() {
	//alert(document.form1.p_orderColumn.value);
        //window.self.name = "CompleteRateList";
        //open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
        //document.form1.target = "openExcel";
        document.form1.target = "_self";
        document.form1.p_process.value = "TutorListExcel";
        document.form1.action='/servlet/controller.tutor.TutorAdminServlet';
        document.form1.submit();
    }
    
function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}
    //alert(column);
    
    document.form1.p_orderColumn.value = column;

    search();
}

    -->
    </script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden" name="p_process"   value = "<%= v_process %>">
    <input type="hidden" name="p_pageno"    value="<%=v_pageno%>">
    <input type="hidden" name="p_pagesize"  value = "<%=v_pagesize%>">
    <input type="hidden" name="p_userid">
    <input type="hidden" name="p_orderColumn" value="<%=v_orderColumn%>">
	<input type="hidden" name="p_orderType" value="<%=v_orderType%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/tutor/tit_new_01.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
 
<!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <td>
						���籸��&nbsp;
                          <select name="p_gubun">
                            <option value="" <% if(v_gubun.equals("")){ %>selected<% } %>>��ü</option>
                            <option value="1" <% if(v_gubun.equals("1")){ %>selected<% } %>>����</option>
                            <option value="2" <% if(v_gubun.equals("2")){ %>selected<% } %>>����</option>
                            <!-- 
                            <option value="3" <% if(v_gubun.equals("3")){ %>selected<% } %>>�׷�簭��</option>
                            -->
                          </select>
                          &nbsp;
<!--
						  <!-- ���Ǻо� &nbsp;
						  <%=CodeConfigBean.getCodeGubunSelect ("0039", "", 1, "p_subjclass", v_subjclass, "", 1)%>

						  <input type="radio" name="p_select" value="1" <% if(v_select.equals("1") ){ %> checked <% } %>>
                          ������
-->
                         
						  ����� &nbsp;
                          <input name="p_selectvalue" type="text" class="input" value="<%=v_selectvalue%>"> 
						  <input type="hidden" name="p_select" value="2">                    
						</td>
						<td width="5%" align="right"><a href="javascript:search()"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>	
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
<!----------------- form �� ----------------->
      <br>  

        <!----------------- ��ư ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="91%" height="3"></td>
          </tr>
          <tr>
            <td align="right">&nbsp;
			  <a href="javascript:insert()"><img src="/images/admin/button/btn_add.gif" border="0"></a> 
		      <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a>
            </td>
          </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- ��ư ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="0">
          <tr>
<!--            <td colspan="9" class="table_top_line"></td>-->
 				<td colspan="8" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="5%" class="table_title" align="center"><b>No</b></td>
            <td width="10%" class="table_title" align="center"><a href="javascript:whenOrder('tutorgubun')" class="e"><b>����</b></a></td>
            <td width="10%" class="table_title" align="center"><a href="javascript:whenOrder('name')" class="e"><b>�����</b></a></td>
            <td width="13%" class="table_title" align="center"><a href="javascript:whenOrder('userid')" class="e"><b>���̵�</b></a></td>
<!--            <td width="8%" class="table_title"><b>��й�ȣ</b></td>-->
<!-- 
            <td width="20%" class="table_title"><a href="javascript:whenOrder('subjclassnm')" class="e"><b>���Ǻо�</b></a></td>
 -->
<!--            <td class="table_title" align="center"><b>ȸ��/�Ҽ�</b></td>-->
            <td width="10%" class="table_title" align="center"><b>����ó</b></td>
<!--            <td width="10%" class="table_title"><b>������</b></td>-->
            <td width="20%" class="table_title" align="center"><a href="javascript:whenOrder('ismanager')" class="e"><b>�������(�Ⱓ)</b></a></td>
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
                v_total_rowcount= dbox.getInt("d_totalrowcount");
                v_fmon			= FormatDate.getFormatDate(dbox.getString("d_fmon"),"yyyy/MM/dd");
                v_tmon			= FormatDate.getFormatDate(dbox.getString("d_tmon"),"yyyy/MM/dd");

                if( v_handphone.length() <= 3 )     {   v_handphone = "-";       }

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
            <td class="table_02_1">
                <a href = "javascript:tutor_select('<%=v_userid%>')"><%=v_name%></a>
            </td>
            <td class="table_02_1"><%=v_userid%></td>
<!--            <td class="table_02_1"><%=v_pwd%></td>-->
<!--            <td class="table_02_1"><%=v_compnm%></td>-->
            <td class="table_02_1"><%=v_handphone%></td>
<!--            <td class="table_02_1"></td>-->
            <td class="table_02_1"><%=v_ismanager%> 
			 <% if(!v_fmon.equals("") && !v_tmon.equals("")) out.println("("+v_fmon+" - "+v_tmon+")");%>
			</td>
          </tr>
          <%}%>
        <% if(i == 0){ %>
          <tr>
            <td class="table_02_1" colspan="6">��ϵ� ������ �����ϴ�</td>
          </tr>
          <% } %>
        </table>

       <%  if(i > 0){ %>
        <table class="table1" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><%= PageUtil.printPageSizeList(v_totalpage, v_pageno, 0, v_pagesize, v_total_rowcount) %></td>
          </tr>
        </table>
       <% } %>
        <!----------------- ������ȸ �� ----------------->
      </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
