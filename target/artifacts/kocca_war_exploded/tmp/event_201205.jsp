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
<style>
* { font-family:"batang","dotum","arial","sans-self"; font-size:12px; color:#323232; overflow-x:hidden; overflow-y:auto; padding:0px; margin:0px; }
ul,ol,li { list-style:none; }
form { margin:0; padding:0; }
input[type='radio'] { margin:0px; padding:0px; }
.alignL { text-align:left; }
.alignC { text-align:center; }
.alignR { text-align:right; }

div#gudieline { width:660px; height:100%; margin:0 auto; border:1px solid #dddddd; padding:20px; }
div#gudieline div.pagetitle { text-align:center; }
div#gudieline div.indate { text-align:right; margin-top:10px; }
div#gudieline div.question { margin-top:40px; margin-bottom:10px; }
div#gudieline div.tip { margin-top:10px; margin-left:14px; color:#828282; }
div#gudieline ul.answer { width:660px; margin-left:14px; }
div#gudieline ul.answer li { float:left; padding-right:50px; margin-top:10px; color:#626262; position:relative; }
div#gudieline ul.answer li input[type='text'] { border:none; width:200px; color:#4f71b0; }
div#gudieline div.centerline { border-top:1px dotted #dddddd; margin-top:40px; }
div#gudieline table.rable { width:646px; margin-left:14px; border:2px solid #777777; border-collapse:collapse; }
div#gudieline table.rable th { height:30px; background-color:#888888; border:1px solid #777777; color:#ffffff; }
div#gudieline table.rable th.subject { color:#323232; background-color:#ffffff; }
div#gudieline table.rable td { text-align:center; border:1px solid #777777; height:24px; }
div#gudieline table.rable td.question { text-align:left; text-indent:5px; }
div#gudieline table.selectcourse { width:646px; margin-left:14px; border-bottom:1px solid #777777; border-top:1px solid #777777; }
div#gudieline table.selectcourse th { border-bottom:1px solid #777777; padding:5px 0px 5px 0px; }
div#gudieline table.selectcourse td { padding:5px 0px 5px 0px; }
div#gudieline div.groupname { font-weight:bold; margin:40px 0px 10px 14px; }
div#gudieline div.usermemo { margin:10px 0px 0px 14px; }
div#gudieline div.usermemo textarea { width:624px; height:60px; border:1px solid #dddddd; padding:10px; }
div#gudieline div.footer { margin-top:30px; margin-bottom:30px; text-align:center; }
div#gudieline div.footer input[type='submit'] { padding:10px 40px 10px 40px; width:300px; border:1px solid #323232; background-color:#626262; color:#ffffff; font-family:"gulim"; font-weight:bold; }
div#gudieline div.event { margin-left:14px; margin-top:40px; background-image:url('/tmp/images/event.gif'); background-repeat:no-repeat; width:644px; height:476px; border:1px solid #dddddd; }
</style>


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
        if(tmp=="6")
        {
            tmp=$("[name='survey2t']").val();
            if($.trim(tmp)=="")
            {
                alert("2�� ������ ��Ÿ�� �����Ͻø�  ���� �Է� �Ͽ� �ֽʽÿ�.");
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
            alert("4�� ���� ������� ��ü���� �������� ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
        // 555
        tmp=$("[name='survey5']:checked").val();
        if(tmp==undefined)
        {
            alert("�¶��� ���� ������ ���� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
        // 666
        tmp=$("[name='survey6']:checked").val();
        if(tmp==undefined)
        {
            alert("�¶��� ���� �������� �پ缺 ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 777
        tmp=$("[name='survey7']:checked").val();
        if(tmp==undefined)
        {
            alert("�¶��� ���� �������� ������ ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 888
        tmp=$("[name='survey8']:checked").val();
        if(tmp==undefined)
        {
            alert("�¶��� ���� �������� ������ ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 999
        tmp=$("[name='survey9']:checked").val();
        if(tmp==undefined)
        {
            alert("�н� ���� ���Ǽ�  ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 101010
        tmp=$("[name='survey10']:checked").val();
        if(tmp==undefined)
        {
            alert("������� ��ü���� ������ ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 11111
        tmp=$("[name='survey11']:checked").val();
        if(tmp==undefined)
        {
            alert("�н� ���� ����, ������� �� ȸ������ �ý��� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
        
     // 1212121
        tmp=$("[name='survey12']:checked").val();
        if(tmp==undefined)
        {
            alert("�� ���� ����� ģ���� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 1313131
        tmp=$("[name='survey13']:checked").val();
        if(tmp==undefined)
        {
            alert("�н� ���ǿ� ���� �亯�� �żӼ�����Ȯ�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 14
        tmp=$("[name='survey14']:checked").val();
        if(tmp==undefined)
        {
            alert("Ʃ�� Ȱ�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
       
        tmp="";
        // 15
        $("[name='survey15']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("6�� ��ۺо� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";
        
        
        tmp=$("[name='survey15t']").val();
        if(tmp=="")
        {
            alert("����ϴ� �ű԰����̿� ���� ���� �ʾҽ��ϴ�.");
            $("[name='survey15t']").focus();
            return;
        }
        ans+=tmp+",";

        tmp="";
        
        
        // 16
        $("[name='survey16']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("6�� ��ȭ������ �о�  ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";
        
        tmp=$("[name='survey16t']").val();
        if(tmp=="")
        {
            alert("����ϴ� �ű԰����̿� ���� ���� �ʾҽ��ϴ�.");
            $("[name='survey16t']").focus();
            return;
        }
        ans+=tmp+",";

        tmp="";
        
     // 17
        $("[name='survey17']").each(function(){
            if($(this).attr("checked"))
                tmp+=$(this).val()+"@";
        });
        if(tmp==undefined || tmp=="")
        {
            alert("6�� ���Ӻо� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp=tmp.substr(0,tmp.length-1);
        ans+=tmp+",";
        
        tmp=$("[name='survey17t']").val();
        if(tmp=="")
        {
            alert("����ϴ� �ű԰����̿� ���� ���� �ʾҽ��ϴ�.");
            $("[name='survey17t']").focus();
            return;
        }
        ans+=tmp+",";

        tmp="";
        
        // 18
        tmp=$("[name='survey18']:checked").val();
        if(tmp==undefined)
        {
            alert("��ǰ�� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp;
        
        
        

        if(!sw)
        {          
            $("[name='p_ans']").val(ans);

            document.nform1.submit();
            alert("������ ���� �Ǿ����ϴ�\n �����մϴ�.");
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
<div id="gudieline">
	<div class="pagetitle"><img src="/tmp/images/title.gif" alt="���̹���������ī���� ���� ���� ������ ����"></div>
	<div class="indate">�� ��������Ⱓ : 2012�� 5�� 24��(��) ~ 6�� 1��(��)</div>
	
	<div class="question">1. ���̹���������ī������ �¶��� ���� ���� ������ �� ���̽ʴϱ�?</div>
	<ul class="answer">
		<li><input name="survey1" type="radio" value="1"> �� ��</li>
		<li><input name="survey1" type="radio" value="2"> 1~2ȸ</li>
		<li><input name="survey1" type="radio" value="3"> 3~4ȸ</li>
		<li><input name="survey1" type="radio" value="4"> 5ȸ �̻�</li>
	</ul>
	
	<div class="question">2. ���̹���������ī���̸� ���ϰ� �� ������?</div>
	<ul class="answer">
		<li><input type="radio" name="survey2" value="1"> �������� Ư��</li>
		<li><input type="radio" name="survey2" value="2"> ���л���Ʈ �˻�</li>
		<li><input type="radio" name="survey2" value="3"> ��α� �� ī�� ȫ��</li>
		<li><input type="radio" name="survey2" value="4"> �Ź���� �� ��� ȫ��</li>
		<li><input type="radio" name="survey2" value="5"> ���� ����/���� ��õ</li>
		<li><input type="radio" name="survey2" value="6"> ��Ÿ ( <input type="text" name="survey2t"> )</li>
	</ul>
	
	<div class="question">3. ���̹���������ī���̿� ���� ��ü���� ��������?</div>
	<ul class="answer">
		<li><input type="radio" name="survey3" value="1"> �ſ츸��</li>
		<li><input type="radio" name="survey3" value="2"> ����</li>
		<li><input type="radio" name="survey3" value="3"> ����</li>
		<li><input type="radio" name="survey3" value="4"> �Ҹ�</li>
		<li><input type="radio" name="survey3" value="5"> �ſ�Ҹ�</li>
	</ul>
	
	<div class="question">4. ���̹���������ī���� �¶��� ���� �������� ���� ��������?</div>
	<table class="rable" cellpadding="0" cellspacing="0">
		<colgroup><col width="*"><col width="60"><col width="60"><col width="60"><col width="60"><col width="60"></colgroup>
		<tr>
			<th class="subject">����</th>
			<th>�ſ츸��</th>
			<th>����</th>
			<th>����</th>
			<th>�Ҹ�</th>
			<th>�ſ�Ҹ�</th>
		</tr>
		<tr>
			<td class="question">������� ��ü���� ������</td>
			<td><input type="radio" name="survey4" value="1"></td>
			<td><input type="radio" name="survey4" value="2"></td>
			<td><input type="radio" name="survey4" value="3"></td>
			<td><input type="radio" name="survey4" value="4"></td>
			<td><input type="radio" name="survey4" value="5"></td>
		</tr>
		<tr>
			<td class="question">�¶��� ���� ������ ���� (������, ���� ��)</td>
			<td><input type="radio" name="survey5" value="1"></td>
			<td><input type="radio" name="survey5" value="2"></td>
			<td><input type="radio" name="survey5" value="3"></td>
			<td><input type="radio" name="survey5" value="4"></td>
			<td><input type="radio" name="survey5" value="5"></td>
		</tr>
		<tr>
			<td class="question">�¶��� ���� �������� �پ缺</td>
			<td><input type="radio" name="survey6" value="1"></td>
			<td><input type="radio" name="survey6" value="2"></td>
			<td><input type="radio" name="survey6" value="3"></td>
			<td><input type="radio" name="survey6" value="4"></td>
			<td><input type="radio" name="survey6" value="5"></td>
		</tr>
		<tr>
			<td class="question">�¶��� ���� �������� ������</td>
			<td><input type="radio" name="survey7" value="1"></td>
			<td><input type="radio" name="survey7" value="2"></td>
			<td><input type="radio" name="survey7" value="3"></td>
			<td><input type="radio" name="survey7" value="4"></td>
			<td><input type="radio" name="survey7" value="5"></td>
		</tr>
		<tr>
			<td class="question">�¶��� ���� �������� ������</td>
			<td><input type="radio" name="survey8" value="1"></td>
			<td><input type="radio" name="survey8" value="2"></td>
			<td><input type="radio" name="survey8" value="3"></td>
			<td><input type="radio" name="survey8" value="4"></td>
			<td><input type="radio" name="survey8" value="5"></td>
		</tr>
		<tr>
			<td class="question">�н� ���� ���Ǽ� (����ȭ�� ����, ���� ��)</td>
			<td><input type="radio" name="survey9" value="1"></td>
			<td><input type="radio" name="survey9" value="2"></td>
			<td><input type="radio" name="survey9" value="3"></td>
			<td><input type="radio" name="survey9" value="4"></td>
			<td><input type="radio" name="survey9" value="5"></td>
		</tr>
	</table>
	
	<div class="question">5. ���̹���������ī������ ���� � ���񽺿� ���� ��������?</div>
	<table class="rable" cellpadding="0" cellspacing="0">
		<colgroup><col width="*"><col width="60"><col width="60"><col width="60"><col width="60"><col width="60"></colgroup>
		<tr>
			<th class="subject">����</th>
			<th>�ſ츸��</th>
			<th>����</th>
			<th>����</th>
			<th>�Ҹ�</th>
			<th>�ſ�Ҹ�</th>
		</tr>
		<tr>
			<td class="question">������� ��ü���� ������</td>
			<td><input type="radio" name="survey10" value="1"></td>
			<td><input type="radio" name="survey10" value="2"></td>
			<td><input type="radio" name="survey10" value="3"></td>
			<td><input type="radio" name="survey10" value="4"></td>
			<td><input type="radio" name="survey10" value="5"></td>
		</tr>
		<tr>
			<td class="question">�н� ���� ����, ������� �� ȸ������ �ý���</td>
			<td><input type="radio" name="survey11" value="1"></td>
			<td><input type="radio" name="survey11" value="2"></td>
			<td><input type="radio" name="survey11" value="3"></td>
			<td><input type="radio" name="survey11" value="4"></td>
			<td><input type="radio" name="survey11" value="5"></td>
		</tr>
		<tr>
			<td class="question">�� ���� ����� ģ����</td>
			<td><input type="radio" name="survey12" value="1"></td>
			<td><input type="radio" name="survey12" value="2"></td>
			<td><input type="radio" name="survey12" value="3"></td>
			<td><input type="radio" name="survey12" value="4"></td>
			<td><input type="radio" name="survey12" value="5"></td>
		</tr>
		<tr>
			<td class="question">�н� ���ǿ� ���� �亯�� �żӼ�����Ȯ��</td>
			<td><input type="radio" name="survey13" value="1"></td>
			<td><input type="radio" name="survey13" value="2"></td>
			<td><input type="radio" name="survey13" value="3"></td>
			<td><input type="radio" name="survey13" value="4"></td>
			<td><input type="radio" name="survey13" value="5"></td>
		</tr>
		<tr>
			<td class="question">Ʃ�� Ȱ��</td>
			<td><input type="radio" name="survey14" value="1"></td>
			<td><input type="radio" name="survey14" value="2"></td>
			<td><input type="radio" name="survey14" value="3"></td>
			<td><input type="radio" name="survey14" value="4"></td>
			<td><input type="radio" name="survey14" value="5"></td>
		</tr>
	</table>
	
	<div class="question">6. ���� ���̹���������ī���� �¶��� ���Ǹ� ���� �н��ϰ� ���� �о߿� ������ �ִٸ�?</div>
	<div class="tip">- �� ����Ʈ���� ���� <u>����ϴ� ���� 2��</u>�� üũ�� �ֽñ� �ٶ��ϴ�.</div>
	<div class="groupname"><��ۺо�></div>
	<table class="selectcourse" cellpadding="0" cellspacing="0">
		<colgroup><col width="30"><col width="293"><col width="30"><col width="*"></colgroup>
		<tr>
			<th colspan="4">����</th>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey15" value="1"></td>
			<td>DSLR�Կ� �ǹ�</td>
			<td class="alignC"><input type="checkbox" name="survey15" value="2"></td>
			<td>Edius ����</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey15" value="3"></td>
			<td>Qbase ����</td>
			<td class="alignC"><input type="checkbox" name="survey15" value="4"></td>
			<td>Protools ����</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey15" value="5"></td>
			<td>���� �ǹ�</td>
			<td class="alignC"></td>
			<td></td>
		</tr>
	</table>
		
	<div class="tip"><b>�� üũ����Ʈ�ʹ� ������ ������ ����ϴ� �ű԰����� �ִٸ� �ۼ��� �ּ���.<BR>
	&nbsp;&nbsp;&nbsp;������  "����"�̶�� �����ּ���.</b></BR></div>
	
	
	<div class="usermemo"><textarea name="survey15t"></textarea></div>
	
	<div class="groupname"><��ȭ������ �о�></div>
	<table class="selectcourse" cellpadding="0" cellspacing="0">
		<colgroup><col width="30"><col width="293"><col width="30"><col width="*"></colgroup>
		<tr>
			<th colspan="4">����</th>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey16" value="1"></td>
			<td>�̱������ ����</td>
			<td class="alignC"><input type="checkbox" name="survey16" value="2"></td>
			<td>K-POP������� �м�</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey16" value="3"></td>
			<td>����å ����/����/����</td>
			<td class="alignC"><input type="checkbox" name="survey16" value="4"></td>
			<td>�׸���ũ ��ȹ �� ��ʺм�</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey16" value="5"></td>
			<td>�۷ι� ��ȭ���� �м�</td>
			<td class="alignC"><input type="checkbox" name="survey16" value="6"></td>
			<td>�����ð���</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey16" value="7"></td>
			<td>�����Ͱ� �˾ƾ��� �ִϸ��̼� ���۰���</td>
			<td class="alignC"><input type="checkbox" name="survey16" value="8"></td>
			<td>��õ����¡ ��� ����/�ǹ�</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey16" value="9"></td>
			<td>���� ���ƾִϸ��̼� ���</td>
			<td class="alignC"><input type="checkbox" name="survey16" value="10"></td>
			<td>�ؿ� ������ �η� �缺����</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey16" value="11"></td>
			<td>��Ī �� pt��ų ��</td>
			<td class="alignC"><input type="checkbox" name="survey16" value="12"></td>
			<td>1�� ���ۼ� ����</td>
		</tr>
	</table>
	
	
	<div class="tip"><b>�� üũ����Ʈ�ʹ� ������ ������ ����ϴ� �ű԰����� �ִٸ� �ۼ��� �ּ���.<BR>
	&nbsp;&nbsp;&nbsp;������  "����"�̶�� �����ּ���.</b></BR></div>
	
	
	<div class="usermemo"><textarea name="survey16t"></textarea></div>
	
	<div class="groupname"><���Ӻо�></div>
	<table class="selectcourse" cellpadding="0" cellspacing="0">
		<colgroup><col width="30"><col width="293"><col width="30"><col width="*"></colgroup>
		<tr>
			<th colspan="2">�����</th>
			<th colspan="2">�����</th>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="1"></td>
			<td>�������� ����(����/��/�Ҽ�)</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="2"></td>
			<td>ĳ���� �ִϸ��̼� ����/���</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="3"></td>
			<td>���̺��ȹ</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="4"></td>
			<td>�� ã��</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="5"></td>
			<td>����UI �Ǵ� UX</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="6"></td>
			<td>Direct3D 11�� ���̴� 4.0</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="7"></td>
			<td>���Ӽ���(Ȯ���� ���)</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="8"></td>
			<td>������ ���� ����</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="9"></td>
			<td>��ũ��Ʈ���(�׼ǽ�ũ��Ʈ)</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="10"></td>
			<td>TCP/IP ä�ü��� �����</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="11"></td>
			<td>GFX�� Ȱ���� �����������̽� ����</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="12"></td>
			<td>P2P�� ���̰̽��� �����</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="13"></td>
			<td>���� �뷱�� ������(��ġ)</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="14"></td>
			<td>MySQL�� ���� DB�����غ���</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="15"></td>
			<td>������ �����</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="16"></td>
			<td>1000���� ĳ���� ����ȭ</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="17"></td>
			<td>���ӵ�ް� ���۱�</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="18"></td>
			<td>FPS ĳ���� ����ȭ</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="19"></td>
			<td>�����������̽�(GFX)</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="20"></td>
			<td>�����ý��� ����</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="21"></td>
			<td>��������Ʈ �ǹ����� ����</td>
			<td class="alignC"><input type="checkbox" name="survey17" value="22"></td>
			<td>Unity3D ���α׷���</td>
		</tr>
		<tr>
			<td class="alignC"><input type="checkbox" name="survey17" value="23"></td>
			<td>��� ���α׷���</td>
			<td class="alignC"></td>
			<td></td>
		</tr>
	</table>
	<div class="tip"><b>�� üũ����Ʈ�ʹ� ������ ������ ����ϴ� �ű԰����� �ִٸ� �ۼ��� �ּ���.<BR>
	&nbsp;&nbsp;&nbsp;������  "����"�̶�� �����ּ���.</b></BR></div>
	<div class="usermemo"><textarea name="survey17t"></textarea></div>
	<div class="event">
		<table style="width:100%; border-collapse:collapse; margin-top:316px;" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center"><input type="radio" style="margin-left:25px;" name="survey18" value="1"></td>
				<td align="center"><input type="radio" style="margin-right:25px;" name="survey18" value="2"></td>
			</tr>
		</table>
	</div>
	<div class="footer"><a href="javascript:gotoSubmit();" onfocus="this.blur();"><img src="/tmp/images/btn_upload.gif"  border="0" /></a></div>
</div>
</body>
</html>
<%}%>