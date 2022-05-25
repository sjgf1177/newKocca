<%
//**********************************************************
//  1. ��      ��: ���� > �����Խ��� 
//  2. ���α׷��� : ku_ForumView_R.jsp
//  3. ��      ��: ���� > �����Խ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	box.put("leftmenu","01");  

	String s_gadmin		 = box.getSession("gadmin");

    String 	v_types      = box.getString("p_types");
    String  v_url		 = "SubjectList";
    
    if  (  "B".equals(v_types)) {
              v_url      = "SubjectFreeList";
    }
    String	v_seq        = box.getString("p_seq");     
    String  v_process    = box.getString("p_process");
   	String  v_seqString  = "";
	String  v_title      = "";
	String  v_contents   = "";
	String  v_indate     = "";
	String  v_upfile     = "";
	String  v_cnt        = "";
	String  v_subject    = "";
	String  v_recommend  = "";
	String  v_inuserid	= "";

    Vector  v_realfileVector = null;
    Vector  v_savefileVector = null;
    Vector  v_fileseqVector  = null;

	ArrayList  list2= (ArrayList)request.getAttribute("selecCommentList");	
	
	DataBox dbox = (DataBox)request.getAttribute("SelectView");
    
    if (dbox != null) {
			v_seq		= dbox.getString("d_seq");
			v_types		= dbox.getString("d_types");   													        
			v_title		= dbox.getString("d_title");
			v_contents	= dbox.getString("d_contents");															
			v_indate	= dbox.getString("d_indate");
	    	v_inuserid	= dbox.getString("d_inuserid");
			v_upfile	= dbox.getString("d_upfile");													        
			v_cnt		= dbox.getString("d_cnt");
			v_recommend	= dbox.getString("d_recommend");   	
			v_subject	= dbox.getString("d_subject");		

			v_realfileVector    = (Vector)dbox.getObject("d_realfile");
			v_savefileVector    = (Vector)dbox.getObject("d_savefile");
			v_fileseqVector		= (Vector)dbox.getObject("d_fileseq");
	
    }

    
     //�ִ���ȸ�� �����۱� ��������
    ArrayList listSubject = (ArrayList)request.getAttribute("SubjectMax");     
    //�ִٵ��� ��������
    ArrayList listComment = (ArrayList)request.getAttribute("SubjectCommentMax");         
    


	// �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_select");

  
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
	int v_rowcount	= 0;
    int v_pageno    = box.getInt("p_pageno");

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topOpenkocca.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">

	//���� ��õ�ϱ�
    function ForumRecommend() {
  
      if (confirm("��õ�Ͻðڽ��ϱ�?")) {
        document.Forumform1.p_process.value = "insertRecommend";
        document.Forumform1.action ="/servlet/controller.homepage.OpenForumUserServlet";
        document.Forumform1.submit();
      }  
      else 
      {
		return;
	   }
    }

	// ��� ���� ��õ�ϱ�
	function recommend(){

		if (confirm("��ڸ���� ��õ �˴ϴ�.")) {
        document.Forumform1.p_process.value = "insertReview";
        document.Forumform1.action ="/servlet/controller.homepage.OpenForumUserServlet";
        document.Forumform1.submit();
      }  
      else 
      {
		return;
	   }
	}
    
    
	//���� ���
	function insertcomment() {
		
		if(document.Forumform1.commentqna.value ==""){
			alert("������ ����ϼ���");
			return;
		}
		
		
		document.Forumform1.action = "/servlet/controller.homepage.OpenForumUserServlet";
		document.Forumform1.p_process.value = "commentInsert";
		document.Forumform1.submit();
	}

	//���� ����
	function deleteComment(v_commentseq) {


		if (confirm("������ �����Ͻðڽ��ϱ�?")) {
			document.Forumform1.p_commentseq.value = v_commentseq;
			document.Forumform1.p_process.value = "deleteComment";
			document.Forumform1.action = "/servlet/controller.homepage.OpenForumUserServlet";
			document.Forumform1.submit();
		}
		else 
		{
			return;
		}
	}
</SCRIPT>




<table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > �������� > ȸ������</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/openkocca/<%=tem_subimgpath%>/tit_forum.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="88" rowspan="3"><img src="/images/user/kocca/openkocca/text_forum.gif"></td>
                          </tr>
                          <tr> 
                            <td height="12"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="2" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr > 
                            <td height="7" colspan="2" ></td>
                          </tr>
                        </table>
                        
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
						<tr > 
                            <td height="7" colspan="2" ></td>
                        </tr>
						<tr>
							<td ><% if ("B".equals(v_types)) { %><img src="/images/user/kocca/openkocca/st_j_view.gif" >
                   				 <%}else{%>	<img src="/images/user/kocca/openkocca/st_f_view.gif" >
                   				 <%}%>
							</td>
						  </tr>
						</table>
                        <!--�Խ��Ǹ�� -->
                        
                                                    
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="5" colspan="6"></td>
                          </tr>
                          <tr> 
                            <td colspan="6"><img src="/images/user/kocca/openkocca/bar_forum_write_top.gif" ></td>
                          </tr>
                          <tr> 
                            <td height="2" colspan="6"></td>
                          </tr>
                          <tr> 
                            <td width="75" class="tbl_gleft03"><% if  (  "B".equals(v_types)) {  out.println("�з�");
															     }else{ out.println("����");}%></td>
                            <td colspan="5" class="tbl_gleft01"><%=v_subject%></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
						  <tr> 
                            <td width="75" class="tbl_gleft03">����</td>
                            <td colspan="5" class="tbl_gleft01"><%=v_title%></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr> 
                            <td width="75" class="tbl_gleft03">�ۼ���</td>
                            <td colspan="5" class="tbl_gleft01"><%=v_inuserid%></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr> 
                            <td width="75" class="tbl_gleft03">��¥</td>
                            <td width="330" class="tbl_gleft01"><%=FormatDate.getFormatDate(v_indate,"yyyy-MM-dd")%></td>
                            <td width="66" class="tbl_gleft03">��ȸ</td>
                            <td width="72" class="tbl_gleft01"><%=v_cnt%></td>
                            <td width="63" class="tbl_gleft03">��õ</td>
                            <td width="74" class="tbl_gleft01"><%=v_recommend%></td>
                          </tr>
                  
                          <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr valign="top"> 
                            <td colspan="6" class="tbl_contents"><%=v_contents%></td>
                          </tr>
						  <tr > 
                            <td height="1" colspan="6" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
						  <tr> 
                            <td width="120" class="tbl_gleft03">÷������</td>
                            <td colspan="5" class="tbl_gleft01">					
	<%		
		if( !v_upfile.equals("") ) { 
			for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����
				String v_realfile = (String)v_realfileVector.elementAt(i);
				String v_savefile = (String)v_savefileVector.elementAt(i);  
				String v_fileseq  = (String)v_fileseqVector.elementAt(i);  	
		
				if(v_realfile != null && !v_realfile.equals("")) {  
	%> 

			<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'> 
              <%= v_realfile%></a><br>
	<%				
				}
			}
		}else{%>
							÷�ε� ������ �����ϴ�.
	<%	}
	%> 
							</td>
                          </tr>
                          <tr> 
                            <td height="3" colspan="6" class="tbl_bgcolor_openkocca"></td>
                          </tr>
                        </table> 
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="2"></td>
                          </tr>
                          <tr>
                            <td height="27" class="linecolor_notice">
							  <table width="180" border="0" align="right" cellpadding="0" cellspacing="0">
                                <tr align="right">

								  <td width="70">
<%if( s_gadmin.substring(0,1).equals("A") || s_gadmin.equals("B2") ){%>
									<a href="javascript:recommend()"><img src="/images/user/kocca/button/btn_review_register.gif"></a><%}%>&nbsp;</td>

                                  <td width="70">
									<a href="/servlet/controller.homepage.OpenForumUserServlet?p_process=<%=v_url%>"><img src="/images/user/kocca/button/btn_list.gif" border="0"></a>&nbsp;</td>
                                  <td width="70">
									<a href="javascript:ForumRecommend();"><img src="/images/user/kocca/button/btn_recom.gif" border="0"></a>&nbsp;&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="1" bgcolor="#cccccc"></td>
                          </tr>
                        </table>
<form name="Forumform1" method="post">
  <input type=hidden name=p_seq value="<%=v_seq%>">
  <input type=hidden name=p_types value="<%=v_types%>">
  <input type=hidden name=p_process value="" >  
  <input type=hidden name="p_commentseq"  value="" >  
 
  
                           
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="12" colspan="3"></td>
                          </tr>
                          <tr> 
                            <td><input name="commentqna" type="text" size="100" value="" class="input3"></td>
                            <td width="9">&nbsp;</td>
                            <td width="58"><a href="javascript:insertcomment();"><img src="/images/user/kocca/button/btn_wr.gif" border="0"></a></td>
                          </tr>
                          <tr> 
                            <td height="6" colspan="3">&nbsp;</td>
                          </tr>
                        </table>
                        
               

</form>

                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                        <%
                                               int i =0;
											  if (list2 != null) {
												  
												  for(i = 0; i <list2.size(); i++) {
													        DataBox dbox1    = (DataBox)list2.get(i);
                                 					        String v_commentseq    =  dbox1.getString("d_commentseq");													        
													        String v_inuserid2          =  dbox1.getString("d_inuserid");
   													        String v_commentqna    =  dbox1.getString("d_commentqna");
   													        String v_cdate    =  dbox1.getString("d_cdate");
   													        String v_inusernm2    =  dbox1.getString("d_inusernm");
   													        
   													 %>  
													   <tr> 
								                            <td width="130" class="tbl_gleft02"><font color="#000000"><%=v_inusernm2%>&nbsp;&nbsp;[<%=FormatDate.getFormatDate(v_cdate,"yyyy-MM-dd")%>]</font></td>
								                            <td width="1"><img src="/images/user/game/mystudy/bg_dotline_1.gif"></td>
								                            <td  class="tbl_bleft"><%=v_commentqna%></td>
								                            <td width="37">
																<% if (s_userid.equals(v_inuserid2) ) { %>
																	<a href="javascript:deleteComment('<%=v_commentseq%>');" ><img src="/images/user/kocca/openkocca/icon_x.gif"></a>
								                                <%}else{%>&nbsp;<%}%></td>
								                          </tr> 
												  	<tr> 
							                            <td background="/images/user/game/mystudy/bg_dotline_2.gif" height="1" colspan="4"></td>
							                          </tr>
													 
													      
											 <%}
                                            }%>			 
                                            
                        
                        </table>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
