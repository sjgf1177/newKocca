<%
//**********************************************************
//  1. ��      ��: ������û > ������û�ȳ�
//  2. ���α׷���: gu_ApplyIntro1.jsp
//  3. ��      ��: ������û�ȳ�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: 06.01.23
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","01");                       // �޴� ���̵� ����

    String  v_process		= box.getString("p_process");
	String  v_tem_grcode   = box.getSession("tem_grcode");
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
	<%@ include file="/learn/user/game/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<script language="JavaScript" type="text/JavaScript">
<!--

 function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

 function move(tab){
	document.form1.p_process.value= "SubjectIntro";
	document.form1.p_tab.value = tab;
	document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
	document.form1.submit();
 }

 function fPopup()  {
    NewWindow=window.open('/learn/user/game/course/gu_ApplyIntro1_Pop.html','popup','width=600,height=350,toobar=no,scrollbars=auto,menubar=no,status=no ,directories=no,');
  }


//-->

</script>

<form name="form1" method="post" enctype = "multipart/form-data">
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_tab'>


	<TABLE border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td>
		<% if(v_tem_grcode.equals("N000010")) {	//�������� %>
			<img src= "/images/user/game/course/type1/kyowon/img01.gif">
		<% } else { %>
			<img src= "/images/user/game/apply/img01.gif">
		<% } %>
		</td>
		</tr>
		<% if(!v_tem_grcode.equals("N000002")) {	//����Ʈ������ %>
		<tr>
		<td><img src= "/images/user/game/apply/img02_gp.gif"></td>
		</tr>
		<tr>
		<td><img src= "/images/user/game/apply/img03_gp.gif"></td>
		</tr>
		<% } else { %>
		<tr>
		<td><img src= "/images/user/game/apply/img02.gif"></td>
		</tr>
		<tr>
		<td>
			<TABLE border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td width="544">&nbsp;</td>
				<td><a href=# onclick="fPopup();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('/images/user/game/apply','','/images/user/game/apply/btn_.gif',1)"><img name="Image3" border="0" src="/images/user/game/apply/btn.gif"></a></td>
				<td width="28">&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr>
		<tr>
		<td><img src= "/images/user/game/apply/img03.gif"></td>
		</tr>
		<tr>
		<td><img src= "/images/user/game/apply/img04.gif"></td>
		</tr>
		<tr>
		<td><img src= "/images/user/game/apply/img05.gif"></td>
		</tr>
		<tr>
		<td><img src= "/images/user/game/apply/img06.gif"></td>
		</tr>
		<tr>
		<td><img src= "/images/user/game/apply/img07.gif"></td>
		</tr>
		<tr>
		<td><img src= "/images/user/game/apply/img08.gif"></td>
		</tr>
		<tr>
		<td><img src= "/images/user/game/apply/img09.gif"></td>
		</tr>
		<% } %>
	</table>

<!--table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" align="right"  background="/images/user/game/apply/<%=tem_subimgpath%>/title01.gif" class="location" ><img src="/images/user/game/common/location_bl.gif">
      HOME > ������û > ������û�ȳ�</td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
</table>
<//-- �� --//>
<table width="719" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="719" align="right"><img src="/images/user/game/apply/tab_g01_on.gif"><a href="javascript:move(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','/images/user/game/apply/tab_g02_on.gif',1)"><img src="/images/user/game/apply/tab_g02.gif" name="Image5" border="0"></a></td>
  </tr>
</table>
<table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/apply/gbox_bg.gif">
  <tr>
    <td><img src="/images/user/game/apply/gbox_top.gif"></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/user/game/apply/st_applyguide1.gif"></td>
        </tr>
        <tr>
          <td height="9"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="tbl_menualtext" >1. ������û�޴�����</td>
        </tr>
        <tr>
          <td height="2"></td>
        </tr>
        <tr>
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10"></td>
        </tr>
        <tr>
          <td class="tbl_gleft">������û�ϰ��� �ϴ� ���������� �����ϰ� ���ϴ� ���¸� Ȯ���� �� ��󼼺��� ��ư��
            Ŭ���մϴ�.</td>
        </tr>
        <tr>
          <td height="5"></td>
        </tr>
        <tr>
          <td align="center" valign="top"><img src="/images/user/game/apply/guide_img1.gif"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="tbl_menualtext" >2. ������ ������ �������� Ȯ���� �Ŀ� ��û��ư�� Ŭ���ϼ���.(<strong>�������</strong>)</td>
        </tr>
        <tr>
          <td height="2"></td>
        </tr>
        <tr>
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10"></td>
        </tr>
        <tr>
          <td class="tbl_gleft"><strong>�������</strong>�� ���� ���û�� ������ �ٷ� ������ûȮ��
            ������ ��Ÿ���� Ȯ���ϸ� ��û�� ��� �̷�� ���ϴ�.</td>
        </tr>
        <tr>
          <td height="5"></td>
        </tr>
        <tr>
          <td align="center" valign="top"><img src="/images/user/game/apply/guide_img2.gif"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="tbl_menualtext" >3. ������ ������ �������� Ȯ���� �Ŀ� ��û��ư�� Ŭ���ϼ���.(<strong>�������</strong>)</td>
        </tr>
        <tr>
          <td height="2"></td>
        </tr>
        <tr>
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="tbl_gleft"><strong>�������</strong>�� ���û�� ������ ��û�ϴ� ������ �� ������
            ������ �ϴܿ��� ����ȭ���� ��ϴ�. </td>
        </tr>
        <tr>
          <td height="5"></td>
        </tr>
        <tr>
          <td align="center" valign="top"><img src="/images/user/game/apply/guide_img3.gif"></td>
        </tr>
        <tr>
          <td class="tbl_gleft">�� ���ϸ����� �����ϰ� ������ �ش��ѵ� ������ ���ϸ����� �����Ḧ �Ϻ� ���� �Ͻ�
            �� �ֽ��ϴ�.<br>
            ����ϴ� ���� ���¸� Ŭ���մϴ�.</td>
        </tr>
        <tr>
          <td height="5"></td>
        </tr>
        <tr>
          <td align="center" valign="top"><img src="/images/user/game/apply/guide_img4.gif"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="tbl_menualtext" >4. ���ݰ��� Ŭ���� ����ó�� �˾�â�� ��ϴ�. ������ ���� Ȯ���� ������
            ������û�� �Ϸ�˴ϴ�.</td>
        </tr>
        <tr>
          <td height="2"></td>
        </tr>
        <tr>
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="10"></td>
        </tr>
        <tr>
          <td class="tbl_gleft">�Ա��ڶ��� �Ա��� ������ ���� <strong>�Ա��� ������</strong>�� ��Ȯ�ϰ�
            ���ϴ�.<br>
            Ȯ���� ������ ��û�� �Ϸ�Ǿ��ٴ� �޼����� �߸鼭 ������û�� �Ϸ�˴ϴ�. </td>
        </tr>
        <tr>
          <td height="5"></td>
        </tr>
        <tr>
          <td align="center" valign="top"><img src="/images/user/game/apply/guide_img5.gif"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td valign="bottom"><img src="/images/user/game/apply/gbox_bo.gif"></td>
  </tr>
</table-->


</form>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->