<%
//**********************************************************
//  1. ��      ��: ���� ��ȸȭ��
//  2. ���α׷���: za_Subject_L.jsp
//  3. ��      ��: ���� ��ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 12
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ page import = "com.credu.library.DataBox" %>
<%@ page import = "com.credu.library.FormatDate" %>
<%@ page import = "com.credu.library.RequestBox" %>
<%@ page import = "com.credu.common.GetCodenm" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    DataBox dbox = (DataBox)request.getAttribute("memberInfo");
    DataBox addInfobox = (DataBox)request.getAttribute("addInfo");
    List<DataBox> schoolList = (List<DataBox>) addInfobox.getObject("schoolList");
    List<DataBox> licenseList = (List<DataBox>) addInfobox.getObject("licenseList");
    List<DataBox> careerList = (List<DataBox>) addInfobox.getObject("careerList");
    List<DataBox> trainingINFOList = (List<DataBox>) addInfobox.getObject("trainingINFOList");

    NumberFormat s_fmt = NumberFormat.getInstance();                //��ȭ���� ,ǥ��
    int v_totgetpoint = box.getInt("p_getpoint");
    int v_totusepoint = box.getInt("p_usepoint");
    int v_totwaitpoint = box.getInt("p_waitpoint");
    int v_availablepoint = v_totgetpoint - v_totusepoint - v_totwaitpoint;
    String v_availablepoint_text = s_fmt.format(v_availablepoint);

    ArrayList list1 = null;
    ArrayList list2 = null;
    ArrayList list3 = null;

    list1 = (ArrayList)request.getAttribute("selectHavePointList");     //��������Ʈ
    list2 = (ArrayList)request.getAttribute("selectStoldPointList");    //��������Ʈ
    list3 = (ArrayList)request.getAttribute("selectUsePointList");      //�������Ʈ

    String p_process = box.getString("p_process");
    if(p_process.equals("MemberModify")) {
        out.print("<script>alert('���� �Ǿ����ϴ�');self.close();opener.whenSelection('go');</script>");
    }
%>
<html>
<head>
<title>ȸ���˻�</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<style>
    .coursePopup { display:none; width:332px; height:160px; background:#fff; color:#000; position:fixed; top:277px; left:338px; text-align:center; border:2px solid #000; }
    #oMobileInfo { position:absolute; top:34px; left:14px; width:96%; overflow:hidden;}

    .d_center { text-align:center;}
    .d_left { text-align:left; }
</style>

<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>

<script type="text/javascript">
<!--
	$(document).ready(function(){
		
		// �̸��� ���ſ��� ����
		$('#p_ismailing').change(fnChangeMailing);
	});

    function modify() {
        var form = document.form1;
        //form.target = opener;
        form.action = "/servlet/controller.system.MemberSearchServlet";
        form.p_process.value = "MemberModify";
        form.submit();
        //self.close();
    }

    /**
     * ȸ�� ���� ����
     * @param type - 
     * @param p_membergubun - 
     */
    function fnUpdateMemberInfo(type, p_membergubun) {
        var title = "";
        var sqlNum = "";
        switch (type) {
            case 1 : title = "ȸ������"; sqlNum="member.membergubun.update"; break;
            case 2 : title = "ȸ������"; sqlNum="member.state.update"; break;
            case 3 : title = "ȸ���̵���ȭ��ȣ"; sqlNum="memberhandphone.update"; break;
            case 4 : title = "ȸ���̸����ּ�"; sqlNum="memberemail.update"; break;
        }

        if(!confirm(title+"�� �����Ͻðڽ��ϱ�?")) {
            return;
        }

        $.post("/servlet/controller.common.AjaxServlet",
            {
                sqlNum : sqlNum,rerurnFunction: "resultSimpleSave",
                p_userid : '<%= dbox.getString("d_userid") %>',
                p_membergubun : p_membergubun,
                p_grcode : '<%= box.getString("p_grcode") %>',
                p_handphone : $("#oNewMobileNo1").val() + "-" + $("#oNewMobileNo2").val() + "-" + $("#oNewMobileNo3").val(),
                p_email : $("#oNewEmail1").val() + "@" + $("#oNewEmail2").val()
            },
            function(data) {
                $("#ajaxDiv").html(data);
                if ( $("#oNewMobileNo1").val() != "" ) {
                    $("#oUserHandphone").text($("#oNewMobileNo1").val() + "-" + $("#oNewMobileNo2").val() + "-" + $("#oNewMobileNo3").val());
                    $("#oNewMobileNo1").val("");
                    $("#oNewMobileNo2").val("");
                    $("#oNewMobileNo3").val("");
                }
                if ( $("#oNewEmail1").val() != "" ) {
                	$("#oUserEmail").text($("#oNewEmail1").val() + "@" + $("#oNewEmail2").val());
                    $("#oNewEmail1").val("");
                    $("#oNewEmail2").val("");
                }
            }
        );
    }

    function resultSimpleSave(data) {
        if (data.result == "true") {
            alert("�����߽��ϴ�.");
        } else {
            alert("������ �����Ͽ����ϴ�.\n" + data.result);
        }
    }

    //Tab ���ý� ����
    function showTab(clickTab) {
        g_showTab(clickTab, 4);
    }

    function g_showTab(tabNo, count) {

        var clickTabNo = new Number(tabNo);
        var tabCount   = new Number(count);

        if( clickTabNo == 0 || tabCount == 0 ) return;

        for(i=1; i<=tabCount; i++) {
            div = document.all["tab_"+i];

            if(!div) return;

            if( clickTabNo == i ) {
                // Ȱ��ȭ�� tab Ŭ���� return
                if(div.style.display == "") return;
                div.style.display = ""
            } else {
                // ���õ��� �ʴ� �ǵ��� ������ ����.
                if(div.style.display != "none") {
                    div.style.display = "none";
                }
            }
        }
    }

    /**
     * SMS ����
     */
    function fnSendSMS() {
        ff = document.form1;
        ff.p_touch.value = "09";

        window.self.name = "memberList";
        open_window("openSMS","","100","100","620","354");
        document.form1.target = "openSMS";
        document.form1.action='/servlet/controller.study.StudentStatusAdminServlet';
        document.form1.p_process.value = 'SendSMS';
        document.form1.submit();
    }

    /**
     * ��й�ȣ �ʱ�ȭ
     */
    function fnResetPassword() {
        var form = document.form1;
        //form.target = opener;
        form.action = "/servlet/controller.system.MemberSearchServlet";
        form.p_process.value = "ResetUserPwd";
        form.submit();
    }

    function fnOpenMobileInfoPopup() {
        $("#oMobileInfoPopup").show();
    }

    function fnCloseMobileInfoPopup() {
        $("#oMobileInfoPopup").hide();
    }

    function fnChangeUserMobile() {
        if ($("#oNewMobileNo1").val() === "" || $("#oNewMobileNo2").val() === "" || $("#oNewMobileNo3").val() === "" ) {
            alert("�̵���ȭ��ȣ�� �Է��ϼ���.");
            return;
        } else {
            fnUpdateMemberInfo(3, '');
            fnCloseMobileInfoPopup();
        }
    }
    
    function fnOpenEmailInfoPopup() {
        $("#oEmailInfoPopup").show();
    }

    function fnCloseEmailInfoPopup() {
        $("#oEmailInfoPopup").hide();
    }

    function fnChangeUserEmail() {
        if ($("#oNewEmail1").val() === "" || $("#oNewEmail2").val() === "" ) {
            alert("������ �ּҸ� �Է��ϼ���.");
            return;
        } else {
            fnUpdateMemberInfo(4, '');
            fnCloseEmailInfoPopup();
        }
    }
    
    // �̸��� ���ſ��� ����
    function fnChangeMailing(){
    	if(confirm("���ϼ��ſ��θ� �����Ͻðڽ��ϱ�?")){
    		var form = document.form1;
            form.action = "/servlet/controller.system.MemberSearchServlet";
            form.p_process.value = "ChangeUserMailing";
            form.submit();
    	}else{
    		$('#p_ismailing').val($('#p_ismailing').val() == "Y" ? "N" : "Y");
    	}
    }
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<div id="ajaxDiv"></div>

<form name="form1" method="post">
    <input type="hidden" name="p_userid" value="<%=dbox.getString("d_userid")%>" />
    <input type="hidden" name="p_process" />
    <input type="hidden" name="p_touch" />
    <input type="hidden" name="p_checks" value="<%=dbox.getString("d_userid")%>" />
    <input type="hidden" name="s_grcode" value="<%=box.getString("p_grcode")%>" />

<table width="720" border="0" cellspacing="0" cellpadding="0" height="400">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td><img src="/images/admin/system/unite_title18.gif" ></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->
            <br />

            <!-- ������ ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
                    <td class="sub_title">����������ȸ</td>
                </tr>
                <tr>
                    <td height=6></td>
                    <td height=6></td>
                </tr>
            </table>
            <!-- -������ ��-- //-->

            <!-- ȸ�� ���� ���� //-->
            <table border="0" cellspacing="1" cellpadding="0" class="table_out" style="border:1px solid;">
                <tr>
                    <td colspan="4" class="table_top_line"></td>
                </tr>
                <tr>
                    <td class="table_title">ȸ������</td>
                    <td class="table_02_2" colspan="3">
                        <kocca_select:select sqlNum="0001" name="p_membergubun" param="0029"    selectedValue='<%= dbox.get("d_membergubun") %>' isLoad="true" onChange="fnUpdateMemberInfo(1, this.value)" type="1" all="none"/>
                    </td>
                </tr>
                <tr>
                    <td class="table_title">���̵�</td>
                    <td class="table_02_2"><%=dbox.getString("d_userid")%></td>
                    <td class="table_title">��й�ȣ</td>
                    <td class="table_02_2"><a href="javascript:fnResetPassword();">��й�ȣ�ʱ�ȭ</a> ****</td>
                </tr>
                <tr>
                    <td class="table_title">����(�ѱ�)</td>
                    <td class="table_02_2"><%=dbox.getString("d_name")%></td>
                    <td class="table_title">����(����)</td>
                    <td class="table_02_2"><%=dbox.getString("d_eng_name")%></td>
                </tr>
                <tr>
                    <td class="table_title">�̸���</td>
                    <td class="table_02_2">
                    <span id="oUserEmail"><%=dbox.getString("d_email")%></span>
                        <a href="javascript:fnOpenEmailInfoPopup();"><span>�����ּ� ����</span></a>
                    </td>
                    <td class="table_title">�ֹε�Ϲ�ȣ</td>
                    <td class="table_02_2">
            <%
                    String v_resno = dbox.getString("d_resno");
                    String v_resno_disp = "";
                    if (v_resno != null) {
                        if (v_resno.length() == 14) {
                            v_resno_disp = v_resno.substring(0,7) + v_resno.substring(7,8) + "******";
                        }
                    }
            %>
                        <%=v_resno%>
                    </td>
                </tr>
                <tr>
                    <td width="20%" class="table_title">�����ȣ(����)</td>
                    <td colspan="3" class="table_02_2"><%=dbox.getString("d_post1")%>-<%=dbox.getString("d_post2")%></td>
                </tr>
                <tr>
                    <td width="20%" class="table_title">�ּ�(����)</td>
                    <td colspan="3" class="table_02_2"><%=dbox.getString("d_addr")%> <%=dbox.getString("d_addr2")%></td>
                </tr>
                <tr>
                    <td width="20%" class="table_title">�����ȣ(ȸ��)</td>
                    <td colspan="3" class="table_02_2"><%=dbox.getString("d_comp_post1")%>-<%=dbox.getString("d_comp_post2")%></td>
                </tr>
                <tr>
                    <td width="20%" class="table_title">�ּ�(ȸ��)</td>
                    <td colspan="3" class="table_02_2"><%=dbox.getString("d_comp_addr1")%> <%=dbox.getString("d_comp_addr2")%></td>
                </tr>
                <tr>
                    <td class="table_title">������ȭ��ȣ</td>
                    <td class="table_02_2"><%=dbox.getString("d_hometel")%></td>
                    <td class="table_title">�̵���ȭ��ȣ</td>
                    <td class="table_02_2">
                        <span id="oUserHandphone"><%=dbox.getString("d_handphone")%></span>
                        <a href="javascript:fnSendSMS();"><img src="/images/admin/button/btn_sms.gif" border="0" valign="bottom"></a>
                        <br/>
                        <br/>
                        <a class="board_btn" href="javascript:fnOpenMobileInfoPopup();"><span>�޴�����ȣ ����</span></a>
                    </td>
                </tr>
                <tr>
                    <td class="table_title">ȸ����ȭ��ȣ</td>
                    <td class="table_02_2"><%=dbox.getString("d_comptel")%></td>
                    <td class="table_title">�Ҽ�</td>
                    <td class="table_02_2"><%=dbox.getString("d_comptext")%></td>
                </tr>
                <tr>
                    <td class="table_title">�����з�</td>
                    <td class="table_02_2"><%=GetCodenm.get_codenm("0069", dbox.getString("d_degree"))%></td>
                    <td class="table_title">����</td>
                    <td class="table_02_2"><%=GetCodenm.get_codenm("0070", dbox.getString("d_jikup"))%></td>
                </tr>
                <tr>
                    <td class="table_title">���ϼ��ſ���</td>
                    <td class="table_02_2">
                    	<%-- <%if (dbox.getString("d_ismailing").equals("N")){%>���Űź�<%}else{%>����<%}%> --%>
                    	<select id="p_ismailing" name="p_ismailing">
                    		<option value="Y" <%="Y".equals(dbox.getString("d_ismailing")) ? "selected" : ""%>>����</option>
                    		<option value="N" <%="N".equals(dbox.getString("d_ismailing")) ? "selected" : ""%>>���Űź�</option>
                    	</select>
                    </td>
                    <td class="table_title">�������ͼ��ſ���</td>
                    <td class="table_02_2"><%if (dbox.getString("d_islettering").equals("Y")){%>����<%}else{%>���Űź�<%}%></td>
                </tr>
                <tr>
                    <td class="table_title">����ó��������</td>
                    <td class="table_02_2"><%if (dbox.getString("d_isopening").equals("Y")){%>����<%}else{%>�����<%}%></td>
                    <td class="table_title">ȸ������</td>
                    <td class="table_02_2">
                        <select name="p_state" onChange="fnUpdateMemberInfo(2, this.value)">
                            <option value="Y" <% if(dbox.getString("d_statecd").equals("Y")){ out.print("selected"); }%>>����</option>
                            <option value="N" <% if(dbox.getString("d_statecd").equals("N")){ out.print("selected"); }%>>Ż��</option>
                        </select>
                    </td>
                </tr>
                <!--
                <tr>
                    <td class="table_title">���԰��</td>
                    <td class="table_02_2"><%=GetCodenm.get_codenm("0060", dbox.getString("d_registgubun"))%></td>
                    <td class="table_title">�Ǹ���������</td>
                    <td class="table_02_2"><%if (dbox.getInt("d_validation")==1){%>����<%}else{%>������<%}%></td>
                </tr>
                -->
                <tr>
                    <td class="table_title">���ʰ�����</td>
                    <td class="table_02_2"><%=FormatDate.getFormatDate(dbox.getString("d_indate"),"yyyy/MM/dd hh:mm:ss")%></td>
                    <td class="table_title">����������</td>
                    <td class="table_02_2"><%=FormatDate.getFormatDate(dbox.getString("d_ldate"),"yyyy/MM/dd hh:mm:ss")%></td>
                </tr>
            </table>
            <!-- ȸ�� ���� �� //-->
        </td>
    </tr>
    <tr style="display: none;">
        <td>
            <br />
            <br />
            <h2><img src="/images/portal/myclass/h2_tit6.gif" alt="��������Ʈ" class="fl_l" /><p class="category">���� ����Ʈ : <strong><%= v_availablepoint_text %></strong> Point</p></h2>
            <div id="tab_1" >
            <ul class="tabwrap mg_t35">
                <li><a href="javascript:showTab(1)" class="tab_myclass tab_myclass_on"><span>��������Ʈ</span></a></li>
                <li><a href="javascript:showTab(2)" class="tab_myclass"><span>��������Ʈ</span></a></li>
                <li><a href="javascript:showTab(3)" class="tab_myclass"><span>�������Ʈ</span></a></li>
            </ul>

            <table class="board_list">
                <colgroup>
                    <col width="240px" />
                    <col width="150px" />
                    <col width="150px" />
                    <col width="150px" />
                </colgroup>
                <thead>
                    <tr class="myclass">
                        <th><p>���泯��</p></th>
                        <th><p>��������Ʈ</p></th>
                        <th><p>�������Ʈ</p></th>
                        <th class="end"><p>��������Ʈ</p></th>
                    </tr>
                </thead>
                <tbody>
<%
    for(int i = 0; i < list1.size(); i++) {

        DataBox dbox1 = (DataBox)list1.get(i);

        String v_tid = dbox1.getString("d_tid");
        String v_getdate = dbox1.getString("d_getdate");
        String v_getpoint = s_fmt.format(dbox1.getInt("d_getpoint"));
        String v_usepoint = s_fmt.format(dbox1.getInt("d_usepoint"));
        String v_usepoint_text =  dbox1.getString("d_usepoint");
        String v_lefrpoint = s_fmt.format(dbox1.getInt("d_lefrpoint"));
        String v_expiredate = dbox1.getString("d_expiredate");

        v_getdate = FormatDate.getFormatDate(v_getdate,"yyyy.MM.dd");
%>
                    <tr onmouseover="className='over'" onmouseout="className=' '">
                        <td class="num"><%= v_getdate %></td>
                        <td class="num ta_r"><%= v_getpoint %></td>
                        <td class="num ta_r"><%= "0".equals(v_usepoint) ? v_usepoint_text : v_usepoint %></td>
                        <td class="num ta_r"><strong><%= v_lefrpoint %></strong></td>
                    </tr>
<%
    }

    if(list1.size() == 0 ) {
%>
                    <tr>
                        <td height="3" colspan="4" align="center">����Ʈ ������ �����ϴ�.</td>
                    </tr>
<%  }%>
                </tbody>
            </table>

            </div>
            <div id="tab_2" STYLE="display:none">

            <ul class="tabwrap mg_t35">
                <li><a href="javascript:showTab(1)" class="tab_myclass"><span>��������Ʈ</span></a></li>
                <li><a href="javascript:showTab(2)" class="tab_myclass tab_myclass_on"><span>��������Ʈ</span></a></li>
                <li><a href="javascript:showTab(3)" class="tab_myclass"><span>�������Ʈ</span></a></li>
            </ul>

            <table class="board_list">
                <colgroup>
                    <col width="110px" />
                    <col width="190px" />
                    <col width="130px" />
                    <col width="130px" />
                    <col width="130px" />
                </colgroup>
                <thead>
                <tr class="myclass">
                    <th><p>��������</p></th>
                    <th><p>��������Ʈ</p></th>
                    <th><p>��������</p></th>
                    <th><p>������</p></th>
                    <th class="end"><p>�����ݾ�</p></th>
                </tr>
                </thead>
                <tbody>
<%
    for(int i = 0; i < list2.size(); i++) {
        DataBox dbox2 = (DataBox)list2.get(i);

        String v_tid = dbox2.getString("d_tid");
        String v_getdate = dbox2.getString("d_getdate");
        String v_title = dbox2.getString("d_title");
        String v_getpoint = s_fmt.format(dbox2.getInt("d_getpoint"));
        String v_subjprice = s_fmt.format(dbox2.getInt("d_subjprice"));
        String v_price = s_fmt.format(dbox2.getInt("d_price"));

        v_getdate = FormatDate.getFormatDate(v_getdate,"yyyy.MM.dd");
%>
                    <tr onmouseover="className='over'" onmouseout="className=' '">
                        <td class="num"><%= v_getdate %></td>
                        <td class="num ta_r"><%= v_getpoint %></td>
                        <td><%= v_title %></td>
                        <td class="num ta_r"><%= v_subjprice %></td>
                        <td class="num ta_r"><strong><%= v_price %></strong></td>
                    </tr>
<%
    }


    if(list1.size() == 0 ){%>
                    <tr>
                        <td height="20" colspan="5" align="center">����Ʈ ������ �����ϴ�.</td>
                    </tr>
<%  }%>
                </tbody>
            </table>

            </div>
            <div id="tab_3" STYLE="display:none">

            <ul class="tabwrap mg_t35">
                <li><a href="javascript:showTab(1)" class="tab_myclass"><span>��������Ʈ</span></a></li>
                <li><a href="javascript:showTab(2)" class="tab_myclass"><span>��������Ʈ</span></a></li>
                <li><a href="javascript:showTab(3)" class="tab_myclass tab_myclass_on"><span>�������Ʈ</span></a></li>
            </ul>

            <table class="board_list">
                <colgroup>
                    <col width="110px" />
                    <col width="305px" />
                    <col width="95px" />
                    <col width="90px" />
                    <col width="90px" />
                </colgroup>
                <thead>
                <tr class="myclass">
                    <th><p>�������</p></th>
                    <th><p>������</p></th>
                    <th><p>�������Ʈ</p></th>
                    <th><p>������</p></th>
                    <th class="end"><p>�����ݾ�</p></th>
                </tr>
                </thead>
                <tbody>
<%
    for(int i = 0; i < list3.size(); i++) {

        DataBox dbox3 = (DataBox)list3.get(i);

        String v_tid = dbox3.getString("d_tid");
        String v_usedate = dbox3.getString("d_usedate");
        String v_title = dbox3.getString("d_title");
        String v_usepoint = s_fmt.format(dbox3.getInt("d_usepoint"));
        String v_subjprice = s_fmt.format(dbox3.getInt("d_subjprice"));
        String v_price = s_fmt.format(dbox3.getInt("d_price"));

        v_usedate = FormatDate.getFormatDate(v_usedate,"yyyy.MM.dd");
%>
                    <tr onmouseover="className='over'" onmouseout="className=' '">
                        <td class="num"><%= v_usedate %></td>
                        <td class="ta_l"><%= v_title %></td>
                        <td class="num ta_r"><%= v_usepoint %></td>
                        <td class="num ta_r"><%= v_subjprice %></td>
                        <td class="num ta_r"><strong><%= v_price %></strong></td>
                    </tr>
<%
    }

    if(list1.size() == 0 ){%>
                    <tr>
                        <td height="20" colspan="5" align="center">����Ʈ ������ �����ϴ�.</td>
                    </tr>
<%
    }
%>
                </tbody>
            </table>

            </div>

        </td>
    </tr>
    <tr style="display: none;">
        <td>

            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_army.gif" alt="��������" class="fl_l" /></h3>
            <table class="write">
                <tr>
                    <td class="intxt end">
                        <span><input type="radio" name="p_militarystatus" value="" checked/>�ش����&nbsp;&nbsp;<kocca_select:select sqlNum="0001" name="p_militarystatus" styleClass="mg_l10" param="0093" selectedValue='<%= addInfobox.get("d_militarystatus") %>' isLoad="true" type="2.2"/></span>
                        <span class="mg_l20">
                            �����Ⱓ <%= addInfobox.get("d_militarystart") %> ~ <%= addInfobox.get("d_militaryend") %>
                        </span>
                        <span class="mg_l15">�������� : <%= addInfobox.get("d_militarymemo") %></span>
                    </td>
                </tr>
            </table>

<%
    if(schoolList!=null && schoolList.size() >0) {
%>
            <h3 class="pop_tit mg_b9">��������<img src="/images/portal/common/stit_applystep.gif" alt="��û����" class="fl_l" /></h3>
            <table class="ac_list">
                <colgroup>
                    <col width="114px" />
                    <col width="101px" />
                    <col width="107px" />
                    <col />
                    <col width="101px" />
                </colgroup>
                <thead>
                    <tr>
                        <th>�б���</th>
                        <th>��������</th>
                        <th>����(����)��</th>
                        <th>�а�/����</th>
                        <th>������</th>
                    </tr>
                </thead>
                <tbody>
<%
        for(DataBox schoolListBox : schoolList) {
%>
                    <tr>
                        <td><%= schoolListBox.get("d_schoolname") %></td>
                        <td><%= schoolListBox.get("d_status") %></td>
                        <td><%= schoolListBox.get("d_send") %></td>
                        <td><%= schoolListBox.get("d_major") %></td>
                        <td><%= schoolListBox.get("d_place") %></td>
                    </tr>
<%
        }
%>
                </tbody>
            </table>
<%
    }
%>


<%
    if(schoolList!=null && schoolList.size() >0) {
%>
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_certificate.gif" alt="�ڰ���" class="fl_l" /></h3>
            <table class="ac_list">
                <colgroup>
                    <col width="221px" />
                    <col width="175px" />
                    <col />
                </colgroup>
                <thead>
                    <tr>
                        <th>�ڰ�����</th>
                        <th>�����</th>
                        <th>����ó</th>
                    </tr>
                </thead>
                <tbody>
<%
        for(DataBox licenseListBox : licenseList) {
%>
                    <tr>
                        <td><%= licenseListBox.get("d_licensename") %></td>
                        <td><%= licenseListBox.getDate("d_getdate", "-") %></td>
                        <td><%= licenseListBox.get("d_publish") %></td>
                    </tr>
<%
        }
%>
                </tbody>
            </table>
<%
    }

    if(trainingINFOList!=null && trainingINFOList.size() >0) {
%>
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_trainnum.gif" alt="���������ȣ" class="fl_l" /></h3>
            <table class="ac_list">
                <colgroup>
                    <col width="221px" />
                    <col width="175px" />
                    <col />
                </colgroup>
                <thead>
                    <tr>
                        <th>������</th>
                        <th>���������ȣ</th>
                        <th>�Ҽӱ���û</th>
                    </tr>
                </thead>
                <tbody>
<%
        for(DataBox trainingINFOListBox : trainingINFOList) {
%>
                    <tr>
                        <td><%= trainingINFOListBox.get("d_subjnm") %></td>
                        <td><%= trainingINFOListBox.get("d_trainingnum") %></td>
                        <td><%= trainingINFOListBox.get("d_fromoffice") %></td>
                    </tr>
<%
        }
%>
                </tbody>
            </table>
<%
    }

    if(careerList!=null && careerList.size() >0) {
%>
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_certificate.gif" alt="�ڰ���" class="fl_l" /></h3>
            <table class="ac_list">
                <colgroup>
                    <col width="67px" />
                    <col width="108px" />
                    <col width="135px" />
                    <col />
                    <col width="150px" />
                    <col width="80px" />
                </colgroup>
                <thead>
                <tr>
                    <th>����</th>
                    <th>����</th>
                    <th>ȸ���</th>
                    <th>����/����</th>
                    <th>�����Ⱓ</th>
                    <th>�������� </th>
                </tr>
                </thead>
                <tbody id="careerListbox">
<%
        for(DataBox careerListbox : careerList) {
%>
                    <tr>
                        <td><%= careerListbox.get("d_jikup") %></td>
                        <td><%= careerListbox.get("d_jikjong") %></td>
                        <td><%= careerListbox.get("d_officename") %></td>
                        <td><%= careerListbox.get("d_position") %></td>
                        <td><%= careerListbox.getDate("d_workstart", ".") %>~<%= careerListbox.getDate("d_workend", ".") %></td>
                        <td><%= careerListbox.get("d_workstatus") %></td>
                    </tr>
<%
        }
%>
                </tbody>
            </table>
<%
    }
%>

            <h3 class="pop_tit"><img src="/images/portal/common/stit_resume.gif" alt="�ڱ�Ұ���" /></h3>
            <table class="write">
                <colgroup>
                    <col width="18%" />
                    <col />
                </colgroup>
                <tr>
                    <th>���μҰ�</th>
                    <td><textarea class="inbox" style="width:97%; height:30px;" readonly><%= addInfobox.get("d_intro") %></textarea></td>
                </tr>
                <tr>
                    <th>��������</th>
                    <td><textarea class="inbox" style="width:97%; height:30px;" readonly><%= addInfobox.get("d_motive") %></textarea></td>
                </tr>
                <tr>
                    <th>���İ�ȹ</th>
                    <td><textarea class="inbox" style="width:97%; height:30px;" readonly><%= addInfobox.get("d_vision") %></textarea></td>
                </tr>
                <tr>
                    <th>��Ÿ</th>
                    <td><textarea class="inbox" style="width:97%; height:30px;" readonly><%= addInfobox.get("d_etc") %></textarea></td>
                </tr>
            </table>
            <br />
            <!-- ��ư ���� //-->
            <table cellpadding="0" cellspacing="0" border="0" width="97%">
                <tr>
                    <td bgcolor="FFFFFF"><IMG src width="0" height="0"></td>
                    <td width="120">
                        <a href="javascript:self.close()"><img src="/images/admin/button/btn_close.gif"  border=0></a>
                    </td>
                </tr>
            </table>
            <!-- ��ư �� //-->
        </td>
    </tr>
    <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>

<div id="oMobileInfoPopup" class="coursePopup">
    <div style="padding: 8px 0 0 15px; font-weight:bold; text-align:left;">�̵���ȭ��ȣ ����</div>
    <div id="oMobileInfo">
        <form id="oUserMobileInfoForm" name="userMobileInfoForm" method="post" onsubmit="return false;">
            <input type="hidden" id="oUserid" name="userid" value="<%= dbox.getString("d_userid") %>" />
        <table border="0" cellpadding="0" cellspacing="0" class="searchTable" style="width:96%;">
            <colgroup>
                <col style="width:40%;" />
                <col style="width:60%;" />
            </colgroup>
            <tr>
                <th scope="cols">���� �̵���ȭ��ȣ</th>
                <td style="text-align:left; padding:8px;">
                    <%= dbox.getString("d_handphone") %>
                </td>
            </tr>
            <tr>                    
                <th scope="cols">�� �̵���ȭ��ȣ</th>
                <td style="text-align:left; padding:8px;">
                    <input type="text" id="oNewMobileNo1" name="newMobileNo1" style="width:30px;" maxlength="3" value="" onkeyup="numeric_chk(this);" /> -
                    <input type="text" id="oNewMobileNo2" name="newMobileNo2" style="width:40px;" maxlength="4" value="" onkeyup="numeric_chk(this);" /> -
                    <input type="text" id="oNewMobileNo3" name="newMobileNo3" style="width:40px;" maxlength="4" value="" onkeyup="numeric_chk(this);" />
                </td>
            </tr>
            <tr>
                <td style="text-align:center;" colspan="2">
                    <a href="javascript:fnChangeUserMobile();"><img src="/images/admin/button/btn_modify.gif" border="0" /></a>
                    <a href="javascript:fnCloseMobileInfoPopup();"><img src="/images/admin/button/btn_close.gif" border="0" /></a>
                </td>
            </tr>
        </table>
        </form>
    </div>
</div>

<div id="oEmailInfoPopup" class="coursePopup">
    <div style="padding: 8px 0 0 15px; font-weight:bold; text-align:left;">�����ּ� ����</div>
    <div id="oEmailInfo">
        <form id="oUserEmailInfoForm" name="userEmailInfoForm" method="post" onsubmit="return false;">
            <input type="hidden" id="oUserid" name="userid" value="<%= dbox.getString("d_userid") %>" />
        <table border="0" cellpadding="0" cellspacing="0" class="searchTable" style="width:96%;">
            <colgroup>
                <col style="width:40%;" />
                <col style="width:60%;" />
            </colgroup>
            <tr>
                <th scope="cols">���� �����ּ�</th>
                <td style="text-align:left; padding:8px;">
                    <%= dbox.getString("d_email") %>
                </td>
            </tr>
            <tr>                    
                <th scope="cols">�� �����ּ�</th>
                <td style="text-align:left; padding:8px;">
                    <input type="text" id="oNewEmail1" name="newEmail1" style="width:70px;" value=""  /> @
                    <input type="text" id="oNewEmail2" name="newEmail2" style="width:80px;" value=""  /> 
                    
                </td>
            </tr>
            <tr>
                <td style="text-align:center;" colspan="2">
                    <a href="javascript:fnChangeUserEmail();"><img src="/images/admin/button/btn_modify.gif" border="0" /></a>
                    <a href="javascript:fnCloseEmailInfoPopup();"><img src="/images/admin/button/btn_close.gif" border="0" /></a>
                </td>
            </tr>
        </table>
        </form>
    </div>
</div>


</body>
</html>
