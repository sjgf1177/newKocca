<%
//**********************************************************
//  1. ��      ��: ���İ���
//  2. ���α׷���: zu_KnowLatest_L.jsp
//  3. ��      ��: ���İ��� �ֱ����� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 9. 1
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
    box.put("leftmenu","04"); 
        
    String  v_searchtext  = box.getString("p_searchtext");   
    String  v_select      = box.getString("p_select");   


    

    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    
    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno"); 
      
    int v_seq = 0, v_readcnt = 0,  i = 0,  v_cnt = 0;    
    String  v_inuserid    = "", v_position = "", v_indate = "", v_title = "", tLink = "",  v_types = "" ,v_name="";
    String  p_categorycd     = box.getString("p_categorycd");
    String s_userid          = box.getSession("userid");
    String s_usernm          = box.getSession("name");
    String v_classname1      = "";
    String v_classname2      = "";    
    
    ArrayList list = (ArrayList)request.getAttribute("ListPage");     
      
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topMyClass.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--
//�Է��������� �̵�
function insertPage() {
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "InsertPage";  
	//document.form1.p_pageno.value = "<%= v_pageno %>";    
	document.form1.submit();
}

//��ȭ�� �������� �̵�
function select(seq, upfilecnt, userid, types) {
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value   = "selectView";
	document.form1.p_seq.value       = seq;
	document.form1.p_userid.value    = userid;
	document.form1.p_types.value     = types;
    document.form1.p_upfilecnt.value = upfilecnt;
	document.form1.submit();
}










//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList(tab) {
	if (form1.p_searchtext.value == ""){
		alert("�˻� �� ������ �Է��� �ּ���");
	}else{
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "MyQnaListPage";
    document.form1.p_pageno.value = "1";
	document.form1.submit();
	showTab(tab);	
	}
}

//������ �̵�
//function goPage(pageNum, tab) {
//	document.form1.p_pageno.value = pageNum;
//	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
//	document.form1.p_process.value = "MyQnaListPage";
//	document.form1.submit();
//	g_showTab(tab, 2);
//}


//������ �̵�
function goPage(pageNum) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "ListPage";
	document.form1.submit();

}


// Tab ���ý� ����
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
			// Ȱ��ȭ�� tab Ŭ���� return
			if(div.style.display == "") return;
			div.style.display = ""
		}
		else {
			// ���õ��� �ʴ� �ǵ��� ������ ����.
			if(div.style.display != "none") {
				div.style.display = "none";
			}
		}
	}
}
//-->
</script>

		  <!-- �Խ��� ���� -->
		  <form name = "form1" method = "post">              
		  <input type = "hidden" name = "p_process"     value = "">
		  <input type = "hidden" name = "p_pageno"      value = "">
		  <input type = "hidden" name = "p_seq"         value = "">
		  <input type = "hidden" name = "p_userid"      value = "">
		  <input type = "hidden" name = "p_upfilecnt"   value = "">
		  <input type = "hidden" name = "p_types"       value = "">
		  <input type = "hidden" name = "p_categorycd"  value = "<%=p_categorycd%>">

		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; ���� ���ǽ� &gt; ���İ��� &gt; �ֱ�����</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/myclass/type1/tit_knowledge.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <!-- ������ -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="675" height="5" colspan="4"><img src="/images/user/myclass/st_know_re.gif"></td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="4"></td>
                    </tr>
                  </table>


                  <!-- �ֱ����� table -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr valign="top"> 
                      <td colspan="7"> <table width="675" border="0" cellpadding="0" cellspacing="0" background="/images/user/myclass/class_tb_bg.gif">
                          <tr> 
                            <td width="6"><img src="/images/user/myclass/class_tb_head.gif"></td>
                            <td width="39" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_num.gif"></td>
                            <td width="86" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_group.gif" ></td>
                            <td width="274" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_title.gif" ></td>
                            <td width="91" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_name.gif"></td>
                            <td width="77" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_day.gif"></td>
                            <td width="52" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_file.gif"></td>
                            <td width="40" align="center" valign="bottom"><img src="/images/user/myclass/class_tb_view.gif"></td>
                            <td width="10" align="right"><img src="/images/user/myclass/class_tb_tail.gif"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="7"><img src="/images/user/myclass/class_tb_tline.gif"></td>
                    </tr>
 
<%if(list.size() != 0){%>
<% 
			for(i = 0; i < list.size(); i++) {
                   DataBox dbox = (DataBox)list.get(i);  
                   v_dispnum    = dbox.getInt("d_dispnum");
                   v_inuserid   = dbox.getString("d_inuserid");
                   v_name       = dbox.getString("d_name");
				   v_cnt        = dbox.getInt("d_cnt");
                   v_indate     = dbox.getString("d_indate");
                   v_title      = dbox.getString("d_title");
                   v_seq        = dbox.getInt("d_seq");
				   v_types      = dbox.getString("d_types");
                   v_readcnt    = dbox.getInt("d_readcnt");
                   v_upfilecnt  = dbox.getInt("d_filecnt");
                   v_totalpage  = dbox.getInt("d_totalpage");
                   v_rowcount   = dbox.getInt("d_rowcount");  


					// �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.

					if (!v_searchtext.equals("")&&v_select.equals("title")) {
						v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
					} else if(!v_searchtext.equals("")&&v_select.equals("name")){
						v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
					}

%>
  

                     
                    <tr> 
                      <td height="3" colspan="7"></td>
                    </tr>
                    <tr> 
                      <td width="45" class="tbl_br"><%=v_dispnum%></td>
                      <td width="86" class="tbl_bleft"><%=dbox.getString("d_categorynm")%></td>
                      <td width="274" class="tbl_bleft">
					        <%if (Integer.parseInt(v_types) > 0) {%>
								&nbsp;&nbsp;&nbsp;&nbsp;<IMG src="/images/user/support/ico_re.gif" border="0"> 
               				<% } %>
				
							<a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_inuserid%>','<%=v_types%>')"><%=v_title%></a>

 							<%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
								<IMG src="/images/user/support/ico_new.gif" border="0">
							<% } %>                      
                      </td>
                      <td width="91" class="tbl_br"><%=v_name%></td>
                      <td width="78" class="tbl_br"><%=FormatDate.getFormatDate(v_indate, "yyyy/MM/dd")%></td>
                      <td width="51" align="center"><% if( v_upfilecnt>0){ %>
							<img src="/images/user/support/ico_file.gif" width="13" height="12">
							<%}else{%>
							<%}%></td>
                      <td width="50" class="tbl_br"><%=v_cnt%></td>
                    </tr>
                    <tr> 
                      <td colspan="7"><img src="/images/user/support/search_line.gif"></td>
                    </tr>

                      <%}%>
					<%}else{%>

					<tr>
					  <td colspan="13" align=center valign=top>
							��ϵ� ������ �����ϴ�.	
					  </td>
					</tr>
					<%}%>
					
                    <tr> 
                      <td height="3" colspan="7"></td>
                    </tr>
                    <tr bgcolor="FCE1D0"> 
                      <td height="5" colspan="7"><img src="/images/user/myclass/class_tb_bo.gif"></td>
                    </tr>
                  </table>
                  <!-- ����¡&�˻� ���� -->
				  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10" colspan="2"></td>
                    </tr>
                    <tr> 
                      <td width="418" align="right">
					  <table width="130" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td>
							<%= HomePageQnaBean.printPageList(v_totalpage, v_pageno, row) %>
							</td>
                          </tr>
                        </table></td>
                      <td width="257" align="right">
					  
					  <a href="javascript:insertPage()" target="_self" onfocus=this.blur()>
					  <img src="/images/user/button/btn_know_resi.gif" border="0"></a></td>

                    </tr>
                  </table>
				<!--�˻�����-->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="227">&nbsp;</td>
                      <td width="56"> 
						<select name = "p_select" class = "input">
							<option value="name" <% if (v_select.equals("name")) out.print("selected"); %>>�ۼ���</option>
                			<option value="title" <% if (v_select.equals("title")) out.print("selected"); %>>����</option>
							<option value = "content" <% if (v_select.equals("content")) out.print("selected"); %>>����</option>
              			 </select>						
						</td>
                      <td width="132"><input type = "text" onFocus = "this.style.background='#FFFAE1'" onBlur = "this.style.background='#ffffff'" 
                name = "p_searchtext" value = "<%=v_searchtext %>" size = "25" maxlength = "30"></td>
                      <td width="260"><A HREF="javascript:selectList()"><IMG src="/images/user/button/btn_search.gif" border="0"></A></td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                  </table>
				<!--�˻���-->	
                     
				  
                  
                </td>
              </tr>
              <tr>
                <td align="center" valign="top">&nbsp;</td>
              </tr>             
              <!--<tr> 
                <td width="470" height="2" align="center" valign="top" bgcolor="#999999"></td>
              </tr>-->
</form> 
            </table>




<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->

