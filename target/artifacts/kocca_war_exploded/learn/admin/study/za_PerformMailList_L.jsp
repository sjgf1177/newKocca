<%
//**********************************************************
//  1. ��      ��: PROJECT DETAIL LIST
//  2. ���α׷���: za_ProjectDetail_L.jsp
//  3. ��      ��: ����Ʈ ������ ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 29
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
	//String  v_process   = box.getString("p_process");            
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	String  v_ismail   = box.getString("p_ismail");

	String  v_subj      = "";
    String  v_year      = "";
    String  v_subjseq   = "";
	String  v_userid = "";
    String  v_isemail  = "";
    String  v_title    = "";
    String  v_luserid =""; 
    String  v_ldate    = "";    
    String  v_cyear     = "";
    String  v_subjnm = "";          
    String  v_seqgrnm   = "";
    int  v_cmode     = 0;
    String  v_contents     = "";
    String  v_cmode_view	= "";
    String	v_ldate_view	= "";
    int v_total = 0;
    
    ArrayList list      = null;
    
	MemberData data = (MemberData)request.getAttribute("SelectMemberInfo");    
    String v_resno      = data.getResno();
    String v_name       = data.getName();
    
    list = (ArrayList)request.getAttribute("selectCounsel");                
       
 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">

function contentsView(contents,title){
	window.open("/learn/admin/study/za_PerformMailContent_R.jsp?contents="+contents+"&title="+title, "SiteLink", "toolbar=no,location=yes,directories=yes,status=no,menubar=no,scrollbars=yes,resizable=yes,width=600,height=800,left=80,top=100");
}

</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" scroll="auto">

<form name="form1" method="post" action="/servlet/controller.study.StudyStatusAdminServlet">
<table width="600" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
    <td align="left">
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr>

          <td align="center" bgcolor="#FFFFFF">
  <table width="615" border="0" cellspacing="0" cellpadding="0" height="520">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/study/s_title10.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>  
	          <!----------------- title �� ----------------->
        <br>
		        <!-------------������ ����-------------------------->
 <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title><%= "1".equals(v_ismail) ? "EMAIL" : "SMS" %> �߼� ����</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td></td>
          </tr>
        </table>

        <br>
        <!----------------- ����Ʈ ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
		    <td width="300"><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">
            �׽�Ʈ ���� &gt;  1 ���� </td>
            <td width="300" height="20" align="right" style=padding-right:8px>���� : <%=v_name%></td>
          </tr>
        </table>

		<br>
        <!----------------- �߰�, ����Ʈ ��ư �� ----------------->

        <!----------------- ����Ʈ ��������Ʈ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="7" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" width="5%" ><b>NO</b></td>
            <td class="table_title" width="10%"><b>�з�</b></td>
            <td class="table_title" width="10%"><b>����</b></td>
            <td class="table_title" width="10%"><b>�߼���</b></td>
            <td class="table_title" width="55%"><b>����</b></td>
            <!-- <td class="table_title" width="35%"><b>����</b></td> -->
            <td class="table_title" width="10%"><b>���</b></td>
          </tr>
<%
	DataBox dbox = null;
	String preCourse = "";			//
	int l = 0;
	int i = 0;

	//������ �ְ� ��������
	if(list != null){
		if( list.size() != 0 ){		// �˻��� ������ �ִٸ�
			v_total = list.size();
			for(i = 0; i < v_total; i++) {
				dbox = (DataBox)list.get(i);
				v_subj      = dbox.getString("d_subj");
			    v_year      = dbox.getString("d_year");
			    v_subjseq   = dbox.getString("d_subjseq");
				v_userid = dbox.getString("d_userid");
			    v_isemail  = dbox.getString("d_ismail");
			    v_title    = dbox.getString("d_title");
			    v_luserid = dbox.getString("d_luserid");
			    v_ldate    = dbox.getString("d_ldate");  
			    v_ldate_view = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");  
			    v_cyear     = dbox.getString("d_cyear");
			    v_subjnm = dbox.getString("d_subjnm");          
			    v_seqgrnm   = dbox.getString("d_seqgrnm");
			    v_cmode     = dbox.getInt("d_cmode");
			    switch(v_cmode) { 
					case 1 : v_cmode_view = "���";
						break;
					case 2 : v_cmode_view = "�н�";
						break;  
					case 3 : v_cmode_view = "����/�̼���";  
						break;  
					case 4 : v_cmode_view = "����";
						break;    
					case 5 : v_cmode_view = "�̼����뺸";
						break;    
					case 6 : v_cmode_view = "��Ÿ";
						break;     
				} 

			    v_contents  = dbox.getStringDefault("d_contents"," "); 
			    
			    
%>
          <tr> 
            <td class="table_01"><%=v_total-i%></td>
            <td class="table_02_1" align="center"><%=v_cmode_view%></td>
            <td class="table_02_1" align="center"><%if(v_isemail.equals("1")) {out.println("E-Mail");} else {out.println("SMS");}%></td>
            <td class="table_02_1"><%=v_ldate_view%></td>
            <td class="table_02_1"><a href="javascript:contentsView('<%=v_contents %>','<%=v_title %>');"><%=v_title %></a></td>
            <!-- <td class="table_02_1" align="center">XXX ���� ��û�� �Ϸ�Ǿ����ϴ�.</td> -->
            <td class="table_02_1" align="center"></td>
          </tr>
          
<%
			} //end for
		}else{		//������ ���ٸ�
%>
              <tr>
                <td align="center" bgcolor="#F7F7F7" height="50" colspan="6">��ϵ� ������ �����ϴ�</td>
              </tr>
<%

		}
	}
%>
        </table>
        <!----------------- Activity ����Ʈ �� ----------------->
      </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>    
</table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>
