<%
//**********************************************************
//  1. ��      ��: �������� > �Ŀ����ͺ�
//  2. ���α׷��� : ku_OpenPower_R.jsp
//  3. ��      ��: �Ŀ����ͺ�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.26
//  7. ��      ��: 
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
	box.put("leftmenu","03");  

	 String  v_process  = box.getString("p_process");
    
    String  s_userid = box.getSession("userid");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int v_seq        = box.getInt("p_seq");

    int    v_cnt		= 0;            // ��ȸ��
    String v_gubun		= "";           // ��ü����
    String v_title		= "";           // ����
    String v_singleword = "";        // �Ѹ���
    String v_content = "";           // ����
    String v_date    = "";           // �����
    String v_name    = "";           // �����
    String v_userid  = "";           // userid
	String v_comptext = "";			 // �Ҽ�

    String v_useyn   	= "";			// �������
    String v_month		= "";			// �ش��
    
    String v_realfile	= "";
    String v_savefile	= "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectMember");
    
    if (dbox != null) {    
        v_cnt			= dbox.getInt("d_cnt");
        v_singleword	= dbox.getString("d_singleword"); 
        v_title			= dbox.getString("d_title"); 
		v_comptext		= dbox.getString("d_comptext"); 
        v_content		= dbox.getString("d_contents");
        v_date			= dbox.getString("d_ldate");   
        v_name			= dbox.getString("d_lname");
		v_useyn   		= dbox.getString("d_useyn"); 	
        v_gubun			= dbox.getString("d_gubun");	
        v_month			= dbox.getString("d_lmonth");

		v_realfile		= dbox.getString("d_realfile");
        v_savefile		= dbox.getString("d_savefile");
		
        v_date     = FormatDate.getFormatDate(v_date, "yyyy/MM/dd");
        //v_adcontent  = StringManager.replace(data.getAdcontent(),"\n","<br>");
     }  
            	
	String  s_gadmin    = box.getSession("gadmin");
    String  v_gadmin	= "";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topOpenkocca.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--

    function list() {
        document.form1.action = "/servlet/controller.homepage.KOpenPowerServlet";
        document.form1.p_process.value = "OpenPowerList";
        document.form1.submit();
    }

//-->
</SCRIPT>
					   
<form name="form1" method="post">
	<input type="hidden" name="p_seq">
	<input type="hidden" name="p_process">

					   <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > �������� > �Ŀ����ͺ�</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/openkocca/<%=tem_subimgpath%>/tit_power.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="88" rowspan="3"><img src="/images/user/kocca/openkocca/text_power.gif"></td>
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
                            <td height="15" colspan="6"></td>
                          </tr>
						  <tr>
							<td>
								<table width="680" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="105" style="padding-left:5px">
											<!--img src="/images/user/kocca/openkocca/photo_power01.jpg"-->
											<!-- ÷�λ��� -->
											<%if( !v_savefile.equals("") ){
											v_savefile = conf.getProperty("url.upload") + "bulletin/" + v_savefile;%>
											<a href="javascript:view(<%=v_seq%>)"><img src="<%=v_savefile%>"></a></td>
											<%}else{
											v_savefile = "/images/user/kocca/homepage/"+tem_subimgpath+"/blank_photo1.gif"; %>
											<img src="<%=v_savefile%>"></td>
											<%}%>
											<!-- ÷�λ��� -->
										</td>
										<td align="right" valign="top">
											<table width="560" border="0" cellspacing="0" cellpadding="0">
												<tr> 
													<td colspan="8" height="1" class="linecolor_main01"></td>
												</tr>
												<tr>
													<td colspan="5" class="tbl_gleft01" ><%=v_month%>�� <%=v_singleword%></td>
													<td width="1" valign="bottom"><img src="/images/user/kocca/openkocca/vline.gif"></td>
													<td>&nbsp;</td>
													<td width="80" align="center"><%=v_date%></td>
												</tr>
												<tr> 
													<td colspan="8" height="1" class="linecolor_main01"></td>
												</tr>
												<tr>
													<td width="50" class="tbl_gleft02">�̸� : </td>
													<td width="100"><b><%=v_title%></b></td>
													<td width="50">�Ҽ� : </td>
													<td width="430"><%=v_comptext%></td>
													<td colspan="3">&nbsp;</td>
												</tr>
												<tr> 
													<td colspan="8" height="1" class="linecolor_main01"></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td height="10" colspan="2"></td>
									</tr>
									<tr>
										<td colspan="2"><img src="/images/user/kocca/openkocca/bar_power_top.gif"></td>
									</tr>
									<tr valign="top">
										
                                  <td height="50" colspan="2" bgcolor="#F5F5F5" class="tbl_contents" ><%=v_content%></td>
									</tr>
									<tr>
										<td colspan="2"><img src="/images/user/kocca/openkocca/bar_power_bo.gif"></td>
									</tr>
									<tr>
										<td colspan="2" height="20"></td>
									</tr>
								</table>
							</td>
						  </tr>
                          
                        </table> 
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="3" class="tbl_bgcolor_openkocca"></td>
                          </tr>
                          <tr>
                            <td height="27" class="linecolor_notice">
							<table width="52" border="0" align="right" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td><a href="javascript:list()"><img src="/images/user/kocca/button/btn_list.gif" border="0"></a></td>
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
  </form>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
