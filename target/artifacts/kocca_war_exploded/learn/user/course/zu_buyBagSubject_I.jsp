<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%
//**********************************************************
//  1. ��      ��: �¶��ΰ���
//  2. ���α׷���: zu_buyBagSubject_I.jsp
//  3. ��      ��: ������û ȭ��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: swchoi 2013.10.26
//  7. ��      ��:
//**********************************************************
%>
<%
    String p_needinput = request.getParameter("p_needinput");

    int i = 0;
    char[]token = p_needinput.toCharArray();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>������û</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>

<script type="text/javascript" >

    /**
     * ������ �ε��� �� datepicker �ʱ�ȭ
     */
    $(document).ready(function(){
        $("#dtpicker1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200});
        $("#dtpicker2").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200});
        $("#dtpicker3").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200});
        $("#dtpicker4").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200});
        $("#dtpicker5").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200});
        $("#dtpicker6").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200});
        $("#dtpicker7").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200});
        $("#dtpicker8").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200});
        $("#dtpicker9").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200});
    });

    /**
     * �ڱ� �Ұ� �� �������� �� textarea �Է½� �Էµ� byte �� ǥ��
     */
    function textareaLength(hwnd,target) {
        var h = $("[name='" + hwnd + "']").val();
        var r = calculate_msglen(h);
        $("#" + target).text(r);
        if(r>3000) {
            $("#"+target).css("color","#FF0000");
        } else {
            $("#"+target).css("color","#000000");
        }
    }

    /**
     * ���ڿ��� byte ���� ����Ͽ� �����Ѵ�.
     */
    function calculate_msglen(msg) {
        var nbytes = 0;

        for (i=0; i<msg.length; i++) {
            var ch = msg.charAt(i);
            if(escape(ch).length > 4) {
                nbytes += 2;
            } else if (ch == '\n') {
                if (msg.charAt(i-1) != '\r') {
                    nbytes += 1;
                }
            } else if (ch == '<' || ch == '>') {
                nbytes += 4;
            } else {
                nbytes += 1;
            }
        }

        return nbytes;
    }

</script>
</head>
<body id="popup" style="overflow:auto"><!-- popup size : 730* -->

<div id="minical" onclick="this.style.display='none';" oncontextmenu='return false' ondragstart='return false' onselectstart='return false' style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
<!-- ��ũ��Ʈ�������� -->

    <div id="pop_header">
        <h1><img src="/images/portal/online/pop_h1_tit3.gif" alt="������û" /></h1>
    </div>
    <div id="pop_container">
        <div id="contentwrap">
            <dl class="guide_list">
                <dt><img src="/images/portal/popup/tit_guide.gif" alt="GUIDE" /></dt>
                <dd>����ó(�ڵ���) �� �̸����� ������� �ʼ� �׸��̹Ƿ� ��Ȯ�� �Է��� �ֽʽÿ�</dd>
            </dl>

            <h3 class="pop_tit"><img src="/images/portal/common/stit_applystep.gif" alt="��û����" /></h3>
            <table class="view_bl">
            <colgroup><col width="18%" /><col width="32%" /><col width="18%" /><col width="32%" /></colgroup>
            <tr>
                <th style="padding-left:0;padding-right:0;text-align:center;">������</th>
                <td colspan="3" class="end"><strong>2009 �����Ȩ���� After Effect HD ����</strong></td>
            </tr>
            <tr>
                <th style="padding-left:0;padding-right:0;text-align:center;">�о�</th>
                <td style="padding-left:10px;padding-right:0">���</td>
                <th style="padding-left:0;padding-right:0;text-align:center;">����</th>
                <td class="end">1��</td>
            </tr>
            <tr>
                <th style="padding-left:0;padding-right:0;text-align:center;">��û�ڸ�</th>
                <td style="padding-left:10px;padding-right:0">ȫ�浿</td>
                <th style="padding-left:0;padding-right:0;text-align:center;">������</th>
                <td class="end">50,000��</td>
            </tr>
            <tr>
                <th style="padding-left:0;padding-right:0;text-align:center;">������û�Ⱓ</th>
                <td style="padding-left:10px;padding-right:0">2013.11.28~2013.11.28</td>
                <th style="padding-left:0;padding-right:0;text-align:center;">���������Ⱓ</th>
                <td class="end">2013.11.28~2013.11.28 </td>
            </tr>
<%
    if(i < token.length && token[0] == '1') {
%>
            <tr>
                <th style="padding-left:0;padding-right:0;text-align:center;">�޴���ȭ</th>
                <td style="padding-left:10px;padding-right:0"><input type="text" class="inbox" style="width:38px;" value="010" /> <input type="text" class="inbox" style="width:38px;" value="010" /> <input type="text" class="inbox" style="width:38px;" value="010" /></td>
                <th style="padding-left:0;padding-right:0;text-align:center;">�̸���</th>
                <td class="end" style="padding-left:10px;padding-right:0"><input type="text" class="inbox" style="width:162px;" value="master@kocca.or.kr" /></td>
            </tr>

            <tr>
                <th style="padding-left:0;padding-right:0;text-align:center;">���Ҽ�</th>
                <td style="padding-left:10px;padding-right:0"><input type="text" id="p_comptext" name="p_comptext" value="����(�б�)��" class="inbox"></td>
                <th style="padding-left:0;padding-right:0;text-align:center;">�������<br>���ε�</th>
                <td style="padding-left:10px;padding-right:0" class="end">
                    <input type="file" name="p_picfile" class="inbox">
                    *�뷮�� 20Kb ���Ϸ� ���ּ���.&nbsp;&nbsp;&nbsp;<br><label style="color:red">���ϸ��� �������� �÷� �ּ���.</label>
                </td>
            </tr>

<%
    }

        if(token.length > 8 && token[8] == '1') {
%>
            <tr>
                <th style="padding-left:0;padding-right:0;text-align:center;">�� ��±Ⱓ</th>
                <td style="padding-left:10px;padding-right:0" colspan="3" class="end">
                    <input type="text" maxlength="2" size="4" id="p_tcareeryear"  name="p_tcareeryear"  value="" onkeypress="onlyNumber()" class="inbox" /> ��
                    <input type="text" maxlength="2" size="4" id="p_tcareermonth" name="p_tcareermonth" value="" onkeypress="onlyNumber()" class="inbox"/> ����
                </td>
            </tr>
<%
        }

        if(token.length > 8 && token[6] == '1') {
%>
            <tr>
                <th style="padding-left:0;padding-right:0;text-align:center;">�ڱ�Ұ�<br>(��»���)</th>
                <td style="padding-left:10px;padding-right:0" colspan="3" class="end"><textarea rows="5" cols="80" name="p_intro" id="p_selfintro" onkeyup="textareaLength('p_intro','p_selfintroLbael');"></textarea><br/>
                * �� 3000Byte ������ �����ϴ�.(�ѱ�,Ư������ 2byte ������ 1Byte)
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������� �� : <label id="p_selfintroLbael" style="font-weight:bold;"></label>
                </td>
            </tr>
            <tr>
                <th style="padding-left:0;padding-right:0;text-align:center;">��������</th>
                <td style="padding-left:10px;padding-right:0" colspan="3" class="end"><textarea rows="5" cols="80" name="p_motive" id="p_support" onkeyup="textareaLength('p_motive','p_motiveLbael');"></textarea><br/>
                * �� 3000Byte ������ �����ϴ�.(�ѱ�,Ư������ 2byte ������ 1Byte)
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������� �� : <label id="p_motiveLbael" style="font-weight:bold;"></label>
                </td>
            </tr>

<%
        }
%>
            </table>

<%
    if(i < token.length && token[9] == '1') {
%>
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_apply_info.gif" alt="��������" class="fl_l" />

            <table class="write">
                <colgroup>
                    <col width="16%" />
                    <col width="38%" />
                    <col width="16%" />
                    <col width="20%" />
                </colgroup>
                <tr>
                    <th>�̸�(�ʸ���)</th>
                    <td colspan="3" class="end">
                        <input type="text" class="inbox" style="width:162px;" />
                    </td>
                </tr>
                <tr>
                    <th>��������<br/>(�ߺ�üũ����)</th>
                    <td colspan="3" class="end">
                        <input type="checkbox" id="" name="" value="1" />����1
                        <input type="checkbox" id="" name="" value="2" />����2
                        <input type="checkbox" id="" name="" value="3" />����3
                    </td>
                </tr>
                <tr>
                    <th>�Ҽ� �� ����</th>
                    <td colspan="3" class="end">
                        <input type="text" class="inbox" style="width:162px;" />
                    </td>
                </tr>
            </table>
<%
    }

    if(i < token.length && token[10] == '1') {
%>

            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_channel.gif" alt="���� �¶��� ä��" class="fl_l" /></h3>
            <table class="write">
            <colgroup><col width="19%" /><col width="35%" /><col width="16%" /><col width="20%" /></colgroup>
            <tr>
                <th>�̸�(�г���)</th>
                <td colspan="3" class="end">
                    <input type="text" class="inbox" style="width:200px;" name="p_nickname_input" id="oNicknameInput" />
                </td>
            </tr>
            <tr>
                <th>���� �¶���ä��<br/>(SNS, ��α� ��)</th>
                <td colspan="3" class="end">
                    <input type="text" name="p_private_sns_input" id="oPrivateSnsInput" class="inbox" style="width:400px;" value=""/>
                </td>
            </tr>
            </table>

<%
    }

    if(i < token.length && token[1] == '1') {
%>
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_army.gif" alt="��������" class="fl_l" /> <span class="ra_txt"><input type="radio"><strong>�ش����</strong> (�ش������ ���� ��� üũ���ּ���)</span></h3>
            <table class="write">
            <tr>
                <td class="intxt end">
                    <span><input type="radio" />�� <input type="radio" class="mg_l10" />���� <input type="radio" class="mg_l10" />����</span>
                    <!-- span class="mg_l20">�����Ⱓ <input type="text" class="inbox" style="width:65px;" value="2013.11.28" /><input type="image" src="/images/portal/ico/ico_calendar.gif" class="calendar" />~ <input type="text" class="inbox" style="width:65px;" value="2013.11.28" /><input type="image" src="/images/portal/ico/ico_calendar.gif" class="calendar" /></span-->
                    <span class="mg_l20">�����Ⱓ <input type="text" name="dtpicker1" id="dtpicker1" class="datepicker_input1" style="width:65px;" value="">~ <input type="text" name="dtpicker2" id="dtpicker2" class="datepicker_input1" style="width:65px;" value="" /></span>
                    <span class="mg_l15">�������� <input type="text" class="inbox" style="width:113px;" /></span>
                </td>
            </tr>
            </table>
<%
    }

    if(i < token.length && token[2] == '1') {
%>
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_curri.gif" alt="��������" class="fl_l"/>&nbsp;<label style="color:red; vertical-align: top;"> * �����з� �� ���������� �ּ� 1���� �Է¹ٶ��ϴ�. </label></h3>
            <table class="write">
            <colgroup><col width="18%" /><col width="32%" /><col width="18%" /><col width="32%" /></colgroup>
            <tr>
                <th>�б���</th>
                <td><input type="text" class="inbox" style="width:162px;" /></td>
                <th>������</th>
                <td class="end"><input type="text" class="inbox" style="width:162px;" /></td>
            </tr>
            <tr>
                <th>�а�/����</th>
                <td><input type="text" class="inbox" style="width:162px;" /></td>
                <th>��������</th>
                <td class="end"><select><option>����</option></select></td>
            </tr>
            <tr>
                <th>���бⰣ</th>
                <td colspan="3" class="end">
                <!-- <input type="text" class="inbox" style="width:65px;" value="2013.11.28" /><input type="image" src="/images/portal/ico/ico_calendar.gif" class="calendar" />~ <input type="text" class="inbox" style="width:65px;" value="2013.11.28" /><input type="image" src="/images/portal/ico/ico_calendar.gif" class="calendar" /> -->
                <input type="text" name="dtpicker3" id="dtpicker3" class="datepicker_input1" style="width:65px;" value="">~ <input type="text" name="dtpicker4" id="dtpicker4" class="datepicker_input1" style="width:65px;" value="">
                </td>
            </tr>
            </table>
            <p class="btn"><a href="" class="btn_gr"><span>���</span></a><a href="" class="btn_gr"><span>�߰�</span></a></p>

            <table class="ac_list">
            <colgroup><col width="114px" /><col width="101px" /><col width="107px" /><col /><col width="101px" /></colgroup>
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
            <tr>
                <td>ȫ�浿���б�</td>
                <td>����</td>
                <td>2013.12.31</td>
                <td>��������а�/���α׷���</td>
                <td>����</td>
            </tr>
            </tbody>
            </table>
<%
    }

    if(i < token.length && token[3] == '1') {
%>

            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_certificate2.gif" alt="�ڰ���/�ܱ���" class="fl_l" /></h3>
            <table class="write">
            <colgroup><col width="18%" /><col width="32%" /><col width="18%" /><col width="32%" /></colgroup>
            <tr>
                <th>�ڰ�����/</br> �ܱ�������</th>
                <td><input type="text" class="inbox" style="width:162px;" /></td>
                <th>�����</th>
                <td class="end">
                <!-- <input type="text" class="inbox" style="width:65px;" value="2013.11.28" /><input type="image" src="/images/portal/ico/ico_calendar.gif" class="calendar" /> -->
                <input type="text" name="dtpicker5" id="dtpicker5" class="datepicker_input1" style="width:65px;" value="">
                </td>
            </tr>
            <tr>
                <th>����ó</th>
                <td colspan="3" class="end"><input type="text" class="inbox" style="width:162px;" /></td>
            </tr>
            </table>
            <p class="btn"><a href="javascript:void(0);" class="btn_gr"><span>���</span></a></p>

            <table class="ac_list">
            <colgroup><col width="221px" /><col width="175px" /><col /></colgroup>
            <thead>
            <tr>
                <th>�ڰ�����/�ܱ�������</th>
                <th>�����</th>
                <th>����ó</th>
                <th>����</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>��������а�/���α׷���</td>
                <td>2013.12.31</td>
                <td>�ѱ���������� �����</td>
                <td><a href="javascript:void(0);"><img src="/images/admin/portal/stat_0.gif"/></a></td>
            </tr>
            <tr>
                <td>��������а�/���α׷���</td>
                <td>2013.12.31</td>
                <td>�ѱ���������� �����</td>
                <td><a href="javascript:void(0);"><img src="/images/admin/portal/stat_0.gif"/></a></td>
            </tr>
            </tbody>
            </table>
<%
    }

    if(i < token.length && token[4] == '1') {
%>

            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_trainnum.gif" alt="���������ȣ" class="fl_l" /> <span class="ra_txt"><input type="radio"><strong>�ش����</strong> (�ش������ ���� ��� üũ���ּ���)</span></h3>
            <table class="write">
            <colgroup><col width="18%" /><col width="32%" /><col width="18%" /><col width="32%" /></colgroup>
            <tr>
                <th>���������ȣ</th>
                <td><input type="text" class="inbox" style="width:162px;" /></td>
                <th>�Ҽӱ���û</th>
                <td class="end">
                <!-- <input type="text" class="inbox" style="width:65px;" value="2013.11.28" /><input type="image" src="/images/portal/ico/ico_calendar.gif" class="calendar" /> -->
                <input type="text" name="dtpicker6" id="dtpicker6" class="datepicker_input1" style="width:65px;" value="">
                </td>
            </tr>
            </table>
<%
    }

    if(i < token.length && token[5] == '1') {
%>

            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_career.gif" alt="�ڰ���" class="fl_l" /> <span class="ra_txt"><input type="radio"><strong>�ش����</strong> (�ش������ ���� ��� üũ���ּ���)</span></h3>
            <table class="write">
            <colgroup><col width="16%" /><col width="38%" /><col width="16%" /><col width="20%" /></colgroup>
            <tr>
                <th>����</th>
                <td colspan="3" class="end"><select><option>����</option></select><select class="mg_l10"><option>����</option></select></td>
            </tr>
            <tr>
                <th>ȸ���</th>
                <td><input type="text" class="inbox" style="width:162px;" /></td>
                <th>����/����</th>
                <td class="end"><input type="text" class="inbox" style="width:162px;" /></td>
            </tr>
            <tr>
                <th>�����Ⱓ</th>
                <td>
                <!-- <input type="text" class="inbox" style="width:65px;" value="2013.11.28" /><input type="image" src="/images/portal/ico/ico_calendar.gif" class="calendar" />~ <input type="text" class="inbox" style="width:65px;" value="2013.11.28" /><input type="image" src="/images/portal/ico/ico_calendar.gif" class="calendar" /> -->
                <input type="text" name="dtpicker7" id="dtpicker7" class="datepicker_input1" style="width:65px;" value="">
                ~ <input type="text" name="dtpicker8" id="dtpicker8" class="datepicker_input1" style="width:65px;" value="">
                </td>
                <th>��������</th>
                <td class="end"><select><option>����</option></select></td>
            </tr>
            </table>
            <p class="btn"><a href="" class="btn_gr"><span>���</span></a><a href="" class="btn_gr"><span>�߰�</span></a></p>

            <table class="ac_list">
            <colgroup><col width="67px" /><col width="108px" /><col width="135px" /><col /><col width="150px" /><col width="80px" /></colgroup>
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
            <tbody>
            <tr>
                <td>ȸ���</td>
                <td>��ǻ��/���ͳ�</td>
                <td>��������������</td>
                <td>���п� ��������</td>
                <td>2004.11.29~2013.12.30</td>
                <td>����</td>
            </tr>
            </tbody>
            </table>
<%
    }

    if(i < token.length && token[6] == '1') {
%>

<%--
            <h3 class="pop_tit"><img src="/images/portal/common/stit_resume.gif" alt="�ڱ�Ұ���" /></h3>
            <table class="write">
            <colgroup><col width="18%" /><col /></colgroup>
            <tr>
                <th>���μҰ�</th>
                <td><textarea class="inbox" style="width:97%; height:30px;"></textarea></td>
            </tr>
            <tr>
                <th>��������</th>
                <td><textarea class="inbox" style="width:97%; height:30px;"></textarea></td>
            </tr>
            <tr>
                <th>���İ�ȹ</th>
                <td><textarea class="inbox" style="width:97%; height:30px;"></textarea></td>
            </tr>
            <tr>
                <th>��Ÿ</th>
                <td><textarea class="inbox" style="width:97%; height:30px;"></textarea></td>
            </tr>
            </table>
--%>

<%
    }

    if(i < token.length && token[7] == '1') {
%>

            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_competition.gif" alt="����״�ȸ �����̷�" class="fl_l" /></h3>
            <table class="write">
            <colgroup><col width="18%" /><col width="32%" /><col width="18%" /><col width="32%" /></colgroup>
            <tr>
                <th>��ȸ��������</th>
                <td><input type="text" class="inbox" style="width:162px;" /></td>
                <th>����</th>
                <td class="end">
                <!-- <input type="text" class="inbox" style="width:65px;" value="2013.11.28" /><input type="image" src="/images/portal/ico/ico_calendar.gif" class="calendar" /> -->
                <input type="text" name="dtpicker9" id="dtpicker9" class="datepicker_input1" style="width:65px;" value="">
                </td>
            </tr>
            <tr>
                <th>����/���𳻿�</th>
                <td colspan="3" class="end"><input type="text" class="inbox" style="width:162px;" /></td>
            </tr>
            </table>
            <p class="btn"><a href="" class="btn_gr"><span>���</span></a><a href="" class="btn_gr"><span>�߰�</span></a></p>

            <table class="ac_list">
            <colgroup><col width="221px" /><col width="175px" /><col /></colgroup>
            <thead>
            <tr>
                <th>����</th>
                <th>��ȸ/��������</th>
                <th>����/���𳻿�</th>
                <th>����</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>2010.05.05</td>
                <td>������ȸ(�����κι�)</td>
                <td>�ݻ�</td>
                <td><a href="javascript:void(0);"><img src="/images/admin/portal/stat_0.gif"/></a></td>
            </tr>
            </tbody>
            </table>
<%  } %>

        </div>
    </div>
    <div id="pop_footer">
        <p class="f_btn"><a href="" class="btn_red"><span>��û�ϱ�</span></a><a href="javascript:window.close();" class="btn_gr"><span>���</span></a></p>
    </div>
</body>
</html>
