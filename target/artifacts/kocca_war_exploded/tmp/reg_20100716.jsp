<%@ page import="com.credu.library.DataBox" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�ѱ���������ī����</title>
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
   
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type='text/javascript' src='/script/jquery.form.js'></script>
<script type="text/javascript" src="/script/jquery.ui.core.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script language="javascript" src="/script/mainscript.js"></script>
  

<style type="text/css">
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
    }
    .style1 {
        color: #333333;
        font-size: 12px;
        line-height: 15pt;
    }
    .style3 {
        color: #006699;
        font-weight: bold;
        font-size: 12px;
    }
.style4 {
	color: #666666;
	font-size: 12px;
}
    .style5 {color: #333333; font-size: 12px; line-height: 15pt; font-weight: bold;}
.style8 {color: #006699}
</style>

<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
    $(document).ready(function(){

    	window.resizeTo(700, 770);
		event_onload();    	



        $("#jobdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})

    });
    function chkab()
    {
        var r=$.trim($("[name='id']").val());
        if(r=="")
        {
            alert("���̵� �ݵ�� �Է� �ϼž� �մϴ�.");
            $("[name='id']").focus();
            return false;
        }

        r=$.trim($("[name='job']").val());
        if(r=="")
        {
            alert("ȸ����� �ݵ�� �Է� �ϼž� �մϴ�.");
            $("[name='job']").focus();
            return false;
        }

        r=$.trim($("[name='department']").val());
        if(r=="")
        {
            alert("�μ��� �ݵ�� �Է� �ϼž� �մϴ�.");
            $("[name='department']").focus();
            return false;
        }

        r=$.trim($("[name='position']").val());
        if(r=="")
        {
            alert("������ �ݵ�� �Է� �ϼž� �մϴ�.");
            $("[name='position']").focus();
            return false;
        }

        r=$.trim($("[name='jobdate']").val());
        if(r=="")
        {
            alert("������� �ݵ�� �Է� �ϼž� �մϴ�.");
            $("[name='jobdate']").focus();
            return false;
        }

        r=$.trim($("[name='people']").val());
        if(r=="")
        {
            alert("�λ����ڴ� �ݵ�� �Է� �ϼž� �մϴ�.");
            $("[name='people']").focus();
            return false;
        }

        if( att_idx < 1 )
        {
            alert("���������� ÷�� �ϼž� �մϴ�.");
            return false;
        }

/*
        r=$.trim($("[name='st3']").val());
        if(r=="")
        {
            alert("��ȭ��ȣ�� �ݵ�� �Է� �ϼž� �մϴ�.");
            $("[name='st3']").focus();
            return false;
        }

        r=$.trim($("[name='st4']").val());
        if(r=="")
        {
            alert("��ȭ��ȣ�� �ݵ�� �Է� �ϼž� �մϴ�.");
            $("[name='st4']").focus();
            return false;
        }
*/
        return true;
    }

    function insert()
    {
        if(!chkab())
            return;
       
        var r=$("[name='smsok']").attr("checked");
        if(!r)
        {
            alert("�������� ���� �� ��ǰ�߼� SMS ���� ���Ǹ� �ϼž� \n���� ���� �մϴ�.");
            return;
        }

        $("[name='p_smsok']").val(r);

        if(!confirm("�̺�Ʈ ���� �Ͻðڽ��ϱ�?"))
            return;

        document.form1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.form1.p_process.value = "reg20100716";
        document.form1.submit();
//        alert("�̺�Ʈ ���� �Ϸ�Ǿ����ϴ�\n �����մϴ�.");
        window.close();
        /*
        $("#form1").ajaxSubmit({
           url:'/servlet/controller.community.CommunityRiskServlet',
           type:'post',
            data:{p_smsok:r},
           success: function(ans){
               if(ans.indexOf("�߸���")>0)
               {
                   alert("����� �ѹ��� �����մϴ�\n �����մϴ�.")
               }
               else
               {
                   alert("�̺�Ʈ ���� �Ϸ�Ǿ����ϴ�\n �����մϴ�.");
                   window.close();
               }
            }
        });
        */
    }
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

//location.reload();

function get_cookie(Name) { 
	var search = Name + "="
    var returnvalue = "";

    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search)
	    if (offset != -1) { 
	        offset += search.length
	        end = document.cookie.indexOf(";", offset);
	        if (end == -1) end = document.cookie.length;
	            returnvalue=unescape(document.cookie.substring(offset, end))
	    }
	}
  return returnvalue;
}

function event_onload(){
	var cookiename=window.location.pathname
    var flag = eval(get_cookie(window.location.pathname));

    if(flag || flag == null){
        var cookievalue="false;"
        document.cookie=cookiename+"="+cookievalue;
        location.reload();
    } else {
        var cookievalue="true;"
        document.cookie=cookiename+"="+cookievalue;
    }
}


</SCRIPT>

<body onload="MM_preloadImages('/tmp/images/reg20100716/btn_ok_o.gif','/tmp/images/reg20100716/btn_cancel_o.gif')">
<form name="form1" method="post" id="form1" enctype = "multipart/form-data" action="/servlet/controller.community.CommunityRiskServlet">
    <input type = "hidden" name = "p_process" value="reg20100716">
    <input type = "hidden" name = "p_smsok" value="">

    <br>
        <table width="600" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style="margin:0 auto">
      <tr>
        <td align="center" bgcolor="#FFFFFF"><table width="500" border="0" cellpadding="0" cellspacing="1" style="margin:0 auto;">
          <tr>
            <td height="50" align="center" class="style3">���̹���������ī���� &quot;2012 ��� ���� �̺�Ʈ!!&quot;</td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#A2D2C9" class="board_write">
                <tr>
                  <td width="60" height="30" bgcolor="#F5FAFA" class="style5">���̵�</td>
                  <td colspan="3" align="left" bgcolor="#F5FAFA" class="style1"><input name="id" type="text" size="12" /></td>
                </tr>
                <tr>
                  <td height="30" bgcolor="#F5FAFA" class="style5">ȸ���</td>
                  <td colspan="3" align="left" bgcolor="#F5FAFA" class="style1"><input name="job" type="text" size="30" /></td>
                </tr>
                <tr>
                  <td height="30" bgcolor="#F5FAFA" class="style5">�μ�</td>
                  <td align="left" bgcolor="#F5FAFA" class="style1"><input name="department" type="text" size="12" /></td>
                  <td height="30" bgcolor="#F5FAFA" class="style5">����</td>
                  <td align="left" bgcolor="#F5FAFA" class="style1"><input name="position" type="text" size="12" /></td>
                </tr>
                <tr>
                  <td height="30" bgcolor="#F5FAFA" class="style5">�����</td>
                  <td align="left" bgcolor="#F5FAFA" class="style1"><input name="jobdate" id="jobdate" type="text" class="datepicker_input1" size="10"></td>
                  <td width="90" bgcolor="#F5FAFA" class="style5">�λ� �����</td>
                  <td align="left" bgcolor="#F5FAFA" class="style1"><input name="people" type="text" size="12" /></td>
                </tr>
                <!-- tr>
                  <td height="30" bgcolor="#F5FAFA" class="style5">�޴���</td>
                  <td colspan="3" align="left" bgcolor="#F5FAFA" class="style1"><select name="st1">
                      <option value="0">SKT</option>
                      <option value="1">KT</option>
                      <option value="2">LGT</option>
                    </select>
                      <select name="st2">
                        <option value="0">010</option>
                        <option value="1">011</option>
                        <option value="2">016</option>
                        <option value="3">017</option>
                        <option value="4">018</option>
                        <option value="5">019</option>
                      </select>
                    -
                    <input name="st3" type="text" size="8" maxLength="4" />
                    -
                    <input name="st4" type="text" size="8" maxLength="4" />
                    (�ش�÷�� ��ǥ �ȳ�) </td>
                </tr -->
                <tr>
                  <td height="30" bgcolor="#F5FAFA" class="style5">��������</td>
                  <td colspan="3" align="left" bgcolor="#F5FAFA" class="style1">
                  
                  <!-- ����÷�� ���� -->
		            <%
		            Vector i_realfileVector    = null;        // ���� ���ϸ�
		            Vector i_savefileVector    = null;        // ���� ���ϸ�
		            Vector i_fileseqVector     = null;         // ���� �Ϸù�ȣ
		            
		            int    i_fileLimit         = HomePageQnaBean.getFILE_LIMIT();             // ���� ÷�� ���ϼ�
		            
		            String i_formName          = "form1";                                    // Form �̸�
		            String i_ServletName       = "HomePageQNAServlet";                        // ���� ���� �̸�
		            String i_boardStyle        = "board_write";                               // �Է� ���̺� Class ��
		            %>
		            
		            <%@ include file="/learn/user/portal/include/multiAttach_event_include.jsp" %>
		          <!-- ����÷�� ���� -->
                  
                  </td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30" align="right"><span class="style4">�������� ���� �� ��ǰ�߼� SMS ���� ����</span>
                <input name="smsok" type="checkbox" /></td>
          </tr>
          <tr>
            <td height="20" align="right">&nbsp;</td>
          </tr>
          <tr>
            <td height="50" align="center">
              <span class="style1">�� ��Ȯ�� ��ǰ ������ ���Ͽ� ȸ�������� Ȯ�� �� �������ֽñ� �ٶ��ϴ�.
                <a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate&tem_grcode=N000001" target="_blank">
                                      ��������Ȯ��<!-- img src="/images/event/event_btn_01.gif" alt="������������" / -->
                </a> <br />
                            ȸ�������� �������� ���� ���� ���� �뵵�� ������� ������ ��ӵ帳�ϴ�. <br />
                            �����ε� ȸ�� �������� �������� ��ȣ�� �ּ��� ���ϰڽ��ϴ�. <br /><br />
                            ����ó : ���̹���������ī���� 02-2161-0077
              </span>
            </td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center"><a href="javascript:insert()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','/tmp/images/reg20100716/btn_ok_o.gif',1)"><img src="/tmp/images/reg20100716/btn_ok.gif" name="Image11" width="65" height="33" border="0" id="Image11" /></a>&nbsp;
                <a href="javascript:window.close()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','/tmp/images/reg20100716/btn_cancel_o.gif',1)"><img src="/tmp/images/reg20100716/btn_cancel.gif" name="Image21" width="65" height="33" border="0" id="Image21" /></a></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>

</form>
</body>
</html>