<%
//**********************************************************
//  1. ��      ��: SUBJECT LIST
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��      ��: ������ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.01.14
//  7. ��      ��:
//***********************************************************
%>
<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    box.put("leftmenu","01");                       // �޴� ���̵� ����

    String  v_process      = box.getString("p_process");
    String  v_rprocess     = box.getString("p_rprocess");
    String  v_subj         = box.getString("p_subj");
    String  v_subjnm       = box.getString("p_subjnm");
    String  v_isonoff      = box.getString("p_isonoff");
    String  v_upperclassnm = box.getString("p_upperclassnm");
    String  v_upperclass   = box.getString("p_upperclass");
    String  v_rupperclass   = box.getString("p_rupperclass");
    String  v_select       = box.getString("p_select");
    String  v_actionurl    = box.getString("p_actionurl");
    String  v_lsearchsubject = box.getString("p_lsearchsubject");
    String  v_gubun          = box.getString("p_gubun");

    ArrayList list1      = null;
    
%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<form name="form1" method="post" action="">
    <input type='hidden' name='p_process' value="<%=v_process%>" >
    <input type='hidden' name='p_select' value="<%=v_select%>">
    <input type='hidden' name='p_gubun' value="<%=v_gubun%>">

    <input type='hidden' name='p_subj' value="<%=v_subj%>">
    <input type='hidden' name='p_subjnm' value="<%=v_subjnm%>">
    <input type='hidden' name='p_rprocess' value="<%=v_rprocess%>">
    <input type='hidden' name='p_actionurl' value="<%=v_actionurl%>">
    <input type='hidden' name='p_isonoff' value="<%=v_isonoff%>">
    <input type='hidden' name='p_upperclass' value="<%=v_upperclass%>">
    <input type='hidden' name='p_rupperclass' value="<%=v_rupperclass%>">
    <input type='hidden' name='p_upperclassnm' value="<%=v_upperclassnm%>">

    <input type='hidden' name='p_lsearchsubject' value="<%=v_lsearchsubject%>">

          <!-- center start -->
            <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; ������û/�ȳ� &gt; ������û</td>
              </tr>
              <tr> 
                <td align="center" valign="top">
                <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="75"><img src="/images/user/support/search_img.gif" alt="�����˻�"></td>
                      <td width="131"><select name="menu1" onChange="MM_jumpMenu('parent',this,0)">
                          <option selected>:: �������� :: </option>
                          <option>���信���ý����� </option>
                        </select></td>
                      <td width="133"><input name="textfield" type="text" class="input" value="" size="20"></td>
                      <td width="337"><img src="/images/user/button/btn_search.gif" alt="�˻�"></td>
                    </tr>
                    <tr> 
                      <td colspan="4"><img src="/images/user/support/search_line.gif"></td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                  </table> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/apply/<%=tem_subimgpath%>/tit_apply.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20">&nbsp;</td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="565" valign="top"><img src="/images/user/apply/st_applyview.gif"></td>
                      <td width="110" align="right" valign="top"><a href="javascript:history.back()"><img src="/images/user/button/btn_list.gif" alt="���" border="0"></a>
                      </td>
                    </tr>
                    <tr> 
                      <td height="5" colspan="2"></td>
                    </tr>
                    <tr valign="top"> 
                      <td colspan="2"> 
                        <!-- �������� table  -->
                        <table width="675" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                          <tr  class="lcolor"> 
                            <td height="3" colspan="4" class="lcolor"></td>
                          </tr>
                          <tr> 
                            <td width="69"  class="tbl_gtit2">����</td>
                            <td width="316" class="tbl_gtit">�μ�</td>
                            <td width="109" class="tbl_gtit2">�̸�</td>
                            <td width="145" class="tbl_gtit">��û��</td>
                          </tr>

<%
                    list1 = (ArrayList)request.getAttribute("ProposeList");
                    int i = 0;
                    for(i = 0; i < list1.size(); i++) {
                        DataBox dbox = (DataBox)list1.get(i);
%>
                          <tr> 
                            <td class="tbl_grc"><%=Integer.parseInt(dbox.getString("d_subjseqgr"))%></td>
                            <td class="tbl_gleft"><%=dbox.getString("d_name")%></td>
                            <td class="tbl_grc"><%=dbox.getString("d_compnm")%></td>
                            <td class="tbl_grc"><%=FormatDate.getFormatDate(dbox.getString("d_appdate"),"yyyy/MM/dd")%></td>
                          </tr>
<%
                    }

                    if(i == 0){
%>
                          <tr> 
                            <td class="tbl_grc" colspan="4">������û�ڰ� �������� �ʽ��ϴ�.</td>
                          </tr>
<%
                    }
%>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="565" valign="top">&nbsp;</td>
                      <td width="110" align="right" valign="top"><a href="javascript:history.back()"><img src="/images/user/button/btn_list.gif" alt="���" border="0"></a> 
                      </td>
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
            </table>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->