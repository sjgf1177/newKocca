<%
//**********************************************************
//  1. ��      ��: ������� ȭ��
//  2. ���α׷���: za_Subject_I.jsp
//  3. ��      ��: ������� ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 12. 15
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
    
    String v_subj = box.getString("p_subj"); //�����ڵ�
    System.out.println("v_subj = " + v_subj);
    
    DataBox dbox1 = (DataBox)request.getAttribute("subjectSelect");
    
	String v_subjnm 	= dbox1.getString("d_subjnm");    	//������
	String v_edugubun 	= dbox1.getString("d_edugubun");  	//���������ڵ�
	String v_edugubunnm = dbox1.getString("d_edugubunnm");	//����������
	String v_subjgubun 	= dbox1.getString("d_subjgubun"); 	//��������(A:LMS��ϰ���,B:����/��������ý��� ��� ����)
	
	//��ȹ
	String v_edustarta 	= dbox1.getString("d_edustarta"); 	//����������(��ȹ)
	String v_eduenda 	= dbox1.getString("d_eduenda");   	//����������(��ȹ)
	String v_edutargeta = dbox1.getString("d_edutargeta");	//�������(��ȹ)
	String v_edutmema 	= dbox1.getString("d_edutmema");  	//�������ο�(��ȹ)
	String v_edutseqa 	= dbox1.getString("d_edutseqa");  	//����������(��ȹ)
	String v_seqpermema = dbox1.getString("d_seqpermema");	//�������ο�(��ȹ)
	String v_eduplacea 	= dbox1.getString("d_eduplacea"); 	//�������(��ȹ)
	
	String v_gyamt 		= dbox1.getString("d_gyamt");     	//��뺸��ȯ�޿���ݾ�
	
	String v_inusercomp = dbox1.getString("d_inusercomp");  //����� �Ҽ� �ڵ�
	
	String v_today = FormatDate.getDate("yyyy-MM-dd");
	
	String  ss_year		 = box.getStringDefault("s_year","");    		//�⵵	
    String  ss_edugubun   = box.getStringDefault("s_edugubun","ALL");    //��������
    String  ss_company    = box.getStringDefault("s_company","ALL");    	//ȸ��
    String  ss_edudept    = box.getStringDefault("s_edudept","ALL");    	//�����ְ��μ�
    String  ss_srchsubjnm = box.getStringDefault("p_srchsubjnm","");		//������
    String  ss_me		 = box.getString("p_me"); //�ڱⰡ ����� ����

%>
<html>
<head>
<title>���̹��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT language="JavaScript">
<!--

function goSubjectListPage() {
  document.form2.p_process.value  = 'SubjList';
  document.form2.submit();
}

function InsertSubject() {
  document.form2.p_process.value = 'SubjInsert';
  document.form2.submit();
}

function UpdateSubject() {

<%//�Ѱ�������/��������ڸ� ���� ���� %>
<% if (!box.getSession("gadmin").substring(0,1).equals("A") && !box.getSession("gadmin").substring(0,1).equals("R")) { %>
  if('<%=v_eduenda%>' > '<%=v_today%>') {
  	alert("������������ ������ ������ �� �����ϴ�.");
  	return;
  }
<% } %>
  document.form2.p_process.value = 'SubjUpdatePage';
  document.form2.submit();
}

function DeleteSubject() {
  document.form2.p_process.value = 'SubjDelete';
  document.form2.submit();
}

/*
function sw_file_add(ext) { 
		var intloopi,intloopj,intloopk ;
		intloopj = document.form2.txtcurrnum.value ;
		if(intloopj==1) {sw_file_add_form.innerHTML = '';}
		uf = "";
		for(intloopi=1;intloopi<intloopj;intloopi++) {
			eval('sw_file_add_form' + uf).innerHTML = "<input type='text' name='txtcurr' size='50' style='width:90%' " + ext + " value='"+(uf+2)+" ���� : '><div id='sw_file_add_form" + (uf+1) + "'></div>";
			uf++; 
		}
		document.Lecreqfm.totfilenum.value = intloopj ; //���� �Ѱ��� ����
	}
*/
function searchTutor(p_id) {
  var url = "/servlet/controller.budget.BudgetAdminServlet?p_process=searchTutor&p_id="+p_id;
  open_window("",url,"0","0","200","200");
}

function receiveTutor(p_id, tutorGubun , tutorName, tutorID) {
	var v_id = eval("document.form2.p_tutorid" + p_id);
	var v_name = eval("document.form2.p_tutorname" + p_id);
	
	v_id.value=tutorID;
	v_name.value = tutorName;	
}

function tutorCancel(p_id) {
	var v_id = eval("document.form2.p_tutorid" + p_id);
	var v_name = eval("document.form2.p_tutorname" + p_id);
	v_id.value = "";
	v_name.value = "";
}
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false'
ondragstart='return false' onselectstart='return false'
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>

<form name="form2" method="post" action="/servlet/controller.budget.BudgetAdminServlet">
    <input type="hidden" name="p_process"   value="">
	<input type="hidden" name="p_subj"		value="<%=v_subj%>">
	
    <input type="hidden" name="s_year"     		value="<%=ss_year%>">		<!-- �⵵ -->
    <input type="hidden" name="s_edugubun"     	value="<%=ss_edugubun%>">	<!-- �������� -->
    <input type="hidden" name="s_company"     	value="<%=ss_company%>">	<!-- ȸ�� -->
    <input type="hidden" name="s_edudept"     	value="<%=ss_edudept%>">	<!-- �����ְ��μ� -->
    <input type="hidden" name="p_srchsubjnm"    value="<%=ss_srchsubjnm%>">	<!-- ������ -->
    <input type="hidden" name="p_me"     		value="<%=ss_me%>">			<!-- �ڱⰡ ����� ���� -->
    	
	<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/tutor/t_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
	   <br>
	           <!-------------������ ����-------------------------->
 <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>����/��������</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        
      <!--------------������ ��---------------------------->
        <table width="970"  cellpadding="0" cellspacing="1" class="table_out">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title_bold">������</td>
            <td width="68%" class="table_02_2"><%=v_subjnm%></td>
          </tr>
          <tr> 
            <td class="table_title_bold">��������</td>
            <td class="table_02_2"><%=v_edugubunnm%></td>
          </tr>
          <tr> 
            <td class="table_title_bold">�������</td>
            <td class="table_02_2"><%=v_edutargeta%></td>
          </tr>
          <tr> 
            <td class="table_title_bold">�������</td>
            <td class="table_02_2"><%=v_eduplacea%></td>
          </tr>
          <tr> 
            <td class="table_title_bold">����������</td>
            <td class="table_02_2"><%=v_edustarta%></td>
          </tr>
          <tr> 
            <td class="table_title_bold">����������</td>
            <td class="table_02_2"><%=v_eduenda%></td>
          </tr>
          <tr align="center"> 
            <td colspan="2" bgcolor="#FFFFFF" style=padding-top:5;padding-bottom:5;><table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="50%" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" >
                      <tr> 
                        <td height="14" colspan="2" class="table_title_bold">�����ο�</td>
                      </tr>
                      
					  <!-- �ο����� ���� -->
                <%  ArrayList  list1 = (ArrayList)request.getAttribute("budgetmemSubjList");
				    for (int i=0; i<list1.size(); i++) {
				        DataBox dbox = (DataBox)list1.get(i); %>
                <tr> 
                  <td width="37%" class="table_title_l" style="padding-left:30px;"><%=dbox.getString("d_codenm")%></td>
                  <td width="63%" class="table_01">
                  <table>
                    <tr><td width="50%" class="table_01"><%=dbox.getInt("d_plandata")%> ��</td>
                        <td width="50%"></td>
                    </tr>
                  </table>
                  </td>
                </tr>
                <%  } %>
                <!-- �����ο����� �� -->
                    </table></td>
                  <td width="1%">&nbsp;</td>
                  <td width="49%">
                  
                  <table width="100%" border="0" cellpadding="0" cellspacing="1" >
                      <tr> 
                        <td colspan="2" class="table_title_bold">����</td>
                      </tr>
					  <!-- �������� ���� -->
				<%  ArrayList  list2 = (ArrayList)request.getAttribute("budgetSubjList");
					int v_sumcost = 0;
				    for (int i=0; i<list2.size(); i++) {
				        DataBox dbox = (DataBox)list2.get(i); 
				        v_sumcost+=dbox.getInt("d_plandata");
				%>
                <tr> 
                  <td width="29%" class="table_title_l" style="padding-left:40px;"><%=dbox.getString("d_codenm")%></td>
                  <td width="34%" class="table_01">
                  <table>
                    <tr><td width="50%" class="table_01">
                  <% //�Ѱ�������/��������ڸ� �����ϰ� Ÿ�μ� ���� ��ȸ �Ұ� %>
                  <%if (!box.getSession("gadmin").substring(0,1).equals("A")  && !box.getSession("gadmin").substring(0,1).equals("R") && !v_inusercomp.equals(box.getSession("comp"))) { %>
                  -
                  <%	} else { %>
                  		<%=dbox.getInt("d_plandata")%>
    	                �� 
    	          <% } %>
    	          </td>
                        <td width="50%"></td>
                    </tr>
                  </table>
    	          </td>
                </tr>
				<%  } %>
				<tr> 
                  <td width="29%" class="table_title_l" style="padding-left:40px;">��</td>
                  <td width="34%" class="table_01">
                  <table>
                    <tr><td width="50%" class="table_01"><%=v_sumcost%>
                    �� </td>
                        <td width="50"%></td>
                    </tr>
                  </table></td>
                </tr>
                <!-- �������� �� -->
					  
                    </table>
                    
                    
                    </td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td class="table_title">�������ο�</td>
            <td width="81%" class="table_02_2"><%=v_edutmema%> ��</td>
          </tr>
          <tr> 
            <td class="table_title">����������</td>
            <td class="table_02_2"><%=v_edutseqa%></td>
          </tr>
          <tr> 
            <td class="table_title">�������ο�</td>
            <td class="table_02_2"><%=v_seqpermema%> ��</td>
          </tr>
          <tr> 
            <td class="table_title">��뺸��ȯ�޿���ݾ�</td>
            <td class="table_02_2"><%=v_gyamt%> ��</td>
          </tr>
        </table>
        <br>
		<!-------------������ ����-------------------------->
 <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>���α׷�</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->

        <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td width="3%" class="table_title">��ȣ</td>
            <td width="30%" class="table_title">������</td>
            <td width="22%" class="table_title">�����/���������</td>
            <td width="16%" class="table_title">���/����ڹ�ȣ</td>
            <td width="8%" class="table_title">���籸��</td>
            <td width="7%" class="table_title">������<br>�����ð�(hr)</td>
            <td width="14%" class="table_title">�ð��簭���(��)</td>
          </tr>
       	<!-- �������� ���� -->
		<%  ArrayList  list3 = (ArrayList)request.getAttribute("SubjProgramList");
			if (list3.size()==0) { %>
		  <tr><td class="table_02_1" colspan="7" align=center>��ϵ� ���α׷��� �����ϴ�.</td></tr>
		<% } else {
		    for (int i=0; i<list3.size(); i++) {
		        DataBox dbox3 = (DataBox)list3.get(i); %>
          <%// for (int i=1;i<16;i++) { %>
          <tr> 
            <td class="table_02_2"><%=i+1%></td>
            <td class="table_02_2"><%=dbox3.getString("d_lessonnm")%></td>
            <td class="table_02_1"><%=dbox3.getString("d_tutorname")%></td>
            <td class="table_02_1"><%=dbox3.getString("d_tutorid")%></td>
            <td class="table_02_1"><%=dbox3.getString("d_tutorgubunnm")%></td>
            <td class="table_02_1"><%=dbox3.getInt("d_eduhr")%></td>
            <td class="table_02_1_r">
            <table><tr><td width="70%">
            <%=dbox3.getInt("d_price")%>
            </td>
            <td width="30%"></td>
            </tr></table>
            </td>
          </tr>
          <% }
          } %>
          <input type="hidden" name="p_lessoncnt" value="15">
        </table>  
        <!----------------- ���������� ��� �� ----------------->
        <br>
       <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
          
          <a href="javascript:UpdateSubject()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>
          
          <td>
		  <td width=8></td>
		  <%//�Ѱ�������/��������ڸ� ���� ���� %>
		  <% if (box.getSession("gadmin").substring(0,1).equals("A") || box.getSession("gadmin").substring(0,1).equals("R")) { %>
          <td><a href="javascript:DeleteSubject()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
		  <td width=8></td>
		  <% } %>
          <td><a href="javascript:goSubjectListPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ���, ����Ʈ ��ư �� ----------------->
      <br>
      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
