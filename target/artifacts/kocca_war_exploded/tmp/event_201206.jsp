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
<title>KOCCA �ѱ���������ī���� - ��������</title>
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
div#gudieline div.indate { text-align:left; margin-top:30px; line-height:18px; border:1px solid #bbbbbb; padding:10px; }
div#gudieline div.msg { margin-top:10px; text-align:right; color:#d96620; }
div#gudieline div.grouptitle { font-size:16px; font-weight:bold; margin-top:40px; margin-bottom:-20px; }
div#gudieline div.question { margin-top:40px; margin-bottom:10px; margin-left:20px; line-height:18px; }
div#gudieline div.tip { padding:50px; font-size:16px; color:#525252; font-weight:bold; text-align:center; }
div#gudieline ul.answer { width:660px; margin-left:44px; }
div#gudieline ul.answer li { float:left; padding-right:50px; margin-top:10px; color:#626262; position:relative; }
div#gudieline ul.answer li input[type='text'] { border:none; width:200px; color:#4f71b0; border-bottom:1px dotted #bbbbbb; }
div#gudieline div.question input[type='text'].date { border:none; border-bottom:1px dotted #bbbbbb; width:40px; text-align:center; }
div#gudieline div.question input[type='text'].num { width:40px; text-align:center; border:0px; }
div#gudieline ul.answer li input[type='text'].typein { width:180px; text-align:center; border:none; border-bottom:1px dotted #bbbbbb; }
div#gudieline ul.answer li input[type='text'].long { width:560px; text-align:left; border:none; border-bottom:1px dotted #bbbbbb; }
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
div#gudieline div.usermemo textarea { margin-left:38px; width:540px; height:60px; border:1px solid #dddddd; padding:10px; font-family:"gulim"; }
div#gudieline div.footer { margin-bottom:30px; text-align:center; }
div#gudieline div.footer input[type='submit'] { padding:10px 40px 10px 40px; width:300px; border:1px solid #323232; background-color:#626262; color:#ffffff; font-family:"gulim"; font-weight:bold; }
div#gudieline div.event { margin-left:14px; margin-top:40px; background-image:url('images/event.gif'); background-repeat:no-repeat; width:644px; height:476px; border:1px solid #dddddd; }
div#gudieline table.inabout { width:660px; margin-top:20px; }
div#gudieline table.inabout th { border:1px solid #bbbbbb; background-color:#eeeeee; }
div#gudieline table.inabout td { border:1px solid #bbbbbb; padding-top:8px; padding-bottom:8px; }
div#gudieline table.inabout td input[type='text'] { width:90%; border:0px; padding-left:5px; }
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
    
        tmp=$("[name='survey1']").val();
        if(tmp=="")
        {
            alert("�̸��� �Է��Ͽ� �ֽýʽÿ�.");
            return;
        }
        ans=tmp+",";

        // 222
        tmp=$("[name='survey2']").val();
        if(tmp=="")
        {
            alert("�ڵ�����ȣ�� �Է��Ͽ� �ֽýʽÿ�.");
            return;
        }      
        ans+=tmp+","; 

        // 333
        tmp=$("[name='survey3']:checked").val();
        if(tmp==undefined)
        {
            alert("������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

         // 444
        tmp=$("[name='survey4']:checked").val();
        if(tmp==undefined)
        {
            alert("������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        if(tmp=="4")
        {
            tmp=$("[name='survey4t']").val();
            if($.trim(tmp)=="")
            {
                alert("������ ��Ÿ�� �����Ͻø�  ���� �Է� �Ͽ� �ֽʽÿ�.");
                $("[name='survey4t']").focus();
                return;
            }
        }
        ans+=tmp+",";
        
        
        // 555
        tmp=$("[name='survey5']").val();
        tmp1=$("[name='survey5t']").val();
        if(tmp=="" && tmp1=="")
        {
            alert(" �ش� �о� ��¿� ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        tmp+="@"+tmp1;
        ans+=tmp+",";
        
        // 666
        tmp=$("[name='survey6']:checked").val();
        if(tmp==undefined)
        {
            alert(" �¶��� ���� ���� ���迡 ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 777 ����
        //tmp=$("[name='survey7']").val();
        //if(tmp=="")
        //{
        //    alert("���̹� ������ ��ī���� �¶��� ���� ���� ���迡 ���� ���� �ʾҽ��ϴ�.");
        //    return;
        // }
        //ans+=tmp+",";
        
     // 888
        tmp=$("[name='survey8']:checked").val();
        if(tmp==undefined)
        {
            alert(" ���̹���������ī���̴� ���� ã�� �� �־��� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 999
        tmp=$("[name='survey9']:checked").val();
        if(tmp==undefined)
        {
            alert("������û�� �� �� ���� Ŀ���� ��� ���� ���� ���ؿ� ������ ���������� ���� ã�� �� �־���  ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 101010
        //tmp=$("[name='survey10']:checked").val();
        //if(tmp==undefined)
        //{
        //    alert("���� �����ϰ� �ִ� �Ǵ� �����ߴ� ���̹������� ���� Ŀ������ ���� ���� ���ؿ� ������ �����̴� ������ ���� ���� �ʾҽ��ϴ�.");
        //    return;
        //}
        //ans+=tmp+",";
        
     // 11111
        tmp=$("[name='survey11']:checked").val();
        if(tmp==undefined)
        {
            alert("���̹������� �ü��(����, � ���α׷� ��)�� �����Ǿ��ִ� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
        
     // 1212121
        tmp=$("[name='survey12']:checked").val();
        if(tmp==undefined)
        {
            alert("���̹������� �н��� ����ü��(Ʃ��, Q&A)�� ���Ҵ� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";
        
     // 1313131
        tmp=$("[name='survey13']:checked").val();
        if(tmp==undefined)
        {
            alert("���� ������ �о߸� �����ϰ� ���� ģ���鿡�� ���̹���������ī���̸� ���ϰ� �ʹ� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey17']").val();
        ans+=tmp+",";        
        
     // 14
        //tmp=$("[name='survey14']:checked").val();
        //if(tmp==undefined)
        //{
        //    alert("���̹���������ī���̴� ���� Ŀ����� �´� ��°����� ���� ���� ��θ� �������ְ� �־� ���ϴ� ������ ���� ���� �ʾҽ��ϴ�.");
        //    return;
        // }
        //ans+=tmp+",";

        //tmp=$("[name='survey15']:checked").val();
        //if(tmp==undefined)
        //{
        //    alert("���� �� ������ �о߸� �����ϰ� ���� ģ���鿡�� ���̹���������ī���̸� ���ϰ� �ʹ� ������ ���� ���� �ʾҽ��ϴ�.");
        //    return;
        //}
        //ans+=tmp+",";

        //tmp=$("[name='survey16']:checked").val();
        //if(tmp==undefined)
        //{
        //    alert("���� ���̹���������ī���� ������ ����Ʈ���� ������ �� �ִٸ� �������� �̼����� �� ������ �Ŷ�� �����Ѵ� ������ ���� ���� �ʾҽ��ϴ�.");
        //    return;
        // }
        //ans+=tmp+",";

        //tmp=$("[name='survey17']").val();
        //if(tmp=="")
        //{
        //    alert("���� ������ �о߸� �����ϰ� ���� ģ���鿡�� ���̹��������δ� ���̹���������ī���� �ܿ��� �̰��� ���ϰ� �ʹ� ������ ���� ���� �ʾҽ��ϴ�.");
        //    return;
        //}
        //ans+=tmp+",";

        tmp=$("[name='survey18']").val();
        if(tmp=="")
        {
            alert("�� ���������� �̼��ϸ� �̷��� ������ �־����� ���ڴ� ������ ���� ���� �ʾҽ��ϴ�.");
            return;
        }
        ans+=tmp+",";        
       
        
        tmp=$("[name='survey19']:checked").val();
        if(tmp==undefined)
        {
            alert("���̹���������ī������ ���������� ����������� �ֽ��� Ʈ����� ����� �ݿ��� ������̴�. ���� ���� �ʾҽ��ϴ�.");            
            return;
        }
        ans+=tmp+",";


        tmp=$("[name='survey20']:checked").val();
        if(tmp==undefined)
        {
            alert("���̹���������ī������ ���������� �����ϱⰡ ���� ������ ���� ���� �ʾҽ��ϴ�.");            
            return;
        }
        ans+=tmp+",";

        tmp=$("[name='survey21']:checked").val();
        if(tmp==undefined)
        {
            alert("���̹���������ī������ ���������� ���忡�� Ȱ���ϱⰡ �����ϴ� ������ ���� ���� �ʾҽ��ϴ�");            
            return;
        }
        ans+=tmp+",";
        

        tmp=$("[name='survey22']:checked").val();
        if(tmp==undefined)
        {
            alert("���̹���������ī���̴� �پ��� ������������ �����ϰ� �ִ� ������ ���� ���� �ʾҽ��ϴ�");            
            return;
        }
        ans+=tmp+",";

        tmp="";
        tmp=$("[name='survey23']").val();
        tmp1=$("[name='survey23t']").val(); 
        tmp2=$("[name='survey23tt']").val();         
        if(tmp=="")
        {        	
            alert("���̹���������ī���̿��� ���� �Ʒ��� ���� ������������ �����Ǿ����� ���ڴ� ������ ���� ���� �ʾҽ��ϴ�");            
            return;
        }
        tmp+="@"+tmp1+"@"+ tmp2;
        ans+=tmp+",";

        tmp=$("[name='survey24']").val();
        if(tmp=="")
        {
            alert("���̹������� ����ȯ�� ������ ���� �ǰ��� �����Ӱ� ����Ͽ� �ֽʽÿ� ������ ���� ���� �ʾҽ��ϴ�");            
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

<body>
<form name="nform1" method="post" id="nform1" action="/servlet/controller.community.CommunityRiskServlet">
    <input type = "hidden" name = "p_process" value="eventInsert">
    <input type = "hidden" name = "p_ans" >
    <input type = "hidden" name = "p_userid" value="<%=v_userid%>">
    <input type = "hidden" name = "p_gubun_inja" value="<%=v_gubun%>">    
    
 
<div id="gudieline">
	<div class="pagetitle"><img src="/tmp/images/title1.gif" alt="���̹���������ī���� ���� ���� ������ ����"></div>
	<div class="indate">
		�� ����� ���̹���������ī������ �н��ڵ��� ȿ�������� ���ο��� ������ ���������� ã��, ���� ����ְ� �н��ϸ�, 
		���忡���� Ȱ�뵵�� ���� ����ȯ���� �����ϱ� ���� �н��ڵ��� �������� ���̹�����ȯ�� ������ ���� �䱸�� ����, �����Կ� ������ �ֽ��ϴ�. 
		�� ������ ���� ������ ���� ��Ź�帳�ϴ�.
	</div>
	<table class="inabout" cellpadding="0" cellspacing="0">
		<colgroup><col width="100"><col width=""><col width="100"><col width=""></colgroup>
		<tr>
			<th>����</th>
			<td><input type="text" name="survey1"></td>
			<th>�ڵ�����ȣ</th>
			<td><input type="text" name="survey2"></td>
		</tr>
	</table>
	<div class="msg">�� �� ���翡 �����Ͻ� ��� ������ �����������θ� �̿�˴ϴ�.</div>
	
	<div class="centerline"></div>
	
	<div class="grouptitle">1. �н��� ����</div>
	<div class="question">Q1. ������ ������?</div>
	<ul class="answer">
		<li><input name="survey3" type="radio" value="1"> ��</li>
		<li><input name="survey3" type="radio" value="2"> ��</li>
	</ul>
	
	<div class="question">Q2. ������ ����(����) �оߴ�?</div>
	<ul class="answer">
		<li><input type="radio" name="survey4" value="1"> ��ۺо�</li>
		<li><input type="radio" name="survey4" value="2"> ���Ӻо�</li>
		<li><input type="radio" name="survey4" value="3"> ��ȭ�о� (��ȭ,ĳ����,����,��ȭ,�ִ� ���) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</li>
		<li><input type="radio" name="survey4" value="4"> ��Ÿ ( <input name="survey4t" type="text"> )</li>
	</ul>
	
	<div class="question">Q3. ������ �ش� �о� �����? &nbsp; &nbsp; <input type="text" name="survey5" class="date">�� &nbsp; &nbsp; <input name="survey5t" type="text" class="date">����</div>
	
	<div class="question">Q4. ���̹���������ī���� �¶��� ���� ���� ������ �� ���̽ʴϱ�?</div>
	<ul class="answer">
		<li><input type="radio" name="survey6" value="1"> 1ȸ</li>
		<li><input type="radio" name="survey6" value="2"> 2~3ȸ</li>
		<li><input type="radio" name="survey6" value="3"> 4ȸ �̻�</li>
	</ul>
		
	<div class="centerline"></div>
	
	<div class="grouptitle">2. ����� ����</div>
	<div class="question">Q1. ���󿡼� ���̹���������ī���̴� ���� ã�� �� �־���.</div>
	<ul class="answer">
		<li><input type="radio" name="survey8" value="1"> �ſ� �ƴϴ�</li>
		<li><input type="radio" name="survey8" value="2"> �ƴϴ�</li>
		<li><input type="radio" name="survey8" value="3"> ����</li>
		<li><input type="radio" name="survey8" value="4"> �׷���</li>
		<li><input type="radio" name="survey8" value="5"> �ſ� �׷���</li>
	</ul>
	
	<div class="question">Q2. ������û�� �� �� ���� Ŀ���� ��� ���� ���� ���ؿ� ������ ���������� ���� ã�� �� �־���.</div>
	<ul class="answer">
		<li><input type="radio" name="survey9" value="1"> �ſ� �ƴϴ�</li>
		<li><input type="radio" name="survey9" value="2"> �ƴϴ�</li>
		<li><input type="radio" name="survey9" value="3"> ����</li>
		<li><input type="radio" name="survey9" value="4"> �׷���</li>
		<li><input type="radio" name="survey9" value="5"> �ſ� �׷���</li>
	</ul>
	
	<div class="question">Q3. ���̹� ������ � ü��(����, � ���α׷� ��)�� �����Ǿ���.</div>
	<ul class="answer">
		<li><input type="radio" name="survey11" value="1"> �ſ� �ƴϴ�</li>
		<li><input type="radio" name="survey11" value="2"> �ƴϴ�</li>
		<li><input type="radio" name="survey11" value="3"> ����</li>
		<li><input type="radio" name="survey11" value="4"> �׷���</li>
		<li><input type="radio" name="survey11" value="5"> �ſ� �׷���</li>
	</ul>
	
	<div class="question">Q4. ���̹����� �н� �� ����ü��(Ʃ��, Q&A ��)�� ���Ҵ�.</div>
	<ul class="answer">
		<li><input type="radio" name="survey12" value="1"> �ſ� �ƴϴ�</li>
		<li><input type="radio" name="survey12" value="2"> �ƴϴ�</li>
		<li><input type="radio" name="survey12" value="3"> ����</li>
		<li><input type="radio" name="survey12" value="4"> �׷���</li>
		<li><input type="radio" name="survey12" value="5"> �ſ� �׷���</li>
	</ul>
	
	<div class="question">Q5. ���� ������ �о߸� �����ϰ� ���� ģ���鿡�� ���̹� ��������ī���̸� ���ϰ� �ʹ�.</div>
	<ul class="answer">
		<li><input type="radio" name="survey13" value="1"> �ſ� �ƴϴ�</li>
		<li><input type="radio" name="survey13" value="2"> �ƴϴ�</li>
		<li><input type="radio" name="survey13" value="3"> ����</li>
		<li><input type="radio" name="survey13" value="4"> �׷���</li>
		<li><input type="radio" name="survey13" value="5"> �ſ� �׷���</li>
	</ul>
	<ul class="answer">
		<li>�� ���� ������ �߰������� �� ��ī���� �ܿ� ģ���鿡�� ���ϰ� ���� �� �ٸ� ���̹������� ������ ������ ������� ����Ͽ� �ֽʽÿ�.</li>
	</ul>
	<ul class="answer">
		<li>( <input type="text" name="survey17" class="long"> )</li>
	</ul>
	
	<div class="question">Q6. �� ���������� �̼��ϸ� �̷��� ������ �־����� ���ڴ�.</div>
	<ul class="answer">
		<li>( <input type="text" name="survey18" class="long"> )</li>
	</ul>
	
	<div class="centerline"></div>
	
	<div class="grouptitle">3. ���������� ����</div>
	<div class="question">Q1. ���̹���������ī������ ���������� ����������� �ֽ��� Ʈ����� ����� �ݿ��� ������̴�.</div>
	<ul class="answer">
		<li><input type="radio" name="survey19" value="1"> �ſ� �ƴϴ�</li>
		<li><input type="radio" name="survey19" value="2"> �ƴϴ�</li>
		<li><input type="radio" name="survey19" value="3"> ����</li>
		<li><input type="radio" name="survey19" value="4"> �׷���</li>
		<li><input type="radio" name="survey19" value="5"> �ſ� �׷���</li>
	</ul>
	
	<div class="question">Q2. ���̹���������ī������ ���������� �����ϱⰡ ����.</div>
	<ul class="answer">
		<li><input type="radio" name="survey20" value="1"> �ſ� �ƴϴ�</li>
		<li><input type="radio" name="survey20" value="2"> �ƴϴ�</li>
		<li><input type="radio" name="survey20" value="3"> ����</li>
		<li><input type="radio" name="survey20" value="4"> �׷���</li>
		<li><input type="radio" name="survey20" value="5"> �ſ� �׷���</li>
	</ul>
	
	<div class="question">Q3. ���̹���������ī������ ���������� ���忡�� Ȱ���ϱⰡ �����ϴ�.</div>
	<ul class="answer">
		<li><input type="radio" name="survey21" value="1"> �ſ� �ƴϴ�</li>
		<li><input type="radio" name="survey21" value="2"> �ƴϴ�</li>
		<li><input type="radio" name="survey21" value="3"> ����</li>
		<li><input type="radio" name="survey21" value="4"> �׷���</li>
		<li><input type="radio" name="survey21" value="5"> �ſ� �׷���</li>
	</ul>
	
	<div class="question">Q4. ���̹���������ī���̴� �پ��� ������������ �����ϰ� �ִ�.</div>
	<ul class="answer">
		<li><input type="radio" name="survey22" value="1"> �ſ� �ƴϴ�</li>
		<li><input type="radio" name="survey22" value="2"> �ƴϴ�</li>
		<li><input type="radio" name="survey22" value="3"> ����</li>
		<li><input type="radio" name="survey22" value="4"> �׷���</li>
		<li><input type="radio" name="survey22" value="5"> �ſ� �׷���</li>
	</ul>
	
	<div class="question">Q5. ���̹���������ī���̿��� ���� �Ʒ��� ���� ������������ �����Ǿ����� ���ڴ�. (3����)</div>
	<ul class="answer">
		<li>( <input type="text" class="typein" name="survey23"> , <input type="text" name="survey23t" class="typein"> , <input type="text" name="survey23tt" class="typein"> )</li>
	</ul>
	
	<div class="question">Q6. ���̹������� ����ȯ�� ������ ���� �ǰ��� �����Ӱ� ����Ͽ� �ֽʽÿ�.</div>
	<ul class="answer">
		<li>( <input type="text" name="survey24" class="long"> )</li>
	</ul>

	<div class="tip">- �����մϴ� -</div>

	<div class="footer"><a href="javascript:gotoSubmit();" onfocus="this.blur();"><img src="/tmp/images/btn_confirm.gif" value="��������"></a></div>
</div>
</form>
</body>
</html>    
 
<%}%>