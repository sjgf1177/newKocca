<%
//**********************************************************
//  1. ��      ��: Ȩ������ ����ü�赵
//  2. ���α׷���: zu_HomePageWork_L.jsp
//  3. ��      ��: Ȩ������ ��뺸�� �ȳ�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 7. 25
//  7. ��      ��: �̿��� 2005. 7. 25
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    String s_userid      = box.getSession("userid");
    String v_dirKey      = "bulletin";
    String v_url         = conf.getProperty("url.upload")+v_dirKey;


	ArrayList list       = (ArrayList)request.getAttribute("selectList");

	DataBox boxImg       = (DataBox)request.getAttribute("selectImg");

	int    s_tabseq      = boxImg.getInt("d_tabseq");
	String realpdf       = boxImg.getString("d_realpdf");
	String savepdf       = boxImg.getString("d_savepdf");
	String realsfile     = boxImg.getString("d_realsfile");
	String savesfile     = boxImg.getString("d_savesfile");
	String reallfile     = boxImg.getString("d_reallfile");
	String savelfile     = boxImg.getString("d_savelfile");
	String v_savesfile   = v_url + "/" + savesfile;
	String v_savelfile   = v_url + "/" + savelfile;

	box.put("leftmenu","02");                       // �޴� ���̵� ����
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topGuide.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--
//��ȭ�� �������� �̵�
function selectImg(seq) {
	document.form1.action = "/servlet/controller.homepage.HomePageCourseServlet";
	document.form1.p_process.value   = "selectList";
	document.form1.p_tabseq.value    = seq;
	document.form1.submit();
}

//ū �̹������� �˾�â ����
function whenLFile(tabseq,savelfile) {

    window.open("/learn/user/homepage/zu_HomePageCourse_P.jsp?p_savelfile='<%=savelfile%>'", "", "width=800,height= 600, status=yes, scrollbars=yes");

}

//-->
</script>



		  <!-- center start -->
		  <form name="form1" method = "post">
		  <input type = "hidden" name = "p_process"    value = "">
		  <input type = "hidden" name = "p_tabseq"     value = <%=s_tabseq%>>
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; �����ȳ� &gt; ����ü�赵</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/<%=tem_subimgpath%>/tit_course.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
				    <tr>
					  <td colspan="5" align="right"><img src="/images/user/button/btn_g_totaldown.gif"></td>
					</tr>
                    <tr> 
                      <td width="675" valign="top" class="font_ex"> 
                        <!-- �����з��� -->
                        <table width="675" border="0" cellpadding="0" cellspacing="0" bgcolor="ededed">
					<%
						for( int i = 0; i < list.size(); i++) {

						DataBox dbox            = (DataBox)list.get(i);  
						int     v_tabseq        = dbox.getInt("d_tabseq");
						String  v_tabseqname    = dbox.getString("d_tabseqname");
						String  tabBg    = "";
						String  tabHead  = ""; 
						String  tabClass = "";
						String  tabTail  = "";
					
					if(v_tabseq==s_tabseq){
						tabBg    = "/images/user/guide/tab_bg_on.gif";
						tabHead  = "/images/user/guide/tab_head_on.gif";
						tabClass = "tbl_ytabon";
						tabTail  = "/images/user/guide/tab_tail_on.gif";
					}else{
						tabBg    = "/images/user/apply/tab_bg.gif";
						tabHead  = "/images/user/apply/tab_head.gif";
						tabClass = "tbl_gtaboff";
						tabTail  = "/images/user/apply/tab_tail.gif";
					}
						if(i%5==0){

					%>
                              <!-- Ȱ���� -->
						  <tr>
						<%}%>
                            <td width="133"> 
                              <table width="130" border="0" cellpadding="0" cellspacing="0" background="<%=tabBg%>">

                                <tr> 
                                  <td width="10" height="25"><img src="<%=tabHead%>"></td>
                                  <td width="111" class="<%=tabClass%>"><a href="javascript:selectImg(<%=v_tabseq%>)"><%=v_tabseqname%></a></td>
                                  <td width="10" align="right"><img src="<%=tabTail%>"></td>
                                </tr>
                              </table>
							</td>

                        <%if((i%5!=4)&&list.size()-1==i){%>
							  <td colspan="<%=5-(list.size()%5)%>">&nbsp; </td>
                            <!--<td width="127" align="right">vv&nbsp;</td>-->
                          </tr>
					    <%}%>

						<%if(((i%5==4))||list.size()==i){%>
						</tr>
						<%}
					}
					%>

                          <tr bgcolor="C8C8C8"> 
                            <td height="2" colspan="5"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="15">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="center" bgcolor="FBFAF1" style="padding-top:10px;padding-bottom:10px;">
					  <table width="625" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td align="right">
							<a href="/servlet/controller.library.DownloadServlet?p_savefile=<%=savepdf%>&p_realfile=<%=realpdf%>"><img src="/images/user/button/btn_g_download.gif" border="0"></a> 
							<a href="javascript:whenLFile(<%=s_tabseq%>,'<%=v_savelfile%>')"><img src="/images/user/button/btn_g_bigsize.gif" border="0"></a>
                               
                            </td>
                          </tr>
                          <tr>
                            <td height="5"></td>
                          </tr>
                          <tr>
                            <td align="center"><a href="javascript:whenLFile(<%=s_tabseq%>,'<%=v_savelfile%>')"><img src="<%=v_savesfile%>" border="0"></a></td>
                          </tr>
                        </table></td>
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
			</form>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
