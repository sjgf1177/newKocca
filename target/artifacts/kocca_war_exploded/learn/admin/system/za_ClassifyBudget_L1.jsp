<%
//**********************************************************
//  1. ��      ��: ��з����꼳��
//  2. ���α׷���: za_ClassifyBudget_L.jsp
//  3. ��      ��: ��з����꼳��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2005. 02. 22
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %> 
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
	
	DataBox dbox = (DataBox)request.getAttribute("BudgetInfo"); //��������
	
    ArrayList list = (ArrayList)request.getAttribute("StudentList"); //������û��Ȳ

  //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_grseq     = box.getString("s_grseq");            //��������
    
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="Javascript">
$(document).ready(function(){
	$("#p_propstart").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propend").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
	function whenSubmit() {
		document.form1.p_process.value="ListPage";
		document.form1.submit();
	}
	
	function whenSave() {

		if (document.form1.s_grcode.value=="----") {
            alert("�����׷��� �����ϼ���.");
			document.form1.s_grcode.focus();
            return ;
		}

		if (document.form1.s_grseq.value=="ALL") {
            alert("���������� �����ϼ���.");
			document.form1.s_grseq.focus();
            return ;
		}

		if (document.form1.p_propstart.value > document.form1.p_propend.value) {
            alert("������û �������� ������û ������ �����̾�� �մϴ�.");
            return ;
		}
		document.form1.p_process.value= "saveInfo";
		document.form1.submit();
	}

    function whenSelection(p_action) {
        if (p_action=="go"){
			if (document.form1.s_grcode.value=="----") {
				alert("�����׷��� �����ϼ���.");
				document.form1.s_grcode.focus();
				return ;
			}

			if (document.form1.s_grseq.value=="ALL") {
				alert("���������� �����ϼ���.");
				document.form1.s_grseq.focus();
				return ;
			}
            
            top.ftop.setPam();
        }    
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.p_process.value = 'ListPage';  
        document.form1.submit();
    }
-->
</script>

</head>

<body topmargin=0 leftmargin=0>
<form name="form1" method="post" action="/servlet/controller.system.ClassifyBudgetServlet">
<input type="hidden" name="p_process" value="">
<input type="hidden" name="s_action"  value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/sutitle_001.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>

	   <br>
	   <table width="970" cellpadding="1" cellspacing="0" class="form_table_out">
        <tr> 
          <td bgcolor="#C6C6C6" align="center">
		    <table width="970" cellpadding="0" cellspacing="0" class="form_table_bg" border="0">
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td width="27%" align="left"> 
				    &nbsp;<%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
						
				    <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->						
				</td>
                <td width="10%" align="center"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') -->
              </tr> 
              <tr> 
                <td height="7"></td>
              </tr>
            </table>
		  </td>
        </tr>
      </table>
	  <br>
      <!-------------������ ����-------------------------->
	  <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>���꼳��</td>
        </tr>
        <tr> 
            <td align="center"><a href="javascript:whenSave()"><img src="/images/admin/button/btn_save.gif" border="0" tabindex=73></a></td>
			<td width=8></td>
          </tr>
        </table>
        </tr>
      </table> 
      <!--------------������ ��---------------------------->
      
        <table width="970"  cellpadding="0" cellspacing="1" class="table_out">
          <tr> 
            <td width="16%" height="33" class="table_title">������û �Ⱓ</td>
            <td colspan="3" class="table_02_2"><input tpye="text" name="p_propstart" id="p_propstart" class="datepicker_input1" size=10 value="<%=(dbox!=null)?FormatDate.getFormatDate(dbox.getString("d_propstart"),"yyyy-MM-dd"):""%>">
              ~ 
              <input tpye="text" name="p_propend" id="p_propend" class="datepicker_input1" size=10 value="<%=(dbox!=null)?FormatDate.getFormatDate(dbox.getString("d_propend"),"yyyy-MM-dd"):""%>"></td>
            <td height="35" class="table_title">�ִ������û ����</td>
            <td width="18%" class="table_02_2"><input type="text" name="p_maxsubjcnt" size="10" maxlength="1" class="input" value="<%=(dbox!=null)?dbox.getString("d_maxsubjcnt"):""%>" onkeyup="numeric_chk(this)">
              ��</td>
          </tr>
<!--
		  <tr> 
            <td height="30" class="table_title">��з� �ڵ�</td>
            <td colspan="3" class="table_02_2"><%//=v_gubun%></td>
          </tr>
-->
          <tr> 
            <td height="37" class="table_title">���꼳���ݾ�</td>
            <td colspan="3" class="table_02_2"><input type="text" name="p_budget" size=10  class="input" value="<%=(dbox!=null)?dbox.getString("d_budget"):""%>" onkeyup="numeric_chk(this)">��</td>
            <td width="14%" class="table_title">���꼳�� ��뿩��</td>
            <td width="52%" class="table_02_2">
<%if(dbox!=null) {%>
			  <select name="p_isuse" class="inputpsearch">
                <option value="Y" <%=(dbox.getString("d_isuse").equals("Y"))?"selected":""%>>Y</option>
                <option value="N" <%=(dbox.getString("d_isuse").equals("N"))?"selected":""%>>N</option>
              </select>
<%}else{%>
			  <select name="p_isuse" class="inputpsearch">
                <option value="Y">Y</option>
                <option value="N">N</option>
              </select>
<%}%>
		    </td>
          </tr>
        </table>
      <br>
      <br>
<% if (dbox!=null && dbox.getString("d_isuse").equals("Y")) { %>
	         <!-------------������ ����-------------------------->
	 <table width="970" border="0" cellspacing="0" cellpadding="0">
       <tr> 
         <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
         <td class=sub_title>������û��Ȳ</td>
       </tr>
       <tr> 
         <td height=6></td>
         <td height=6></td>
       </tr>
      </table> 
            <!----------------- �߰� ��ư ���� ----------------->
	      <table cellpadding="0" cellspacing="0" class="table1">
	        <tr>
	          <td align="left" width=10>
	          <td align="left" width=200>
				<%  int v_sumprice = 0;
					if(list.size()>0){
						for (int i=0; i<list.size(); i++) {
							DataBox dbox2 = (DataBox)list.get(i); 
							v_sumprice += dbox2.getInt("d_sumbiyong");
						} 
					}
				%>								
			   <b>��û �Ѱ� : <%=v_sumprice%>��</b>
	          </td>
			  
	          <td align="right" height="20">
	          <a href="javascript:whenSubmit();"><img src='/images/admin/button/b_go.gif' border=0></a>
	          </td>
	        </tr>
	        <tr>
	          <td height="3"></td>
	        </tr>
	      </table>
	      <!----------------- �߰� ��ư �� ----------------->
      <table width="575" border="0" cellspacing="1" cellpadding="0" class="table_out">
        <tr> 
          <td width="300" height="20" class="table_title">������</td>
          <td width="90" class="table_title">������</td>
          <td width="90" class="table_title">��û�ο�</td>
          <td width="90" class="table_title">�ݾ�</td>
        </tr>
	<%  
		if(list.size()>0){
			for (int i=0; i<list.size(); i++) {
			DataBox dbox2 = (DataBox)list.get(i); %>
        <tr> 
          <td class="table_02_2"><%=dbox2.getString("d_subjnm")%></td>
          <td class="table_02_1"><%=dbox2.getInt("d_avgbiyong")%></td>
          <td class="table_02_1"><%=dbox2.getInt("d_stdcnt")%></td>
          <td class="table_02_1"><%=StringManager.replace(dbox2.getString("d_sumbiyong"),".0","")%></td>
        </tr>
		<%	}
		}else { %>
		<tr><td colspan=4 class="table_02_1">������û���� �н��ڰ� �����ϴ�.</td></tr>
		<% } %>
      </table>
<% } %>	  
      <!--------------������ ��---------------------------->     
	 <br><br><br>
	 
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>

</body>
</html>
