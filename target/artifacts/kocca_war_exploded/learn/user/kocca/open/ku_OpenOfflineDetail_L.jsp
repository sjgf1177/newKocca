<%
/**
 * file name : gu_OpenOfflineDetail_L.jsp
 * date      : 2005/12/16
 * programmer:	lyh
 * function  : �������ΰ����ڷ� ������
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
	DataBox dbox = null;
	DataBox dbox2 = null;
	DataBox dbox3 = null;


	box = (RequestBox)request.getAttribute("requestbox");
	String v_userid = box.getSession("userid");

	String lDate = "";
	box.put("leftmenu","02");  

    ArrayList list = (ArrayList)request.getAttribute("OpenOfflineListDetail");			//�ش�� ��
    ArrayList preList = (ArrayList)request.getAttribute("OpenOfflineListDetailPre");	//������
    ArrayList nextList = (ArrayList)request.getAttribute("OpenOfflineListDetailNext");	//������

	if(list.size() != 0 ){
		dbox = (DataBox)list.get(0);
	}

	lDate = FormatDate.getFormatDate(dbox.getString("d_ldate"),"yyyy/MM/dd");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topOpenkocca.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
function listGo(){
	location.href = "/servlet/controller.homepage.KOpenOfflineServlet?p_process=OpenOfflineList";
}

function preNextGo(seq,grcode){
	document.frm1.seq.value = seq;
	document.frm1.grcode.value = grcode;
	document.frm1.p_process.value = "OpenOfflineDetail";
	document.frm1.action = "/servlet/controller.homepage.KOpenOfflineServlet";
	document.frm1.submit();
}


//-->
</SCRIPT>
<!-- title -->
                  <table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                    <tr> 
                      <td width="20">&nbsp;</td>
                      <td valign="top"><table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > �������� > �������ΰ���</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/openkocca/<%=tem_subimgpath%>/tit_offline.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
						<!--  -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="88" rowspan="3"><img src="/images/user/kocca/openkocca/text_offline.gif"></td>
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
                            <td width="75" class="linecolor_notice01">����</td>
                            <td width="605" colspan="5" class="tbl_gleft01"><%=dbox.getString("d_subjnm")%></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1" class="linecolor_main01"></td>
                          </tr>
                          <tr> 
                            <td colspan="6" height="1"></td>
                          </tr>
                          <tr> 
                            <td class="linecolor_notice01">�ۼ���</td>
                            <td width="220" class="tbl_gleft02">���</td>
                            <td width="75" class="linecolor_notice01">�ۼ���</td>
                            <td width="110" class="tbl_gleft02"><%=lDate%></td>
                            <td width="75" class="linecolor_notice01" >��ȸ��</td>
                            <td width="125" class="tbl_gleft02"><%=dbox.getString("d_readcnt")%></td>
                          </tr>
                           <tr> 
                            <td colspan="6" height="1" class="linecolor_main01"></td>
                          </tr>
                          <tr> 
                            <td colspan="6">

						<!-- ������� -->
						<FORM name="frm1" METHOD=POST>
								<INPUT TYPE="hidden" NAME="seq">
								<INPUT TYPE="hidden" NAME="grcode">
								<INPUT TYPE="hidden" NAME="p_process">
						</FORM>

						<table width="680" border="0"  cellspacing="0" cellpadding="0">
							<tr> 
							  <td class="tbl_gleft">- �Ͻ� : <%=FormatDate.getFormatDate(dbox.getString("d_dday"),"yyyy.MM.dd")%> <%=FormatDate.getFormatTime(dbox.getString("d_starttime"),"HH:mm")%>  ~ <%=FormatDate.getFormatTime(dbox.getString("d_endtime"),"HH:mm")%></td>
							</tr>
							<tr> 
							  <td class="tbl_gleft">- ��� : <%=dbox.getString("d_place")%></td>
							</tr>
							<tr> 
							  <td class="tbl_gleft">- ���� : <%=dbox.getString("d_tname")%></td>
							</tr>
							<tr> 
							  <td class="tbl_gleft">- ���� : <%=dbox.getString("d_codenm")%></td>
							</tr>
							<tr> 
							  <td class="tbl_gleft">- ���� : 
									 <% if(!dbox.getString("d_limitmember").equals("")){
											out.print(dbox.getString("d_limitmember")+" ��");
											} else{ out.print(" - ");}
										%>
								</td>
							</tr>
							<tr> 
							  <td class="tbl_gleft">
										- ���� : 
									  <TABLE border="0"  cellspacing="0" cellpadding="0" >
									  <TR><TD height="5"></TD></TR>
									  <TR>
										<TD valign="top"><%=dbox.getString("d_content")%></TD>
									  </TR>
									  </TABLE>
							  </td>
							</tr>
							</table>
						  
					<!-- ���� �� -->

							  </td>
                          </tr>
                         <tr> 
                            <td colspan="6" height="1" class="linecolor_main01"></td>
                          </tr>
<%
	//�������� �ִٸ�
	if(preList.size() != 0 ){
		dbox2 = (DataBox)preList.get(0);
%>
                          <tr> 
                            <td class="linecolor_notice01">������</td>
                            <td colspan="5" class="tbl_gleft02"><A HREF="javascript:preNextGo('<%=dbox2.getString("d_seq")%>','<%=dbox2.getString("d_grcode")%>')"><%=dbox2.getString("d_subjnm")%></A></td>
                          </tr>
<%
	}
%>	

<%
	//�������� �ִٸ�
	if(nextList.size() != 0 ){
		dbox3 = (DataBox)nextList.get(0);
%>
                          <tr> 
                            <td colspan="6" height="1" class="linecolor_main01"></td>
                          </tr>
						  <tr> 
                            <td class="linecolor_notice01">������</td>
                            <td colspan="5" class="tbl_gleft02"><A HREF="javascript:preNextGo('<%=dbox3.getString("d_seq")%>','<%=dbox3.getString("d_grcode")%>')"><%=dbox3.getString("d_subjnm")%></A></td>
                          </tr>
<%
	}else{		// �������� ��� ������ �Ʒ� ������ ���̵���
%>	
						  <tr> 
							<td height="1" colspan="6" class="linecolor_board4" ></td>
						  </tr>

<%
}
%>
                        </table>

						<!--  -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="3" class="tbl_bgcolor_openkocca"></td>
                          </tr>
                          <tr>
                            <td height="27" class="linecolor_notice">
							<table width="52" border="0" align="right" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td><a href="/servlet/controller.homepage.KOpenOfflineServlet?p_process=OpenOfflineList"><img src="/images/user/kocca/button/btn_list.gif" border="0"></a></td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="1" bgcolor="#cccccc"></td>
                          </tr>
                        </table></td>
                      <td width="21">&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
        </tr>
      </table> 
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>


<!--  -->
	</td>
  </tr>
  <tr>
	<td align="center" valign="top">&nbsp;</td>
  </tr>
</table>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->