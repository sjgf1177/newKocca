<%
//**********************************************************
//  1. ��      ��: �������� �԰��ο���ȸ
//  2. ���α׷���: za_cpeduApproval_l.jsp
//  3. ��      ��: ����Ȯ���ڸ�� ����Ʈȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2004.12.23
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");
if (box == null) {
        box = RequestManager.getBox(request);
}


int i = 0, v_reccnt = 0, v_dispnum = 0, v_totalpage = 0, v_rowcount = 0, v_usercnt = 0;
String v_subj = "", v_subjnm = "", v_cpnm = "", v_cpsubjseq = "", v_appuser = "", v_year = "";
String v_subjseq = "", v_subjseqgr = "", v_propstart = "", v_propend = "", v_edustart = "", v_eduend = "";
   
String v_searchtext = box.getString("p_searchtext");
int v_pageno = box.getInt("p_pageno"); 
String v_gyear = box.getString("s_gyear");
String v_grcode = box.getString("s_grcode");
String v_grseq = box.getString("s_grseq");
String v_grcomp = box.getString("s_grcomp");
String v_process = box.getString("p_process");

String s_gadmin = box.getSession("gadmin");

//String s_userid = box.getSession("userid");
//String s_usernm = box.getSession("username");


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">      
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="javascript">
<!--//
function whenSelection(ss_action){

    document.form1.p_action.value = ss_action;
    
	if (ss_action=="go") {
		if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
		    alert("�����׷��� �����ϼ���.");
		    return ;
		}
		alert("11111");
		top.ftop.setPam();
	}
	
	document.form1.action = "/servlet/controller.cp.CPEduStudentServlet";
	document.form1.p_process.value = "<%=v_process%>";
	document.form1.p_pageno.value = "1";
	document.form1.target = "_self";
	document.form1.submit();
}

function go(index) {
     document.form1.p_pageno.value = index;
     document.form1.p_action.value = "go";
     document.form1.action = "/servlet/controller.cp.CPEduStudentServlet";
     document.form1.p_process.value = "<%=v_process%>";     
     document.form1.target = "_self";
     document.form1.submit();
}  

function goPage(pageNum) {
	document.form1.p_pageno.value = pageNum;
	document.form1.p_action.value = "go";
	document.form1.action = "/servlet/controller.cp.CPEduStudentServlet";
	document.form1.p_process.value = "<%=v_process%>";  
	document.form1.target = "_self";
	document.form1.submit();
}  

function selectList() {
document.form1.target = "_self";
	document.form1.action = "/servlet/controller.cp.CPEduStudentServlet";
	document.form1.p_process.value = "<%=v_process%>"; 
	document.form1.p_pageno.value = "1";
	document.form1.submit();
}

function MoveLink(act,year,subj,subjseq) {
	if(act == "1"){
		//����Ȯ���� ���
		document.form1.p_process.value   = "";
	    document.form1.action            = "/servlet/controller.cp.CPEduStudentServlet";
		document.form1.p_pageno.value = "1";
		document.form1.target = "_self";
	    document.form1.submit();	
	}
	else if(act == "2"){
		//��������� ���
		document.form1.p_process.value   = "cancel";
	    document.form1.action            = "/servlet/controller.cp.CPEduStudentServlet";
		document.form1.p_pageno.value = "1";
		document.form1.target = "_self";
	    document.form1.submit();
	}
	else if(act == "3"){
		//������û�� ���
	    document.form1.p_process.value   = "propose";
	    document.form1.action            = "/servlet/controller.cp.CPEduStudentServlet";
		document.form1.p_pageno.value = "1";
		document.form1.target = "_self";
	    document.form1.submit();
	}
	else if(act == "4"){
		//����Ȯ���� ��ܸ���Ʈ
	    document.form1.p_process.value   = "approvalList";
	    document.form1.action            = "/servlet/controller.cp.CPEduStudentServlet";
		document.form1.p_year.value = year;
		document.form1.p_subj.value = subj;
		document.form1.p_subjseq.value = subjseq;
		document.form1.target = "_self";
	    document.form1.submit();
	}
	else if(act == "5"){
		//���� �ٿ�ε�
        window.self.name = "CPEduStudent";
        window.open("","DownExcel","width=538,height=300,status=no,scrollbars=no");
        document.form1.target = "DownExcel";
        document.form1.action = "/servlet/controller.cp.CPEduStudentServlet";
        document.form1.p_process.value = "studentExcel";
        //document.form1.target = "_self";
        document.form1.submit();
	}
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
<input type="hidden" name="p_grcomp" value="<%=v_grcomp%>">
<input type="hidden" name="p_year" value="">
<input type="hidden" name="p_subj" value="">
<input type="hidden" name="p_subjseq" value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	
	<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/cp/cp_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	   
      <br>
      <!--table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><b>
        <a href="javascript:MoveLink(1)"><img src="/images/admin/button/btn_deciname.gif" border="0"></a> 
		<a href="javascript:MoveLink(2)"><img src="/images/admin/button/btn_cancelname.gif" border="0"></a> 
		<br></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table-->  
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
                      <td width="20"></td>
	  				  <td width="270"><font color="red">��</font><%=SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  --></td>
	  				  <td width="220"><%=SelectCompanyBean.getGrcomp(box, false, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  --></td>
					  <td width="100"><font color="red">��</font><%=SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  --></td>
					  <td width="280"><%=SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  --></td>
					  <td align="right"><a href="javascript:whenSelection('go');"><img src="/images/admin/button/b_go.gif"  border="0"></a><br></td>
					  <td width="20"></td>
					</tr>
					<tr>
					  <td colspan="11" height="5"></td>
					</tr>
					<tr>
					  <td ></td>
					  <td>������ü&nbsp;<%= CPCommonBean.getCP(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    �������  --></td>
					  <td>������&nbsp;<input name="p_searchtext" type="text" class="input" style="width:150" value="<%=v_searchtext %>" onKeyPress=javascript:enter(event)></td>
					  <td></td>
					  <td></td>
					  <td align="right"></td>
					  <td></td>
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
      
      <!----------------- ���̵�/����/��μ���/���������ư ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="110" height="23" align="center" valign="middle">
                    <table cellspacing="0" cellpadding="0" class="s_table">
                      <tr>
                        <td rowspan="3" class="blue_butt_left"></td>
                        <td class="blue_butt_top"></td>
                        <td rowspan="3" class="blue_butt_right"></td>
                      </tr>
                      <tr>
                        <td class="blue_butt_middle">����Ȯ���ڸ��</td>
                      </tr>
                      <tr>
                        <td class="blue_butt_bottom"></td>
                      </tr>
                    </table>
                  </td>
                  <td width="2"></td>
                  <td width="110">
                    <table cellspacing="0" cellpadding="0" class="s_table">
                      <tr>
                        <td rowspan="3" class="black_butt_left"></td>
                        <td class="black_butt_top"></td>
                        <td rowspan="3" class="black_butt_right"></td>
                      </tr>
                      <tr>
                        <!--td class="black_butt_middle"><a href="javascript:MoveLink(2)"><font color="#FFFFFF">��������ڸ��</font></a></td-->
                        <td class="black_butt_middle"><a href="javascript:MoveLink(2)"><font color="#FFFFFF">��������ڸ��</font></a></td>
                      </tr>
                      <tr>
                        <td class="black_butt_bottom"></td>
                      </tr>
                    </table>
                  </td>
                  <td>&nbsp;</td>
                </tr>
              </table>
            </td>
            <td align="right" height="20">&nbsp;</td>
            <!----------------- �Ǽ��ý� Button �б�----------------->
                  <!---- ��ü���� ---->
              <td align="right" width="65"><a href="javascript:MoveLink(5)"><img src="/images/admin/button/btn_exceldown.gif" border="0"></a></td>
            
            <!----------------- �Ǽ��ý� Button �б�----------------->
        </tr>
      </table>
      <!----------------- ���̵�/����/��μ���/���������ư ----------------->
      
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
        <tr> 
          <td colspan="7" class="table_top_line"></td>
        </tr>
        <tr> 
        <%if(!s_gadmin.equals("S1") && !s_gadmin.equals("T1") && !s_gadmin.equals("M1")){%>
          <td class="table_title" width="4%">��ȣ</td>
          <td class="table_title"  width="27%">������</td>
          <td class="table_title"  width="21%">����/��ü����</td>
          <td class="table_title"  width="16%">��ü��</td>
          <td class="table_title"  width="17%">�н��Ⱓ</td>
          <td class="table_title"  width="7%">�ο�</td>
          <td class="table_title"  width="8%">���</td>
        <%}else{%>
          <td class="table_title" width="4%">��ȣ</td>
          <td class="table_title"  width="27%">������</td>
          <td class="table_title"  width="21%">����/��ü����</td>
          <td class="table_title"  width="17%">�н��Ⱓ</td>
          <td class="table_title"  width="7%">�ο�</td>
          <td class="table_title"  width="8%">���</td>
        <%}%>
        </tr>

<%         
if (box.getString("p_action").equals("go")) {
	ArrayList list = (ArrayList)request.getAttribute("selectApprovalList");
    //out.println(list.size());

	for(i = 0; i < list.size(); i++) {
        //out.println(i+1);
        
        DataBox dbox = (DataBox)list.get(i);  
        
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
        

//2005-06-15 ȭ�麯�� ��û�ο��� 0�̰�, �н��Ⱓ�� �������� ����Ʈ�� �Ⱥ�����..  ���� ��û�ο��� üũ��
        
        if (!v_searchtext.equals("")) {
            v_subjnm = StringManager.replace(v_subjnm, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            // ����˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
        }
        
        if(v_cpsubjseq.equals("")){
        	v_cpsubjseq = "<span class=text_color04>�̵��</span>";
        }
        
        if(v_usercnt > 0)
        	v_appuser = "<a href=\"javascript:MoveLink(4,'" + v_year + "','" + v_subj + "','" + v_subjseq + "')\"><img src=\"/images/admin/button/b_name.gif\"  border=\"0\"></a>";
        else
        	v_appuser = "-";
%>
        <tr> 
          <td class="table_02_1"><%=i+1%></td>
          <td class="table_02_2"  ><%=v_subjnm%></td>
          <td class="table_02_1"  ><%=StringManager.toInt(v_subjseqgr)%> / <%=v_cpsubjseq%></td>
          <%if(!s_gadmin.equals("S1") && !s_gadmin.equals("T1") && !s_gadmin.equals("M1")){%>
            <td class="table_02_1"><%=v_cpnm%></td>
          <%}%>
          <td class="table_02_1"><%=FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")%> - <%=FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")%></td>
          <td class="table_02_1"><%=v_usercnt%></td>
          <td class="table_02_1"><%=v_appuser%></td>
        </tr>
        
<%
    v_reccnt = v_reccnt+1;
	    
	} // END FOR
	
}
%>
<%
if(i==0 || v_reccnt == 0){
%>
        <tr> 
          <td class="table_02_1" colspan="7" height="28" bgcolor="#ffffff">��ȸ�� �����Ͱ� �����ϴ�.</td>
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
