<%
//**********************************************************
//  1. ��      ��: �������� ����Ʈ
//  2. ���α׷��� : za_MasterForm_L.jsp
//  3. ��      ��: �������� ����Ʈ ��ȸȭ��
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
    String  ss_area		   = box.getStringDefault("s_area", "ALL");

//    String  ss_contenttype = box.getStringDefault("s_contenttype","ALL");
    String  ss_contenttype = box.getStringDefault("s_contenttype","ALL");
    String  p_action       = box.getString("p_action");
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
            document.form1.p_process.value="listPage";
            document.form1.submit();
        }

        // ��з� ���ý�
        function changeUpperclass() {
            document.form1.p_process.value="listPage";
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
        // ����
        function whenSubmit(){
            document.form1.p_process.value="listPage";
            document.form1.p_action.value="go";
            document.form1.submit();
        }
        // ������
        function whenChange(subj){
            document.form1.p_subj.value=subj;
            document.form1.p_process.value="updatePage";
            document.form1.submit();
        }
        //����
        function whenOrders(ord){
            document.form1.p_process.value="listPage";
            document.form1.p_order.value=ord;
            whenSelection('go');
        }
        // �н�â �̸�����
        function whenViewEdu(url){
        	document.form1.lessonReurl.value = url;
			document.form1.lessonReiurl.value = "";
            window.open(url,'EduStart','width=800,height=600');
        }

        // ��������ġ
        function whenDir(subj) {
            document.form1.p_subj.value=subj;

            window.self.name = "winContents";
            farwindow = window.open("", "openDir", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 600, height = 600, top=0, left=0");
            document.form1.target = "openDir";
            document.form1.action = "/servlet/controller.contents.MasterFormServlet";
            document.form1.p_process.value="contentscolocateview";
            document.form1.submit();

            farwindow.window.focus();
            document.form1.target = window.self.name;

        }

// ������ �̸�����
function studyOpen(url) {

   if (url == '') {
	   alert("������ �����ϴ�");
   } else {
	   //open_window('openApp',url,0,0,0,0,false,false,true,true,true);
	   open_window('openApp',url,0,0,1024,768,false,false,true,true,true);
   }

}

function studyOpenRe() {
	document.form1.lessonRepopup.value = "1";
	var rurl = document.form1.lessonReurl.value;
	var riurl = document.form1.lessonReiurl.value;
	setTimeout("whenViewEdu('"+rurl+"');" ,100);
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
          <td><img src="/images/admin/course/c_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>

        <!----------------- form ���� ----------------->
                <form name="form1" method="post" action="/servlet/controller.contents.MasterFormServlet">
                <!-- �н�â �ٽö���� 1:�ٽ� �ȶ���  2:�ٽö���(�н����������� �ݾ������) -->
				    <input type='hidden' name='lessonRepopup' value="1">
				    <input type='hidden' name='lessonReurl' value="">
				    <input type='hidden' name='lessonReiurl' value="">
                
        <table width="97%" border="0" cellspacing="0" cellpadding="1" >
          <tr>
            <td bgcolor="#C6C6C6" align="center">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="form_table_bg">
                <tr>
                  <td height="7"></td>
                </tr>
                <tr>
                    <input type="hidden" name="p_process" value="listPage">
                    <input type="hidden" name="p_action"  value="">
                    <input type="hidden" name="p_subj"    value="">
                    <input type="hidden" name="p_order"   value="subjnm">

                  <td align="center">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                      <tr>
                        <td align="left" valign="middle">&nbsp;
<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>	
	�з� <kocca:selectBox name="s_area" optionTitle="== ��ü ==" type="sqlID" sqlID="code.list.0001" param="0101"  selectedValue="<%= ss_area %>" isLoad="true" />&nbsp;&nbsp;
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
	
                          </td>
                         </tr>
                        <tr><td  height="5px"></td></tr>
                        <tr>
                            <td  align="left" valign="middle" style="padding-left:8px">
                          ContentType
                          <select name = "s_contenttype" onChange="javascript:whenSelection('go')">
                            <option value="ALL" <% if (ss_contenttype.equals("ALL")){ %>selected<%}%>>ALL</option>
                            <option value="M"   <% if (ss_contenttype.equals("M")){ %>selected<%}%>>NORMAL(OLD)</option>
                            <option value="N"   <% if (ss_contenttype.equals("N")){ %>selected<%}%>>NORMAL(NEW)</option>
                            <option value="L"   <% if (ss_contenttype.equals("L")){ %>selected<%}%>>LINK</option>
<%                      if (GetCodenm.get_config("useOBC").equals("Y") || GetCodenm.get_config("useSCORM").equals("Y")) {%>
                            <option value="O"   <% if (ss_contenttype.equals("O")){ %>selected<%}%>>OBC</option>
                            <option value="S"   <% if (ss_contenttype.equals("S")){ %>selected<%}%>>SCORM</option>
<%                      }%>
                          </select>
                          ������ <input id="inputbox" name="s_inputbox">
                          </td>
                          <td width="10%" align="center">
                          <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td height="7"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
                </form>
        <!----------------- form �� ----------------->
        <br>

        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="9" class="table_top_line"></td>
          </tr>
          <tr>
            <td height="25" class="table_title" width="5%"><b>NO</b></td>
            <td class="table_title" width="10%"><a href="javascript:whenOrders('subj')" class="b"><b>�����ڵ�</b></a></td>
            <td class="table_title" width="13%"><a href="javascript:whenOrders('dir')" class="b"><b>������ ��ġ</b></a></td>
            <td class="table_title"><a href="javascript:whenOrders('subjnm')" class="b"><b>������</b></a></td>
            <td class="table_title"><b>������Ÿ��</b></td>
            <td class="table_title"><b>����</b></td>
            <td class="table_title" width="8%"><a href="javascript:whenOrders('center')" class="b"><b>�߾�����</b></a></td>
            <td class="table_title" width="18%"><b>���</b></td>
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
            <td class="table_02_1"><% if(data.getContenttype().equals("S")) {%><a href="javascript:whenDir('<%=v_subj%>')"><img src="/images/admin/button/b_contents.gif" border=0></a><%} else { %> <%=data.getDir()%> <% } %></td>
            <td bgcolor="#F7F7F7"><%=data.getSubjnm()%></td>
            <td class="table_02_1"><%=data.getContenttypenm()%></td>
            <td class="table_02_1"><%=data.getCnt_lesson()%></td>
            <td class="table_02_1"><%=data.getIscentered()%></td>
            <td class="table_03_1">
              <table width="95%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center">

<%        if (data.getIsoutsourcing().equals("N")) {              %>
                    <a href="javascript:whenChange('<%=v_subj%>')"><img src="/images/admin/button/b_modify.gif"  border="0"></a>
<%        }                                                %>
                  </td>
                  <td align="center">
<%        if (data.getIsoutsourcing().equals("N"))  {
	String results = null;
	if (data.getEduurl().equals("")){
			results = "/servlet/controller.contents.EduStart?p_year=2000&p_subjseq=0001&p_subj="+v_subj;
	}else{
		results = data.getEduurl();
	}
	%>
                    <a href="javascript:whenViewEdu('<%=results%>')"><img src="/images/admin/button/b_preview.gif"  border="0"></a>
<%        }                                                       %>
                  </td>
                  <!--<td align="center"><a href="javascript:whenViewPreview('<%=v_subj%>')"><img src="/images/admin/contents/view1_butt.gif" width="48" height="18" border="0"></a></td>-->
<!-- OBC,SCORM�� ��� ����ɼ��߰� (����)-->
                </tr>
              </table>
            </td>
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
