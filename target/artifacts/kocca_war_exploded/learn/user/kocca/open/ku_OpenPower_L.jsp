<%
//**********************************************************
//  1. ��      ��: �������� > �Ŀ����ͺ�
//  2. ���α׷��� : ku_HomePageFaq_L.jsp
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

	box.put("tem_grcode",box.getSession("tem_grcode"));

	String  v_process = box.getString("p_process");
	String  v_grcode  = box.getString("tem_grcode");  
    
    int v_pageno         = box.getInt("p_pageno");
	int row = 2;
    if (v_pageno == 0) {
        v_pageno = 1;
    }
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");
	String  v_gubun		  = box.getString("p_gubun");

	int i = 0;
    int    v_seq     = 0;           // �Ϸù�ȣ
	int    v_cnt     = 0;           // ��ȸ��	

    String v_title   = "";          // Ʃ�͸�
    String v_content = "";          // ����
    String v_ldate   = "";          // �����
    String v_name    = "";          // �����
	String v_useyn   = "";			// ���λ�뿩��
	String v_savefile = "";			// �������ϸ�
	String v_realfile = "";			// �������ϸ�
	String v_select_seq = "";		// ���� �Խü��õ� seq
	String v_month   = "";			// �ش��
	String v_singleword   = "";		// ����
	String v_comptext	= "";		// �Ҽ�

	String v_content_text = "";		// ���𿡼� text �� ����	

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

	ArrayList list = (ArrayList)request.getAttribute("selectList");
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topOpenkocca.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">

     function view(seq) {
        form1.action = "/servlet/controller.homepage.KOpenPowerServlet";
        form1.p_seq.value = seq;
        form1.p_process.value = "OpenPowerDetail";
        form1.submit();
    }

	function selectView(seq) {
        form1.action = "/servlet/controller.homepage.KOpenPowerServlet";
        form1.p_seq.value = seq;
        form1.p_process.value = "OpenPowerDetail";
        form1.submit();
    }

	//������ �̵�
	function goPage(pageNum) {
		 document.form1.p_pageno.value = pageNum;
		 document.form1.action = "/servlet/controller.homepage.KOpenPowerServlet";
		 document.form1.p_process.value = "OpenPowerList";
		 document.form1.submit();
	}

</SCRIPT>	
				
<form name="form1" method="post">
	<input type="hidden" name="p_seq">
	<input type="hidden" name="p_process">
	<input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>">
	
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
                        </table>
						<!-- ���ͺ�1 --> 
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
<% String contents_value = null;
if( !list.equals("")){
            for( i = 0; i < list.size(); i++) {
                DataBox dbox = (DataBox)list.get(i);
                v_seq   = dbox.getInt("d_seq");
                v_cnt	= dbox.getInt("d_cnt");
                v_title = dbox.getString("d_title");			// Ʃ�͸�
                v_ldate = dbox.getString("d_ldate");
                v_name  = dbox.getString("d_lname");
                v_useyn = dbox.getString("d_useyn");
                v_month = dbox.getString("d_lmonth");
                v_singleword = dbox.getString("d_singleword");  // ����
				v_content = dbox.getString("d_contents");
				v_content_text = dbox.getString("d_content_text");
				v_comptext = dbox.getString("d_comptext");
				
                v_savefile = dbox.getString("d_savefile");
                v_realfile = dbox.getString("d_realfile");
				v_dispnum   = dbox.getInt("d_dispnum");
                v_totalpage = dbox.getInt("d_totalpage");

				if( v_content_text.length() > 130) contents_value = v_content_text.substring(0,130)+"...";
				else  contents_value = v_content_text;

                v_ldate   = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");
%>
                          <tr> 

                            <td width="105" style="padding-left:5px"> 
								<!-- ÷�λ��� -->
								<%if( !v_savefile.equals("") ){
								v_savefile = conf.getProperty("url.upload") + "bulletin/" + v_savefile;%>
								<img src="<%=v_savefile%>"></td>
								<%}else{
								v_savefile = "/images/user/kocca/homepage/"+tem_subimgpath+"/blank_photo1.gif"; %>
								<img src="<%=v_savefile%>"></td>
								<%}%>
								<!-- ÷�λ��� -->
                            <td align="right" valign="top"> 
							  <table width="560" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td colspan="8" height="0" class="linecolor_main01"></td>
                                </tr>
                                <tr> 
                                  <td class="tbl_gleft04"><%=v_month%>�� <%=v_singleword%></td>
                                  <td><a href="javascript:selectView(<%=v_seq%>)"><img src="/images/user/kocca/button/btn_more.gif" border="0"></a></td>
                                  <td width="1" valign="bottom"><img src="/images/user/kocca/openkocca/vline.gif"></td>
                                  <td width="80" align="center"><%=v_ldate%></td>
                                </tr>
                                <tr> 
                                  <td colspan="8" height="1" class="linecolor_main01"></td>
                                </tr>
                                <tr> 
                                  <td width="499" colspan="2" valign="top" class="tbl_gleft" >
									<a href="javascript:view(<%=v_seq%>)"><%=contents_value%></a>
									</td>
                                  <td width="1" ><img src="/images/user/kocca/openkocca/vline_l.gif"></td>
                                  <td class="tbl_gleft" width="90"><b><%=v_title%></b><br><%=v_comptext%></td>
                                </tr>
                              </table></td>
                          </tr>
						  <tr> 
                            <td height="17" colspan="2"></td>
                          </tr>
<%		}
	}
if(list.size() == 0){%>	  
						  <tr> 	
							<td colspan="8" height="25" valign="center" align="center"> ��ϵ� ������ �����ϴ�.</td> 
						  </tr>
						 <tr> 
						    <td colspan="8" height="1" class="linecolor_main01"></td>
						 </tr>
<%}%>                     
						  <tr> 
                            <td height="10" colspan="2"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td class="tbl_bgcolor_openkocca" height="3" colspan="2" ></td>
                          </tr>
                          <tr> 
                            <td width="630" height="27" class="linecolor_notice"> 
                              <!-- ������ -->
							   <table width="540" border="0" align="center" cellpadding="0" cellspacing="0">
								  <tr> 
									<td>
										<%= PageUtil.printPageListKocca(v_totalpage, v_pageno, row) %>
									</td>
								  </tr>
								</table>  
							</td>
                            <td width="50" class="linecolor_notice">&nbsp;</td>
                          </tr>
                        </table>
</form>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
