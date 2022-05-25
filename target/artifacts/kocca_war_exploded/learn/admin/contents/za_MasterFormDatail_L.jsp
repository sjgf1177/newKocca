<%
//**********************************************************
//  1. ��      ��: �������� �� ����Ʈ
//  2. ���α׷��� : za_MasterForm_L.jsp
//  3. ��      ��: �������� �� ����Ʈ ��ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 11. 24
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    String  ss_classtype   = box.getStringDefault("s_classtype",  "upper");
    String  ss_upperclass  = box.getStringDefault("s_upperclass", "ALL");
    String  ss_middleclass = box.getStringDefault("s_middleclass","ALL");
    String  ss_lowerclass  = box.getStringDefault("s_lowerclass", "ALL");

//    String  ss_contenttype = box.getStringDefault("s_contenttype","ALL");
    String  ss_contenttype = box.getStringDefault("s_contenttype","N");
    String  p_action       = box.getString("p_action");
    String  c_gadmin    = box.getSession("s_gadmin");
    String v_owner = "";
    if(c_gadmin==null || c_gadmin.equals(""))   c_gadmin="A1";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language="javascript">
        // ���ý�
        function whenSelection(action){
            if (action=="go"){
                top.ftop.setPam();
            }
            document.form1.p_action.value = action;
            document.form1.p_process.value="listPageDetail";
            document.form1.submit();
        }
        // ��з� ���ý�
        function changeUpperclass() {
            document.form1.p_process.value="listPageDetail";
            document.form1.p_action.value="";
            document.form1.submit();
        }
        // �ߺз� ���ý�
        function changeMiddleclass() {
            changeUpperclass();
        }
        // �Һз� ���ý�
        function changeLowerclass() {
            changeUpperclass();
        }
        //����
        function whenOrders(ord){
            document.form1.p_process.value="listPageDetail";
            document.form1.p_order.value=ord;
            whenSelection('go');
        }


      //select box ����
      $(function() {
      	$("#oUpperclass").bind("change", function(){
              var param = "type=sqlID&sqlID=selectBox.subjAttMiddleList&param=" + $(this).val();
              $.ajaxSetup({cache:false});
              $.ajax({
                      type : "get"
                  ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                  ,   dataType : "json"
                  ,   data : param
                  ,   success : fnSetMiddleClass
                  ,   complete : function(arg1, arg2) {
                          // alert("complete : " + arg1);
                      }
                  ,   error :  function(arg1, arg2) {
                          // alert("error : " + arg1);
                      }
              });
          });

          $("#oMiddleclass").bind("change", function(){
              var param = "type=sqlID&sqlID=selectBox.subjAttLowerList&param=" + $("#oUpperclass").val() + "," + $(this).val();
              $.ajaxSetup({cache:false});
              $.ajax({
                      type : "get"
                  ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                  ,   dataType : "json"
                  ,   data : param
                  ,   success : fnSetLowerClass
                  ,   complete : function(arg1, arg2) {
                          // alert("complete : " + arg1);
                      }
                  ,   error :  function(arg1, arg2) {
                          // alert("error : " + arg1);
                      }
              });
          });
      });

      /**
       * �˻����ǿ��� ��з� ���ý� callback function
       */
      function fnSetMiddleClass( result ) {
          $("#oMiddleclass").empty();
          $("#oMiddleclass").append("<option value=\"\">== ��ü ==</option>");
          $("#oLowerclass").empty();
          $("#oLowerclass").append("<option value=\"\">== ��ü ==</option>");

          if ( result.selectBoxList.length > 0 ) {
              $.each( result.selectBoxList, function() {
                  $("#oMiddleclass").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
              });

          }
      }


      /**
       * �˻����ǿ��� �ߺз� ���ý� callback function
       */
      function fnSetLowerClass( result ) {
          $("#oLowerclass").empty();
          $("#oLowerclass").append("<option value=\"\">== ��ü ==</option>");

          if ( result.selectBoxList.length > 0 ) {
              $.each( result.selectBoxList, function() {
                  $("#oLowerclass").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
              });

          }
      }
    </script>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">


      <!----------------- title ���� ----------------->
     <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/tit_master_info.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>

        <!----------------- form ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="1" >
          <tr>
            <td bgcolor="#C6C6C6" align="center">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="form_table_bg">
                <tr>
                  <td height="7"></td>
                </tr>
                <tr>
                <form name="form1" method="post" action="/servlet/controller.contents.MasterFormServlet">
                    <input type="hidden" name="p_process" value="listPageDetail">
                    <input type="hidden" name="p_action"  value="">
                    <input type="hidden" name="p_subj"    value="">
                    <input type="hidden" name="p_order"   value="subjnm">

                  <td align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                      <tr>
                        <td align="left" valign="middle">&nbsp;
<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>	
	��з� 
	<kocca:selectBox name="s_upperclass" id="oUpperclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttUpperList" selectedValue="<%= ss_upperclass %>" isLoad="true" />
	�ߺз� 
<%
    if ( !ss_middleclass.equals("") ) {
%>
									<kocca:selectBox  name="s_middleclass" id="oMiddleclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttMiddleList" param="<%= ss_upperclass %>" selectedValue="<%= ss_middleclass %>" isLoad="true" />
<%
    } else {
%>
                                    <select name="s_middleclass" id="oMiddleclass">
                                    	<option value="">== ��ü ==</option>
                                    </select>
<%
    }
%>	
	�Һз�
<%
    if ( !ss_lowerclass.equals("") ) {
%>
                                    <kocca:selectBox name="s_lowerclass" id="oLowerclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttLowerList" param="<%= ss_upperclass + ',' + ss_middleclass %>" selectedValue="<%= ss_lowerclass %>" isLoad="true" />
<%
    } else {
%>
                                    <select name="s_lowerclass" id="oLowerclass">
                                        <option value="">== ��ü ==</option>
                                    </select>
<%
    }
%>	
	
                          ContentType
                          <select name = "s_contenttype" onChange="javascript:whenSelection('go')">
						    <option value="ALL" <% if (ss_contenttype.equals("ALL")){ %>selected<%}%>>ALL</option>
                            <option value="M"   <% if (ss_contenttype.equals("M")){ %>selected<%}%>>NORMAL(OLD)</option>
                            <option value="N"   <% if (ss_contenttype.equals("N")){ %>selected<%}%>>NORMAL(NEW)</option>
							<option value="L"   <% if (ss_contenttype.equals("L")){ %>selected<%}%>>LINK</option>
<%          			if (GetCodenm.get_config("useOBC").equals("Y") || GetCodenm.get_config("useSCORM").equals("Y")) {%>
							<option value="O"   <% if (ss_contenttype.equals("O")){ %>selected<%}%>>OBC</option>
							<option value="S"   <% if (ss_contenttype.equals("S")){ %>selected<%}%>>SCORM</option>
<%          			}%>
                          </select>
						  </td>
						  <td width="10%" align="center">
                          <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                </form>
                <tr>
                  <td height="7"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <!----------------- form �� ----------------->
        <br>

        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="13" class="table_top_line"></td>
          </tr>
          <tr>
            <td height="25" class="table_title" width="5%"><b>NO</b></td>
            <td class="table_title" width="6%"><a href="javascript:whenOrders('subj')" class="b"><b>�����ڵ�</b></a></td>
            <td class="table_title" width="13%"><a href="javascript:whenOrders('dir')" class="b"><b>������ ��ġ</b></a></td>
            <td class="table_title"><a href="javascript:whenOrders('subjnm')" class="b"><b>������</b></a></td>
            <td class="table_title"><b>������Ÿ��</b></td>
            <td class="table_title"><b>����</b></td>
            <td class="table_title" width="8%"><a href="javascript:whenOrders('center')" class="b"><b>�߾�����</b></a></td>
            <td class="table_title" width="7%"><b>�޴������� ��ġ</b></td>
            <td class="table_title" width="7%"><b>âũ��(WIDTH)</b></td>
            <td class="table_title" width="7%"><b>âũ��(HEIGHT)</b></td>
            <td class="table_title" width="7%"><b>�н�������</b></td>
            <td class="table_title" width="7%"><b>Ʈ���޴�����</b></td>
			<td class="table_title" width="9%"><b>�н��ڿ��Ժ����ֱ�</b></td>
          </tr>
<%  if (p_action.equals("go")) {
        ArrayList  list = (ArrayList)request.getAttribute("MasterFormList");
        MasterFormListData data = null;
        String      v_subj="";
        for (int i=0; i<list.size(); i++) {
            data  = (MasterFormListData)list.get(i);
            v_subj = data.getSubj();
            
%>
          <tr>
            <td align="center" bgcolor="#EEEEEE" height="25"><%=i+1%></td>
            <td class="table_02_1"><%=v_subj%></td>
            <td class="table_02_1"><%=data.getDir()%></td>
            <td bgcolor="#F7F7F7"><%=data.getSubjnm()%></td>
            <td class="table_02_1"><%=data.getContenttypenm()%></td>
            <td class="table_02_1"><%=data.getCnt_lesson()%></td>
            <td class="table_02_1"><%=data.getIscentered()%></td>
            <td class="table_02_1"><%=data.getMftypenm() %></td>
            <td class="table_02_1"><%=data.getWidth()%></td>
            <td class="table_02_1"><%=data.getHeight()%></td>
            <td class="table_02_1"><%if(data.getEduprocess().equals("Y")){out.println("����");} else if(data.getEduprocess().equals("N")){out.println("�����");}else{out.println("-");}%></td>
            <td class="table_02_1"><%=data.getOtbgcolor()%></td>
			<td class="table_02_1"><%=data.getIsvisible()%></td>
          </tr>
<%      }
    }
%>

        </table>
        <!----------------- �������� ���� �� ----------------->
        <br>

      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
