<%
//**********************************************************
//  1. ��      ��: �������� �԰��ο���ȸ
//  2. ���α׷���: za_cpeduApproval_l.jsp
//  3. ��      ��: ����Ȯ���ڸ�� ����Ʈȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005.8.23
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

int i = 0, v_reccnt = 0, v_dispnum = 0, v_totalpage = 0, v_rowcount = 0, v_usercnt = 0;
String v_subj = "", v_subjnm = "", v_cpnm = "", v_cpsubjseq = "", v_appuser = "", v_year = "";
String v_subjseq = "", v_subjseqgr = "", v_propstart = "", v_propend = "", v_edustart = "", v_eduend = "";

String v_upcnt    = "";
String v_recentdt = "";   

String v_searchtext = box.getString("p_searchtext");
int v_pageno = box.getInt("p_pageno"); 
String v_gyear = box.getString("s_gyear");
String v_grcode = box.getString("s_grcode");
String v_grseq = box.getString("s_grseq");
String v_process = box.getString("p_process");

//String s_userid = box.getSession("userid");
//String s_usernm = box.getSession("username");


%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language="javascript">
<!--//
function whenSelection(ss_action){

    document.form1.p_action.value = ss_action;
    
	if (ss_action=="go") {
		if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
		    alert("�����׷��� �����ϼ���.");
		    return ;
		}
		top.ftop.setPam();
	}
	
	document.form1.action = "/servlet/controller.cp.CPEduStatusServlet";
	document.form1.p_process.value = "<%=v_process%>";
	document.form1.p_pageno.value = "1";
	document.form1.target = "_self";
	document.form1.submit();
}

function go(index) {
     document.form1.p_pageno.value = index;
     document.form1.p_action.value = "go";
     document.form1.action = "/servlet/controller.cp.CPEduStatusServlet";
     document.form1.p_process.value = "<%=v_process%>";     
     document.form1.target = "_self";
     document.form1.submit();
}  

function goPage(pageNum) {
	document.form1.p_pageno.value = pageNum;
	document.form1.p_action.value = "go";
	document.form1.action = "/servlet/controller.cp.CPEduStatusServlet";
	document.form1.p_process.value = "<%=v_process%>";  
	document.form1.target = "_self";
	document.form1.submit();
}  

function selectList() {
    document.form1.target = "_self";
	document.form1.action = "/servlet/controller.cp.CPEduStatusServlet";
	document.form1.p_process.value = "<%=v_process%>"; 
	document.form1.p_pageno.value = "1";
	document.form1.target = "_self";
	document.form1.submit();
}

function MoveLink(action, year,subj,subjseq, subjseqgr) {
  document.form1.p_process.value   = "insertPage";
  document.form1.action            = "/servlet/controller.cp.CPEduStatusServlet";
  document.form1.p_year.value = year;
  document.form1.p_subj.value = subj;
  document.form1.p_subjseq.value = subjseq;
  document.form1.p_subjseqgr.value = subjseqgr;
  //alert(document.form1.p_subjseqgr.value);
  document.form1.target = "_self";
  document.form1.submit();
}

//�н���Ȳ����Ͻ� ��ȸ
function whenUpdateList(subj, year, subjseq){
    window.self.name = "UpdateList";
    //alert(toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str);
    
    open_window("openUpdateList","","100","100","640","550","no","no","no","yes","no");  
    document.form1.target = "openUpdateList";
    document.form1.action = "/servlet/controller.cp.CPEduStatusServlet";
	document.form1.p_subj.value = subj;
	document.form1.p_subjseq.value = subjseq;
	document.form1.p_year.value = year;
	document.form1.p_process.value = "openUpdateList";
	document.form1.submit();
}


function statusInsertAll(){
	if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
	    alert("�����׷��� �����ϼ���.");
		return ;
	}
	
	if (document.form1.s_gyear.value == '') {
	    alert("�����⵵�� �����ϼ���.");
		return ;
	}
	
	if (document.form1.s_grseq.value == 'ALL' || document.form1.s_grseq.value == '') {
	    alert("���������� �����ϼ���.");
		return ;
	}
	ff1 = document.form1;
	
	ff1.s_grcodename.value=ff1.s_grcode.options[ff1.s_grcode.selectedIndex].text;
	ff1.s_gryearname.value=ff1.s_gyear.options[ff1.s_gyear.selectedIndex].text;
	ff1.s_grseqname.value =ff1.s_grseq.options[ff1.s_grseq.selectedIndex].text;
	
	document.form1.action = "/servlet/controller.cp.CPEduStatusServlet";
	document.form1.target = "_self";
	document.form1.p_process.value = "statusInsertAllPage";
	document.form1.submit();
}



function enter(e) {
        if (e.keyCode =='13'){
            whenSelection('go');
        }
}

//-->
</script>
</head>

<body topmargin=0 leftmargin=0>

<form name="form1" action="" method="post">
<input type="hidden" name="p_process" value="<%=v_process%>">
<input type="hidden" name="p_action" value="">
<input type="hidden" name="p_pageno" value="<%=v_pageno%>">
<input type="hidden" name="p_grcode" value="<%=v_grcode%>">
<input type="hidden" name="p_gyear" value="<%=v_gyear%>">
<input type="hidden" name="p_grseq" value="<%=v_grseq%>">
<input type="hidden" name="p_year" value="">
<input type="hidden" name="p_subj" value="">
<input type="hidden" name="p_subjseq" value="">
<input type="hidden" name="p_subjseqgr" value="">
<input type="hidden" name="s_grcodename" value="">
<input type="hidden" name="s_gryearname" value="">
<input type="hidden" name="s_grseqname" value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	
	<!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="../../images/admin/cp/cp_tit_study.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
	   
      <br>
      <br>
      <table width="970" cellpadding="1" cellspacing="0" class="form_table_out">
        <tr> 
          <td align="center"><table width="970" cellpadding="0" cellspacing="0" class="form_table_bg">
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td align="center">
                  <table  border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><font color="red">��</font><%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  --></td>
                      <td><font color="red">��</font><%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
					  </td>
					  <td><%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
					  </td>
                      <td>������ü&nbsp; <%= CPCommonBean.getCP(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    �������  -->&nbsp; </td>

                      <td>������</td>
                      <td width=6></td>
                      <td><input name="p_searchtext" type="text" class="input" style="width:80" value="<%=v_searchtext %>" onKeyPress=javascript:enter(event)></td>
                      <td width=6></td>
                      <td><a href="javascript:whenSelection('go');"><img src="/images/admin/button/b_go.gif"  border="0"></a> 
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
            </table></td>
        </tr>
      </table> 
      <br>
      <table width="970">
        <tr>
          <td height="25" valign="middle" align="right">
            <a href="javascript:statusInsertAll()"><img src="/images/admin/button/btn_outbatch2.gif"  border="0"></a>
          </td>
        </tr>
      </table>
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
        <tr> 
          <td colspan="9" class="table_top_line"></td>
        </tr>
        <tr> 
          <td class="table_title" width="3%">��ȣ</td>
          <td class="table_title"  width="25%">������</td>
          <td class="table_title"  width="12%">����/��ü����</td>
          <td class="table_title"  width="12%">��ü��</td>
          <td class="table_title"  width="17%">�н��Ⱓ</td>
          <td class="table_title"  width="6%">�ο�</td>
          <td class="table_title"  width="6%">Ƚ��</td>
          <td class="table_title"  width="13%">����������Ʈ</td>
          <td class="table_title"  width="6%">���</td>
        </tr>

<%         
if (box.getString("p_action").equals("go")) {
	ArrayList list = (ArrayList)request.getAttribute("selectEduStatuslList");
	                                                                
	for(i = 0; i < list.size(); i++) {
        DataBox dbox = (DataBox)list.get(i);  

		//sql = "select a.subj, a.subjnm, b.subjseq, b.propstart, b.propend, b.edustart, b.eduend, c.cpnm, count(d.userid) as usercnt ";
        
        v_dispnum = dbox.getInt("d_dispnum");
        v_subj   = dbox.getString("d_subj");
        v_subjnm   = dbox.getString("d_subjnm");
        v_subjseq    = dbox.getString("d_subjseq");
        v_subjseqgr    = dbox.getString("d_subjseqgr");
        v_cpsubjseq    = dbox.getString("d_cpsubjseq");
        v_propstart    = dbox.getString("d_propstart");
        v_propend    = dbox.getString("d_propend");
//2005-06-15ȭ�麯��. ���� ��û�Ⱓ�� ���̹Ƿ� �н��Ⱓ���� ���� �ٶ�       
		v_edustart    = dbox.getString("d_edustart");
        v_eduend    = dbox.getString("d_eduend");
// ���� �ٶ�
        v_cpnm = dbox.getString("d_cpnm");
        v_usercnt = dbox.getInt("d_usercnt");
        v_totalpage = dbox.getInt("d_totalpage");
        v_rowcount = dbox.getInt("d_rowcount");
        v_year    = dbox.getString("d_year");
        
        v_upcnt    = dbox.getString("d_upcnt");
        v_recentdt = dbox.getString("d_recentdt");

//2005-06-15 ȭ�麯�� ��û�ο��� 0�̰�, �н��Ⱓ�� �������� ����Ʈ�� �Ⱥ�����..  ���� ��û�ο��� üũ��
//if(v_usercnt!=0) {
        
        if (!v_searchtext.equals("")) {
            v_subjnm = StringManager.replace(v_subjnm, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            // ����˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
        }
        
        if(v_cpsubjseq.equals("")){
        	v_cpsubjseq = "<span class=text_color04>�̵��</span>";
        }
        
        int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));  //���� ��¥ �Ͻ� �ʱ�ȭ
        int i_edustart = 0;
        int i_eduend   = 0;
        
        if(!v_edustart.equals("")){
          i_edustart = Integer.parseInt(v_edustart);
        }
        
        if(!v_eduend.equals("")){
          i_eduend = Integer.parseInt(v_eduend);
        }
        
        if(v_usercnt > 0 && (v_today >= i_edustart && v_today <= i_eduend))
        	v_appuser = "<a href=\"javascript:MoveLink(4,'" + v_year + "','" + v_subj + "','" + v_subjseq + "', '"+ v_subjseqgr +"')\"><img src=\"/images/admin/button/b_regist.gif\"  border=\"0\"></a>";
        else
        	v_appuser = "-";
        	
        
%>
        <tr>
          <td class="table_02_1"><%=v_dispnum%></td>
          <td class="table_02_2"><%=v_subjnm%></td>
          <td class="table_02_1"><%=StringManager.toInt(v_subjseqgr)%> / <%=v_cpsubjseq%></td>
          <td class="table_02_1"><%=v_cpnm%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")%> - <%=FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")%></td>
          <td class="table_02_1"><%=v_usercnt%></td>
          <td class="table_02_1"><%=v_upcnt%></td>
          <td class="table_02_1"><a href="javascript:whenUpdateList('<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')"><%=FormatDate.getFormatDate(v_recentdt,"yyyy/MM/dd HH:mm")%></td>
          <td class="table_02_1"><%=v_appuser%></td>
        </tr>
<%
    v_reccnt = v_reccnt+1;
//	} // END IF
	} // END FOR
	
}
%>
<%
if(i==0 || v_reccnt == 0){
%>
        <tr> 
          <td class="table_02_1" colspan="9" height="28" bgcolor="#ffffff">��ȸ�� �����Ͱ� �����ϴ�.</td>
        </tr>
        
<%
	}
%>
      </table> 
    </td>
  </tr>
</table>
<br>
<table width="980" border="0" cellpadding="5" cellspacing="1">
  <tr>
    <td><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
  </tr>  
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>
<br>
</form>
</body>
</html>
