<%
//**********************************************************
//  1. ��      ��: ���������� -  ����Ʈ����
//  2. ���α׷���: zu_MyQnaSite_L.jsp
//  3. ��      ��: ����������
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 7. 20
//  7. ��      ��:
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

     
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;
    
    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   
        
    ArrayList blist2 = (ArrayList)request.getAttribute("MyQnaSiteListPage");  
      
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topMyClass.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--
function press_enter(e) { 
	if (e.keyCode =='13'){  selectList();  }
}
//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
	if (form1.p_searchtext.value == ""){
		alert("�˻� �� ������ �Է��� �ּ���");
	}else{
    	document.form1.action = "/servlet/controller.study.MyQnaServlet";
    	document.form1.p_process.value = "MyQnaSiteListPage";
        document.form1.p_pageno.value = "1";
    	document.form1.submit();
	}
}

//��ȭ�� �������� �̵�
function select(tabseq, seq,  userid, types) {
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value   = "MyQnaSiteViewPage";
	document.form1.p_tabseq.value       = tabseq;
	document.form1.p_seq.value       = seq;
	document.form1.p_userid.value    = userid;
	document.form1.p_types.value     = types;
    //document.form1.p_upfilecnt.value = upfilecnt;
	document.form1.submit();
}

//������ �̵�
function goPage(pageNum) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value = "MyQnaSiteListPage";
	document.form1.submit();
}

// Tab ���ý� �̵�
function showTab()
{
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value = "MyQnaStudyListPage";
    document.form1.p_pageno.value = "1";
    document.form1.p_searchtext.value = "";        
	document.form1.submit();
}
//-->
</script>


 <form name="form1" method="post" action="/servlet/controller.study.MyQnaServlet">
 		  <input type = "hidden" name = "p_process" value = "">
		  <input type = "hidden" name = "p_pageno"  value = "">
		  <input type = "hidden" name = "p_seq"     value = "">
		  <input type = "hidden" name = "p_userid"  value = "">
		  <input type = "hidden" name = "p_upfilecnt" value = "">
		  <input type = "hidden" name = "p_types" value = "">
		  <input type = "hidden" name = "p_tabseq" value = "">
		  <!-- center start -->
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; ���� ���ǽ� &gt; ���� ������</td>
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
                  
                  <!-- ������ : ����Ʈ����-->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="98" valign="top" style="cursor:hand;" onClick="showTab();">
                      <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image37','','/images/user/myclass/tab_study_on.gif',1)"><img src="/images/user/myclass/tab_study.gif" alt="�н�����" name="Image37" border="0"></a>
                      </td>                    
                      <td width="98" valign="top"><img src="/images/user/myclass/tab_site_on.gif" alt="����Ʈ����"> </td>
                      <td width="98" valign="top" >&nbsp;</td>
                      <td width="381" ></td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="4"></td>
                    </tr>
                  </table>

                  <!-- ������ table -->
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
            v_tabseq		= dbox.getInt("d_tabseq"); 
            v_dispnum   = dbox.getInt("d_dispnum"); 
            v_indate    = dbox.getString("d_indate");
            v_types     = dbox.getString("d_types");
            v_totalpage = dbox.getInt("d_totalpage");
            v_title     = dbox.getString("d_title");
            
            int i_upfilecnt = dbox.getInt("d_upfilecnt");
            
			if (!v_searchtext.equals("")&&v_select.equals("title")) {
				v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			}
            
%>                    
                    <tr> 
                      <td width="20" class="tbl_br"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=v_dispnum%></td>
                      <td align="center"  width="100"><%=dbox.getString("d_codenm")%></td>
                      <td class="tbl_bleft" width="320" >
				        <%if (Integer.parseInt(v_types) > 0) {%>
							&nbsp;&nbsp;&nbsp;&nbsp;<IMG src="/images/user/support/ico_re.gif" border="0"> 
           				<% } %>
                        <a href="javascript:select('<%=dbox.getInt("d_tabseq")%>','<%=dbox.getInt("d_seq")%>', '<%=ss_userid%>','<%=v_types%>');"><%=v_title%></a> 
						<%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
							<IMG src="/images/user/support/ico_new.gif" border="0">
						<% } %>                        
                      </td>
                      <!--<td class="tbl_br"> </td>-->
                      <td class="tbl_br" width="105" ><%=FormatDate.getFormatDate(v_indate, "yyyy/MM/dd")%></td>
                      <td align="center" width="35">
                      <% if(i_upfilecnt>0){ %>
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
                      <td colspan="6" align=center>����Ÿ�� �����ϴ�.</td>
                    </tr>
<%
        }
%>

                    <tr bgcolor="FCE1D0"> 
                      <td height="5" colspan="6"><img src="/images/user/myclass/class_tb_bo.gif"></td>
                    </tr>
                  </table>

                  <!-- ����¡ ���� -->
				  <table width="675" border="0" cellspacing="0" cellpadding="0">
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
                  
                  <!-- �˻� -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="227">&nbsp;</td>
                      <td width="56"> 
						<select name = "p_select" class = "input">
                			<option value="title" <% if (v_select.equals("title")) out.print("selected"); %>>����</option>
							<option value = "content" <% if (v_select.equals("content")) out.print("selected"); %>>����</option>
              			 </select>	
                      <td width="132">
                      <input type = "text" onFocus = "this.style.background='#FFFAE1'" onBlur = "this.style.background='#ffffff'" 
                             name = "p_searchtext" value = "<%=v_searchtext %>" size = "25" maxlength = "30" onkeypress="press_enter(event)"></td>
                      <td width="260">&nbsp;
                          <A HREF="javascript:selectList()"><IMG src="/images/user/button/btn_search.gif" alt="�˻�" border="0"></A>
                      </td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                  </table>                  
                  
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