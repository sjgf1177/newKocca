<%
//**********************************************************
//  1. ��      ��: SUBJECT LIST
//  2. ���α׷���:  ku_CourseIntroRecognition2_L.jsp
//  3. ��      ��: ������ȸ (��������)
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%

    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    box.put("leftmenu","06");                       // �޴� ���̵� ����
    String  v_process         = box.getString("p_process");

    String  v_sphere     = box.getString("p_sphere");


%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topCourse.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
    function whenTabSelect(sphere){
      document.form1.p_sphere.value = sphere;
      document.form1.p_process.value  = 'SubjectListRecognition';
      document.form1.action='/servlet/controller.course.KCourseIntroServlet';
      document.form1.target = "_self";
      document.form1.submit();
    }
//-->
</SCRIPT>

<form name="form1" method="post" >
    <input type='hidden' name='p_process'  value="<%=v_process%>">
    <input type='hidden' name='p_rprocess' value="">
    <input type='hidden' name='p_sphere'   value="<%=v_sphere%>">
    <input type='hidden' name='p_subj'     value="">


                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td  class="location" > HOME > �����Ұ� > ������������</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/course/<%=tem_subimgpath%>/tit_course_recognition.gif"></td>
                          </tr>
                          <tr>
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/course/text_main_recognition.jpg" ></td>
                          </tr>
                          <tr>
                            <td height="19"></td>
                          </tr>
                        </table>
                        <!--�ѿ����� -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="94"><img src="/images/user/kocca/course/tab_reco02_on.gif"></td>
							<td width="3">&nbsp;</td>
							<td width="94"><a href="javascript:whenTabSelect('XXX')"><img src="/images/user/kocca/course/tab_reco01.gif" name="Image311"  id="Image311" onMouseOver="MM_swapImage('Image311','','/images/user/kocca/course/tab_reco01_on.gif',1)" onMouseOut="MM_swapImgRestore()"></a></td>
                            <td width="490">&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="5" colspan="12" ></td>
                          </tr>
                          <tr>
                            <td height="1" colspan="12" class="linecolor_cource02"></td>
                          </tr>
                          <tr>
                            <td height="17" colspan="12">&nbsp;</td>
                          </tr>
                        </table>
                        <!--�帣���о�_�����ؽ�Ʈ-->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="144"><div align="center"><img src="/images/user/kocca/course/text_t_reco_info.gif" ></div></td>
                            <td width="1" class="tbl_bleft5"><img src="/images/user/kocca/course/vline.gif" ></td>
                            <td class="tbl_bleft5"><img src="/images/user/kocca/course/text_t_reco_info_02.gif" ></td>
                          </tr>
                          <tr>
                            <td height="20" colspan="3" >&nbsp;</td>
                          </tr>
                        </table>
                        <!--�帣���о�_����-->
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td><img src="/images/user/kocca/course/sst_spack_aaa.gif" ></td>
							</tR>
						</table>
                        <!--table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/course/st_sub_box_top.gif"></td>
                          </tr>
                          <tr>
                            <td background="/images/user/kocca/course/bg_box.gif">
                              <table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="27">&nbsp;</td>
                                  <td width="625">
                                    <!--Ư¡ -->
                                    <!--table width="625" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="20">&nbsp;</td>
                                      </tr>
                                      <tr> 
                                        <td><img src="/images/user/kocca/course/sst_spack.gif" ></td>
                                      </tr>
                                      <tr> 
                                        <td height="10"></td>
                                      </tr>
                                    </table>
                                    <table width="625" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td colspan="4"><img src="/images/user/kocca/course/bar_spack_top.gif" ></td>
                                      </tr>
                                      <tr bgcolor="#F9F7E8"> 
                                        <td width="19" height="74">&nbsp;</td>
                                        <td width="35" valign="top"><img src="/images/user/kocca/course/i_spack.gif" ></td>
                                        <td width="26">&nbsp;</td>
                                        <td width="552">
                                          <strong>�������</strong> : ����������<br> 
                                          <strong>��������</strong> : 70��<br> 
                                          <strong>�������</strong> : ������ (60%) ���� (10%) : �¶��� ����(10%) : ������ (20%) ���� 60�� �̻�<br> 
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td colspan="4"><img src="/images/user/kocca/course/bar_spack_bottom.gif" ></td>
                                      </tr>
                                      <tr> 
                                        <td height="20" colspan="4">&nbsp;</td>
                                      </tr>
                                    </table></td>
                                  <td width="27">&nbsp;</td>
                                </tr>
                              </table>
                             </td>
                          </tr>
                          <tr>
                            <td><img src="/images/user/kocca/course/st_sub_box_bottom.gif" ></td>
                          </tr>
                        </table-->
</form>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
