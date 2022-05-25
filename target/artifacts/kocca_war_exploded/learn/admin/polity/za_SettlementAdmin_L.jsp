<%
/**
 * file name : za_SettlementAdmin_L.jsp
 * date      :
 * programmer:
 * function  : ī�� ���� ���� ����Ʈ ��ȸȭ��
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

	String  v_process  = "selectList";
    String ems_url = conf.getProperty("ems.url.value");

    String  ss_grcode			= box.getString("s_grcode");		//�����׷�
    String  ss_gyear			= box.getString("s_gyear");			//�⵵
    String  ss_grseq			= box.getString("s_grseq");			//��������
    String  ss_grseqnm			= box.getString("s_grseqnm");		//����������
    String  ss_mastercd			= box.getString("s_mastercd");		//����&�ڽ�
    String  ss_upperclass		= box.getString("s_upperclass");	//������з�
    String  ss_middleclass		= box.getString("s_middleclass");	//�����ߺз�
    String  ss_lowerclass		= box.getString("s_lowerclass");	//�����Һз�
    String  ss_subjcourse		= box.getString("s_subjcourse");	//����&�ڽ�
    String  ss_subjseq			= box.getString("s_subjseq");		//���� ����
    String  ss_settlementstart	= box.getString("s_settlementstart");//ȯ�ҽ�����
    String  ss_settlementend	= box.getString("s_settlementend");	//ȯ��������
    String  ss_accountstat		= box.getString("s_accountstat");	//ȯ�һ���
	
    String  v_action    = box.getString("p_action");

	String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
	String v_dispnum	= "";
    
	int		v_pageno	= box.getInt("v_pageno");

	int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;
	int		v_total_rowcount = 0;

	if(v_pageno == 0)
	{
		v_pageno = 1;
	}

    String  v_ongo     = "whenSelection('go')";
	String  v_finalString = "";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript">
$(document).ready(function(){
	$("#s_settlementstart").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#s_settlementend").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
	function MM_openBrWindow(theURL,winName,features) { //v2.0
	  window.open(theURL,winName,features);
	}

	//�˻�
	function whenSelection(p_action) {
	  document.form1.p_action.value = p_action;

	  if (p_action == 'go') {
		if (chkParam() == false) {
		  return;
		}
		top.ftop.setPam();
	  }

	  document.form1.action='/servlet/controller.polity.SettlementAdminServlet';
	  document.form1.p_process.value = 'selectList';    
	  document.form1.submit();
	}

	// �˻����� üũ
	function chkParam() {
	  if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '') {
		alert("�����׷��� �����ϼ���.");
		return false;
	  }
	  if (document.form1.s_grseq.value == 'ALL' || document.form1.s_grseq.value == '') {
		alert("���������� �����ϼ���.");
		return false;
	  }
	}

	// ����
	function ordering(column) {
		if (document.form1.p_orderType.value == " asc") {
			document.form1.p_orderType.value = " desc";
		} else {
			document.form1.p_orderType.value = " asc";
		}

		document.form1.p_order.value = column;
		whenSelection("go");
	}

	//��ü �ɼǼ��� ��ư
	function whenChangeAll(idx){
		if(!confirm("���氡���� ���οɼ��� ��� ����˴ϴ�.\n\n����Ͻðڽ��ϱ�?")) return;

		for(var i=0;i<document.form1.length;i++){
			if(document.form1.elements[i].type=="select-one"){
				document.form1.elements[i].selectedIndex=idx;
			}
		}

		alert("[Ȯ��]��ư�� �����ž߸� ����˴ϴ�");

	}

	// ȸ������
	function whenMemberInfo(userid) {
		window.self.name = "ProposeList";
		open_window("openMember","","100","100","600","260");
		document.form1.target = "openMember";
		document.form1.action='/servlet/controller.library.SearchServlet?p_userid='+userid;
		document.form1.p_process.value = 'memberInfo';
		document.form1.submit();
		document.form1.target = window.self.name;
	}

	//-------------------------------
    // excel file ����.
    //-------------------------------
    function whenExcel()
    {
        f = document.form1;
		
		if (chkParam() == false) {
		  return;
		}
		
		document.form1.method = 'post';
		document.form1.target = 'mainFrame';

		document.form1.action='/servlet/controller.polity.SettlementAdminServlet';
        document.form1.p_process.value = 'ExcelDown'; 
		document.form1.p_action.value = "go";

        document.form1.submit();	                
		
    }
	// ���� ����(�޷�)
	function whenclick(caldate) {
		caldate.value = "";
	}

	// ���Ϲ߼�
    function whenFreeMail() {
      if (chkSelected() < 1) {
        alert('������ �߼��� �н��ڸ� �����ϼ���');
        return;
      }

      ff =document.form1;

      ff.p_msubjnm.value=ff.s_subjcourse.options[ff.s_subjcourse.selectedIndex].text;
      ff.p_mseqgrnm.value=ff.s_subjseq.options[ff.s_subjseq.selectedIndex].text;
      ff.p_msubj.value=ff.s_subjcourse.value;
      ff.p_myear.value=ff.s_gyear.value;
      ff.p_msubjseq.value=ff.s_subjseq.value;


      window.self.name = "StudentMemberList";
      open_window("openFreeMail","","10","10","800","650");
      document.form1.target = "openFreeMail";
//      document.form1.action='/servlet/controller.study.StudyTotalStatusServlet';
      document.form1.action='<%=ems_url%>/ems/MassMail.do';
      document.form1.p_process.value = 'SendFreeMail';
      document.form1.submit();
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

	// �������̵�
    function go(index) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = index;
         document.form1.action = '/servlet/controller.polity.SettlementAdminServlet';
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

	// �������̵�
    function goPage(pageNum) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = pageNum;
         document.form1.action = '/servlet/controller.polity.SettlementAdminServlet';
         document.form1.p_process.value = "selectList";
         document.form1.submit();
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
//-->
</script>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/polity/tit_service_03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

<!------------------------------------- form ���� ------------------------------------->
<form name = "form1" method = "post">
    <input type="hidden" name="p_process">
    <input type="hidden" name="p_masternm"  value="">
    <input type="hidden" name="p_mastercd"  value="<%=ss_mastercd%>">
    <input type="hidden" name="p_action">
    <input type="hidden" name="p_order"  value="name">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
    <input type="hidden" name="p_pageno" value="<%=v_pageno%>">

    <input type="hidden" name="p_grcode" >
    <input type="hidden" name="p_grseq" >
    <input type="hidden" name="p_gyear">
    <input type="hidden" name="p_subj" >
    <input type="hidden" name="p_subjseq" >
	
    <input type="hidden" name="p_chknum" >
    <input type="hidden" name="p_chkvalue" >

    <input type="hidden" name="p_returnurl"       value="/servlet/controller.polity.SettlementAdminServlet">
    <input type="hidden" name="p_returnprocess"   value="selectList">


      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">

            <table cellspacing="2" cellpadding="2" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td width="20%" colspan="2" align="left" valign="middle">
                        <!------------------- ���ǰ˻� ���� ------------------------->
                        <font color="red">��</font> <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                      </td>
                      <td width="80%" colspan="2">
                        <font color="red">��</font> <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
                        <font color="red">��</font> <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
                        <!-- input type= "hidden" name="s_grseq" value="0001"-->
                        <%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
                        <%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
                        <%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
                      </td>
					  <td width="200" rowspan="4">&nbsp;</td>
                    </tr>
					<tr>
                        <td height="5" colspan="4"></td>
                    </tr>
                    <tr>
						<td colspan="4">
						<table cellspacing="0" cellpadding="0" width="100%">
							<tr>
								<td>
								<%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
								<%= SelectSubjBean.getSubjseq(box, false, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    ��������  -->
								<!--%= SelectCompanyBean.getCompany(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    ȸ��  ������.-->
								<!-------------------- ���ǰ˻� �� ---------------------------->

								<!--input type = "hidden" name="s_start">
								<input type = "hidden" name="s_end">
								<input type="hidden" name="p_step"  value="2"--></td>
								<td width="40">
								</td>
							</tr>
						</table>
						</td>
                    </tr>
					<tr>
                        <td height="5" colspan="4"></td>
                    </tr>
					<tr>
						<td colspan="4">
						<table cellspacing="0" cellpadding="0" width="100%">
							<tr>
								<td>
									��û��&nbsp;<input name="s_settlementstart" id="s_settlementstart" value="<%=ss_settlementstart%>" type="text" class="datepicker_input1" size="10">&nbsp;
									~&nbsp;<input name="s_settlementend" id="s_settlementend" value="<%=ss_settlementend%>" type="text" class="datepicker_input1" size="10"></td>
								<td width="40"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></div><!-- whenSelection('go') -->
								</td>
							</tr>
						</table>
                        <td width="20%" align="right">&nbsp;</td>
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
	  <br>

<!---------------------////////////////////////////// ����/�������� ////////////////////////////////-------------------------->
        <%
        String v_ispropose          ="";
        String v_proposetype        ="";
        String v_isedutarget        ="";
        String v_educnt             ="";
        String v_mastercd           ="";
        String v_masternm           ="";

        if (!ss_subjcourse.equals("ALL")&&!ss_subjseq.equals("ALL")&&!ss_subjcourse.equals("")&&!ss_subjseq.equals("")&&v_action.equals("go")) {
			DataBox dbox = (DataBox)request.getAttribute("selectList");

        %>
        <%}%>

        <!----------------- ��ν���, ��ν������, Ȯ�� ��ư ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
            <td class=sub_title>ī�� ���� ����</td>
            <td align="right" height="20" width="58">&nbsp;</td>
            <td align="right" height="20" width="70"><a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a></td>
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
            <td height="3"></td>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- ��ν���, ��ν������, Ȯ�� ��ư �� ----------------->

        <!----------------- ����������ȸ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">		
          <!--FORM name="ff" method="post" action="/servlet/controller.polity.RefundmentAdminServlet"-->
            <input type="hidden" name="p_grcode"     value="<%=ss_grcode%>">
            <input type="hidden" name="p_gyear"      value="<%=ss_gyear%>">
            <input type="hidden" name="p_grseq"      value="<%=ss_grseq%>">
            <input type="hidden" name="p_grseqnm"    value="<%=ss_grseqnm%>">
            <input type="hidden" name="p_uclass"     value="<%=ss_upperclass%>">
            <input type="hidden" name="p_mclass"     value="<%=ss_middleclass%>">
            <input type="hidden" name="p_lclass"     value="<%=ss_lowerclass%>">
            <input type="hidden" name="p_subjcourse" value="<%=ss_subjcourse%>">
            <input type="hidden" name="p_subjseq"    value="<%=ss_subjseq%>">
            <input type="hidden" name="p_mastercd"   value="<%=ss_mastercd%>">
            <input type="hidden" name="p_masternm"   value="">
			<input type="hidden" name="emsName" value="<%=box.getSession("name")%>">
			<input type="hidden" name="emsEmail" value="<%=box.getSession("email")%>">
          <tr>
            <td colspan="13" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="10%"><a href="javascript:ordering('userid')" class="e">��û��<br>(ID)</a></b></td>
            <td class="table_title" width="10%"><b><a href="javascript:ordering('subjnm')" class="e">��û<br>����</a></b></td>
            <td class="table_title" width="5%"><b><a href="javascript:ordering('subjseq')" class="e">����</a></b></td>
            <td class="table_title" width="10%"><b><a href="javascript:ordering('name')" class="e">�����Ⱓ</a></b></td>
            <td class="table_title"><b>��û��</b></td>
            <td class="table_title"><b>�⺻<br>������</b></td>
            <td class="table_title"><b>����<br>����</a></td>
            <td class="table_title"><b>����Ʈ</a></b></td>
            <td class="table_title"><b>������</a></td>
            <td class="table_title"><b>������ȣ</a></td>
            <td class="table_title"><b>���ι�ȣ</a></td>
            <td class="table_title"><b>�����ݾ�</a></td>
            <td class="table_title"><b>����<br>����</a></td>
          </tr>

<%  
        if (v_action.equals("go")) {
        ArrayList  list = (ArrayList)request.getAttribute("selectList");

        int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));  //���� ��¥ �Ͻ� �ʱ�ȭ

		String v_subj		= "";
		String v_subjnm		= "";
		String v_membergubun= "";
		String v_userid		= "";
		String v_uname		= "";
		String v_subjseq	= "";		
		String v_chkfinal	= "";
		String v_scyear		= "";
		String v_edustart	= "";
		String v_eduend 	= "";
		String v_appdate	= "";
		String v_subjprice	= "";
		String v_discountrate	= "";
		String v_usepoint	= "";
		String v_paymoney	= "";
		String v_accountname= "";
		String v_paydate	= "";
		String v_paystat	= "";
		String v_cardno		= "";
		String v_cardapprovalno		= "";
		String v_realpaymoney = "";
		String v_cardyn		= "";

        for (i=0; i<list.size(); i++) {
			DataBox dbox = (DataBox)list.get(i);

            v_finalString	= "";

			v_subj			= dbox.getString("d_subj");
			v_subjnm		= dbox.getString("d_subjnm");
			v_userid		= dbox.getString("d_userid");
			v_uname			= dbox.getString("d_name");
			v_subjseq		= dbox.getString("d_subjseq");
			v_scyear		= dbox.getString("d_year");
			v_edustart		= dbox.getString("d_edustart");
			v_eduend		= dbox.getString("d_eduend");
			v_appdate		= dbox.getString("d_appdate");
			v_subjprice		= dbox.getString("d_subjprice");
			v_discountrate	= dbox.getString("d_discountrate");
			v_usepoint		= dbox.getString("d_usepoint");
			v_realpaymoney	= dbox.getString("d_realpaymoney");
			v_paymoney		= dbox.getString("d_paymoney");
			v_accountname	= dbox.getString("d_accountname");
			v_paydate		= dbox.getString("d_paydate");
			v_paystat		= dbox.getString("d_paystat");
			v_cardno		= dbox.getString("d_cardno");
			v_cardyn		= dbox.getString("d_cardyn");
			v_cardapprovalno = dbox.getString("d_cardapprovalno");

			v_dispnum		= dbox.getString("d_dispnum");
			v_totalpage     = dbox.getInt("d_totalpage");
			v_rowcount      = dbox.getInt("d_rowcount");
			v_total_rowcount= dbox.getInt("d_total_rowcount");

			if(v_cardyn.equals("Y")) {v_cardyn = "����";}
			else {v_cardyn = "�̽���";}

%>
            <tr class="table_02_1">
                <td class="table_02_1"><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%=v_uname %><br>(<%=v_userid%>)</a></td>
                <td class="table_02_1"><%=v_subjnm %></td>
                <td class="table_02_1"><%=v_subjseq %></td>
                <td class="table_02_1"><%=FormatDate.getFormatDate(v_edustart,"yyyy-MM-dd")%> ~<br><%=FormatDate.getFormatDate(v_eduend,"yyyy-MM-dd")%></td>
				<td class="table_02_1"><%=FormatDate.getFormatDate(v_appdate,"yyyy-MM-dd HH:mm:ss")%></td>	
                <td class="table_02_1"><%=v_subjprice %></td>
                <td class="table_02_1"><%=v_discountrate %></td>
                <td class="table_02_1"><%=v_usepoint %></td>
                <td class="table_02_1"><%=FormatDate.getFormatDate(v_paydate,"yyyy-MM-dd") %></td>
                <td class="table_02_1"><%=v_cardno %></td>
                <td class="table_02_1"><%=v_cardapprovalno %></td>
                <td class="table_02_1"><%=v_paymoney %></td>
                <td class="table_02_1"><%=v_cardyn %></td>
                
            </tr>
<%          //}
        }
		if (i == 0)
			{ %>
			<tr>
				<td align="center" bgcolor="#FFFFFF" height="100" colspan="13">��ϵ� ������ �����ϴ�.</td>
			  </tr>
			<%}
    }

%>
           
            </FORM>
        </table>
        <!----------------- ����������ȸ �� ----------------->

        <%  if(i > 0){ %>
        <table class="table1" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
          </tr>
        </table>
        <br>
        <table class="table1" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right">��<b> TOTAL : <%=v_total_rowcount %>��</b></td>
          </tr>
        </table>
        <% } %>

        <br>

      </td>
  </tr>

</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>