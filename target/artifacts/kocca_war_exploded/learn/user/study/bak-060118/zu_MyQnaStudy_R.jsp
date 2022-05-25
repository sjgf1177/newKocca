<%
//**********************************************************
//  1. ��      ��: ���������� - �н����� �󼼺���
//  2. ���α׷���: zu_MyQnaStudy_R.jsp
//  3. ��      ��: ����������
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 7. 20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
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


    DataBox dbox        = (DataBox)request.getAttribute("MyQnaStudyViewPage");
       
    String v_inuserid   = dbox.getString("d_inuserid");
    String v_name       = dbox.getString("d_name");
    String v_indate     = dbox.getString("d_indate");
    String v_title      = dbox.getString("d_title");
    String v_contents   = dbox.getString("d_contents");

   	Vector v_realfileVector = null;
	Vector v_savefileVector = null;
	v_realfileVector    = (Vector)dbox.getObject("d_realfile");
	v_savefileVector    = (Vector)dbox.getObject("d_savefile");
	int    v_filecount = v_realfileVector.size();

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topMyClass.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--

//-->
</script>


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
                  <!-- ������ -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="98" valign="top"><img src="/images/user/myclass/tab_study_on.gif"> 
                      </td>
                      <td width="98" valign="top" ><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaSiteListPage" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image37','','/images/user/myclass/tab_site_on.gif',1)"><img src="/images/user/myclass/tab_site.gif" name="Image37" border="0"></a></td>
                      <td width="98" valign="top" >&nbsp;</td>
                      <td width="381" ></td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="4"></td>
                    </tr>
                  </table>
                  <!-- qna table -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="6"><img src="/images/user/myclass/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td width="94"><img src="/images/user/myclass/text_title.gif"></td>
                      <td colspan="5" class="tbl_btit"><%=v_title%></td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/myclass/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/myclass/text_name.gif"></td>
                      <td width="149" class="tbl_gleft"><%=v_name%>(<%= v_inuserid %>)</td>
                      <td width="95"><img src="/images/user/myclass/text_day.gif"></td>
                      <td width="117" class="tbl_gleft"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %> </td>
                      <td width="95"><!--img src="/images/user/myclass/text_viewnum.gif" --></td>
                      <td width="125" class="tbl_gleft"></td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
					 <tr> 
                      <td width="94"><img src="/images/user/myclass/text_file.gif"></td>
                      <td colspan="5" class="tbl_bdata">
           <%		
				if( v_realfileVector != null ) { 
					for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����

						String v_realfile = (String)v_realfileVector.elementAt(i);
						String v_savefile = (String)v_savefileVector.elementAt(i);  	

						if(v_realfile != null && !v_realfile.equals("")) {  %> <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'> 
              <%= v_realfile%></a><br>
              <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>> 
              <%		}   %> <%			}
				}
		%>  
					  </td>
                    </tr>
                    <tr> 
                      <td colspan="6"><img src="/images/user/myclass/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td colspan="6" class="tbl_contents"><%=v_contents%></td>
                    </tr>
                    <tr bgcolor="B8D5E5"> 
                      <td height="5" colspan="6"><img src="/images/user/myclass/class_tb_bo.gif"></td>
                    </tr>
                    <tr> 
                      <td height="10" colspan="6"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="418" align="right">&nbsp; </td>
                      <td width="257" align="right"> <a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaStudyListPage"><img src="/images/user/button/btn_list.gif" border="0"></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
              <tr> 
                <td width="470" height="2" align="center" valign="top" bgcolor="#999999"></td>
              </tr>
            </table>
            
            
<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->