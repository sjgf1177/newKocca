<%
//**********************************************************
//  1. ��      ��: ���� > �������� �Խ���
//  2. ���α׷��� : gu_Notice_L.jsp
//  3. ��      ��: ���� > �������� �Խ���
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
	ArrayList list1 = null;
	ArrayList list2 = null;

    int		v_tabseq   = box.getInt("p_tabseq");
    int		v_seq      = box.getInt("p_seq");     
    String  v_process  = box.getString("p_process");
	String  s_gadmin   = box.getSession("gadmin");

	// �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_select");

    int    v_cnt       = 0;            // ��ȸ��
    String v_gubun     = "";           // ��ü����
    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����
	String v_luserid   = "";
    String v_gubun_view = "";
    String v_loginyn    = "";			// �α�������
    String v_useyn   	= "";			// �������
    String v_grcodecd   = "";           // ��� �����׷�
    
    String v_upfile     = "";
    //String v_realfile  ="";
    
    Vector v_realfileVector = null;
    Vector v_savefileVector = null;
    Vector v_fileseqVector  = null;

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
	int v_rowcount	= 0;
    int v_upfilecnt = 0;
    int v_pageno         = box.getInt("p_pageno");
    if (v_pageno == 0) {
        v_pageno = 1;
    }

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

    list2 = (ArrayList)request.getAttribute("selectNoticeList");
   
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topOpenkocca.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
    //����Ʈ ��ȸ
    function select() {
        document.form1.action = "/servlet/controller.homepage.OpenForumNoticeServlet";
        document.form1.p_process.value = "List";
        document.form1.submit();
    }

	//�󼼺���
    function selectView(seq) {

		v_url = "/servlet/controller.homepage.OpenForumNoticeServlet?p_process=selectView&p_seq="+seq;
		//		alert(v_url);
        document.nform1.action = v_url;
        document.nform1.submit();
    }

	// ������ ���� �������� ��� ��������
	function insertpage(){
		document.nform1.action = "/servlet/controller.homepage.OpenForumNoticeServlet";
        document.nform1.p_process.value = "insertNotice";
        document.nform1.submit();
	}

	
	//������ �̵�
	function goPage(pageNum) {
		 document.nform1.p_pageno.value = pageNum;
		 document.nform1.action = "/servlet/controller.homepage.OpenForumNoticeServlet";
		 document.nform1.p_process.value = "List";
		 document.nform1.submit();
	}

//-->
</SCRIPT>




<form name="nform1" method="post">
	<input type = "hidden" name = "p_process">
	<input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>">

               <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > �������� >  ��������</td>
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
                        <!--�Խ��Ǹ�� -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0" valign="center">
                          <tr> 
                            <td><img src="/images/user/kocca/openkocca/st_forum_notice.gif"> </td>
                          </tr>                          
                          <tr> 
                            <td></td>
                          </tr>
                        </table>
                        
                     
						<table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="5"><img src="/images/user/kocca/openkocca/board_first.gif" width="5" height="33"></td>
                            <td width="669" class="tbl_bgcolor_openkocca">
							<table width="669" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="30" class="tbl_grc"><img src="/images/user/kocca/openkocca/text_no.gif"></td>
                                  <td  class="tbl_grc"><img src="/images/user/kocca/openkocca/text_subject02.gif"></td>
                                  <td width="80" class="tbl_grc"><img src="/images/user/kocca/openkocca/text_writer.gif" ></td>
                                  <td width="50" class="tbl_grc"><img src="/images/user/kocca/openkocca/text_search.gif" ></td>
                                  <td  width="50" class="tbl_grc"><img src="/images/user/kocca/openkocca/text_fileadd.gif" ></td>
                                  <td  width="80" class="tbl_grc"><img src="/images/user/kocca/openkocca/text_day.gif" ></td>
                                </tr>
                              </table></td>
                            <td width="6"><img src="/images/user/kocca/openkocca/board_tail.gif" width="6" height="33"></td>
                          </tr>
                          <tr> 
                            <td height="3" colspan="3"></td>
                          </tr>
                          <tr> 
                            <td height="1" colspan="3" class="tbl_bgcolor_openkocca"></td>
                          </tr>
                        </table> 						

                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                        						<%
									String  v_addate1 = "";
									int i = 0;
									for(i = 0; i < list2.size(); i++) {
									
										DataBox dbox = (DataBox)list2.get(i);
										v_seq      = dbox.getInt("d_seq");
										v_cnt      = dbox.getInt("d_cnt");
										v_adtitle  = dbox.getString("d_adtitle");
										v_addate   = dbox.getString("d_addate");
										v_adname   = dbox.getString("d_adname");
										v_upfilecnt = dbox.getInt("d_filecnt");
										v_addate1   = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");
										v_dispnum   = dbox.getInt("d_dispnum");
									    v_totalpage = dbox.getInt("d_totalpage");
									    v_rowcount  = dbox.getInt("d_rowcount");
										
										if (!v_searchtext.equals("")&&v_search.equals("adtitle")) {
											v_adtitle = StringManager.replace(v_adtitle, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
										} 
										else if(!v_searchtext.equals("")&&v_search.equals("adname")){
											v_adname = StringManager.replace(v_adname, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
										}
									%>
									        <tr> 
									          <td width="40" class="tbl_grc" ><%=v_dispnum%></td>
									          <td name="p_seq"  class="tbl_gleft" value="<%=v_seq%>"><a href="javascript:selectView(<%=v_seq%>)"><%=v_adtitle%></td>
									          <td width="85" class="tbl_grc" ><%=v_adname%></td>
									          <td  width="50"class="tbl_grc" ><%=v_cnt%></td>
									          <td width="50"  class="tbl_grc" ><%if(v_upfilecnt>0){%><img src="/images/user/game/service/i_add.gif" width="13" height="13"><%} else {%>-<%}%></td>
									          <td  width="80" class="tbl_grc" ><%=FormatDate.getFormatDate(v_addate, "yyyy-MM-dd")%></td>
									        </tr>
									        <tr> 
													<td height="1" colspan="6" class="linecolor_main01"></td>
												  </tr>
									<%}%>
									
									<%  if (i == 0 ) {                         %>
									                        <tr> 
				                            <td colspan="6" class="tbl_grc">���������� �����ϴ�.</td>
				                          </tr>
				                          
												<tr> 
													<td height="1" colspan="6" class="linecolor_main01"></td>
												  </tr>
												  
									<%   }   %>
									<%
									for(int j = i; j < 5; j++){%>			
												      <tr> 
						                            <td colspan="6" class="tbl_grc">&nbsp;</td>
						                          </tr>
				                          
												<tr> 
													<td height="1" colspan="6" class="linecolor_main01"></td>
												  </tr>
         										<%}%>
         										
									
                        
                          <tr> 
                            <td height="1" colspan="6" class="linecolor_main01"></td>
                          </tr>
                         
                          <tr> 
							<td height="1" colspan="6" class="linecolor_main01"></td>
                          </tr>                        
                          <tr> 
                            <td height="1" colspan="6" class="linecolor_main01"></td>
                          </tr>
                        </table>
			<table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td class="tbl_bgcolor_openkocca" height="3" colspan="2" ></td>
                          </tr>
                          <tr> 
                            <td width="630" height="27"  align=center>
                               <!-- page -->
								  <table width="580" border="0" cellspacing="0" cellpadding="0">
									  <tr> 
										<td>
										<%= PageUtil.printPageListKocca(v_totalpage, v_pageno, 10) %>
										</td>
									  </tr>
								  </table>
                              </td>
							  <td width="70" >
								  <%if( StringManager.substring(s_gadmin,0,1).equals("A") || s_gadmin.equals("B1") ){%>
									  <a href="javascript:insertpage()"><img src="/images/user/kocca/button/btn_input.gif" width="45" height="20"></a>
								  <%}%>
							  </td>
                          </tr>
                          <tr> 
                            <td height="1" class="linecolor_main01" colspan="2" ></td>
                          </tr>
			
                        </table>
                    
                        
                        
                        
<p>&nbsp;</p>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
