<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    DataBox dbox        = (DataBox)request.getAttribute("member");

    String v_name="";
    String v_userid="";
    String v_chk="";
    String v_sw="";
    String v_gubun=box.getString("p_gubun_inja");
    if(dbox != null)
    {
        v_name              = dbox.getString("d_name");
        v_userid            = dbox.getString("d_userid");
        v_chk            = dbox.getString("d_val");  //���� �ߴ��� ����
        if(!v_chk.equals(""))
        {
            v_sw="1";
            out.print("<script> alert('������ �ѹ��� �ϽǼ� �ֽ��ϴ�. ���� ���� �մϴ�.');window.close();</script>");
        }
    }
    else
    {
        v_sw="1";
        out.print("<script> alert('ȸ�������� �����ϴ�. ���� ���� �մϴ�.');window.close();</script>");
    }

    if(!v_sw.equals("1"))
    if(1==1)
    {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�ѱ���������ī����</title>
<script type='text/javascript' src='http://edu.kocca.or.kr/script/jquery-1.3.2.min.js'></script>
<script type='text/javascript' src='http://edu.kocca.or.kr/script/jquery.form.js'></script>

<style type="text/css">
<!--
.question {
	font-size: 14px;
	font-weight: bold;
}
.answer {font-size: 14px}

.table {
	font-size: 12px
}
.style1 {
	font-size: 13px;
	font-weight: bold;
	color: #ff6600;
}
-->
</style>
<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
    var sw=false;
    function gotoSubmit()
    {
        var ans="";
        var tmp="";

        tmp=$("[name='survey1']:checked").val();
        if(tmp==undefined)
        {
            alert("1�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans=tmp+",";

        // 222
        tmp=$("[name='survey2']:checked").val();
        if(tmp==undefined)
        {
            alert("2�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        if(tmp=="3")
        {
            tmp=$("[name='survey2t']").val();
            if($.trim(tmp)=="")
            {
                alert("2�� �������� ��Ÿ�� �����Ͻø� �������� ���� �Է� �Ͽ� �ֽʽÿ�.");
                $("[name='survey2t']").focus();
                return;
            }
        }
        ans+=tmp+",";

        // 333
        tmp=$("[name='survey3']:checked").val();
        if(tmp==undefined)
        {
            alert("3�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

         // 444
        tmp=$("[name='survey4']:checked").val();
        if(tmp==undefined)
        {
            alert("4�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        // 555
        tmp=$("[name='survey5t1']").val()+"@";
        tmp+=$("[name='survey5t2']").val()+"@";
        tmp+=$("[name='survey5t3']").val();
        ans+=tmp+",";

         // 666
        tmp=$("[name='survey6']:checked").val();
        if(tmp==undefined)
        {
            alert("6�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        if(tmp=="4")
        {
            tmp=$("[name='survey6t']").val();
            if($.trim(tmp)=="")
            {
                alert("6�� �������� ��Ÿ�� �����Ͻø� �������� ���� �Է� �Ͽ� �ֽʽÿ�.");
                $("[name='survey6t']").focus();
                return;
            }
        }
        ans+=tmp+",";

        // 777
        tmp=$("[name='survey7']:checked").val();
        if(tmp==undefined)
        {
            alert("7�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp="";
         // 888
        $("[name='survey8']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("8�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        if(tmp.indexOf("3")!=-1)
        {
            if($.trim($("[name='survey8t']").val())=="")
            {
                alert("8�� �������� ��Ÿ�� �����Ͻø� �������� ���� �Է� �Ͽ� �ֽʽÿ�.");
                $("[name='survey8t']").focus();
                return;
            }
            tmp+=$("[name='survey8t']").val()+"@";
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";

        tmp="";
        // 999
        $("[name='survey9']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("9�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        if(tmp.indexOf("3")!=-1)
        {
            if($.trim($("[name='survey9t']").val())=="")
            {
                alert("9�� �������� ��Ÿ�� �����Ͻø� �������� ���� �Է� �Ͽ� �ֽʽÿ�.");
                $("[name='survey9t']").focus();
                return;
            }
            tmp+=$("[name='survey9t']").val()+"@";
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";

        tmp="";
        // 10
        $("[name='survey10']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("10�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";

        tmp="";
        // 11
        $("[name='survey11']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("11�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";

        tmp="";
        // 12
        $("[name='survey12']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("12�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";

        tmp="";
        // 13
        $("[name='survey13']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("13�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";

        tmp=$("[name='survey14t']").val();
        if(tmp=="")
        {
            alert("14�� ������ ���� ���� �ʾҽ��ϴ�.");
            $("[name='survey14t']").focus();
            return;
        }
        ans+=tmp+",";

        if(!sw)
        {
            tmp=$("[name='survey15t']").val();
            if(tmp=="")
            {
                alert("15�� ������ ���� ���� �ʾҽ��ϴ�.");
                $("[name='survey15t']").focus();
                return;
            }
            ans+=tmp;

            $("[name='p_ans']").val(ans);

            document.nform1.submit();
            alert("�̺�Ʈ ���� �Ϸ�Ǿ����ϴ�\n �����մϴ�.");
            window.close();
        }
        sw=true
    }

    function showHide(tbl,classnm)
    {
        $(tbl).show();
        $(tbl).find("table").hide();
        $(".a10").show();
        $(classnm).show();
    }

    function hideShow1(tbl)
    {
        var r=$("#"+tbl).css("display");
        if(r=="none")
            $("#"+tbl).css("display","block");
        else
            $("#"+tbl).css("display","none");
    }
</script>

</head>

<body >
<form name="nform1" method="post" id="nform1" action="/servlet/controller.community.CommunityRiskServlet">
    <input type = "hidden" name = "p_process" value="eventInsert">
    <input type = "hidden" name = "p_ans" >
    <input type = "hidden" name = "p_userid" value="<%=v_userid%>">
    <input type = "hidden" name = "p_gubun_inja" value="<%=v_gubun%>">
<table width="650" border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto">
<tr>
<td><img src="/tmp/images/survey_img1.gif" width="650" height="130" /></td>
</tr>
<tr>
<td background="/tmp/images/survey_bg.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td width="50">&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">1) ���������� ���ɴ��?</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td width="20" valign="bottom"><input name="survey1" type="radio" value="0" /></td>
<td valign="bottom">�� 20��</td>
<td width="20" valign="bottom"><input name="survey1" type="radio" value="1" /></td>
<td valign="bottom">�� 30��</td>
<td width="20" valign="bottom"><input name="survey1" type="radio" value="2" /></td>
<td valign="bottom">�� 40��</td>
<td width="20" valign="bottom"><input name="survey1" type="radio" value="3" /></td>
<td width="60" valign="bottom">�� ��Ÿ</td>
</tr>
</table></td>
</tr>
</table></td>
<td width="50">&nbsp;</td>
</tr>
<tr>
<td height="30">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">2) ���������� ��������?</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td width="20"><input name="survey2" type="radio" value="0" /></td>
<td>�� ��۰��� ����</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey2" type="radio" value="1" /></td>
<td>�� ��ȭ���� ����</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey2" type="radio" value="2" /></td>
<td>�� ���Ӱ��� ����</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey2" type="radio" value="3" /></td>
<td>�� ��Ÿ (
<input name="survey2t" type="text" size="50" />
)</td>
</tr>
</table></td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">3) ���������� ���� �оߴ�?</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td width="20" valign="bottom"><input name="survey3" type="radio" value="0" /></td>
<td valign="bottom">�� ���</td>
<td width="20" valign="bottom"><input name="survey3" type="radio" value="1" /></td>
<td valign="bottom">�� ��ȭ</td>
<td width="20" valign="bottom"><input name="survey3" type="radio" value="2" /></td>
<td valign="bottom">�� ����</td>
<td width="20" valign="bottom"><input name="survey3" type="radio" value="3" /></td>
<td width="60" valign="bottom">�� ��Ÿ</td>
</tr>
</table></td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">4) ���̹���������ī���̿��� ������ �������?</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td width="20" valign="bottom"><input name="survey4" type="radio" value="0" /></td>
<td valign="bottom">�� 1~2����</td>
<td width="20" valign="bottom"><input name="survey4" type="radio" value="1" /></td>
<td valign="bottom">�� 3~5����</td>
<td width="20" valign="bottom"><input name="survey4" type="radio" value="2" /></td>
<td valign="bottom">�� 6���� �̻�</td>
<td width="20" valign="bottom"><input name="survey4" type="radio" value="3" /></td>
<td width="60" valign="bottom">�� ����</td>
</tr>
</table></td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">5) ���������� �������� ���̹���������ī���� �����Ͻ� ������?(�������ð���) <br /></span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td >�� ��ȭ �о� (���� ������ : <input name="survey5t1" type="text" id="survey5Text1" size="40" />)</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>�� ��� �о� (���� ������ :
<input name="survey5t2" type="text" id="survey5Text2" size="40" />
)</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>�� ���� �о� (���� ������ :
<input name="survey5t3" type="text" id="survey5Text3" size="40" />
)</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table></td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">6) ���̹���������ī���� ������ �����ϴµ� �־� ���� ����?</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td width="20"><input name="survey6" type="radio" value="0" /></td>
<td>�� ������ �پ���</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey6" type="radio" value="1" /></td>
<td>�� ���� ������ ������</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey6" type="radio" value="2" /></td>
<td>�� �ǹ��߽��� ���� ����</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey6" type="radio" value="3" /></td>
<td>�� �������� �����</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey6" type="radio" value="4" /></td>
<td>�� ��Ÿ�ǰ� (
<input name="survey6t" type="text" id="survey6Text1" size="50" />
)</td>
</tr>
</table></td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">7) ���̹���������ī���� ������ �����ϴµ� �־� ������ ����?</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td width="20"><input name="survey7" type="radio" value="0" /></td>
<td>�� �ӵ��� ����</td>
<td width="20"><input name="survey7" type="radio" value="1" /></td>
<td width="250">�� ���� ������ ������</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey7" type="radio" value="2" /></td>
<td>�� �ΰ��ڷ� ����</td>
<td><input name="survey7" type="radio" value="3" /></td>
<td>�� �ֽ�Ʈ���带 �ݿ��ϴ� ���� ����</td>
</tr>

</table></td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">8) ��ȭ������ �������� �ַ� ���� �ִ� �оߴ�?(�������ð���)</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td width="20"><input name="survey8" type="checkbox" value="0" /></td>
<td>�� ��ȹ/â�� �κ�</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey8" type="checkbox" value="1" /></td>
<td>�� ����/��� �κ�</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey8" type="checkbox" value="2" /></td>
<td>�� ����/������ �κ�</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey8" type="checkbox" value="3" /></td>
<td>�� ��Ÿ (
<input name="survey8t" type="text" id="survey8Text1" size="50" />
)</td>
</tr>
</table></td>
</tr>
<tr>
  <td height="30">&nbsp;</td>
</tr>
<tr>
  <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td>&nbsp;</td>
      <td width="10"><img src="/tmp/images/survey_bul1.gif" width="6" height="6" /></td>
      <td><span class="style1">����</span></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td width="30">&nbsp;</td>
      <td>&nbsp;</td>
      <td> <strong><img src="/tmp/images/survey_bul2.gif" width="6" height="6" /> ��ȹ/â�� �κ� :</strong> �帣�� �����Ͽ� �������� ��ȹ,â��,��ʿ���,�����̷� �� �н��� ���� <br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ ��ȹ�η��� â�Ƿ°� ��ȹ���� ����Ű���� ��<br />
        <br />
        <strong><img src="/tmp/images/survey_bul2.gif" width="6" height="6" /> ����/��� �κ� : </strong>�������� �����ϱ� ���� �ʿ�� �ϴ� ���α׷�,������,�׷���,���� ��<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ǹ� ��ų�� ����Ű���� ��<br />
        <br />
        <strong><img src="/tmp/images/survey_bul2.gif" width="6" height="6" /> ������/���� �κ� : </strong>������ ��� ������ ���� �� �ؿ��� ������ ������,���� �� �ؿ� ��� <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ ���캽���ν� �� �帣�� ���� ü���� ���� �� ����ä���� <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ȯ�� ������ �� </td>
    </tr>
  </table></td>
</tr>

</table></td>
<td>&nbsp;</td>
</tr>

<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">9) ��ȭ������ �������� �ű� �������� ���ߵǾ����� �ϴ� �κ���?<br />
  &nbsp;&nbsp;&nbsp;&nbsp;(�������ð���)</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td width="20"><input name="survey9" type="checkbox" value="0" /></td>
<td>�� ��ȹ/â�� �κ�</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey9" type="checkbox" value="1" /></td>
<td>�� ����/��� �κ�</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey9" type="checkbox" value="2" /></td>
<td>�� ����/������ �κ�</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td valign="bottom">&nbsp;</td>
<td><input name="survey9" type="checkbox" value="3" /></td>
<td>�� ��Ÿ (
<input name="survey9t" type="text" id="survey9Text1" size="50" />
)</td>
</tr>
</table></td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">10) ��ȭ������ ������ �濵�Ϲ� �κп� �ش�Ǵ� ���� ���� �� �����Ǿ�����<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ϴ� ���´�?(�������ð���)</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
    <td>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="answer">
            <tr>
                <td>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                        <tr>
                            <td width="30" valign="bottom">&nbsp;</td>
                            <td valign="bottom"><span onclick="showHide($('#tbl1'),'.a10_1')" style="cursor:pointer">�� ��ȭ�������濵</span></td>
                            <td valign="bottom"><span onclick="showHide($('#tbl1'),'.a10_2')" style="cursor:pointer">�� ��ȭ���������</span></td>
                            <td width="120" valign="bottom"><span onclick="showHide('#tbl1','.a10_3')" style="cursor:pointer">�� �������Թ�</span></td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
              <td height="15px"></td>
            </tr>
            <tr id="tbl1" style="display:none">
              <td height="15px">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="a10">
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="40">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="a10">
                    <tr>
                      <td width="50" height="2" bgcolor="#2B599B"></td>
                      <td width="110" bgcolor="#FF9900"></td>
                      <td width="359" bgcolor="#666666"></td>
                      </tr>

                  </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                        <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                        <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_1" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="0" /></td>
                        <td width="100" style="padding:5px">��ȭ�� �濵�� ����</td>
                        <td style="padding:5px">��ȭ���� ������ �����Ͽ� �ڽ��� ������ ��ȭ������ �پ��ϳ� ����� ���ʷ� ������ �����濵�� ���� ���ߵ��� ���а� ������ �� �ֵ��� ��</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_1" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="1" /></td>
                        <td width="100" style="padding:5px">��ȭ������ �濵�� ����</td>
                        <td style="padding:5px">��ȭ������ ����� Ư���� ���캸�� �� Ư���� ���� ��ȭ������ ����� ������ ������</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="2" /></td>
                        <td width="100" style="padding:5px">��ȭ�ں��� ����</td>
                        <td style="padding:5px">���������ǰ� ����ȭ�Ǳ� ������ 1991��� �Ĺ� ���� �ѱ� ��ȭ�ں��� ���� ������ �ľ��ϰ� �׺����� ������</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="3" /></td>
                        <td width="100" style="padding:5px">��ȭ������ �о� �������� � ���� ������?</td>
                        <td style="padding:5px">��� ��ȭ�������� �������踦 ���ڸ��� �������ν� �������� �ν�ü�踦 �����ϰ�����</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="4" /></td>
                        <td width="100" style="padding:5px">����� ��ȭ�������� ����</td>
                        <td style="padding:5px">�������� ��ȭ������ ������ ���յ� ��ȭ������������ ���� ������ ����</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="5" /></td>
                        <td width="100" style="padding:5px">����ȭ�� ��ȭ������</td>
                        <td style="padding:5px">������ �ô��Ȳ�� ��ȭ�� �ð����� �����ϰ� �ѱ� ��ȭ �Ǵ� �ѱ��� ��Ȱ���迡 ������ ��ȭ�������� �������� ��ȭ�� ��������� ��ȭ�Ը��� ��� �⿩�� �ִ��� �� ���ɼ��� ����غ�</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="6" /></td>
                        <td width="100" style="padding:5px">�츮 �ô븦 ��ǥ�ϴ� ��ȭ KeyWord</td>
                        <td style="padding:5px">Ű����� ǥ��� ��ȭ������ ���� ������ �ǹ̿� ������ �ǹ̸� ����ϰ� �����ϰ�, ���ư� �װ��� ������ �ѱ� ��ȸ���� � ������ ǥ��ǰ� �ִ��� �˾ƺ�</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="7" /></td>
                        <td width="100" style="padding:5px">�귣��� ��ȭ�������� ����</td>
                        <td style="padding:5px">��ȭ,����,��ȭ �� �پ��� �й� �����ڵ��� �� ���� �о翡�� �ۺ� ������ ���丮�� ã�� ���� �װ��� ������ȭ�ϴ� ��ȿ� ���� ��ü���� ���̵� ������</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="8" /></td>
                        <td width="100" style="padding:5px">������ȭ�� ��ȭ ������</td>
                        <td style="padding:5px">�ѱ����乮ȭ���ڴ��� ������ ���� ���� �پ��� ������ȭ ������ ������ ���� ������� ���� �����ڵ��� ����, ������ȭ �������� ������ �ִ� �Ϲ� �н��ڵ�� ������</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="9" /></td>
                        <td width="100" style="padding:5px">�������θ�Ʈ ����� ����</td>
                        <td style="padding:5px">������ �������� '�ູ���'���μ� �������θ�Ʈ����� �ٶ󺸱� ���� �õ��� ����ϰ�, �� ���ư� �������θ�Ʈ����� ������ ���� �ٺ����� ����å�� ������</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_3" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="10" /></td>
                        <td width="100" style="padding:5px">��ȭ ������ ������</td>
                        <td style="padding:5px">��ȭ�������� �����ϰ� �ִ� ���� ������ ��ȭ�� ���빰��� ����� �߸�ǰ���� ���� �����ϴ� ����� ������</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_3" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey10" type="checkbox" value="11" /></td>
                        <td width="100" style="padding:5px">��ȭ����</td>
                        <td style="padding:5px">��ȭ������ ���ǿ��� ��ȭ������ ��������, ��ȭ������ ����� ���� ��ȭ������ �Ƿʸ� �������鼭 ��ȭ�����̶�� ���ο� �帣�� ������ �˱� ���� ����ְ� �����ϰ��� ��</td>
                      </tr>
                    </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="a10">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td height="15px"></td>
            </tr>
        </table>    </td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">11) ��ȭ������ ������ ��ȹ/â�� �κп� �ش�Ǵ� ���� ���� �� �����Ǿ�����<br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ϴ� ���´�?(�������ð���)</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
            <tr>
                <td width="30" valign="bottom">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl2')" style="cursor:pointer">�� ���� & �����ȹ</span></td>
            </tr>
            <tr id="tbl2" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="0" /></td>
                          <td width="100" style="padding:5px">������ �ǹ��� ������ȹ</td>
                          <td style="padding:5px">���������濵�� ó�� ���� �� �����ؾ� �� �⺻���� ������ ��ҵ��� ���� �������������� ��ʸ� ���� ���� ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="1" /></td>
                          <td width="100" style="padding:5px">�ѱ��� ������ ��ȭ������</td>
                          <td style="padding:5px">�츮���� ������ �پ��� ��� �� �о��� ���������� ��̷ο� �ð����� �ؼ��ϰ� ������ ��ġ�� �߽����� ���������� ������ ����</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="2" /></td>
                          <td width="100" style="padding:5px">���ذ� ������ �����</td>
                          <td style="padding:5px">������ ����� �̷�, ���� ������ ����, ������ ������ ����, ������ Ư�������� ���� �⺻���� ������ ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="3" /></td>
                          <td width="100" style="padding:5px">���� �Ŵ�����Ʈ</td>
                          <td style="padding:5px">���� ��ȭ������� ���忡�� �����ߴ� �������� ��ȹ ������ ü������ �̷����� ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="4" /></td>
                          <td width="100" style="padding:5px">���� ���� ��ȭ ������</td>
                          <td style="padding:5px">����� ���ͳ� Ȩ�������� ��Ÿ�� ����� Ŀ�´����̼� ������ �м��ϰ� �м��� ������ ī��,�̹���,����Ƽ��,�� ������ ����ȭ ��</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="30" valign="bottom" height="30px">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl3')" style="cursor:pointer">�� ���߹�ȭ</span></td>
            </tr>
            <tr id="tbl3" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="5" /></td>
                          <td width="100" style="padding:5px">���߹�ȭ�� ����</td>
                          <td style="padding:5px">��ȭ�� ���߹�ȭ�� ���Ͽ� ������ �����ϰ� �츮���� ���߹�ȭ ������ ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="6" /></td>
                          <td width="100" style="padding:5px">�� �ô��� Ʈ����� �ɸ��� ����</td>
                          <td style="padding:5px">�ں����� ��ǰ ������ ������ ���� ������ �ɸ��� �о</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="7" /></td>
                          <td width="100" style="padding:5px">��ȭ ��ť</td>
                          <td style="padding:5px">2006����� 2009����� �аԴ� �ѱ���ȸ������ ���߹�ȭ, ���Դ� ���߹�ȭ �о߿��� �Ͼ�� �ϵ��� �ٷ�</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="8" /></td>
                          <td width="100" style="padding:5px">���� �������� ���߿���</td>
                          <td style="padding:5px">��ȭ,����,���� ���� ���������� ���� �������� ���� ���� �� �ִ� ����� �Ұ���</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="30" valign="bottom" height="30px">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl4')" style="cursor:pointer">�� ����� ��ȹ</span></td>
            </tr>
            <tr id="tbl4" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="9" /></td>
                          <td width="100" style="padding:5px">����Ʈ ���� ��ȭ</td>
                          <td style="padding:5px">����Ʈ �� ��ǳ�� ���� ��ȭ�� ����� �Һ� �з����� ��ȭ�� ���� ��ȭ���忡 ��ġ�� ����¿� ���� ����</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="10" /></td>
                          <td width="100" style="padding:5px">����Ʈ�� ���� ��ȹ</td>
                          <td style="padding:5px">�ȵ���̵� ������ ��ȹ�ϱ� ���� �˾ƾ� �� �پ��� ���� ����</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="30" valign="bottom" height="30px">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl5')" style="cursor:pointer">�� ���丮�ڸ� & �ó������۹�</span></td>
            </tr>
            <tr id="tbl5" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="11" /></td>
                          <td width="100" style="padding:5px">��ȭ������ ���� ���丮�ڸ�</td>
                          <td style="padding:5px">��ȭ��� ���� �������� �������� �ִ� '�̾߱�� ��ȭ �������� ����'�� ���� �ٷ�</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="12" /></td>
                          <td width="100" style="padding:5px">��ȭ�� ���丮�ڸ�</td>
                          <td style="padding:5px">�پ��� ������ ��ȭ�������� �м��ϰ� ��ȭ��å�� ���캽���ν� ��ȭ�������� ������� ���� �� �ִ� â���� ���հ� ������ ���� �������� ��</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="13" /></td>
                          <td width="100" style="padding:5px">��ȹ�ڸ� ���� ���丮�ڸ�</td>
                          <td style="padding:5px">�츮���� �������� ����� �޾ƿ� ��ǰ���� ���� ��� ���忡 �ٷ� ������ �� �ִ� ��Ģ�� ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="14" /></td>
                          <td width="100" style="padding:5px">�۾��� ������ �Ǳ�</td>
                          <td style="padding:5px">�������� ������ �İ����̰� ������ ������� �۾��� ����� ����</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="15" /></td>
                          <td width="100" style="padding:5px">�۾��� ���</td>
                          <td style="padding:5px">�۾����� ������ ����� �Ұ���</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="16" /></td>
                          <td width="100" style="padding:5px">�ѱ��� �ó����� ����</td>
                          <td style="padding:5px">�츮������ ������ �´� �ó����� �۹��� �پ��� ���� ���� ��̷Ӱ� ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="30" valign="bottom" height="30px">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl6')" style="cursor:pointer">�� �ִϸ��̼� & �������θ�Ʈ ��ȹ</span></td>
            </tr>
            <tr id="tbl6" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="17" /></td>
                          <td width="100" style="padding:5px">�ѱ� �ִϸ��̼��� ����</td>
                          <td style="padding:5px">�ѱ� �ִϸ��̼��� ����� ���� ����� ��ü���� �������� �׸�. �̸� ���� �ѱ� �ִϸ��̼� ������ �帧�� �����ϸ鼭 ������ ������ �߽����� �ñ⸦ ������.</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="18" /></td>
                          <td width="100" style="padding:5px">�������θ�Ʈ ������ ��ȹ</td>
                          <td style="padding:5px">�������θ�Ʈ�� ������ ���� �������θ�Ʈ,������ �������θ�Ʈ,����ü�� �������θ�Ʈ�� ������ �پ��� ������ ���� ��ʸ� �Ұ���</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="30" valign="bottom" height="30px">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl7')" style="cursor:pointer">�� ��ȭ & ����</span></td>
            </tr>
            <tr id="tbl7" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="19" /></td>
                          <td width="100" style="padding:5px">��ȭ �׸� ����</td>
                          <td style="padding:5px">��ȭ�� ��� �����ȸ�� ������ ����. ��ȭ�� ��ü�� ������ �������� 13���� �׸��� ������ ��ȭ�� ��Ÿ�� �����ȸ�� ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="20" /></td>
                          <td width="100" style="padding:5px">�ĸ��� �ó׸� ������</td>
                          <td style="padding:5px">��ȭ �ĸ��� �Բ� ��� �� ���� �� �ִ� ��̸� ����. �ֱٿ� �ĸ����� �Ұ� �ִ� �ѱ� ��ȭ�� �� ���� �ٷ����</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="21" /></td>
                          <td width="100" style="padding:5px">ö�а� ���߰���</td>
                          <td style="padding:5px">1930��� ���� �ѱ��ε��� �νĿ� Ŀ�ٶ� ������ ��ģ ���߰��信 ���Ͽ� ö���� �ؼ��� �õ�</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="30" valign="bottom" height="30px">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl8')" style="cursor:pointer">�� ���� & ���� ��ȹ</span></td>
            </tr>
            <tr id="tbl8" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="22" /></td>
                          <td width="100" style="padding:5px">ü���� ���������� ��ȹ</td>
                          <td style="padding:5px">�������� ������ �θ��� ���ÿ� ���� ����ؾ��� ���� ����</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey11" type="checkbox" value="23" /></td>
                          <td width="100" style="padding:5px">���Ǳ�ȹ�� ����</td>
                          <td style="padding:5px">���ǻ��� ������������ ���� å�� ���� ������ ��� �ؾ� �ϴ��� �� ���� å�� ����� ���� ������ ��� �ؾ� ������ ���� ������ �˾ƺ�</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
        </table>    </td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">12) ��ȭ������ ������ ����/��� �κп� �ش�Ǵ� ���� ���� �� �����Ǿ����� <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ϴ� ���´�?(�������ð���)</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
            <tr>
                <td width="30" valign="bottom">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl9')" style="cursor:pointer">�� ��ȭ���(CT)</span></td>
            </tr>
            <tr id="tbl9" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey12" type="checkbox" value="0" /></td>
                          <td width="100" style="padding:5px">���б����ȭ��</td>
                          <td style="padding:5px">���б����ȭ�� ���� �̷��� Ž���� ��ġ�� �ʰ�, �װ��� ��.������ �Ϻα����� �����ڷῡ �ٰ��Ͽ� �м������� ���캽</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey12" type="checkbox" value="1" /></td>
                          <td width="100" style="padding:5px">��ȭ���(CT) ǥ��ȭ ��� ���</td>
                          <td style="padding:5px">��ȭ����� ���� ����� ���� �̷� ����</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="30" valign="bottom" height="30px">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl10')" style="cursor:pointer">�� �ִϸ��̼� ����</span></td>
            </tr>
            <tr id="tbl10" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey12" type="checkbox" value="2" /></td>
                          <td width="100" style="padding:5px">�߻��� ���� �ִϸ��̼� ����</td>
                          <td style="padding:5px">�������� ������ ��ȭ.�ִϸ��̼� ��ǰ ��� �ְ��� �ϼ����� ���� ��ǰ�� �߽�����, ��Ȳǥ���� �Ƹ�ȭ�� ���� ������ �ʴ� �̷а� ��� �м�</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
        </table>    </td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">13) ��ȭ������ ������ ����/������ �κп� �ش�Ǵ� ���� ���� �� <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����Ǿ����� �ϴ� ���´�?(�������ð���)</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
            <tr>
                <td width="30" valign="bottom">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl11')" style="cursor:pointer">�� ������ �Ϲ�</span></td>
            </tr>
            <tr id="tbl11" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey13" type="checkbox" value="0" /></td>
                          <td width="100" style="padding:5px">������ ������</td>
                          <td style="padding:5px">��ȭ������� Ȳ�ݴް��� �޺λ��� '������' �����ÿ� ���� �̾߱���, ������ ��ȭ���������� ���ҽ���Ƽ���� ������ ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey13" type="checkbox" value="1" /></td>
                          <td width="100" style="padding:5px">��ȭ����� ��ȭ������</td>
                          <td style="padding:5px">��� ��ȭ�������� ���信������ ���� ������ �����ϰ� �ϴ� ������������ ���� ��ȭ�������� �����ϰ� �ִ� ������� ��ʱ��� �پ��ϰ� ��Ƴ�</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey13" type="checkbox" value="2" /></td>
                          <td width="100" style="padding:5px">���� �߰��� ���</td>
                          <td style="padding:5px">�������� Ȯ���� ��� �� �̷� �������忡 ���� ���ظ� �Ƿ��ϸ� �������� �����ÿ� ���� �̾߱���</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="30" valign="bottom" height="30px">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl12')" style="cursor:pointer">�� �۷ι� ����Ͻ�</span></td>
            </tr>
            <tr id="tbl12" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey13" type="checkbox" value="3" /></td>
                          <td width="100" style="padding:5px">�۷��ù�ȭ�������� ����</td>
                          <td style="padding:5px">�������� ��ȭ������ ��ȹ�� ������ �̷��� ��븦 ������ �۷��ù�ȭ�� ���� �ؼ����̵�</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey13" type="checkbox" value="4" /></td>
                          <td width="100" style="padding:5px">�ƽþ� ��ȭ����</td>
                          <td style="padding:5px">�ƽþ� ��ȭ������ ���� �ƽþƶ�� '���� Ʋ' �ȿ� ������ ��ȭ��ġ���� ������� ���������� ����ϰ�, �̸� �غ��ϱ� ���� ��õ���� �������� ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey13" type="checkbox" value="5" /></td>
                          <td width="100" style="padding:5px">�̱� ���־� ������</td>
                          <td style="padding:5px">�̱� ������ ���־� ������ ����� �ٷ�
                            �Ҹ�(Retail) ������: �����,��ȭ��,������,���θ�,��ǰ��,���� ������
                            ��ȭ(Culture) ������: �ڹ���,�̼���,����,�Ÿ�,����,�̺�Ʈ �վ��Ϸ��� ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td width="30" valign="bottom" height="30px">&nbsp;</td>
                <td valign="bottom"><span onclick="hideShow1('tbl13')" style="cursor:pointer">�� �Ҽȳ�Ʈ��ũ & ���� & ��ȭ ������</span></td>
            </tr>
            <tr id="tbl13" style="display:none">
              <td>&nbsp;</td>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td class="table">���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="10">&nbsp;</td>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" height="2" bgcolor="#2B599B"></td>
                        <td width="110" bgcolor="#FF9900"></td>
                        <td width="359" bgcolor="#666666"></td>
                      </tr>
                    </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                          <td width="100" align="center" style="padding:5px"><strong>���¸�</strong></td>
                          <td align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#666666"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey13" type="checkbox" value="6" /></td>
                          <td width="100" style="padding:5px">�Ҽȳ�Ʈ��ũ�� �̷�����</td>
                          <td style="padding:5px">�Ҽȳ�Ʈ��ũ�� �����̸� �̸� ������� �� ����Ͻ��� ��� ������ �з������� �������� ���캸��, �̸� ���� �츮�� �̷��� ��� �������� ������</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" style="padding:4px">
                        <tr>
                          <td width="40" align="center" style="padding:5px"><input name="survey13" type="checkbox" value="7" /></td>
                          <td width="100" style="padding:5px">���� ������</td>
                          <td style="padding:5px">���� ������ �������� �߿��ϴٰ� �����Ǵ� ����, ����, ������ ������ Ȯ��, ���� '����'�� �Ҹ��� ���θ��,��α��� ������ �˾ƺ�</td>
                        </tr>
                      </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="30" height="1" bgcolor="#CCCCCC"></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
        </table>    </td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">14) �� �Ұ��� ���� �� �ܿ� ��ȭ������ ���� ���·� �ż��Ǿ����� �ϴ� <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ü���� ������?</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td valign="bottom">(
<input name="survey14t" type="text" id="survey14Text1" size="65" />
)</td>
</tr>
</table></td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><span class="question">15) ���� ������ �����ϰ� �� ������?</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
<tr>
<td width="30" valign="bottom">&nbsp;</td>
<td valign="bottom">(
<input name="survey15t" type="text" id="survey15Text1" size="65" />
)</td>
</tr>
</table></td>
</tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td align="center"><a href="javascript:gotoSubmit();" onfocus="this.blur();"><img src="/tmp/images/survey_but1.gif" width="109" height="30" border="0" /></a></td>
<td>&nbsp;</td>
</tr>
</table></td>
</tr>
<tr>
<td><img src="/tmp/images/survey_bottom.gif" width="650" height="20"/></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
</table>
</form>
</body>
</html>
<%}%>