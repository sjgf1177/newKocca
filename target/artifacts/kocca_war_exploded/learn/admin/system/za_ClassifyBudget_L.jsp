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
    //DEFINED in relation to select START
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gryear    = box.getString("s_grseq");            //��������
    String  ss_grseq     = box.getString("s_grseq");            //��������
    String  ss_gubun     = box.getString("s_gubun");            //��������
    String  s_gadmin		 = box.getSession("gadmin");
    

	ArrayList list      = null;
	if (box.getString("p_action").equals("go"))  {
	    list = (ArrayList)request.getAttribute("SelectList"); //������û��Ȳ
	}  
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
	//���꼳������
	function whenSave() {

		if (document.form1.s_grcode.value=="ALL") {
            alert("�����׷��� �����ϼ���.");
			document.form1.s_grcode.focus();
            return ;
		}

		if (document.form1.s_gyear.value=="") {
            alert("�����⵵�� �����ϼ���.");
			document.form1.s_grcode.focus();
            return ;
		}

		if (document.form1.s_grseq.value=="ALL") {
            alert("���������� �����ϼ���.");
			document.form1.s_grseq.focus();
            return ;
		}

		if (document.form1.s_gubun.value=="ALL") {
            alert("������ �����ϼ���.");
			document.form1.s_gubun.focus();
            return ;
		}

		if (document.form1.p_propstart.value > document.form1.p_propend.value) {
            alert("������û �������� ������û ������ �����̾�� �մϴ�.");
            return ;
		}

		document.form1.p_process.value= "saveInfo";
		document.form1.r_process.value= "selectListPage";
		document.form1.submit();
	}
	
	//���꼳�� ���� ��ȸ
  function whenSelection(p_action) {
          
        top.ftop.setPam();
            
        document.form1.p_action.value = p_action;
        document.form1.target = "_self";
        document.form1.p_process.value = 'selectListPage';  
        document.form1.submit();
    }
	
	//���꼳�� ���� ����Ʈ
	function whenUpdateList(grcode, gryear, grseq, gubun) {
	    document.form1.grcode.value = grcode;
	    document.form1.gryear.value = gryear;
	    document.form1.grseq.value = grseq;
	    document.form1.gubun.value = gubun;
		document.form1.p_process.value= "ListPage";
		document.form1.submit();
	}

-->
</script>

</head>

<body topmargin=0 leftmargin=0>
<form name="form1" method="post" action="/servlet/controller.system.ClassifyBudgetServlet">
<input type="hidden" name="p_process" value="">
<input type="hidden" name="p_action" value="">
<input type="hidden" name="r_process" value="">
<input type="hidden" name="grcode" value="">
<input type="hidden" name="gryear" value="">
<input type="hidden" name="grseq" value="">
<input type="hidden" name="gubun" value="">

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
                <td width="90%" align="left"> 
                <%
                	if(s_gadmin.equals("A1")){
                %>
				    		&nbsp;<%= SelectEduBean.getGrcode(box, true, true)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->	
				    		<%
				    			} else {
				    		%>
				    		&nbsp;<%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->	
				    		<%	}	%>
       			     <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)  �����⵵ -->
				     <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->		
					 ���� <%=CodeConfigBean.getCodeGubunSelect("0049","",1,"s_gubun",ss_gubun,"",2)%>
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
          <td class=sub_title>���꼳�� ���</td>
          <td width="10%" align="right"><a href="javascript:whenSave()"><img src="/images/admin/button/btn_add.gif" border="0" tabindex=73></a></td>
        </tr>
       <tr> 
         <td height=6></td>
         <td height=6></td>
       </tr>
      </table> 
      <!--------------������ ��---------------------------->
        <table width="970"  cellpadding="0" cellspacing="1" class="table_out">
          <tr> 
            <td width="15%" height="33" class="table_title">������û �Ⱓ</td>
            <td width="25%" class="table_02_2">
			  			<input tpye="text" name="p_propstart" id="p_propstart" class="datepicker_input1" size=10 value=""> ~ 
              <input tpye="text" name="p_propend" id="p_propend" class="datepicker_input1" size=10 value=""></td>
            <td width="15%" class="table_title">���꼳�� �ݾ�</td>
            <td width="25%" class="table_02_2"><input type="text" name="p_budget" size="20"  maxlength="10" class="input" value="" onkeyup="numeric_chk(this)"> ��</td>
            <td width="10%" class="table_title">��뿩��</td>
            <td width="10%" class="table_02_2">
			  			<select name="p_isuse" class="inputpsearch">
                <option value="Y">Y</option>
                <option value="N">N</option>
              </select>
		    		</td>
          </tr>
        </table>
      <br>
        <table width="970" cellspacing="1" cellpadding="0">
        	<tr>
        		<td align="left">&nbsp;<font color="red">* ���꼳���� ����Ҷ��� (�����׷�,����,��������,����)�� �����ϼž߸� �մϴ�.</font></td>
        	</tr>
        </table>
      <br>

     <!-------------������ ����-------------------------->
	  <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>���꼳�� ����Ʈ</td>
        </tr>
       <tr> 
         <td height=6></td>
         <td height=6></td>
       </tr>
      </table> 
      <!--------------������ ��---------------------------->

	  <!----------------- �߰� ��ư �� ----------------->
      <table width="575" border="0" cellspacing="1" cellpadding="0" class="table_out">
        <tr> 
          <td width="15%" height="20" class="table_title">�����׷�</td>
          <td width="17%" class="table_title">��������</td>
          <td width="7%" class="table_title">����</td>
          <td width="17%" class="table_title">������û �Ⱓ</td>
          <td width="13%" class="table_title">���꼳�� �ݾ�</td>
          <td width="13%" class="table_title">��뿩��</td>
          <td width="20%" class="table_title">���</td>
        </tr>
<%  
	if (box.getString("p_action").equals("go"))  {
		for (int i=0; i<list.size(); i++) {
		DataBox dbox2 = (DataBox)list.get(i); 
%>
        <tr> 
          <td class="table_02_1"><%=GetCodenm.get_grcodenm(dbox2.getString("d_grcode"))%></td>
          <td class="table_02_1"><%=GetCodenm.get_grseqnm(dbox2.getString("d_grcode"), dbox2.getString("d_gryear"), dbox2.getString("d_grseq"))%></td>
          <td class="table_02_1"><%=CodeConfigBean.getCodeName("0049", dbox2.getString("d_gubun"))%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(dbox2.getString("d_propstart"),"yyyy-MM-dd")%> ~ <%=FormatDate.getFormatDate(dbox2.getString("d_propend"),"yyyy-MM-dd")%></td>
          <td class="table_02_1"><%=dbox2.getInt("d_budget")%></td>
          <td class="table_02_1"><%=dbox2.getString("d_isuse")%></td>
          <td class="table_03_1"><a href="javascript:whenUpdateList('<%=dbox2.getString("d_grcode")%>','<%=dbox2.getString("d_gryear")%>','<%=dbox2.getString("d_grseq")%>','<%=dbox2.getString("d_gubun")%>')"><img src="/images/admin/button/b_lecapply.gif" border="0"></a></td>
        </tr>
<%
		}
	}
%>

      </table>  
      <!--------------������ ��---------------------------->     
	 <br><br><br>
	 
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>

</body>
</html>
