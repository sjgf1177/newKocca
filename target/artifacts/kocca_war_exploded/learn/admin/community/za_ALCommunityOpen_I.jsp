<%
//**********************************************************
//  1. ��      ��: COMMUNITY CREATE PAGE
//  2. ���α׷���: za_ALCommunityOpen_I.jsp
//  3. ��      ��: Action Learning �н���ȣȸ ���� page
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: mscho 2004. 02. 17
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    String  v_user_id   = box.getSession("userid");    
    String  v_user_name = box.getSession("username"); 
    String  v_process   = box.getString("p_process");  
    String  v_grcode    = box.getString("p_grcode");      
    String  v_subj      = box.getString("p_subj");  
    String  v_year      = box.getString("p_year");  
    String  v_subjseq   = box.getString("p_subjseq");      
    String  v_cntpropose= box.getString("p_cntpropose");          
    String  p_process   =   "ActionLearningInsert";
    //DEFINED class&variable END                       
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
    <script language = "javascript" src = "/script/cresys_lib.js"></script>
	<script language = "javascript">
	<!--
        function open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable)
        {
            toolbar_str = toolbar ? 'yes' : 'no';
            menubar_str = menubar ? 'yes' : 'no';
            statusbar_str = statusbar ? 'yes' : 'no';
            scrollbar_str = scrollbar ? 'yes' : 'no';
            resizable_str = resizable ? 'yes' : 'no';
            window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str).focus();
        }	
	   function cancel() {
                document.form1.action = "/servlet/controller.community.CommunityAdminServlet";
                document.form1.p_process.value = "ActionLearningList";      
                document.form1.submit();	
            }                        
            function insert() { 
                if (blankCheck(document.form1.p_masterID.value)) {
                    alert("�ü��� �Է��ϼ���!");
                    return;
                }  
                if (blankCheck(document.form1.p_sdesc.value)) {
                    alert("�н���ȣȸ �̸��� �Է��ϼ���!");
                    document.form1.p_sdesc.focus();
                    return;
                }   
                if (blankCheck(document.form1.p_intros.value)) {
                    alert("�н���ȣȸ �Ұ��� �Է��ϼ���!");
                    document.form1.p_intros.focus();
                    return;
                }           
                if (blankCheck(document.form1.p_topics.value)) {
                    alert("�н���ȣȸ ������ �Է��ϼ���!");
                    document.form1.p_topics.focus();
                    return;
                }	                                                
                if (realsize(document.form1.p_topics.value) > 1000) {
                    alert("�н���ȣȸ ������ �ѱ۱��� 1000�ڸ� �ʰ����� ���մϴ�.");
                    document.form1.p_topics.focus();
                    return;
                }		                  
                document.form1.action = "/servlet/controller.community.CommunityAdminServlet";  
                document.form1.p_process.value = "ActionLearningInsert";                                     
                document.form1.submit();
            }
    function master_search() {
        window.self.name = "winSelectView";
        open_window("openWinView","","100","100","540","350");       
        document.form1.target = "openWinView";
        document.form1.action = "/servlet/controller.community.CommunityAdminServlet";
        document.form1.p_process.value = "SearchMasterOpenPage";
        document.form1.submit();
        document.form1.target = window.self.name;
    }
    -->
	</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_user_id"   value = "<%=v_user_id %>">
    <input type = "hidden" name = "p_user_name" value = "<%=v_user_name %>">
    <input type = "hidden" name = "p_process"   value = "<%=v_process %>">  
    <input type = "hidden" name = "p_subj"      value = "<%=v_subj %>">  
    <input type = "hidden" name = "p_year"      value = "<%=v_year %>">  
    <input type = "hidden" name = "p_subjseq"   value = "<%=v_subjseq %>">  
    <input type = "hidden" name = "p_grcode"    value = "<%=v_grcode %>">  
    <input type = "hidden" name = "p_cntpropose" value = "<%=v_cntpropose%>">  
    <input type = "hidden" name = "p_masterName">  
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="../../../images/admin/community/tit_comm_05.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <br>
      <br>
        <!-----------------��ȣȸ ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="20%" class="table_title"><b>��û��</b></td>
            <td width="80%" class="table_02_2">������</td>
          </tr>
          <tr> 
            <td class="table_title"><strong>�ü�����</strong></td>
            <td class="table_02_2"><input name="p_masterID" type="text" class="input" readonly>
              <a href="javascript:master_search()"><img src="/images/admin/community/membersearch_butt.gif" height="18" border="0"></a>
              </td>
          </tr>
          <tr> 
            <td class="table_title"><strong>ī�װ�</strong></td>
            <td class="table_02_2"> 
            <%=CodeConfigBean.getCodeSelect("communityCategory","p_categoryId","")%>
            </td>
          </tr>
          <tr> 
            <td class="table_title"><strong>�н� ��ȣȸ ����</strong></td>
            <td class="table_02_2">
            <input class="ms" size="50" maxlength="20" name="p_sdesc">
            </td>
          </tr>
          <tr> 
            <td class="table_title"><strong>�н� ��ȣȸ �Ұ�</strong></td>
            <td class="table_02_2">
            <input class="ms" size="50" maxlength="20" name="p_intros">
            </td>
          </tr>
          <tr> 
            <td class="table_title">
            <table width="100" height="20" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center"><strong>�н���ȣȸ ����</strong></td>
                </tr>
              </table>
            </td>
            <td class="table_02_2">
            <textarea name="p_topics" cols="60" rows="15" class="ms"></textarea>
            </td>
          </tr>
          <tr> 
            <td height="25" colspan="2" align="center" bgcolor="#e9e9e9">
            <table width="97%" height="25" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td valign="absmiddle"><strong>�������� :</strong> 
                    <input type="radio" name="p_isPublic" value='Y'>
                    ���� 
                    <input type="radio" name="p_isPublic" value='N' checked>
                    �����</td>
                </tr>
              </table></td>
          </tr>
        </table>
        <!----------------- ��ȣȸ ���� �� ----------------->
        <br>
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="right" class="ms"><a href="javascript:insert()"><img src="/images/admin/community/confirm_butt.gif" width="37" height="18" border="0"></a></td>
            <td width="1%" align="center" class="ms">&nbsp;</td>
            <td align="left" class="ms"><a href="javascript:cancel()"><img src="/images/admin/community/cancel2_butt.gif" width="37" height="18" border="0"></a></td>
          </tr>
        </table> </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
