<%
//**********************************************************
//  1. ��      ��: SUBJ QNA LIST
//  2. ���α׷���: zu_SubjQna_L.jsp
//  3. ��      ��: ���� ���� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 20
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_gadminYn = box.getString("p_gadminYn");    //�����ڿ���
    String  v_subj     = box.getString("p_subj");        //�����ڵ�
    String  v_year     = box.getString("p_year");        //�⵵
    String  v_subjseq  = box.getString("p_subjseq");     //���� ����
    String  v_lesson   = box.getString("p_lesson");
    String  v_lessonnm = box.getString("p_lessonnm");
    int     v_upfilecnt = 0;
    String  v_title="", v_jikwinm="",v_cono="", v_inuserid="", v_userid="",v_inusernm="";
    String  v_indate="";
    String  v_isopen="", v_isopen_value="";
    int   v_seq = 0, v_anscnt = 0 ;
    int  v_qcnt     = 0;
    int  v_nanscnt	=0;
    int     i            = 0;

    v_userid= box.getSession("userid");

    // ����¡����
    int v_totalpage = 0;
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   
	if (v_pageno == 0) v_pageno = 1;
	
    //list1 = (ArrayList)request.getAttribute("SubjqnaList");SubjQnaList
    ArrayList list1  = (ArrayList)request.getAttribute("SubjQnaList");
%>
<html>
<head>
<title>::: ������ :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    // ���
    function qna_insert() {
  		document.ff.target = "_self";
        document.ff.p_process.value = 'SubjQnaInsertPage';
        document.ff.submit();
    }

    // �󼼺���
    function qna_select(seq,isopen,userid,s_userid,gadminyn) {
        if((isopen=="Y") || (userid == s_userid) || (gadminyn == "1")){
            qna_read(seq);
        } else {
            alert("������Դϴ�.");
        }
    }
    
    // �󼼺���
    function qna_read(seq) {
        document.ff.target = "_self";
        document.ff.p_process.value = 'SubjQnaDetail';
        document.ff.p_seq.value = seq;
        document.ff.submit();
    }
    
    // �˻� 
    function qna_search() {
        document.ff.target = "_self";
        document.ff.p_process.value = 'SubjQnaList';
        document.ff.submit();
    }

    //������ �̵�
    function goPage(pageNum) {
    
    	document.ff.p_pageno.value = pageNum;
    	document.ff.action = "/servlet/controller.study.SubjQnaStudyServlet";
    	document.ff.p_process.value = "SubjQnaList";
    	document.ff.submit();
    }

-->
</SCRIPT>
</head>


<body topmargin="0" leftmargin="0">
<form name="ff" method="post" action="/servlet/controller.study.SubjQnaStudyServlet">
		<input type="hidden" name="p_process"  value="SubjQnaDetail">
		<input type="hidden" name="p_subj"     value="<%=v_subj%>">
		<input type="hidden" name="p_year"     value="<%=v_year%>">
		<input type="hidden" name="p_subjseq"  value="<%=v_subjseq%>">
		<input type="hidden" name="p_lesson"   value="<%=v_lesson%>">
		<input type="hidden" name="p_lessonnm" value="<%=v_lessonnm%>">
		<input type="hidden" name="p_seq"      value="">
		<input type="hidden" name="p_gadminYn" value="<%=v_gadminYn%>">
        <input type = "hidden" name = "p_pageno"  value = "<%=v_pageno%>">
            <br>
            <!----------------- Ÿ��Ʋ ���� ----------------->
  				<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    				<tr> 
      					<td><img src="/images/user/study/inquiry_title.gif"></td>
      					<td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      					<td><img src="/images/user/study/gongi_tail.gif"></td>
    				</tr>
  				</table>
            <!----------------- Ÿ��Ʋ �� ---------------->
            <br>
            <!----------------- ��ȸ ���� ---------------->
            <table align=center cellspacing="0" border=0 cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td valign="bottom"></td>
                <td align="right"> 
                  <table width="245" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                        <td>
                          <select  name="p_search" class="input">
                            <option value="title" <% if (v_search.equals("title")) out.print("selected"); %>>����</option>
                            <option value="content" <% if (v_search.equals("content")) out.print("selected"); %>>����</option>
                            <option value="name" <% if (v_search.equals("name")) out.print("selected"); %>>�ۼ���</option>
                          </select>
                        </td>
                        <td>
                          <input type="text" size="18" name="p_searchtext"  class="input" value='<%=v_searchtext %>'>
                        </td>
                        <td><a href = "javascript:qna_search();"><img src="/images/user/button/btn_j.gif" border="0"></a></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <!----------------- ��ȸ �� ---------------->  

            <!----------------- ������ ����Ʈ ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
              <tr>
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
              <tr>
                <td>
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr>
                      <td class="board_title_bg1" width="6%">��ȣ</td>
                      <td class="board_title_bg1">��������</td>
                      <td class="board_title_bg1" width="6%">����</td>
                      <td class="board_title_bg1" width="6%">����</td>
                      <td class="board_title_bg1" width="6%">÷��</td>                      
                      <td class="board_title_bg1" width="10%">�ۼ���</td>
                      <td class="board_title_bg1" width="10%">�����</td>
                    </tr>

            <%
              for(i = 0; i < list1.size(); i++) {
    			  DataBox dbox = (DataBox)list1.get(i);              
        	      v_totalpage = dbox.getInt("d_totalpage");
        	      //v_rowcount  = dbox.getInt("d_rowcount");
    			

                  v_seq     = dbox.getInt("d_seq");
                  v_title   = dbox.getString("d_title");
                  v_jikwinm = dbox.getString("d_jikwinm");
                  v_cono    = dbox.getString("d_cono");
                  v_inuserid= dbox.getString("d_inuserid");
                  v_inusernm= dbox.getString("d_name");
                  v_indate  = FormatDate.getFormatDate(dbox.getString("d_indate"),"yyyy/MM/dd");
                  v_anscnt  = dbox.getInt("d_anscnt");
                  v_isopen  = StringManager.chkNull(dbox.getString("d_isopen"));
                  v_upfilecnt = dbox.getInt("d_upfilecnt");
                  
                  			              
                  /*QnaData data= (QnaData)list1.get(i);
                  v_seq     = data.getSeq();
                  v_title   = data.getTitle();
                  v_jikwinm = data.getJikwinm();
                  v_cono    = data.getCono();
                  v_inuserid= data.getInuserid();
                  v_inusernm= data.getInusernm();
                  v_lessonnm= data.getLessonnm();
                  v_indate  = FormatDate.getFormatDate(data.getIndate(),"yyyy/MM/dd");
                  v_seq     = data.getSeq();
                  v_anscnt  = data.getAnscnt();
                  v_isopen  = StringManager.chkNull(data.getIsOpen());
                  */
                  
                  if(v_isopen.equals("Y")){     v_isopen_value="����";       }
                    else                  {     v_isopen_value="�����";     }

            %>
                    <tr>
                      <td class="board_text1"><%= list1.size() - i %></td>
                      <td class="board_text3"><a href="javascript:qna_select(<%=v_seq%>, '<%=v_isopen%>', '<%=v_inuserid%>', '<%=v_userid%>', '<%=v_gadminYn%>');"><%= v_title %></a>
 							<%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(dbox.getString("d_indate"), "yyyyMMdd"))){%>
								<IMG src="/images/user/support/ico_new.gif" border="0">
							<% } %>                                            
                      </td>
                      <td class="board_text1"><%= v_isopen_value %></td>
                      <td class="board_text1"><% if(v_anscnt > 0 ){ out.println("Y"); } else { out.println("N"); }%></td>
                      <td class="board_text1">
                      
					        <% if( v_upfilecnt>0){ %>
							<img src="/images/user/support/ico_file.gif" width="13" height="12">
							<%}%>
                      </td>                      
                      <td class="board_text1"><%= v_inusernm %></td>
                      <td class="board_text1"><%= v_indate %></td>
                    </tr>
            <%
    		    }
            %>

<%    if(i == 0){   %>    
                    <tr> 
                      <td class="board_text1" colspan="7">��ϵ� ������ �����ϴ�.</td>
                    </tr>    
<%    } %>            
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ������ ����Ʈ �� ---------------->
            <br>
            <!----------------- �ۼ�, �ݱ� ��ư ���� ---------------->
            <table  align=center cellspacing="0" cellpadding="0"  class="open_board_table_out1">
              <tr> 
                <td width=70%></td>
                <td align=right>
                
                    <a href = "javascript:qna_insert();"><img src="/images/user/button/btn_write.gif" border="0"></a></td>
				<td witdh=5%></td>
                <td width=8% align=right><a href="javascript:self.close()"><img src="/images/user/button/btn_close.gif"  border="0"></a></td>
              </tr>
            </table>
            <!----------------- �ۼ�, �ݱ� ��ư �� ----------------->
            <br>


                  <!-- ����¡ ���� -->
				  <table border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10" colspan="2"></td>
                    </tr>
                    <tr> 
                      <td width="418" align="right">
					    <table width="130" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="19">
							<%= HomePageQnaBean.printPageList(v_totalpage, v_pageno, row) %>
							</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  

</form>
</body>
</html>
