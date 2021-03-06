<%
//**********************************************************
//  1. 제      목: EDUCATION SUBJECT PAGE
//  2. 프로그램명: zu_MyQna_L.jsp
//  3. 개      요: 설문
//  4. 환      경: JDK 1.3
//  5. 버      젼: 1.0
//  6. 작      성: 정은년 2005. 7. 20
//  7. 수      정:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","03"); 
    
    String  ss_userid     = box.getSession("userid");    
    String  v_indate      = "";
    String  v_types       = ""; 
    String  v_title       = "";
    String  v_searchtext  = box.getString("p_searchtext");   
    String  v_select      = box.getString("p_select");   
    String  v_edustart    = "";
    String  v_eduend      = "";

     
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    
    // 페이징관련
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   
        
    ArrayList blist1 = (ArrayList)request.getAttribute("MyQnaListPage1");  // 학습관련
    ArrayList blist2 = (ArrayList)request.getAttribute("MyQnaListPage2");  // 사이트관련
      
%>

<!------- 상단 로고,메뉴,유저정보 파일 시작 ------------>
<%@ include file="/learn/user/include/topMyClass.jsp"%>
<!------- 상단 로고,메뉴,유저정보 파일 끝  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--
//검색내용에 맞는 리스트 페이지로 이동
function selectList(tab) {
	if (form1.p_searchtext.value == ""){
		alert("검색 할 내용을 입력해 주세요");
	}else{
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value = "MyQnaListPage";
    document.form1.p_pageno.value = "1";
	document.form1.submit();
	showTab(tab);	
	}
}

//페이지 이동
function goPage(pageNum, tab) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value = "MyQnaListPage";
	document.form1.submit();
	g_showTab(tab, 2);
}

// Tab 선택시 동작
function showTab(clickTab)
{
   //alert(clickTab);
	g_showTab(clickTab, 2);
}

function g_showTab(tabNo, count)
{

	var clickTabNo = new Number(tabNo);
	var tabCount   = new Number(count);

	if( clickTabNo == 0 || tabCount == 0 ) return;

	for(i=1; i<=tabCount; i++)
    {
		div = document.all["tab_"+i];

		if(!div) return;

		if( clickTabNo == i ) {
			// 활성화된 tab 클릭시 return
			if(div.style.display == "") return;
			div.style.display = ""
		}
		else {
			// 선택되지 않는 탭들은 깜빡임 방지.
			if(div.style.display != "none") {
				div.style.display = "none";
			}
		}
	}
}
//-->
</script>


 <form name="form1" method="post" action="/servlet/controller.study.MyQnaServlet">
 		  <input type = "hidden" name = "p_process" value = "">
		  <input type = "hidden" name = "p_pageno"  value = "">
		  <input type = "hidden" name = "p_seq"     value = "">
		  <input type = "hidden" name = "p_userid"  value = "">
		  <input type = "hidden" name = "p_upfilecnt" value = "">

		  <!-- center start -->
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; 나의 강의실 &gt; 나의 질문방</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/myclass/<%=tem_subimgpath%>/tit_myquest.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  
              <div id="tab_1"> 
                  <!-- 구분탭 : 학습관련-->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="98" valign="top"><img src="/images/user/myclass/tab_study_on.gif"> 
                      </td>
                      <td width="98" valign="top" style="cursor:hand;" onClick="showTab(2);" >
                      <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image37','','/images/user/myclass/tab_site_on.gif',1)"><img src="/images/user/myclass/tab_site.gif" name="Image37" border="0"></a>
                      </td>
                      <td width="98" valign="top" >&nbsp;</td>
                      <td width="381" ></td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="4"></td>
                    </tr>
                  </table>

                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr vaㅈlign="top"> 
                      <td colspan="6"> 
                      <table width="675" border="0" cellpadding="0" cellspacing="0" background="/images/user/myclass/class_tb_bg.gif">
                          <tr> 
                            <td width="5"><img src="/images/user/myclass/class_tb_head.gif"></td>
                            <td width="39" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_num.gif"></td>
                            <td width="90" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_class.gif" ></td>
                            <td width="91" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_eduday.gif"></td>                           
                            <td width="300" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_title.gif" ></td>
                            <td width="100" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_day.gif"></td>
                            <td width="55" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_file.gif"></td>
                            <td width="20" align="right"><img src="/images/user/myclass/class_tb_tail.gif"></td>
                          </tr>
                        </table>
                        </td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/myclass/class_tb_tline.gif"></td>
                    </tr>
                    <tr> 
                      <td height="3" colspan="6"></td>
                    </tr>
<%
        for (int i=0; i<blist1.size(); i++) {
            DataBox dbox = (DataBox)blist1.get(i);  
            v_dispnum   = dbox.getInt("d_dispnum"); 
            v_indate    = dbox.getString("d_indate");
            v_types     = dbox.getString("d_kind");
            v_totalpage = dbox.getInt("d_totalpage");
            v_title     = dbox.getString("d_title");
            v_edustart  = dbox.getString("d_edustart");
            v_eduend    = dbox.getString("d_eduend");
                                            
			if (!v_searchtext.equals("")&&v_select.equals("title")) {
				v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			}
            
%>                    
                    <tr> 
                      <td width="20" class="tbl_br"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=v_dispnum%></td>
                      <td align="center"  width="120"><%=dbox.getString("d_scsubjnm")%></td>
                      <td align="center"  width="80"><%=FormatDate.getFormatDate(v_edustart, "yyyy/MM/dd")%><br>~<%=FormatDate.getFormatDate(v_eduend, "yyyy/MM/dd")%></td>                      
                      <td class="tbl_bleft" width="310" >
				        <%if (Integer.parseInt(v_types) > 0) {%>
							&nbsp;&nbsp;&nbsp;&nbsp;<IMG src="/images/board/re.gif" border="0"> 
           				<% } %>
                        <a href="#"><%=v_title%></a> 
						<%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
							<IMG src="/images/user/support/ico_new.gif" border="0">
						<% } %>                        
                      </td>
                      <td class="tbl_br" width="75" ><%=FormatDate.getFormatDate(v_indate, "yyyy/MM/dd")%></td>
                      <td align="center" width="100">
                      <% if(!dbox.getString("d_upfile").equals("")){ %>
							<img src="/images/user/support/ico_file.gif" width="13" height="12">
					  <%}else{%> &nbsp; <%}%>
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
<%
        }
        if(blist1.size()==0){
%>
                    <tr> 
                      <td colspan="6" align=center>데이타가 없습니다.</td>
                    </tr>
<%
        }
%>

                    <tr bgcolor="FCE1D0"> 
                      <td height="5" colspan="6"><img src="/images/user/myclass/class_tb_bo.gif"></td>
                    </tr>
                  </table>
                  <!-- 페이징 시작 -->
				  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10" colspan="2"></td>
                    </tr>
                    <tr> 
                      <td width="418" align="right">
					    <table width="130" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="19">
							<%= HomePageQnaBean.printPageList(v_totalpage, v_pageno, row, 1) %>
							</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  
                  <!-- 검색 -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="227">&nbsp;</td>
                      <td width="56"> 
						<select name = "p_select" class = "input">
                			<option value="title" <% if (v_select.equals("title")) out.print("selected"); %>>제목</option>
							<option value = "content" <% if (v_select.equals("content")) out.print("selected"); %>>내용</option>
              			 </select>	
                      <td width="132">
                      <input type = "text" onFocus = "this.style.background='#FFFAE1'" onBlur = "this.style.background='#ffffff'" 
                             name = "p_searchtext" value = "<%=v_searchtext %>" size = "25" maxlength = "30"></td>
                      <td width="260">&nbsp;
                          <A HREF="javascript:selectList('1')"><IMG src="/images/common/bt_y_search.gif" border="0"></A>
                      </td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                  </table>                  
             </div>
             
              <div id="tab_2" STYLE="display:none">             
                  <!-- 구분탭 : 사이트관련-->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="98" valign="top" style="cursor:hand;" onClick="showTab(1);">
                      <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image37','','/images/user/myclass/tab_study_on.gif',1)"><img src="/images/user/myclass/tab_study.gif" name="Image37" border="0"></a>
                      </td>                    
                      <td width="98" valign="top"><img src="/images/user/myclass/tab_site_on.gif"> </td>
                      <td width="98" valign="top" >&nbsp;</td>
                      <td width="381" ></td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="4"></td>
                    </tr>
                  </table>

                  <!-- 질문방 table -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr valign="top"> 
                      <td colspan="6"> 
                      <table width="675" border="0" cellpadding="0" cellspacing="0" background="/images/user/myclass/class_tb_bg.gif">
                          <tr> 
                            <td width="5"><img src="/images/user/myclass/class_tb_head.gif"></td>
                            <td width="39" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_num.gif"></td>
                            <td width="90" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_group.gif" ></td>
                            <td width="320" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_title.gif" ></td>
                            <!--<td width="91" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_name.gif"></td>-->
                            <td width="100" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_day.gif"></td>
                            <td width="55" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_file.gif"></td>
                            <td width="50" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_view.gif"></td>
                            <td width="20" align="right"><img src="/images/user/myclass/class_tb_tail.gif"></td>
                          </tr>
                        </table>
                        </td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/myclass/class_tb_tline.gif"></td>
                    </tr>
                    <tr> 
                      <td height="3" colspan="6"></td>
                    </tr>
<%
        for (int i=0; i<blist2.size(); i++) {
            DataBox dbox = (DataBox)blist2.get(i);  
            v_dispnum   = dbox.getInt("d_dispnum"); 
            v_indate    = dbox.getString("d_indate");
            v_types     = dbox.getString("d_types");
            v_totalpage = dbox.getInt("d_totalpage");
            v_title     = dbox.getString("d_title");
			if (!v_searchtext.equals("")&&v_select.equals("title")) {
				v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			}
            
%>                    
                    <tr> 
                      <td width="20" class="tbl_br"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=v_dispnum%></td>
                      <td align="center"  width="100"><%=dbox.getString("d_codenm")%></td>
                      <td class="tbl_bleft" width="320" >
				        <%if (Integer.parseInt(v_types) > 0) {%>
							&nbsp;&nbsp;&nbsp;&nbsp;<IMG src="/images/board/re.gif" border="0"> 
           				<% } %>
                        <a href="#"><%=v_title%></a> 
						<%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
							<IMG src="/images/user/support/ico_new.gif" border="0">
						<% } %>                        
                      </td>
                      <!--<td class="tbl_br"> </td>-->
                      <td class="tbl_br" width="105" ><%=FormatDate.getFormatDate(v_indate, "yyyy/MM/dd")%></td>
                      <td align="center" width="35">
                      <% if(!dbox.getString("d_upfile").equals("")){ %>
							<img src="/images/user/support/ico_file.gif" width="13" height="12">
					  <%}else{%> &nbsp; <%}%>
                      </td>
                      <td width="80" class="tbl_br"><%=dbox.getInt("d_cnt")%></td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
<%
        }
        if(blist2.size()==0){
%>
                    <tr> 
                      <td colspan="6" align=center>데이타가 없습니다.</td>
                    </tr>
<%
        }
%>

                    <tr bgcolor="FCE1D0"> 
                      <td height="5" colspan="6"><img src="/images/user/myclass/class_tb_bo.gif"></td>
                    </tr>
                  </table>
                  
                  <!-- 페이징 시작 -->
				  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10" colspan="2"></td>
                    </tr>
                    <tr> 
                      <td width="418" align="right">
					    <table width="130" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="19">
							<%= HomePageQnaBean.printPageList(v_totalpage, v_pageno, row, 2) %>
							</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  
                  <!-- 검색 -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="227">&nbsp;</td>
                      <td width="56"> 
						<select name = "p_select" class = "input">
                			<option value="title" <% if (v_select.equals("title")) out.print("selected"); %>>제목</option>
							<option value = "content" <% if (v_select.equals("content")) out.print("selected"); %>>내용</option>
              			 </select>	
                      <td width="132">
                      <input type = "text" onFocus = "this.style.background='#FFFAE1'" onBlur = "this.style.background='#ffffff'" 
                             name = "p_searchtext" value = "<%=v_searchtext %>" size = "25" maxlength = "30"></td>
                      <td width="260">&nbsp;
                          <A HREF="javascript:selectList('2')"><IMG src="/images/common/bt_y_search.gif" border="0"></A>
                      </td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                  </table>                  
             </div>             
             

                  
                </td>
              </tr>
              <tr>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
              <tr> 
                <td width="470" height="2" align="center" valign="top" bgcolor="#999999"></td>
              </tr>
</form>
            </table>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->