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
<script type='text/javascript' src='http://edu.kocca.or.kr/script/jquery-1.3.2.min.js'></script>
<script type='text/javascript' src='http://edu.kocca.or.kr/script/jquery.form.js'></script>
<title>�ѱ���������ī����</title>

<style type="text/css">
<!--
.question {
	font-size: 14px;
	font-weight: bold;
	line-height: 20px;
	color: #ff6600;
}
.subquestion {
	font-size: 12px;
	font-weight: bold;
	line-height: 17px;
	padding-left: 16px
}
.answer {font-size: 14px}

table {
	font-size: 12px;
	line-height: 17px;
}
.style1 {
	font-size: 12px;
	font-weight: bold;
	line-height: 20px;
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

         // 1
        $("[name='survey1']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("1�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";

        tmp="";
        if($.trim($("[name='survey2t']").val())=="")
        {
            alert("2�� ������ �Է� �Ͽ� �ֽʽÿ�.");
            $("[name='survey2t']").focus();
            return;
        }
        tmp+=$("[name='survey2t']").val();
        ans+=tmp+",";

        tmp="";
        // 3
        $("[name='survey3']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("3�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";

        tmp="";
//        if($.trim($("[name='survey4t']").val())=="")
//        {
//            alert("4�� ������ �Է� �Ͽ� �ֽʽÿ�.");
//            $("[name='survey4t']").focus();
//            return;
//        }
        tmp+=$("[name='survey4t']").val();
        ans+=tmp;
        
        if(!sw)
        {
            $("[name='p_ans']").val(ans);

            document.nform1.submit();
            alert("�̺�Ʈ ���� �Ϸ�Ǿ����ϴ�\n �����մϴ�.");
            window.close();
        }
        sw=true
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
<td><img src="/tmp/images/survey_img10.gif" width="650" height="130" /></td>
</tr>
<tr>
<td background="/tmp/images/survey_bg.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>&nbsp;</td>
<td height="30" class="question">1. �ѱ������������������ ����(2011��)�� ������ �� �ִ� [����]���� ������ &nbsp;&nbsp;&nbsp;&nbsp;������ ������ �ֽ��ϴ�. </td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td width="50">&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="subquestion">1) ���� [����]���� ���� �߿��� ������ �ְų� �����ϰ� ���� ���¸� ������ �ֽñ� <br />&nbsp;&nbsp;&nbsp;&nbsp;�ٶ��ϴ�. ���� ����� ���� �켱 ������ �ξ�
   �����Ͽ� ���⿡ ���� �ϵ��� �ϰڽ�<br>&nbsp;&nbsp;&nbsp;&nbsp;�ϴ�.<br />
       <span class="style1">* ���� ������ �Ұ��� ���� ���Ͻô� ���Ǹ� ������ �ּ���.(���� ���� ����)</span></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#FF9900"></td>
              </tr>
</table>
  <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#CCCCCC">
    <tr>
      <td width="30" align="center" bgcolor="#FFFFFF"><strong>����</strong></td>
      <td width="89" align="center" bgcolor="#FFFFFF"><strong>���¸�</strong></td>
      <td width="139" align="center" bgcolor="#FFFFFF"><strong>���³���</strong></td>
      <td width="255" align="center" bgcolor="#FFFFFF"><strong>����</strong></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><input name="survey1" type="checkbox" value="0" /></td>
      <td bgcolor="#FFFFFF">������, �����е� �� ���� ����</td>
      <td bgcolor="#FFFFFF">������, �����е� �� ���� ���� ȯ���� ���� �� �ֽ� OS(4)�� ����� ���� ���۹�</td>
      <td rowspan="2" bgcolor="#FFFFFF">������, �ȵ���̵����� ������� �� ����Ʈ�� ������  ���ο� ������ â���ϴ� ��������
        �����ϰ� �Ǿ��� ����� �ִ� ���� �����ڰ�
        ����� ������ �� �ִ� ȯ���� �����Ǿ���. <br />
        �̷��� ���Ӱ��� ȯ���� ��ȭ�� �����Ͽ� ���� �������� ������� ���� ���� ���ӻ������� ���� �� ������ ��  �ֵ��� ���� ���� ������ 
        �¶��� �������� �����Ϸ� �Ѵ�. </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><input name="survey1" type="checkbox" value="1" /></td>
      <td bgcolor="#FFFFFF">�ȵ���̵����� ���� ����</td>
      <td bgcolor="#FFFFFF">�ȵ���̵����� ���� ���� ȯ�� ���� �� �ֽ� OS(2.2)�� ����� ���� ���۹�</td>
      </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><input name="survey1" type="checkbox" value="2" /></td>
      <td bgcolor="#FFFFFF">�Ҽ� ��Ʈ��ũ ����(SNG)<br />
        ��ȹ�� ����</td>
      <td bgcolor="#FFFFFF">�Ҽ� ��Ʈ��ũ ���� ���� Ư���� ���� ��ȹ ����
        ����� ���̿���, ����, ���̹� �� �پ���
        �÷����� ����� �Ҽ�
        ��Ʈ��ũ ���� ���۹�</td>
      <td bgcolor="#FFFFFF">�ֱ� ���������� �Ҽ� ��Ʈ��ũ ������ ũ��
        �α⸦ ��� �ִ� ��Ȳ���� ���� ���Ӱ��߻簡 ���ο�  ���忡 �մ����� �����ϰ� �ִ�. ���� ���� ���� ����迡���� ���� �����ڰ� ����
        ���� ��Ȳ������ �ż��ϰ�  �����ϰ� �ִ�. <br />
        ������ �Ҽ� ��Ʈ��ũ ���� ���߿� ����
        ���Ͽ찡 �������� �ʰ� �־� ���忡 �űԷ�
        �����ϰ���  �ϴ� �����ڴ� ������� ����
        ���ۿ� ���� �����̴�. �̷��� ���ӻ���� ���� ��ȭ�� �����Ͽ� ��ȹ ��  ���� ����� ����
        ����� ���� ���Ͽ츦 �¶��� ��������
        �����Ϸ� �Ѵ�. </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><input name="survey1" type="checkbox" value="3" /></td>
      <td bgcolor="#FFFFFF">���� ��ȹ �� �׷��� �ǹ��ڸ� ���� ���� ��� ����</td>
      <td bgcolor="#FFFFFF">������ ���� ����� ���� ��ȹ�ڿ� �׷���
        �ǹ��ڰ� �����ϱ� ������ ������ ������ ���� ���� �����  ����</td>
      <td bgcolor="#FFFFFF">��ȹ�ڿ� �׷��� �ǹ��ڴ� ������ ���� ����� ���� ����� �����ϰ� ���Ӱ��߿� �����ؾ�
        ������  ���α׷��� �� �˾ƾ� �Ѵٴ�
        �����庮���� ���� �׷��� ���� ��찡 ����. ���� ���α׷��� �ǽ���  ���ϴ� ���� �����
        �����ϴµ� ���� Ȯ���� ����̱� ������
        �ݵ�� �׷��� �ϴ� ���� �ƴϴ�. �׷���
        ���α׷��� ���������� ��� ���ؿ� ����
        �����庮�� ���߱� ���� ���� ����� ������
        ������ �¶��� �������� �����Ϸ� �Ѵ�. </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><input name="survey1" type="checkbox" value="4" /></td>
      <td bgcolor="#FFFFFF">UDK Ȱ�� ���</td>
      <td bgcolor="#FFFFFF">UDK�� Ȱ���Ͽ�
        ��ũ��Ʈ�� �� ������ ���� ���� ���� ���</td>
      <td bgcolor="#FFFFFF">���迡�� ���� ������ ����� ���ӿ��� ��
        �ϳ��� �𸮾� ������ ���� ��Ŷ�� UDK��
        ����� �����ʿ� ���� �� ���� ���߻� �� ����������� ���䰡 �����ϰ� �ִ�. ������ �̷��� UDK�� ������ ���� ���Ͽ찡 ���信 ����
        ũ��  �������� �ʰ� �ִ� ��Ȳ���� ���� �������� ���� �ɷ� ����� ���� UDK�� ���� ������ ������ �� �ִ�  ���Ͽ츦 �¶���
        �������� �����Ϸ� �Ѵ�. </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><input name="survey1" type="checkbox" value="5" /></td>
      <td bgcolor="#FFFFFF">���ӿ� ���� <br />
        ������ �м� <br />
        ���</td>
      <td bgcolor="#FFFFFF">���̴� ���α׷���, ���������̳� �� ���� �� �о� ���������� �ش� �о��� ���� ��Ҹ� �м��ϴ�
        ���Ͽ� �� ��� �Ұ�</td>
      <td bgcolor="#FFFFFF">���� �����̳� �� �� �о� ���������� ������ ������ �� ���� ������ �����Ͽ� ��������
        ������  �����ϰ� �Ѵ�. �̷��� �� �о�
        ���������� �ʺ��ڿ� �ٸ��� �ش� �о��� ���� ����, ���� ���̵� �� �ϼ���, ����� ����
        ������ ���������� �м��� ��  �ִ� �ɷ���
        �ִ�. �̷��� �� �о� ���������� �м� ���Ͽ츦 �����Ͽ� ������ ���� �����ϰ� �м��ϴ�
        ����� �¶��� �������� �����Ϸ� �Ѵ�.</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><input name="survey1" type="checkbox" value="6" /></td>
      <td bgcolor="#FFFFFF">���� �ɸ���</td>
      <td bgcolor="#FFFFFF">������ ������ ��
        ����ؾ� �ϴ� �ɸ����� �̷��� ���� ������
        ������ �ϴ� �ɸ����� ��� �Ұ�</td>
      <td bgcolor="#FFFFFF">��κ��� ���� �����ڴ� �÷��̾��� �ɸ���
        ������ �����Ͽ� ������ �������Ѵ�. ����
        �÷��̾��� �ɸ� ������ ���� ���� �ɸ����� ������ Ȱ���ϰ� ���� �������� ��Ȯ�ϰ�
        ������ �̷��� �幮  ���̴�. ���� ����
        �����ڰ� ���� �÷��̾��� �ɸ� ������ �����ϴ� �̷��� �ٰŸ� �˰� �ִٸ� ���� ����ִ�  ������ ������ �� �ִٰ� �Ǵ��Ͽ� �̷��� ���Ӱ��߰� ���õ� �ɸ����� ������
        �¶��� �������� �����Ϸ� �Ѵ�.</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><input name="survey1" type="checkbox" value="7" /></td>
      <td bgcolor="#FFFFFF">GFX�� �����������̽� ���۹��</td>
      <td bgcolor="#FFFFFF">GFX�� ���� �������̽��� �����ϴ� ��� �Ұ�</td>
      <td bgcolor="#FFFFFF">GFX�� ��� �÷��ÿ� �Ϻ��ϰ� �����ȴٴ� �������� �� ���������� ���� ������
        �������̽� ���� �̵����  �� �ϳ��̴�. Ư�� �÷����� �׼� ��ũ��Ʈ������ �������̽��� ������ �� �־� ���������� ���� ���� ���߻簡 GFX�� �����ߴ�. �̷��� GFX��  ���� ���� ���Ͽ츦 �����ϱ� ���� �¶��� ��������
        �����Ϸ� �Ѵ�.</td>
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
<td><strong>2) ��Ÿ �ǰ�</strong></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
  <tr>
    <td width="30" valign="bottom">&nbsp;</td>
    <td valign="bottom">(
      <input name="survey2t" type="text" id="survey12Text" size="65" />
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
    <td><span class="question">2. ���� [����] ���� ������ ������ ���� �ǰ� �ִ� �����Դϴ�. </span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table border="0" cellpadding="0" cellspacing="0" width="100%" class="answer">


      <tr>
        <td height="15px"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="a10">
          <tr>
            <td class="table"><p class="subquestion">1) ���� �߿��� �����ؾ� �Ѵٰų� �����ؾ� �Ѵٰ� �����Ͻô� ���¸� �������ֽñ�<br />
&nbsp;&nbsp;&nbsp;              �ٶ��ϴ�.              (����  ���� ����)</p></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="a10">
              <tr>
                <td bgcolor="#FF9900"></td>
              </tr>
            </table>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><strong>����</strong></td>
                        <td width="111" align="center" style="padding:5px"><strong>���¸�</strong></td>
                        <td width="399" align="center" style="padding:5px"><strong>����Ұ�</strong></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#666666"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_1" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="0" /></td>
                        <td width="110" style="padding:5px">���̵�� �߻�</td>
                        <td style="padding:5px">â�۰� ���̵�� ���ߴɷ�, ���� �� �������θ�Ʈ �����ȹ��<br>�ۼ��ɷ�, ���������̼� �ɷ°� �����  ��ȯ�� �߻� ���</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_1" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="1" /></td>
                        <td width="110" style="padding:5px">3D Max �����ϱ�</td>
                        <td style="padding:5px">3D Max�� ������ҿ� �ֿ� ��ɵ鿡 ���� ���ظ� ��������<br>��������  ��� ��� ���</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="2" /></td>
                        <td width="110" style="padding:5px">3D �׷��� ���� <br />
                          �ǹ�</td>
                        <td style="padding:5px">3D Max�� ���� 3D �׷���  ���۰����� �ֿ� ����Ʈ �Ұ�</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="3" /></td>
                        <td width="110" style="padding:5px">3D ���α׷���1</td>
                        <td style="padding:5px">3D ���α׷����� �ϱ� ���� ���ʿ��� ���п� ���� �Ұ�</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="4" /></td>
                        <td width="110" style="padding:5px">���Ӽ���</td>
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
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="5" /></td>
                        <td width="110" style="padding:5px">DiretX1</td>
                        <td style="padding:5px">��ǻ�� ���ο� ���� ǥ���ϴ� ����� ó�� ���, ���߿� ����<br>���Ǵ� ������ ��������� ���� ����</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="6" /></td>
                        <td width="110" style="padding:5px">DiretX2</td>
                        <td style="padding:5px">���ð����� ������ �� �ִ� DiretX�� �⺻����� 2D ���ӱ׷��� ���</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="7" /></td>
                        <td width="110" style="padding:5px">���� ������1</td>
                        <td style="padding:5px">Direct3D�� ���� �⺻���� ����� 2D �׷��� ǥ������� ����<br>�׼ǰ���  ����</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="8" /></td>
                        <td width="110" style="padding:5px">���� ĳ���� <br />
                          ������1</td>
                        <td style="padding:5px">�������� ������ �ý��۰� ��ҵ��� �������ϴ�  ����� ���� ����<br>�۾��� ����</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_2" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="9" /></td>
                        <td width="110" style="padding:5px">���������α׷���</td>
                        <td style="padding:5px">ĳ���Ϳ� ĳ���͵������� ����� ĳ���͵������� �� �� ��ü�� ���� <br />
                          ���</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_3" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="10" /></td>
                        <td width="110" style="padding:5px">MOD �������� <br />
                          �� Ȱ��</td>
                        <td style="padding:5px">��������Ʈ ���� �����ϸ鼭 ���� �䱸������ �м� ���� �� ������ <br />
                          ���� ���� ������ ���� ����</td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="30" height="1" bgcolor="#CCCCCC"></td>
                      </tr>
                    </table>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table a10_3" style="padding:4px">
                      <tr>
                        <td width="40" align="center" style="padding:5px"><input name="survey3" type="checkbox" value="11" /></td>
                        <td width="110" style="padding:5px">��ȭ����</td>
                        <td style="padding:5px">MOD ���� ����, MOD ������  ������ �� �ֿ� ���, ���۰���<br>��� �� MOD ���ӿ� ����  �������� �Ұ�</td>
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
    </table></td>
  </tr>
</table></td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><strong>2) ��Ÿ �ǰ�</strong></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="answer">
  <tr>
    <td width="30" valign="bottom">&nbsp;</td>
    <td valign="bottom">(
      <input name="survey4t" type="text" id="survey4tyext1" size="65" />
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