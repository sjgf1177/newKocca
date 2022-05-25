<%
//**********************************************************
//  1. ��      ��: Ȩ�������ڷ��
//  2. ���α׷��� : zu_SoftDataBoard_R.jsp
//  3. ��      ��: Ȩ�������ڷ�� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.1.19
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box     = (RequestBox)request.getAttribute("requestbox");
    int     v_tabseq   = box.getInt("p_tabseq");
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


    Vector v_realfileVector = null;
    Vector v_savefileVector = null;

    DataBox dbox = (DataBox)request.getAttribute("selectSoftwareBoard");
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
 //       v_content = StringManager.replace(v_content,"\r\n","<br>");
//        v_content = BoardBean.convertBody(v_content);

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
    ArrayList list = (ArrayList)request.getAttribute("selectSoftwareBoardList");
%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%//@ include file="/jsp/user/homepage/supporttop.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--

    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    
    function reply_SoftDataBoard() {
        document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
        document.form1.p_process.value = "replyPage";
        document.form1.submit();
    }

    function modify_SoftDataBoard() {
        document.form1.p_userid.value = "<%= v_userid %>";
        document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_SoftDataBoard() {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            document.form1.p_userid.value = "<%= v_userid %>";
            document.form1.p_pageno.value = "1";
            document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
            document.form1.p_process.value = "delete";
            document.form1.submit();
        }
        else {
            return;
        }
    }

    function list_SoftDataBoard() {
        document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }


    function selectList() {
        document.form1.p_pageno.value = "1";
        document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    function select(seq, upfilecnt, userid) {
        document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
        document.form1.p_process.value = "select";
        document.form1.p_seq.value = seq;
        document.form1.p_upfilecnt.value = upfilecnt;
        document.form1.p_userid.value    = userid;
        document.form1.submit();
    }
//-->
</SCRIPT>

    <input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
    <input type = "hidden" name = "p_userid"     value = "<%= v_userid %>">

              <!----------------- page ��� ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="route_table">
                <tr> 
                  <td class="route_text"><img src="/images/user/homepage/arrow_icon2.gif" width="20" height="7" border="0">
				  ������ġ : Home &gt; ���̹������� &gt; SW�ڷ��</td>
                </tr>
                <tr> 
                  <td class="route_line"></td>
                </tr>
              </table>
              <!----------------- page ��� �� ----------------->

              <!----------------- Ÿ��Ʋ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="b_title_table">
                <tr> <td height="10"></td></tr>
                <tr> 
                  <td background="/images/user/homepage/information_b_title_bg1.gif">
				  <img src="/images/user/homepage/information_b_title2.gif" width="370" height="46" border="0">
				  </td>
                  <td width="7" background="/images/user/homepage/information_b_title_bg1.gif">
				  <img src="/images/user/homepage/information_b_title_bg2.gif" width="7" height="46" border="0">
				  </td>
                </tr>
                <tr> <td height="7"></td></tr>
              </table>
              <!----------------- Ÿ��Ʋ �� ----------------->
              <br>

              <!----------------- SW�ڷ��  ���� ���� ---------------->
              <table cellspacing="0" cellpadding="0" class="information_board_color_line_out1">
                <tr> <td class="information_board_color_line"></td></tr>
              </table>

              <table cellspacing="0" cellpadding="0" class="information_board_table_out1">
                <tr> 
                  <td> 
                    <table cellspacing="1" cellpadding="3" class="table2">
                      <tr> 
                        <td class="information_board_title_bg1" width="20%">�� ��</td>
                        <td class="board_title_bg3" width="30%"><%= v_title %> </td>
                        <td class="information_board_title_bg1" width="20%">��ȸ��</td>
                        <td class="board_title_bg3" width="30%"><%=v_cnt%></td>
                      </tr>
                      <tr> 
                        <td class="information_board_title_bg1" width="20%">�����</td>
                        <td class="board_title_bg3"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
                        <td class="information_board_title_bg1" width="20%">�ۼ���</td>
                        <td class="board_title_bg3"><%=v_name%></td>
                      </tr>
                      <tr> 
                        <td colspan="4" class="board_text1" align="center"> 
                          <table width="98%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td height="7"></td>
                            </tr>
                            <tr> 
                              <td><br><%= v_content %></td>
                            </tr>
                          </table>
                        </td>
                      </tr>
						<!---------����÷�ο��� ------------>

						<%  if(box.getBoolean("p_isUpload") ) {    
								for(i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����
								String v_realfile = (String)v_realfileVector.elementAt(i);
								String v_savefile = (String)v_savefileVector.elementAt(i);                        
						%>
						  <tr>
							<td class = "information_board_title_bg1" width = "20%" align = "center">÷������</td>
							<td class = "table_text3" width = "80%" align = "left" colspan="3">
							<%		if(v_realfile != null && !v_realfile.equals("")) {  %>
									&nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'>
									<%= v_realfile%></a><br>
									<input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
							<%		}   %>
							</td>
						  </tr>
						<%      }   
							}
						%>
					<!---------����÷�ο��� �� ------------>
					</table>
                  </td>
                </tr>
              </table>
              <!----------------- SW�ڷ�� ���� �� ---------------->
              <br>


              <!----------------- ��� ��ư ���� ---------------->
              <table width="200" border="0" cellspacing="0" cellpadding="0">
                <tr> 

<%
                    if(box.getBoolean("p_isReply")) {    //    �亯 ���ɿ���
                      if(BulletinManager.isAuthority(box, box.getString("p_canReply"))) {    //    �亯 ����
                %>
                    <td align="center">
                    <a href="javascript:reply_SoftDataBoard()"><img src="/images/user/homepage/reply_butt1.gif" width="45" height="16" border="0"></a>
                    </td>
                <%
                      }
                    }

                    if(BulletinManager.isAuthority(box, box.getString("p_canDelete"))) {    //    ���� ����
                %>
                    <td align="center"><a href="javascript:delete_SoftDataBoard()">
                    <img src="/images/user/homepage/del_butt1.gif" width="45" height="16" border="0">
                    </td>
                <%
                    }
                    if(BulletinManager.isAuthority(box, box.getString("p_canModify"))) {    //    ���� ����
                %>
                    <td align="center">
                    <a href="javascript:modify_SoftDataBoard()"><img src="/images/user/homepage/modify_butt1.gif" width="45" height="16" border="0"></a>
                    </td>
                <%
                    }
                %>
                 <td align="center">
				  <a href="javascript:list_SoftDataBoard()">
				  <img src="/images/user/homepage/list_butt1.gif" width="45" height="16" border="0">
				  </a>
				  </td>
                </tr>
              </table>
              <!----------------- ��� ��ư �� ---------------->
              <br>


              <table cellspacing="0" cellpadding="0" class="information_board_table_out2">
                <tr>
                  <td height="5"></td>
                </tr>
                <tr>
                  <td background="/images/user/homepage/information_dot1.gif" height="3"></td>
                </tr>
                <tr>
                  <td height="5"></td>
                </tr>
              </table>
              <br>

              <!----------------- ��ȸ ���� ----------------->
              <table cellpadding="0" cellspacing="0" class="tab_table">
                <tr> 
                  <td align="right">
                    <table cellpadding="0" cellspacing="0" width="39%" border="0">
                      <tr> 
                        <td> 
                            <select name="p_search" class="inputpsearch">
                                <option value='name' <% if (v_search.equals("name")) out.print("selected"); %>>�ۼ���</option>
                                <option value='title' <% if (v_search.equals("title")) out.print("selected"); %>>����</option>
                                <option value='content' <% if (v_search.equals("content")) out.print("selected"); %>>����</option>
                            </select>
                        </td>
                        <td align="center"> 
                          <input name="p_searchtext" type="text" class="inputsub" value='<%=v_searchtext %>'></td>
                        <td width="100" align="right">
						<a href = "javascript:selectList();"><img src="/images/user/homepage/search_butt2.gif" width="45" height="16" border="0"></a>
                        </td>
                      </tr>
                      <tr> 
                        <td height="5"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              <!----------------- ��ȸ �� ----------------->

              <!----------------- SW�ڷ�� ����Ʈ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="information_board_color_line_out1">
                <tr> 
                  <td class="information_board_color_line"></td>
                </tr>
              </table>

              <table cellspacing="0" cellpadding="0" class="information_board_table_out1">
                <tr> 
                  <td> 
                    <table cellspacing="1" cellpadding="3" class="table2">
                      <tr> 
                        <td class="information_board_title_bg1" width="5%">��ȣ</td>
                        <td class="information_board_title_bg1" width="5%">����</td>
                        <td class="information_board_title_bg1">�� ��</td>
                        <td class="information_board_title_bg1" width="13%">�����</td>
                        <td class="information_board_title_bg1" width="7%">��ȸ��</td>
                      </tr>
                <%
                if ( list !=null ) { 
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

                        if (v_orgseq == v_seq) v_title = "<b>" + v_title + "</b>";
                        
                        //Ȧ¦ ����Ʈ row�� css�� ����
                        String v_class1 ="", v_class2=""; 
                        if (((i+1)%2) ==1 ){
                            v_class1 = "board_text1";
                            v_class2 = "board_text3";
                        }else{
                            v_class1 = "board_text2";
                            v_class2 = "board_text4";
                        }

                %>

                      <tr> 
                        <td class="<%=v_class1%>" ><%=v_dispnum%></td>
                        <td class="<%=v_class1%>">
							<% if (v_upfilecnt>0) {%> 
								<img src="/images/user/homepage/file_icon.gif" width="13" height="13" border="0">
							<% } %></td>
                        <td  class="<%=v_class2%>">
							<img src = "/images/admin/system/space.gif" width="<%=v_levels*15-30%>" height ="2" border =0>
							<%if (v_levels > 1) {%>
								<img src="/images/user/homepage/reply_icon1.gif"> 
							<% } %>
								<a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_userid%>')"><%=v_title%></a>
							<% if(FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){          %>
								&nbsp;&nbsp;<img src = "/images/user/homepage/new_icon1.gif" align = "absmiddle" border = "0">
							<%  } %>
						</td>
                        <td class="<%=v_class1%>"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
                        <td class="<%=v_class1%>"><%=v_cnt%></td>
                      </tr>
            <%
                    }
                }else {
            %>
                    <tr><td colspan="5" align=center class="board_text1">��ϵ� ������ �����ϴ�. </td></tr>
            <%  } %>
                    </table>
                  </td>
                </tr>
              </table>
              <!----------------- SW�ڷ�� ����Ʈ �� ----------------->

              <!----------------- ������ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="tab_table">
                <tr> 
                  <td height="11"></td>
                </tr>
                <tr> 
                  <td align="center"><%= PageUtil.printPageList(v_totalpage, v_pageno, row) %>
                  </td>
                </tr>
              </table>
              <!----------------- ������ �� ----------------->
              <br>
              <br>


            </td>
          </tr>
          <tr>
            <td height="8"><img src="/images/user/homepage/information_sub_menu_bg2.gif" width="178" height="8" border="0"></td>
            <td><img src="/images/user/homepage/sub_body_bg2.gif" width="804" height="8" border="0"></td>
          </tr>
        </table>
        <!----------------- ����޴�, ���� ���� �� �� ----------------->

<!---------- copyright start ------------------->
<%//@ include file="/jsp/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->