<%
//**********************************************************
//  1. ��      ��: �����ڷ��
//  2. ���α׷��� : zu_SoftwareBoard_L.jsp
//  3. ��      ��: SW�ڷ�� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.01.19
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    int v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");

    int v_seq = 0;
    int v_levels = 0;
    int v_cnt = 0;
    int i     = 0;

    String v_userid = "";
    String v_name   = "";
    String v_indate = "";
    String v_title  = "";
	String v_class1 = "";
	String v_class2 = "";


    int v_dispnum   = 0;
    int v_totalpage = 0;
    int v_rowcount  = 0;
    int v_upfilecnt = 0;

    int v_pageno    = box.getInt("p_pageno");
	if (v_pageno == 0) v_pageno = 1;

    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");
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
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
        document.form1.p_pageno.value = "1";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
    function insertPage() {
        document.form1.action = "/servlet/controller.homepage.SoftwareBoardServlet";
        document.form1.p_process.value = "insertPage";
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
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
    <input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_seq"       value = "">
    <input type = "hidden" name = "p_upfilecnt" value = "">
    <input type = "hidden" name = "p_userid"    value = "">


              <!----------------- page ��� ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="route_table">
                <tr> 
                  <td class="route_text"><img src="/images/user/homepage/arrow_icon2.gif" width="20" height="7" border="0">������ġ 
                    : Home &gt; ���̹������� &gt; SW�ڷ��</td>
                </tr>
                <tr> 
                  <td class="route_line"></td>
                </tr>
              </table>
              <!----------------- page ��� �� ----------------->

              <!----------------- Ÿ��Ʋ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="b_title_table">
                <tr> 
                  <td height="10"></td>
                </tr>
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

              <!----------------- ��ȸ ���� ----------------->
              <table cellpadding="0" cellspacing="0" class="tab_table">
                <tr> 
                  <td align="right">
                    <table cellpadding="0" cellspacing="0" width="39%" border="0">
                      <tr> 
                        <td> 
							<select name="p_search"  class="inputdate">
<!--                              <option value='name' <% if (v_search.equals("name")) out.print("selected"); %>>�ۼ���</option> -->
                              <option value='title' <% if (v_search.equals("title")) out.print("selected"); %>>����</option>
                              <option value='content' <% if (v_search.equals("content")) out.print("selected"); %>>����</option>
                            </select>
                        </td>
                        <td align="center"> 
						 <input name="p_searchtext" type="text" class="input_course_search" value='<%=v_searchtext %>'>
                        </td>
                        <td width="100" align="right">
						<a href = "javascript:selectList();"><img src="/images/user/homepage/search_butt2.gif" width="45" height="16" border="0"></a>
                        <%  if(BulletinManager.isAuthority(box, box.getString("p_canAppend"))) {    //    ���� ���� %><a href = "javascript:insertPage();">
						<img src="/images/user/community/write_butt1.gif" width="45" height="16" border="0"></a>
						<%  }   %>
						</td>
                      </tr>
                      <tr><td height="5"></td></tr>
                    </table>
                  </td>
                </tr>
              </table>
              <!----------------- ��ȸ �� ----------------->

              <!----------------- SW�ڷ�� ����Ʈ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="information_board_color_line_out1">
                <tr> <td class="information_board_color_line"></td></tr>
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
			for(i = 0; i < list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i);
				v_userid    = dbox.getString("d_userid");
				v_name      = dbox.getString("d_name");
				v_indate    = dbox.getString("d_indate");
				v_title     = dbox.getString("d_title");
				v_seq       = dbox.getInt("d_seq");
				v_cnt       = dbox.getInt("d_cnt");
				v_levels    = dbox.getInt("d_levels");
				v_upfilecnt = dbox.getInt("d_upfilecnt");
				v_dispnum   = dbox.getInt("d_dispnum");
				v_totalpage = dbox.getInt("d_totalpage");
				v_rowcount  = dbox.getInt("d_rowcount");


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


				// level �� ���� �տ� ����� �̹���

%>

                      <tr> 
                        <td class="<%=v_class1%>"><%=v_dispnum%></td>
                        <td class="<%=v_class1%>">
						<% if (v_upfilecnt>0) {%> 
							<img src="/images/user/homepage/file_icon.gif" width="13" height="13" border="0">
						<% } %>
						</td>
                        <td  class="<%=v_class2%>"> 
							<img src = "/images/admin/system/space.gif" width="<%=v_levels*15-30%>" height ="2" border =0>
							<%if (v_levels > 1) {%>
								<img src="/images/user/community/reply_icon1.gif"> 
							<% } %>
								<a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_userid%>')"><%=v_title%></a>
							<% if(FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){          %>
								&nbsp;&nbsp;<img src = "/images/user/community/new_icon1.gif" align = "absmiddle" border = "0">
							<%  } %>
						</td>
                        <td class="<%=v_class1%>"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
                        <td class="<%=v_class1%>"><%=v_cnt%></td>
                      </tr>

<%
        }
%>
<%   if (i == 0 ) {                         %>
                      <tr> 
                        <td class="board_text1" colspan ='5'>��ϵ� ������ �����ϴ�.</td>
                      </tr>
<%   }                                     %>

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
                <tr> <td align="center"><%= PageUtil.printPageList(v_totalpage, v_pageno, row) %></td></tr>
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