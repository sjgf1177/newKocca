<%
//**********************************************************
//  1. ��      ��: ������ ���
//  2. ���α׷��� : ku_InsertTheme.jsp
//  3. ��      ��: ������ ���â 
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.17
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	ArrayList list		= null;
	String v_process = box.getString("p_process");

	int v_subjectseq	= 0;
	String v_grcode		= "";
	String v_subject	= "";
	String v_tyear		= "";	
	String v_tmonth		= "";
	String v_tmpmonth	= "";

	String v_insert = box.getStringDefault("p_insert","N");
	String v_isOk   = box.getString("isOk");

	String v_title = box.getString("p_title");

%>

<script language="javascript">

// �� üũ 
function check(year, month){
	document.title_form.action="/servlet/controller.homepage.OpenForumUserServlet";
	document.title_form.p_process.value = "checkTheme";	
	document.title_form.p_tmonth.value   = month;
	document.title_form.p_tyear.value    = year;
	document.title_form.submit();
}

//���
function insert(month){
	if (blankCheck(document.title_form.p_title.value)) {
		alert("������ �Է��ϼ���");
		document.title_form.p_title.focus();
		return;
	}

	if (realsize(document.title_form.p_title.value) > 20) {
		alert("������ �ѱ۱��� 200�ڸ� �ʰ����� ���մϴ�.");
		document.title_form.p_title.focus();
		return;
	}
	document.title_form.action = "/servlet/controller.homepage.OpenForumUserServlet";
    document.title_form.p_process.value = "insertTheme";
	document.title_form.p_tmpmonth.value = month ;
    document.title_form.submit();
}


function windowsclose(){
	self.close();
}


//�Է� ������ ������ üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;
    
    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);
    
    return (false);
}
//���ڼ��� üũ
function realsize( value ) {
    var len = 0;
    if ( value == null ) return 0;
    for(var i=0;i<value.length;i++){
        var c = escape(value.charAt(i));
        if ( c.length == 1 ) len ++;
        else if ( c.indexOf("%u") != -1 ) len += 2;
        else if ( c.indexOf("%") != -1 ) len += c.length/3;
    }
    return len;
}


</script>



<html><head><title>������ ���</title></head>
<body onLoad="document.title_form.p_title.focus();">
<link href="/css/user_style1.css" rel="stylesheet" type="text/css">


<form method="post" action="ku_InsertTheme.jsp" name="title_form">
	<input type = "hidden" name = "p_process">
	<input type = "hidden" name = "p_tmonth">
	<input type = "hidden" name = "p_tmpmonth">
	<input type = "hidden" name = "p_tyear">



<table width="300" border="0" cellpadding="0" cellspacing="0" bgcolor="F6F6F6">
  <tr> 
    <td width="300"><img src="/images/user/kocca/openkocca/pop_tit_j.gif" width="375"></td>
  </tr>
  <tr> 
    <td><table width="300" border="0" cellspacing="0" cellpadding="0">
        <tr background="/images/user/game/apply/pop_box_topbg.gif"> 
          <td width="22" height="10" valign="top" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toph.gif" width="22" height="10"></td>
          <td width="657" height="10" background="/images/user/game/apply/pop_box_topbg.gif"></td>
          <td width="21" height="10" align="right" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toptail.gif" width="21" height="10"></td>
        </tr>
        <tr> 
          <td valign="top" background="/images/user/game/apply/pop_box_lbg.gif">&nbsp;</td>
          <td align="center" valign="top" bgcolor="#FFFFFF"> 
		    <table width="350" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="center"><font color="#663399"><strong>[����]</strong>�� 
                  10�� ���Ϸ� �Է��� �ֽʽÿ�.</font></td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td align="center"><font color="#000000">�̴��� ������ �Է����ֽʽÿ�.</font></td>
              </tr>
              <tr> 
                <td height="5" align="center"></td>
              </tr>
              <tr> 
                <td align="center"><table width="350" border="0" cellpadding="0" cellspacing="0" background="/images/user/kocca/openkocca/box_02.gif">
                    <tr> 
                      <td><img src="/images/user/kocca/openkocca/box_01.gif" width="350" height="10"></td>
                    </tr>
                    <tr>
<%			
	Calendar cal 	= Calendar.getInstance();
	int year		= cal.get(Calendar.YEAR);
		 v_tyear	= String.valueOf(year);
	int month 		= cal.get(Calendar.MONTH)+2;
	if(month <10)
		v_tmonth 	= "0"+String.valueOf(month);
	else
		v_tmonth 	= String.valueOf(month);

%>						
                      <td align="left">&nbsp;&nbsp;<strong>[ 2006 ]</strong>��<strong> [ 02 ]</strong>��</td>
                    </tr>
                    <tr> 
                      <td height="5"></td>
                    </tr>
                    <tr> 
                      <td align="center"> <font color="#663399">������&nbsp;&nbsp;</font><input type="text" name="p_title" class=type1 style=width:175 value="<%=v_title%>"> 
                        <a href="javascript:check('<%=v_tyear%>','<%=v_tmonth%>')">
                        <img src="/images/user/kocca/button/b_j.gif" align="absmiddle"></a> 
                      </td>
                    </tr>
                    <tr> 
                      <td align="center"><img src="/images/user/kocca/openkocca/box_03.gif" width="350" height="10"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
	<%

		if (v_process.equals("checkTheme")){

				OpenForumUserBean bean = new OpenForumUserBean();
				list = bean.SelectTheme(box); 
			    
			if( list.size() == 1 ){
				if( v_isOk.equals("0") ){
				for( int i = 0 ; i < list.size() ; i++ ){
					DataBox dbox = (DataBox)list.get(i);	
					v_grcode	 = dbox.getString("d_grcode");
					v_subjectseq = dbox.getInt("d_subjectseq");
					v_subject	 = dbox.getString("d_subject");
					v_tyear		 = dbox.getString("d_tyear");
					String v_month		 = dbox.getString("d_tmonth");
	%>
              <tr> 
                <td height="1" bgcolor="#663399"></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
			<tr> 
                <td align="center"><strong>------ �̴��� ������ ------</strong></td>
              </tr>
            </table>
            <table width="350" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="2" align="right">&nbsp;</td>
              </tr>
			  <tr> 
                <td colspan="2" align="center"><strong>[ 
                  <%=v_month%> ] ��</strong>�� ������� <font color="#663399"><strong>[ 
                  <%=v_subject%> ]</strong></font> �Դϴ�</td>
              </tr>
              <tr> 
                <td colspan="2" align="right">&nbsp;</td>
              </tr>
			  <tr> 
                <td colspan="2" align="center"><font color="#663399"><strong>[ 
                  <%=box.getString("p_title")%> ]</strong></font>�� <strong>[ 
                  <%=v_tmonth%> ] ��</strong> ������� ��밡���մϴ�.</td>
              </tr>
              <tr> 
                <td colspan="2" align="right"><a href="javascript:insert(<%=v_tmonth%>)"><img src="/images/user/kocca/button/btn_input.gif"></a></td>
              </tr>	
<%			}
		}else{
			%>
			 <tr> 
                <td colspan="2" align="center"><font color="#663399"><strong>[ 
                  <%=box.getString("p_tmpmonth")%> ] ��</strong> ������� �̹� ��ϵǾ� �ֽ��ϴ�.</td>
              </tr>
			  <tr> 
                <td colspan="2" align="right"><a href="javascript:windowsclose()"><img src="/images/user/kocca/button/btn_close.gif"></a></td>
              </tr>	
<%	}	}	}
	
%>

<% if( v_process.equals("insertThemePage") ) {
				
		OpenForumUserBean bean = new OpenForumUserBean();
		list = bean.SelectTheme(box); 
		
	if( list.size() == 1 ){
		if( v_isOk.equals("1") ){
		for( int i = 0 ; i < list.size() ; i++ ){
			DataBox dbox = (DataBox)list.get(i);	
			v_grcode	 = dbox.getString("d_grcode");
			v_subjectseq = dbox.getInt("d_subjectseq");
			v_subject	 = dbox.getString("d_subject");
			v_tyear		 = dbox.getString("d_tyear");
			String v_month		 = dbox.getString("d_tmonth");
			%>
			  <tr> 
                <td colspan="2" align="center"><font color="#663399"><strong>[ 
                 <%=v_subject%> ]</strong></font> <strong>[ 
                  <%=v_month%> ] ��</strong> ������� ��ϵǾ����ϴ�.</td>
              </tr>
			  <tr> 
                <td colspan="2" align="right"><a href="javascript:windowsclose()"><img src="/images/user/kocca/button/btn_close.gif"></a></td>
              </tr>	
<%
		}}}}%>
  	  </table></td>
          <td background="/images/user/game/apply/pop_box_rbg.gif">&nbsp;</td>
        </tr>
        <tr> 
          <td valign="bottom" background="/images/user/game/apply/pop_box_lbg.gif"><img src="/images/user/game/apply/pop_box_boh.gif" width="22" height="21"></td>
          <td background="/images/user/game/apply/pop_box_bobg.gif">&nbsp;</td>
          <td valign="bottom" background="/images/user/game/apply/pop_box_rbg.gif"><img src="/images/user/game/apply/pop_box_botail.gif" width="21" height="21"></td>
        </tr>
      </table></td>
  </tr>
</table>
  	</form>
</body></html>

