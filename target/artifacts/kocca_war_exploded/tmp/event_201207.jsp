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
        v_name   = dbox.getString("d_name");
        v_userid = dbox.getString("d_userid");
        v_chk    = dbox.getString("d_val");  //���� �ߴ��� ����
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>KOCCA �ѱ���������ī���� - �������丮</title>
<meta http-equiv="content-type" content="text/html;charset=euc-kr">
<meta http-equiv="Content-Style-Type" content="text/css">
<script type='text/javascript' src='http://edu.kocca.or.kr/script/jquery-1.3.2.min.js'></script>
<script type='text/javascript' src='http://edu.kocca.or.kr/script/jquery.form.js'></script>


<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
    var sw=false;
    function gotoSubmit()
    {
        var ans="";
        var tmp="";

        tmp=$("[name='survey1']:checked").val();
        if(tmp==undefined)
        {
            alert("1��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans=tmp+",";

        // 222
        tmp=$("[name='survey2']:checked").val();
        if(tmp==undefined)
        {
            alert("2��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey3']:checked").val();
        if(tmp==undefined)
        {
            alert("3��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey4']:checked").val();
        if(tmp==undefined)
        {
            alert("4��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey5']:checked").val();
        if(tmp==undefined)
        {
            alert("5��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey6']:checked").val();
        if(tmp==undefined)
        {
            alert("6��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey7']:checked").val();
        if(tmp==undefined)
        {
            alert("7��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey8']:checked").val();
        if(tmp==undefined)
        {
            alert("8��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey9']:checked").val();
        if(tmp==undefined)
        {
            alert("9��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey10']:checked").val();
        if(tmp==undefined)
        {
            alert("10��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey11']:checked").val();
        if(tmp==undefined)
        {
            alert("11��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey12']:checked").val();
        if(tmp==undefined)
        {
            alert("12��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey13']:checked").val();
        if(tmp==undefined)
        {
            alert("13��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey14']:checked").val();
        if(tmp==undefined)
        {
            alert("14��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey15']:checked").val();
        if(tmp==undefined)
        {
            alert("15��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey16']:checked").val();
        if(tmp==undefined)
        {
            alert("16��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey17']:checked").val();
        if(tmp==undefined)
        {
            alert("17��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey18']:checked").val();
        if(tmp==undefined)
        {
            alert("18��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey19']:checked").val();
        if(tmp==undefined)
        {
            alert("19��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey20']:checked").val();
        if(tmp==undefined)
        {
            alert("20��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey21']:checked").val();
        if(tmp==undefined)
        {
            alert("21��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey22']:checked").val();
        if(tmp==undefined)
        {
            alert("22��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey23']:checked").val();
        if(tmp==undefined)
        {
            alert("23��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey24']:checked").val();
        if(tmp==undefined)
        {
            alert("24��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey25']:checked").val();
        if(tmp==undefined)
        {
            alert("25��° ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";        
       
        // 18
        tmp=$("[name='survey26']:checked").val();
        if(tmp==undefined)
        {
            alert("26��° ������ ���� ���� �ʾҽ��ϴ�.");
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
div#gudieline div.question { margin-top:40px; margin-bottom:10px; font-weight:bold; font-size:14px; }
div#gudieline div.tip { margin-top:10px; margin-left:14px; color:#828282; }
div#gudieline ul.answer { width:660px; margin-left:14px; }
div#gudieline ul.answer li { float:left; padding-right:50px; margin-top:10px; color:#626262; position:relative; }
div#gudieline ul.answer li input[type='text'] { border:none; width:200px; color:#4f71b0; }
div#gudieline div.centerline { border-top:1px dotted #dddddd; margin-top:40px; }
div#gudieline table.rable { width:640px; margin-left:20px; border:2px solid #777777; border-collapse:collapse; }
div#gudieline table.rable th { height:30px; background-color:#888888; border:1px solid #777777; color:#ffffff; }
div#gudieline table.rable th.subject { color:#323232; background-color:#ffffff; }
div#gudieline table.rable td { text-align:center; border:1px solid #777777;  padding-top:6px; padding-bottom:6px; }
div#gudieline table.rable td.question { text-align:left; padding-left:5px; }
div#gudieline table.selectcourse { width:646px; margin-left:14px; border-bottom:1px solid #777777; border-top:1px solid #777777; }
div#gudieline table.selectcourse th { border-bottom:1px solid #777777; padding:5px 0px 5px 0px; }
div#gudieline table.selectcourse td { padding:5px 0px 5px 0px; }
div#gudieline div.groupname { font-weight:bold; margin:40px 0px 10px 14px; }
div#gudieline div.usermemo { margin:10px 0px 0px 14px; }
div#gudieline div.usermemo textarea { width:624px; height:60px; border:1px solid #dddddd; padding:10px; }
div#gudieline div.footer { margin-top:30px; margin-bottom:30px; text-align:center; }
div#gudieline div.footer input[type='submit'] { padding:10px 40px 10px 40px; width:300px; border:1px solid #323232; background-color:#626262; color:#ffffff; font-family:"gulim"; font-weight:bold; }
div#gudieline div.event { margin-left:14px; margin-top:40px; background-image:url('/tmp/images/event2.gif'); background-repeat:no-repeat; width:644px; height:476px; border:1px solid #dddddd; }
</style>

<body>
<form name="nform1" method="post" id="nform1" action="/servlet/controller.community.CommunityRiskServlet">
    <input type = "hidden" name = "p_process" value="eventInsert">
    <input type = "hidden" name = "p_ans" >
    <input type = "hidden" name = "p_userid" value="<%=v_userid%>">
    <input type = "hidden" name = "p_gubun_inja" value="<%=v_gubun%>">
<div id="gudieline">    
	<div class="pagetitle"><img src="/tmp/images/title2.gif" alt="���̹���������ī���� ���� ���� ������ ����"></div>
	<div class="indate">�� ��������Ⱓ : 2012�� 7�� 2��(��) ~ 7�� 15��(��)</div>
	
	<div class="question">1. �¶��� �������� �ι�</div>
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
			<td class="question">�н��� ���뿡 ������ �Ǵ°�?</td>				
			<td><input name="survey1" type="radio" value="1" ></td>
			<td><input name="survey1" type="radio" value="2" ></td>
			<td><input name="survey1" type="radio" value="3" ></td>
			<td><input name="survey1" type="radio" value="4" ></td>
			<td><input name="survey1" type="radio" value="5" ></td>			
		</tr>
		<tr>
			<td class="question">�پ��� ������������ �����ϰ� �ִ°�?</td>
			<td><input name="survey2" value="1"  type="radio"></td>
			<td><input name="survey2" value="2" type="radio"></td>
			<td><input name="survey2" value="3" type="radio"></td>
			<td><input name="survey2" value="4" type="radio"></td>
			<td><input name="survey2" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">����� ������ �ʿ��� ���İ� ���Ǵɷ��� ���߰� �ִ°�?</td>
			<td><input name="survey3" value="1" type="radio"></td>
			<td><input name="survey3" value="2" type="radio"></td>
			<td><input name="survey3" value="3" type="radio"></td>
			<td><input name="survey3" value="4" type="radio"></td>
			<td><input name="survey3" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�������� ���úо��� �������� �����Ǿ� �ִ°�?</td>
			<td><input name="survey4" value="1"  type="radio"></td>
			<td><input name="survey4" value="2" type="radio"></td>
			<td><input name="survey4" value="3" type="radio"></td>
			<td><input name="survey4" value="4" type="radio"></td>
			<td><input name="survey4" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�н����� �������䰡 �ݿ��Ǿ��°�?</td>
			<td><input name="survey5" value="1"  type="radio"></td>
			<td><input name="survey5" value="2" type="radio"></td>
			<td><input name="survey5" value="3" type="radio"></td>
			<td><input name="survey5" value="4" type="radio"></td>
			<td><input name="survey5" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�н����� �����䱸�� �ݿ��Ǿ��°�?</td>
			<td><input name="survey6" value="1" type="radio"></td>
			<td><input name="survey6" value="2" type="radio"></td>
			<td><input name="survey6" value="3" type="radio"></td>
			<td><input name="survey6" value="4" type="radio"></td>
			<td><input name="survey6" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�¶��� ������������ ���� �������� ��������?</td>
			<td><input name="survey7" value="1" type="radio"></td>
			<td><input name="survey7" value="2" type="radio"></td>
			<td><input name="survey7" value="3" type="radio"></td>
			<td><input name="survey7" value="4" type="radio"></td>
			<td><input name="survey7" value="5" type="radio"></td>
		</tr>
	</table>
	
	<div class="question">2. ����� ���� �ι�</div>
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
			<td class="question">�������� �� VOC�� ���� �ż��� ���밡 �̷�� ���°�?</td>
			<td><input name="survey8" value="1"  type="radio"></td>
			<td><input name="survey8" value="2" type="radio"></td>
			<td><input name="survey8" value="3" type="radio"></td>
			<td><input name="survey8" value="4" type="radio"></td>
			<td><input name="survey8" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">����, ���Ǵ亯, FAQ �� ����� ���Ǹ� ���� �޴��� �����ϰ� �ִ°�?</td>
			<td><input name="survey9" value="1" type="radio"></td>
			<td><input name="survey9" value="2" type="radio"></td>
			<td><input name="survey9" value="3" type="radio"></td>
			<td><input name="survey9" value="4" type="radio"></td>
			<td><input name="survey9" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�������� ������ �����ϰ� �亯�ϴ� �� �䱸������ �����Ϸ��� ����ϴ°�?</td>
			<td><input name="survey10" value="1" type="radio"></td>
			<td><input name="survey10" value="2" type="radio"></td>
			<td><input name="survey10" value="3" type="radio"></td>
			<td><input name="survey10" value="4" type="radio"></td>
			<td><input name="survey10" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">������� ���� �������� ��������?</td>
			<td><input name="survey11" value="1" type="radio"></td>
			<td><input name="survey11" value="2" type="radio"></td>
			<td><input name="survey11" value="3" type="radio"></td>
			<td><input name="survey11" value="4" type="radio"></td>
			<td><input name="survey11" value="5" type="radio"></td>
		</tr>
	</table>
	
	<div class="question">3. �������� � �ι�</div>
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
			<td class="question">����Ʈ�� ������� ���ʿ��� ���� ���� ���°�?</td>
			<td><input name="survey12" value="1" type="radio"></td>
			<td><input name="survey12" value="2" type="radio"></td>
			<td><input name="survey12" value="3" type="radio"></td>
			<td><input name="survey12" value="4" type="radio"></td>
			<td><input name="survey12" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">����, �������̵�, �н� �� ������ ������ �������ΰ�?</td>
			<td><input name="survey13" value="1" type="radio"></td>
			<td><input name="survey13" value="2" type="radio"></td>
			<td><input name="survey13" value="3" type="radio"></td>
			<td><input name="survey13" value="4" type="radio"></td>
			<td><input name="survey13" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">����Ʈ �޴��� ������ �����ϰ� ��ġ�Ǿ� �ִ°�?</td>
			<td><input name="survey14" value="1" type="radio"></td>
			<td><input name="survey14" value="2" type="radio"></td>
			<td><input name="survey14" value="3" type="radio"></td>
			<td><input name="survey14" value="4" type="radio"></td>
			<td><input name="survey14" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">���������� ���� �������� ��������?</td>
			<td><input name="survey15" value="1" type="radio"></td>
			<td><input name="survey15" value="2" type="radio"></td>
			<td><input name="survey15" value="3" type="radio"></td>
			<td><input name="survey15" value="4" type="radio"></td>
			<td><input name="survey15" value="5" type="radio"></td>
		</tr>
	</table>
	
	<div class="question">4. ���̹���������ī������ ��ȸ�� �⿩ �ι�</div>
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
			<td class="question">����Ʈ�� ����� �������� Ȱ������ �ʴ°�?</td>
			<td><input name="survey16" value="1" type="radio"></td>
			<td><input name="survey16" value="2" type="radio"></td>
			<td><input name="survey16" value="3" type="radio"></td>
			<td><input name="survey16" value="4" type="radio"></td>
			<td><input name="survey16" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">����������缺�� �⿩�ϴ°�?</td>
			<td><input name="survey17" value="1" type="radio"></td>
			<td><input name="survey17" value="2" type="radio"></td>
			<td><input name="survey17" value="3" type="radio"></td>
			<td><input name="survey17" value="4" type="radio"></td>
			<td><input name="survey17" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�������� ��ȣ�� ö���Ѱ�?</td>
			<td><input name="survey18" value="1" type="radio"></td>
			<td><input name="survey18" value="2" type="radio"></td>
			<td><input name="survey18" value="3" type="radio"></td>
			<td><input name="survey18" value="4" type="radio"></td>
			<td><input name="survey18" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�������� �����߱��� ���� �򰡴�?</td>
			<td><input name="survey19" value="1" type="radio"></td>
			<td><input name="survey19" value="2" type="radio"></td>
			<td><input name="survey19" value="3" type="radio"></td>
			<td><input name="survey19" value="4" type="radio"></td>
			<td><input name="survey19" value="5" type="radio"></td>
		</tr>
	</table>
	
	<div class="question">5. ���̹���������ī������ �귣�� �� �ι�</div>
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
			<td class="question">�¶��� �������񽺿� ���� ���������� �����ϴ°�?</td>
			<td><input name="survey20" value="1" type="radio"></td>
			<td><input name="survey20" value="2" type="radio"></td>
			<td><input name="survey20" value="3" type="radio"></td>
			<td><input name="survey20" value="4" type="radio"></td>
			<td><input name="survey20" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�н�ȿ���� �����ϴ°�?</td>
			<td><input name="survey21" value="1" type="radio"></td>
			<td><input name="survey21" value="2" type="radio"></td>
			<td><input name="survey21" value="3" type="radio"></td>
			<td><input name="survey21" value="4" type="radio"></td>
			<td><input name="survey21" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�������⿡ ���� �����ϴ°�?</td>
			<td><input name="survey22" value="1" type="radio"></td>
			<td><input name="survey22" value="2" type="radio"></td>
			<td><input name="survey22" value="3" type="radio"></td>
			<td><input name="survey22" value="4" type="radio"></td>
			<td><input name="survey22" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">���̹���������ī���̸� �ϰ� �����ϰڴ°�?</td>
			<td><input name="survey23" value="1" type="radio"></td>
			<td><input name="survey23" value="2" type="radio"></td>
			<td><input name="survey23" value="3" type="radio"></td>
			<td><input name="survey23" value="4" type="radio"></td>
			<td><input name="survey23" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">�ѱ�������������� �̹����� ������ �Ǵ°�?</td>
			<td><input name="survey24" value="1" type="radio"></td>
			<td><input name="survey24" value="2" type="radio"></td>
			<td><input name="survey24" value="3" type="radio"></td>
			<td><input name="survey24" value="4" type="radio"></td>
			<td><input name="survey24" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">������ ȯ��� �����ڵ鿡�� ������ �Ǵ°�?</td>
			<td><input name="survey25" value="1" type="radio"></td>
			<td><input name="survey25" value="2" type="radio"></td>
			<td><input name="survey25" value="3" type="radio"></td>
			<td><input name="survey25" value="4" type="radio"></td>
			<td><input name="survey25" value="5" type="radio"></td>
		</tr>
		<tr>
			<td class="question">���ѹα� ��������� ������ ������ �Ǵ°�?</td>
			<td><input name="survey26" value="1" type="radio"></td>
			<td><input name="survey26" value="2" type="radio"></td>
			<td><input name="survey26" value="3" type="radio"></td>
			<td><input name="survey26" value="4" type="radio"></td>
			<td><input name="survey26" value="5" type="radio"></td>
		</tr>
	</table>
	
	
	<div class="footer"><a href="javascript:gotoSubmit();" onfocus="this.blur();"><img src="/tmp/images/confirm2.gif" border="0" ></a></div>
</div>
</form>
</body>
</html>
<%}%>