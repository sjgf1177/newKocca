<%
//**********************************************************
//  1. ��      ��: SuperiorityMember
//  2. ���α׷���: za_SuperiorityMember_L.jsp
//  3. ��      ��: ���ȸ�� List
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004-02-04
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    int     v_pageno    = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");
    String ems_url		= conf.getProperty("ems.url.value");
	String v_membergubun = box.getStringDefault("p_membergubun","P");
	String ss_userid	= box.getString("p_userid");
	String ss_username	= box.getString("p_username");
	String v_isunum		= box.getString("p_isunum");

	//���翬��
    java.util.Date d_now = new java.util.Date();
    String d_year = String.valueOf(d_now.getYear()+1900);

    String  v_userid    =  "";
    String  v_name      =  "";
    String  v_email     =  "";

	String v_dispnum	= "";

    int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;

    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String  v_orderColumn  = box.getString("p_orderColumn");           //������ �÷���

    ArrayList list      = null;

    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";


    if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("selectList");
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	//�˻�
    function whenSelection(p_action) {

		if (p_action == 'go') {
		if (chkParam() == false) {
		  return;
		}
		top.ftop.setPam();
	  }
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.course.SuperiorityMemberAdminServlet';
        document.form1.p_process.value = 'selectList';
        document.form1.submit();
    }

	// �˻����� üũ
	function chkParam() {
	  if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '') {
		alert("�����׷��� �����ϼ���.");
		return false;
	  }
	}

	//�˻�
    function whenSelection2(p_action, p_type) {

        if (p_type == 'selgubun')
        document.form1.s_seltext.value = 'ALL';
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.course.SuperiorityMemberAdminServlet';
        document.form1.p_process.value = 'selectList';
        document.form1.submit();
    }

    // ����
    function whenOrder(column) {
        if (document.form1.p_orderType.value == " asc") {
            document.form1.p_orderType.value = " desc";
        } else {
            document.form1.p_orderType.value = " asc";
        }

        document.form1.p_orderColumn.value = column;
        whenSelection("go");
    }

	// �������
    function whenExcel() {
        if(document.form1.s_action.value != "go"){
            alert('���� ��ȸ�� �ֽʽÿ�');
            return;
		}

        //������½� ��� ���ڵ尡 �������� �ϱ� ���� ������, �ѹ� �ӽ�����
        var temp_pagesize = document.form1.p_pagesize.value; 
        var temp_pageno   = document.form1.p_pageno.value; 
        
        //������½� ��� ���ڵ尡 �������� �ϱ� ���� ������, �ѹ�����
        document.form1.p_pagesize.value = 10000;
        document.form1.p_pageno.value = 1;
		
        //window.self.name = "selectList";
        //open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
        //document.form1.target = "openExcel";
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.course.SuperiorityMemberAdminServlet';
        document.form1.p_process.value = 'SuperiorityMemberExcel';
        document.form1.p_action.value = 'go';
        document.form1.submit();

        //ȭ����½� ���� ���ڵ尡 �������� �ϱ� ���� ������, �ѹ� ������� ����
        document.form1.p_pagesize.value = temp_pagesize;
        document.form1.p_pageno.value = temp_pageno;
        
    }

	//üũ�ڽ� üũ
    function chkSelected() {
      var selectedcnt = 0;
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            if (document.form1.p_checks[i].checked == true) {
              selectedcnt++;
            }
          }
        } else {
          if (document.form1.p_checks.checked == true) {
            selectedcnt++;
          }
        }
      }
      return selectedcnt;
    }

	//��ü����
    function whenAllSelect() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = true;
          }
        } else {
          document.form1.p_checks.checked = true;
        }
      }
    }

	// ��ü���� ���
    function whenAllSelectCancel() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = false;
          }
        } else {
          document.form1.p_checks.checked = false;
        }
      }
    }

	// �����Ϲ߼�
    function whenFormMail() {
      if (chkSelected() < 1) {
        alert('������ �߼��� �н��ڸ� �����ϼ���');
        return;
      }
      
      document.form1.target = "_self";
      document.form1.action='/servlet/controller.course.SuperiorityMemberAdminServlet';
      document.form1.p_process.value = 'SendFormMail';
      document.form1.submit();
    }
	
	//�Ϲݸ��� �߼�
    function whenFreeMail() {
      if (chkSelected() < 1) {
        alert('������ �߼��� �н��ڸ� �����ϼ���');
        return;
      }
      
      ff =document.form1;
      
      //ff.p_msubjnm.value=ff.s_subjcourse.options[ff.s_subjcourse.selectedIndex].text;
      //ff.p_mseqgrnm.value=ff.s_subjseq.options[ff.s_subjseq.selectedIndex].text;
      //ff.p_msubj.value=ff.s_subjcourse.value;
      //ff.p_myear.value=ff.s_gyear.value;
      //ff.p_msubjseq.value=ff.s_subjseq.value;
      ff.p_msubjnm.value="ALL";
      ff.p_mseqgrnm.value="ALL";
      ff.p_msubj.value="ALL";
      ff.p_myear.value="<%= d_year %>";
      ff.p_msubjseq.value="ALL";
      ff.p_touch.value = "09";
      
      //window.self.name = "ProposeMemberList";
      //open_window("openFreeMail","","10","10","800","650");
      //document.form1.target = "openFreeMail";
      //document.form1.action='<%=ems_url%>/ems/MassMail.do';
      //document.form1.p_process.value = 'SendFreeMail';
      //document.form1.submit();
      window.self.name = "MemberList";
      open_window("openFreeMail","","10","10","800","650");
      document.form1.target = "openFreeMail";
      document.form1.action='/servlet/controller.study.StudyTotalStatusServlet';
      document.form1.p_process.value = 'SendFreeMail';
      document.form1.submit();
      
      
    }
	
	// �������̵�
    function go(index) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = index;
         document.form1.action = '/servlet/controller.course.SuperiorityMemberAdminServlet';
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

	// �������̵�
    function goPage(pageNum) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = pageNum;
         document.form1.action = '/servlet/controller.course.SuperiorityMemberAdminServlet';
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

	// ��� ����
    function whenMemberInfo(userid) {
        window.self.name = "selectList";
        open_window("openMember","","100","100","600","260");
        document.form1.target = "openMember";
        document.form1.action='/servlet/controller.library.SearchServlet?p_userid='+userid;
        document.form1.p_process.value = 'memberInfo';
        document.form1.submit();
        document.form1.target = window.self.name;
    }

	function press_enter(e) { 
		if (e.keyCode =='13'){  whenSelection('go');  }
	}

	//���ڸ� �Է� ����
	function numcheck(oTarget)
	{
		if(((event.keyCode < 48) || (event.keyCode > 57)) && ((event.keyCode < 96) || (event.keyCode > 105)))
			if((event.keyCode == 9) || (event.keyCode == 8) || (event.keyCode == 46))
				event.returnValue = true;
			else
				event.returnValue = false;
	}
	//SMS �߼�
	function whenSMS() {
      if (chkSelected() < 1) {
        alert('SMS�� �߼��� �н��ڸ� �����ϼ���');
        return;
      }

      ff =document.form1;

      //ff.p_msubjnm.value=ff.s_subjcourse.options[ff.s_subjcourse.selectedIndex].text;
      //ff.p_mseqgrnm.value=ff.s_subjseq.options[ff.s_subjseq.selectedIndex].text;
      //ff.p_msubj.value=ff.s_subjcourse.value;
      //ff.p_myear.value=ff.s_gyear.value;
      //ff.p_msubjseq.value=ff.s_subjseq.value;
      //ff.p_touch.value = "09";

      ff.p_msubjnm.value="ALL";
      ff.p_mseqgrnm.value="ALL";
      ff.p_msubj.value="ALL";
      ff.p_myear.value="<%= d_year %>";
      ff.p_msubjseq.value="ALL";
      ff.p_touch.value = "09";

      //window.self.name = "StudentMemberList";
      //open_window("openSMS","","100","100","620","354");
      //document.form1.target = "openSMS";
      //document.form1.action='/servlet/controller.course.SuperiorityMemberAdminServlet';
      //document.form1.p_process.value = 'SendSMS';
      //document.form1.submit();
      //window.self.name = "StudentMemberList";
      open_window("openSMS","","100","100","620","354");
      document.form1.target = "openSMS";
      document.form1.action='/servlet/controller.study.StudentStatusAdminServlet';
      document.form1.p_process.value = 'SendSMS';
      document.form1.submit();
    }

	//����� ����Ʈ 
	function whenMemberList(){
//		if(document.form1.s_action.value != "go"){
//			alert('���� ��ȸ�� �ֽʽÿ�');
//			return;
//		}
//		window.self.name = "selectList";
//		open_window("openMemList","","100","100","700","400",true,true,true,true,true);
//		document.form1.target = "openMemList";
		document.form1.action='/servlet/controller.course.SuperiorityMemberAdminServlet';
		document.form1.p_process.value = 'inputMember';
//		document.form1.p_action.value = 'go';
		document.form1.submit();
	}

	// Ŀ�´�Ƽ ��â
    function CommunityOpenPage() {
        window.self.name = "winSelectViewCommunity";
        farwindow = window.open("", "openWinCommunity", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 920, height = 640, top=0, left=0");
		
		document.form1.p_process.value = "selectmyindex";
        document.form1.target = "openWinCommunity"
        document.form1.action = "/servlet/controller.community.CommunityIndexServlet?p_cmuno=2006000001&p_static_cmuno=2006000001";
        document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
    }  

-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_pageno" value="<%=v_pageno%>">
    <input type="hidden" name="p_pagesize" value="<%=v_pagesize%>">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->
    <input type="hidden" name="p_rprocess" value="selectList">
    <input type="hidden" name="p_orderColumn" value="<%=v_orderColumn%>">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
    <input type="hidden" name="p_action">
    
    
    <!-- tz_humantouc insert parameter start-->
    <input type="hidden" name="p_touch" value='04'>
    <input type="hidden" name="p_msubjnm" value=''>
    <input type="hidden" name="p_mseqgrnm" value=''>
    <input type="hidden" name="p_msubj" value=''>
    <input type="hidden" name="p_myear" value=''>
    <input type="hidden" name="p_msubjseq" value=''>
    <!-- tz_humantouc insert parameter end -->

    <input type="hidden" name="userLoginID" value="<%=box.getSession("userid")%>">
    <input type="hidden" name="emsName" value="<%=box.getSession("name")%>">
	<input type="hidden" name="emsEmail" value="<%=box.getSession("email")%>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
       <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/tit_c_member.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>

      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr> 
                      <td>
					  <font color="red">��</font> <%= SelectEduBean.getGrcode(box, false, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
						�з� 
						<select name="p_membergubun">
							<option value="P" <% if(v_membergubun.equals("P")) { %> selected <% } %>)>����</option>
							<option value="C" <% if(v_membergubun.equals("C")) { %> selected <% } %>)>���</option>
							<option value="U" <% if(v_membergubun.equals("U")) { %> selected <% } %>)>����</option>
						</select>
                        &nbsp;&nbsp;���� ������ : 
                        <input type="text" name="p_isunum" class="input" maxlength="20" onkeypress="press_enter(event)" size=20 value="<%=v_isunum%>" onKeydown="return numcheck(this);"> �̻�
					  </td>
                      <td></td>
                    </tr>

                    <td>
                        <td height="5"></td>
                    </tr>
                    <tr> 
                      <td>ID : 
                        <input type="text" name="p_userid" class="input" maxlength="10" onkeypress="press_enter(event)" size=10 value="<%=ss_userid%>">
                        &nbsp;&nbsp;���� : 
                        <input type="text" name="p_username" class="input" maxlength="20" onkeypress="press_enter(event)" size=20 value="<%=ss_username%>">
					  </td>
                      <td align="left"><a href="javascript:whenSelection('go')"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->

      <br>
      <br>

      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="635" height="20" align="right">&nbsp;</td>
            <td width="90" align="right" >
            <a href="javascript:whenMemberList()"><img src="/images/admin/button/btn_peoplelist.gif" border="0"></a>
            </td>
            <td width="3"></td>
            <td width="70" align="right" >
            <a href="javascript:whenFreeMail()"><img src="/images/admin/button/btn_mail.gif" border="0"></a>
            </td>
            <td width="3"></td>
            <td width="32" align="right">
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a>
            </td>
			<td width="3"></td>
            <td width="45" align="right">
            <a href="javascript:whenSMS()"><img src="/images/admin/button/btn_sms.gif" border="0"></a>
            </td>
			<td width="3"></td>
            <td width="116" align="right">
            <a href="javascript:CommunityOpenPage()"><img src="/images/admin/button/btn_communitygo.gif" border="0"></a>
            </td>
        </tr>
        <tr>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư �� ----------------->
      <!----------------- ��û�����ȸ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
          <tr>
            <td colspan="18" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="10%">No</td>
            <td class="table_title" width="20%"><a href="javascript:whenOrder('membergubun')" class="e">ȸ������</td>
            <td class="table_title" width="25%"><a href="javascript:whenOrder('userid')" class="e">ID</a></td>
            <td class="table_title" width="35%"><a href="javascript:whenOrder('name')" class="e">����</a></td> 
            <td class="table_title" width="10%"><%@ include file="/learn/admin/include/za_checkboxall.jsp" %></td>
          </tr>
        <%
            if (ss_action.equals("go")) {    //go button ���ýø� list ���
                for(i = 0; i < list.size(); i++) 
				{
					DataBox dbox = (DataBox)list.get(i);

                    v_userid        = dbox.getString("d_userid");
                    v_name          = dbox.getString("d_name");
                    v_email         = dbox.getString("d_email");
                    //v_ismailing     = dbox.getString("d_ismailing");
                    v_membergubun	= dbox.getString("d_membergubun");

					v_dispnum		= dbox.getString("d_dispnum");
                    v_totalpage     = dbox.getInt("d_totalpage");
                    v_rowcount      = dbox.getInt("d_rowcount");

					//ȸ������
					if(v_membergubun.equals("C")) {v_membergubun = "���";}
					else if(v_membergubun.equals("U")) {v_membergubun = "����";}
					else  {v_membergubun = "����";}

               %>
        <tr>
            <td class="table_01"><%= v_dispnum %></td>
            <td class="table_02_1"><%= v_membergubun %></td>
            <td class="table_02_1"><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%= v_userid %></a></td>
            <td class="table_02_1"><%= v_name %></td>   
            <td class="table_02_1">
              <input type="checkbox" name="p_checks" value="<%=v_userid%>,<%=v_email%>">
            </td>
            <input type="hidden" name="p_email" value="<%=v_email%>">
        </tr>
         <%
               }
            }
         if(i == 0 && ss_action.equals("go")){ %>
              <tr>
                <td class="table_02_1" colspan="5">��ϵ� ������ �����ϴ�</td>
              </tr>
        <% } else{ %>   </table> <% } %>


       <%  if(i > 0){ %>
        <table class="table1" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
          </tr>
        </table>
        <br>
        <% } %>
      </table>
      <!----------------- ��û��� ��ȸ �� ----------------->
     <br>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
