<%@ page contentType = "text/html;charset=euc-kr" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript" src = "/script/user_patch.js"></script>
<script language='javascript'>object_ScriptX();</script>
<!--object id=factory classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
codebase="/script/ScriptX.cab#Version=6,1,429,14">
</object-->

<style media="print">
.noprint     { display: none }
</style>

<script language="javascript">
var i = 0;
function window.onload()
{
  var temp_div;
  var units = document.body;

  temp_div ="<div id=idWait class=noprint style='visibility: hidden; position: absolute; ";
  temp_div+="left: 0px; top: 0px; width: 0px; height: 0px; background-color: lightyellow; ";
  temp_div+="color: darkred; font:bold 9pt Arial; border: thin inset threedface; padding: 40pt'>";
  temp_div+="<center><b>��ø� ��ٸ��ʽÿ�... <br>Print �غ����Դϴ�....</b></center>";
  temp_div+="</div>";

  units.innerHTML += temp_div;
}

function printFrame()
{

  function printExec()
  {
  	SpoolStatus(true);

    factory.printing.Print();

    switch ( typeof(onfinish) )
    {
      case "string":
        execScript(onfinish);
        break;
      case "function":
        onfinish();
    }

    SpoolStatus(false);

  }
  if ( printIsFiveO() ) printExec() // IE5 �̻�
  else factory.TimeOut(printExec);  // IE4 workaround

}

function printIsFiveO()
{
	var agent = window.navigator.userAgent;
	var i = agent.indexOf("MSIE ")+5;
	// MSIE 5 �̻��϶� true�� return
	return parseInt(agent.substring(i, i+1)) >= 5;
}

function SpoolStatus(start)
{
  if ( start ) {
    var width = document.body.clientWidth/3;
    var height = document.body.clientHeight/4;
    idWait.style.pixelWidth  = width;
    idWait.style.pixelHeight = height;
    idWait.style.pixelLeft   = document.body.scrollLeft + width;
    idWait.style.pixelTop    = document.body.scrollTop + height/2;
    idWait.style.visibility  = "visible";
  }
  else {

		alert("�μⰡ �Ϸ�Ǿ����ϴ�.");
    parent.window.close();
  }

}

function putSet(head, foot, top, bottom, left, right)
{
  with(factory.printing)
  {
    header		   = head;
    footer		   = foot;
    portrait	   = 1;
    topMargin	   = top;
    bottomMargin = bottom;
    leftMargin	 = left;
    rightMargin	 = right;
  }

  printFrame();

}

function doPrint()
{
	if ( i == 0 ) {
			putSet("", "", 0, 0, 0, 0);
			i++;
	}
// 	setInterval('Print();',6000);
}


</script>
</head>

<style type="text/css">
<!--
	.text1  {
		 font-family:����;
		 font-size:10pt;
		 color: #000000;
		 line-height: 120%;
	}
	.text1  A:link {color:#3366cc; text-decoration: none}
	.text1  A:visited {color:#009999; text-decoration: none}
	.text1  A:hover {color:#33ccff; text-decoration: none}

	.text2  {
		 font-family:�ü�;
		 font-size:12pt;
		 color: #000000;
		 line-height: 140%;
	}
	.text2  A:link {color:#000000; text-decoration: none}
	.text2  A:visited {color:#000000; text-decoration: none}
	.text2  A:hover {color:#33ccff; text-decoration: none}

  .blacktext {FONT-FAMILY:����,Arial; font-size: 11pt; font-weight:normal; color:#000000; line-height: 140%; text-decoration: bold}

-->
</style>
</head>
<body topmargin=0 leftmargin=0 >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><table width="680" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="40" align=right><br></td>
        </tr>
        <tr> 
          <td align=center><img src=/images/admin/hrd/training_pop.gif></td>
        </tr>
        <tr> 
          <td height=30></td>
        </tr>
        <tr> 
          <td><table width="680" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="402"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="1%"><img src=/images/admin/hrd/bullet.gif></td>
                      <td width="25%" class=sub_title>&nbsp;&nbsp;�Ʒñ���� :</td>
                      <td width="67%"></td>
                    </tr>
                    <tr> 
                      <td height="15">&nbsp;</td>
                      <td height="15">&nbsp;</td>
                      <td height="15">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="1%"><img src=/images/admin/hrd/bullet.gif></td>
                      <td width="25%" class=sub_title>&nbsp;&nbsp;�Ʒð����� :</td>
                      <td width="67%">&nbsp;</td>
                    </tr>
                  </table></td>
                <td align="right"> <table width="300" border="1" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="50" rowspan="2" align="center" bgcolor="F7F7F7" >����</td>
                      <td height="35" align="center" bgcolor="EAF4FD">���</td>
                      <td height="35" align="center" bgcolor="EAF4FD">����</td>
                      <td height="35" align="center" bgcolor="EAF4FD">����</td>
                    </tr>
                    <tr> 
                      <td height="70" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                      <td height="70" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                      <td height="70" align="center" bgcolor="#FFFFFF">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="1%"><img src=/images/admin/hrd/bullet.gif></td>
                <td width="12%"  class=sub_title>&nbsp;&nbsp;�Ʒ��� :</td>
                <td width="84%">200&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� /&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��)</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td><table width="680" border="1" cellspacing="0" cellpadding="0">
              <tr align="center">
                <td width="77" height="35" bgcolor="EAF4FD">����</td>
                <td width="78" height="35" align="right"> ��&nbsp;</td>
                <td width="75" height="35" bgcolor="EAF4FD">�⼮</td>
                <td width="78" height="35" align="right"> ��&nbsp;</td>
                <td width="79" height="35" bgcolor="EAF4FD">�Ἦ</td>
                <td width="78" height="35" align="right"> ��&nbsp;</td>
                <td width="77" height="35" bgcolor="EAF4FD">����</td>
                <td width="78" height="35" align="right"> ��&nbsp;</td>
                <td width="77" height="35" bgcolor="EAF4FD">����</td>
                <td width="78" height="35" align="right"> ��&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><table width="680" border="1" cellspacing="0" cellpadding="0">
              <tr align="center" bgcolor="EAF4FD"> 
                <td height="30" colspan=5>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
              </tr>
              <tr align="center" bgcolor="EAF4FD"> 
                <td width="50" height="40">����</td>
                <td width="160" height="40">�Ʒð���</td>
                <td width="123" height="40" bgcolor="EAF4FD">��米��</td>
                <td width="237" height="40">�Ʒó���</td>
                <td width="98" height="40">���<br>
                  (�����ڵ�) </td>
              </tr>
              <tr> 
                <td height="35" align="center">1</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td height="35" align="center">2</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td height="35" align="center">3</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td height="35" align="center">4</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td height="35" align="center">5</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td height="35" align="center">6</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td height="35" align="center">7</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td height="35" align="center">8</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
              </tr>
              <tr> 
                <td height="35" align="center">9</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
                <td height="35" align="center">&nbsp;</td>
              </tr>
            </table>
            <table width="680" border="1" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="30" colspan="2" align="center" bgcolor="EAF4FD">���û���</td>
                <td width="609" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="36" rowspan="4" align="center" bgcolor="F7F7F7">Ư<br>
                  ��<br>
                  ��<br>
                  �� </td>
                <td width="147" height="30" align="center" bgcolor="EAF4FD">������</td>
                <td height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td height="30" align="center" bgcolor="EAF4FD">�Ἦ��</td>
                <td height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td height="30" align="center" bgcolor="EAF4FD">������</td>
                <td height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td height="40" align="center" bgcolor="EAF4FD">��Ÿ����<br>
                  (���޻���,������ ��)</td>
                <td height="40">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr height=30><td>&nbsp;</td></tr>
</table>
</body>
</html>
