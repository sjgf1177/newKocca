<%
//**********************************************************
//  1. ��      ��: �����ڷ��
//  2. ���α׷���: za_StudyData_R.jsp
//  3. ��      ��: �����ڷ�� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_subjnm = box.getString("p_subjnm");
    int v_tabseq    = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_orgseq     = v_seq;
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int v_levels = 0;
    int v_dispnum   = 0;
    int v_totalpage = 0;
    int v_rowcount  = 0;

    int    i         = 0;
    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";
    
    String v_class1     = "";
    String v_class2     = "";
        
	Vector v_realfileVector = null;
    Vector v_savefileVector = null;

	DataBox dbox = (DataBox)request.getAttribute("selectStudyData");

    if (dbox != null ) {
        v_seq           = dbox.getInt("d_seq");
        v_userid        = dbox.getString("d_userid");
        v_name          = dbox.getString("d_name");
        v_title         = dbox.getString("d_title");
        v_content       = dbox.getString("d_content");
        v_cnt           = dbox.getInt("d_cnt");
        v_indate        = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");
        //v_content = StringManager.replace(v_content,"\r\n","<br>");


        // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
        if (!v_searchtext.equals("")) {
            if (v_search.equals("name")) {
                v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            } else if (v_search.equals("title")) {
                v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            }  else if (v_search.equals("content")) {
                v_content = StringManager.replace(v_content, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            }
        }
    }

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");

    // ����Ʈ
    ArrayList list = (ArrayList)request.getAttribute("selectStudyDataList");
    
    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_upperclass    = box.getString("s_upperclass");        //�����з�
	String  ss_middleclass    = box.getString("s_middleclass");        //�����з�
	String  ss_lowerclass    = box.getString("s_lowerclass");        //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_action    = box.getString("s_action");   
    //DEFINED in relation to select END        

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // ��ü���
	function goListPage() {
        document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
        document.form1.p_process.value = "adminList";
        document.form1.s_action.value = "go";
        document.form1.submit();
	}
	
	
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
         document.form1.p_process.value = "list";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
         document.form1.p_process.value = "list";
         document.form1.submit();
    }
    function reply_StudyData() {
        document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
        document.form1.p_process.value = "replyPage";
        document.form1.submit();
    }

    function modify_StudyData() {
        document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_StudyData() {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
            document.form1.p_process.value = "delete";
            document.form1.p_pageno.value = "1";
            document.form1.submit();
        }
        else {
            return;
        }
    }

    function list_StudyData() {
        document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
        document.form1.p_process.value = "list";
        document.form1.submit();
    }


    function selectList() {
        document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
        document.form1.p_process.value = "list";
        document.form1.p_pageno.value = "1";
        document.form1.submit();
    }

    function select(seq, upfilecnt, userid) {
        document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
        document.form1.p_process.value = "select";
        document.form1.p_seq.value = seq;
        document.form1.p_upfilecnt.value = upfilecnt;
        document.form1.p_userid.value    = userid;
        document.form1.submit();
    }
    function insertPage() {
        document.form1.action = "/servlet/controller.study.StudyAdminDataServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }    
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden" name="s_action"    value="<%=ss_action%>">     <!--in relation to select-->
    <input type="hidden" name="s_grcode"    value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"     value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_grseq"     value="<%=ss_grseq%>">      <!--in relation to select-->
    <input type="hidden" name="s_upperclass"    value="<%=ss_upperclass%>">     <!--in relation to select-->
	<input type="hidden" name="s_middleclass"    value="<%=ss_middleclass%>">    
	<input type="hidden" name="s_lowerclass"    value="<%=ss_lowerclass%>">    
    <input type="hidden" name="s_subjcourse"value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"   value="<%=ss_subjseq%>">    <!--in relation to select-->   
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
    <input type = "hidden" name = "p_subjnm"    value = "<%=v_subjnm %>">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
    <input type = "hidden" name = "p_userid"     value = "<%= v_userid %>">



  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title09.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>       
      <!----------------- title �� ----------------->
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
		    <td width="1%"><img src="/images/admin/common/icon.gif" ></td> 
            <td><%=v_subjnm%>����</td>
          </tr>
		  <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
        </table>
        <!----------------- �ڷ��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="0">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="20%" height="25" class="table_title"><b>�ۼ���</b></td>
            <td class="table_02_2" ><%=v_name%></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><%= v_title %></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>�����</b></td>
            <td class="table_02_2"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
          </tr>       
          <tr> 
            <td class="table_title" height="25"><b>��ȸ��</b></td>
            <td class="table_02_2"><%=v_cnt%></td>
          </tr>                  
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><%= v_content %></td>
          </tr>

          <tr> 
            <td height="25" class="table_title"><b>÷������</b></td>
            <td class="table_02_2">
	              <%
                  Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                  Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                  %>
                  <%@ include file="/learn/admin/include/za_MultiAttach_R.jsp" %> 
			</td>
		  </tr>
        </table>
        <!----------------- �ڷ��� �� ----------------->
        <br>

        <!----------------- ���, ��� ��ư ���� ----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
<%  if(BulletinManager.isAuthority(box, box.getString("p_canModify"))) {    //    ���� ���� %>             
            <td>
            <a href="javascript:modify_StudyData()"><img src="/images/admin/button/btn_modify.gif"  border="0"></a>
            </td>
<%  
    }

    if(BulletinManager.isAuthority(box, box.getString("p_canDelete"))) {    //    ���� ���� 
%>            
            <td width=8></td>
			<td>
            <a href="javascript:delete_StudyData()"><img src="/images/admin/button/btn_del.gif" border="0"></a>
            </td>
<%  }  %>               
          </tr>
        </table>
        <!----------------- ���, ��� ��ư �� ----------------->






        <br>
        <!----------------- ����Ʈ, �߰� ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr>                       
            <td align="right" width="100%">
                <%  if(BulletinManager.isAuthority(box, box.getString("p_canAppend"))) {    //    ���� ���� %>
                    <a href = "javascript:insertPage();"><img src="/images/admin/button/btn_add.gif" border="0"></a>
                <%  }   %>            
                <a href="javascript:goListPage();"><img src="/images/admin/button/btn_list.gif" border="0"></a>
            </td>
          </tr>
          <tr> 
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- ����Ʈ, �߰� ��ư �� ----------------->





        <!----------------- ���� �ڷ��  ����Ʈ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="6" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="5%" height="25" class="table_title"><b>NO</b></td>
            <td class="table_title"><b>����</b></td>
            <td  width="10%" class="table_title"><b>÷������</b></td>            
            <td class="table_title"><b>�������</b></td>
            <td class="table_title"><b>�ۼ���</b></td>
            <td class="table_title"><b>��ȸ��</b></td>
          </tr>
<%
    for(i = 0; i < list.size(); i++) {
		DataBox dbox2 = (DataBox)list.get(i); 
		v_userid    = dbox2.getString("d_userid");
		v_name      = dbox2.getString("d_name");
		v_indate    = dbox2.getString("d_indate");
		v_title     = dbox2.getString("d_title");
		v_seq       = dbox2.getInt("d_seq");
		v_cnt       = dbox2.getInt("d_cnt");
		v_levels    = dbox2.getInt("d_levels");
		v_upfilecnt = dbox2.getInt("d_upfilecnt");
		v_dispnum   = dbox2.getInt("d_dispnum");
		v_totalpage = dbox2.getInt("d_totalpagecount");
		v_rowcount  = dbox2.getInt("d_rowcount");

        // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
        if (!v_searchtext.equals("")) {
            if (v_search.equals("name")) {
                v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            } else if (v_search.equals("title")) {
                v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            }
        }
        if(i%2 == 0){   
            v_class1 = "board_text1";
            v_class2 = "board_text3";
        }else{
            v_class1 = "board_text2";
            v_class2 = "board_text4";
        }          
%>          


          <tr> 
            <td align="center" bgcolor="#EEEEEE" height="25"><%=v_dispnum%></td>
            <td class="table_02_2"><a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_userid%>')"><%=v_title%></a>
              <% if(FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){ %>
                 &nbsp;&nbsp;<img src = "/images/user/support/ico_new.gif" align = "absmiddle" border = "0">
              <%  } %>            
            </td>
            <td class="table_02_1" align="center">
            <%if(v_upfilecnt>0){%>
            <img src='/images/user/support/ico_file.gif' border=0>
            <%}%>
            </td>            
            <td class="table_02_1" align="center"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
            <td class="table_02_1" align="center"><%= v_name %></td>
            <td class="table_02_1" align="center"><%=v_cnt%></td>
          </tr>
<%  } if(i == 0){   %>    
                    <tr> 
                      <td class="table_02_1" align="center" colspan="6">��ϵ� ������ �����ϴ�.</td>
                    </tr>    
<%    } %>
        </table>
        <!----------------- ���� �ڷ��  ����Ʈ �� ----------------->
        <br>





        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center" class="ms"><%= PageUtil.printPageList(v_totalpage, v_pageno, row) %></td>
          </tr>
          <tr>
            <td height="15"></td>
          </tr>
          <tr>
            <td align="center" class="ms">




              <!----------------- �˻� ���� ----------------->
              <table width="26%" height="26" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td align="center"> 
                    <select name="p_search">
                            <option value='name' <% if (v_search.equals("name")) out.print("selected"); %>>�ۼ���</option>
                            <option value='title' <% if (v_search.equals("title")) out.print("selected"); %>>����</option>
                            <option value='content' <% if (v_search.equals("content")) out.print("selected"); %>>����</option>
                    </select>
                     <input size="18" name="p_searchtext" class="input" value='<%=v_searchtext %>'>
                  </td>
                  <td align="center">
                  <a href = "javascript:selectList();"><img src="/images/admin/button/search3_butt.gif" border="0"></a></td>
                </tr>
              </table>
              <!----------------- �˻� �� ----------------->






      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
