<%
//**********************************************************
//  1. ��      ��: SUBJECT LIST
//  2. ���α׷���:  ku_CourseIntroWorkshop2_L.jsp
//  3. ��      ��: ������ȸ (��ũ��)
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
    box.put("leftmenu","05");                       // �޴� ���̵� ����
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
      document.form1.p_process.value  = 'SubjectListWorkshop';
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
                            <td  class="location" > HOME > �����Ұ� > ��ũ�����</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/course/<%=tem_subimgpath%>/tit_course_workshop.gif"></td>
                          </tr>
                          <tr>
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/course/text_main_workshop.jpg" ></td>
                          </tr>
                          <tr>
                            <td height="19"></td>
                          </tr>
                        </table>
                        <!--�ѿ����� -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="94"><img src="/images/user/kocca/course/tab_work02_on.gif" name="Image32"></td>
							<td width="3">&nbsp;</td>
							<td width="94"><a href="javascript:whenTabSelect('XXX')"><img src="/images/user/kocca/course/tab_work01.gif" name="Image311"  id="Image311" onMouseOver="MM_swapImage('Image311','','/images/user/kocca/course/tab_work01_on.gif',1)" onMouseOut="MM_swapImgRestore()"></a></td>
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
                        <!--�帣���о�_�����ؽ�Ʈ -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="144"><div align="center"><img src="/images/user/kocca/course/text_t_workshop_info.gif" ></div></td>
                            <td width="1" class="tbl_bleft5"><img src="/images/user/kocca/course/vline.gif" ></td>
                            <td class="tbl_bleft5"><img src="/images/user/kocca/course/text_t_workshop_info_02.gif" ></td>
                          </tr>
                          <tr>
                            <td height="20" colspan="3" >&nbsp;</td>
                          </tr>
                        </table>
                        <!--�帣���о�_���� -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/course/st_sub_box_top.gif"></td>
                          </tr>
                          <tr>
                            <td background="/images/user/kocca/course/bg_box.gif"><table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="27">&nbsp;</td>
                                  <td width="625">
                                  <table width="625" border="0" cellspacing="0" cellpadding="0">
                                      <!--tr>
                                        <td><img src="/images/user/kocca/course/st_workshop_pur.gif" ></td>
                                      </tr>
                                      <tr>
                                        <td height="20"></td>
                                      </tr-->
                                      <tr>
                                        <td><img src="/images/user/kocca/course/n_box_workshop_01.gif" ></td>
                                      </tr>
                                      <!--tr>
                                        <td height="5"></td>
                                      </tr>
                                      <tr>
                                        <td><img src="/images/user/kocca/course/box_workshop_02.gif" ></td>
                                      </tr>
                                      <tr>
                                        <td height="5"></td>
                                      </tr>
                                      <tr>
                                        <td><img src="/images/user/kocca/course/box_workshop_03.gif" ></td>
                                      </tr>
                                      <tr>
                                        <td height="5"></td>
                                      </tr-->
                                    </table>
                                    <!--�������� ���� -->
                                    <table width="625" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td height="15"></td>
                                      </tr>
                                      <tr>
                                        <td ><img src="/images/user/kocca/course/st_workshop_plan.gif" ></td>
                                      </tr>
                                      <tr>
                                        <td height="4"></td>
                                      </tr>
                                      <tr>
                                        <td >
                                          <table border="0" cellpadding="0" cellspacing="1" width="623" bgcolor="#C9C9C9">
                                            <tr height="25" bgcolor="#DDD4BA" align="center">
                                                <td width="28"><font color="000000">��</font></td>
                                                <td width="200"><font color="000000">����</font></td>
                                                <td width="240"><font color="000000">�����</font></td>
                                                <td width="155"><font color="000000">���</font></td>
                                            </tr>
                                            <tr height="25" bgcolor="#FFFFFF" align="center">
                                                <td>1</td>
                                                <td rowspan="8">
                                                   �ִϸ��̼ǿ�ũ��<Br>
                                                   �������ۿ�ũ��<Br>
                                                   ĳ���Ϳ�ũ��<Br>
                                                   ��������ͳݿ�ũ��<Br>
                                                   ���Ǹ�ȭ��ũ��<Br>
                                                   ��ȭ��ũ��<Br>
												   ��ȭ������ũ��<Br>
													��ȭ����ũ��<Br>
                                                    <�� ���� ���� �� ����>
                                                </td>
                                                <td>���������̼� & 1�� ��������</td>
                                                <td>��ü���� / ������</td>
                                            </tr>
                                            <tr height="25" bgcolor="#FFFFFF" align="center">
                                                <td>2</td>
                                                <td>�� ������ �¶��� �н�</td>
                                                <td>���º�</td>
                                            </tr>
                                            <tr height="25" bgcolor="#FFFFFF" align="center">
                                                <td>3</td>
                                                <td>�� ������ �¶��� �н�</td>
                                                <td>���º�</td>
                                            </tr>
                                            <tr height="25" bgcolor="#FFFFFF" align="center">
                                                <td>4</td>
                                                <td>2�� ���� ���� �� ���</td>
                                                <td>���º�</td>
                                            </tr>
                                            <tr height="25" bgcolor="#FFFFFF" align="center">
                                                <td>5</td>
                                                <td>�� ������ �¶��� �н�</td>
                                                <td>���º�</td>
                                            </tr>
                                            <tr height="25" bgcolor="#FFFFFF" align="center">
                                                <td>6</td>
                                                <td>�� ������ �¶��� �н�</td>
                                                <td>���º�</td>
                                            </tr>
                                            <tr height="25" bgcolor="#FFFFFF" align="center">
                                                <td>7</td>
                                                <td>3�� ���� ���� �� ���</td>
                                                <td>���º�</td>
                                            </tr>
                                            <tr height="25" bgcolor="#FFFFFF" align="center">
                                                <td>8</td>
                                                <td>�� ������ �¶��� �н�</td>
                                                <td>���º�</td>
                                            </tr>
                                         </table><br>

                                        </td>
                                      </tr>
                                       <tr>
                                        <td height="10"></td>
                                      </tr>
                                      <tr>
                                        <td>
                                        <table width="625" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td height="5"><div align="left"><a name="curry"></a></div></td>
                                          </tr>
                                          <tr>
                                            <td><img src="/images/user/kocca/course/sst_curry.gif"></td>
                                          </tr>
                                          <tr>
                                            <td height="8"></td>
                                          </tr>
                                        </table>
                                        <table width="625" border="2" cellspacing="0"
                                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#DFDFE0"  frame="hsides">
                                          <tr  class="lcolor">
                                            <td height="3" colspan="4" class="linecolor_cource"></td>
                                          </tr>
                                          <tr>
                                            <td width="31" class="tbl_ytit">��</td>
                                            <td width="110" class="tbl_ytit">����</td>
                                            <td width="357" class="tbl_ytit">�����<br></td>
                                            <td width="104"  class="tbl_ytit">���</td>
                                          </tr>
                                          <tr>
                                            <td height="4" colspan="4"></td>
                                          </tr>
                                          <tr>
                                            <td height="26" class="tbl_grc">1��</td>
                                            <td class="tbl_grc" rowspan="9" bgcolor="#ecf2e3"><b>����</b></td>
                                            <td class="tbl_bleft">���������̼� & 1�� �������� </td>
                                            <td class="tbl_grc">��ü����/������</td>
                                          </tr>
                                          <tr>
                                            <td height="26" class="tbl_grc">2��</td>
                                            <td class="tbl_bleft"> �� ������ �¶��� �н�</td>
                                            <td class="tbl_grc"> ������</td>
                                          </tr>
                                          <tr>
                                            <td height="26" class="tbl_grc">3��</td>
                                            <td class="tbl_bleft"> �� ������ �¶��� �н�</td>
                                            <td class="tbl_grc"> ������</td>
                                          </tr>
                                          <tr>
                                            <td height="26" class="tbl_grc">4��</td>
                                            <td class="tbl_bleft">2�� ���� ���� �� ���</td>
                                            <td class="tbl_grc">���º�</td>
                                          </tr>
                                          <tr>
                                            <td height="4" ></td>
                                            <td height="4" ></td>
                                            <td height="4" ></td>
                                          </tr>
                                          <tr>
                                            <td height="29" class="tbl_grc">5��</td>
                                            <td class="tbl_bleft">�� ������ �¶��� �н�</td>
                                            <td class="tbl_grc">������ </td>
                                          </tr>
                                          <tr>
                                            <td height="26" class="tbl_grc">6��</td>
                                            <td class="tbl_bleft">�� ������ �¶��� �н�</td>
                                            <td class="tbl_grc">������ </td>
                                          </tr>
                                          <tr>
                                            <td height="26" class="tbl_grc">7��</td>
                                            <td class="tbl_bleft">3�� ���� ���� �� ���</td>
                                            <td class="tbl_grc">���º�</td>
                                          </tr>
                                          <tr>
                                            <td height="26" class="tbl_grc">8��</td>
                                            <td class="tbl_bleft"> �� ������ �¶��� �н�</td>
                                            <td class="tbl_grc"> ������</td>
                                          </tr>
                                          <tr>
                                            <td height="4" colspan="4"></td>
                                          </tr>
                                        </table>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td height="20"></td>
                                      </tr>
                                    </table>
                                    <table width="625" border="2" cellspacing="0"
                                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#DFDFE0"  frame="hsides">
                                      <tr  class="lcolor">
                                        <td height="3" colspan="4" class="linecolor_cource"></td>
                                      </tr>
                                      <tr>
                                        <td bgcolor="#ebe7c2" width="40%" align="center"> ��ũ�� ���� �о�</td>
                                        <td class="tbl_ytit">���� ���� ��ð���</td>
                                      </tr>
                                       <tr>
                                        <td height="4" colspan="2"></td>
                                      </tr>
                                      <tr>
                                        <td class="tbl_grc">�ִϸ��̼� ��ũ��</td>
                                        <td class="tbl_gleft">
                                            �ִϸ��̼� ����� ����<br>
                                            �Ҹ��콺 ���ϸ��̼��� ��ʿ� ����<br>
                                            �ִϸ��̼Ǹ�����<br>
                                            �ִϸ��̼Ǳ�ȹ<br>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="tbl_grc">�������� ��ũ��</td>
                                        <td class="tbl_gleft">
                                            ���� ����� ��ʿ���<br>
                                            �������ݸ�����<br>
                                            �������ݱ�ȹ<br>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="tbl_grc">ĳ���� ��ũ��</td>
                                        <td class="tbl_gleft">
                                            ĳ���� ����� ��ʿ���<br>
                                            ĳ���͸�����<br>
                                            ĳ���ͱ�ȹ<br>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="tbl_grc">��������ͳ� ��ũ��</td>
                                        <td class="tbl_gleft">
                                            ��������ͳ� ��ũ��<br>
                                            ��������ͳݸ�����<br>
                                            ��������ͳݱ�ȹ<br>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="tbl_grc">���Ǹ�ȭ ��ũ�� </td>
                                        <td class="tbl_gleft">
                                            ���Ǹ�ȭ�ǹ� ����<br>
                                            ���Ǹ�ȭ����� ��ʿ���<br>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td class="tbl_grc">��ȭ��ũ��</td>
                                        <td class="tbl_gleft">
                                            ��ȭ�ǹ�<br>
                                            ��ȭ����� ��ʿ��� <br>
                                        </td>
                                      </tr>
									  <tr>
                                        <td class="tbl_grc">��ȭ���� ��ũ��</td>
                                        <td class="tbl_gleft">
                                            ��ȭ�ǹ�<br>
                                            ��ȭ����� ��ʿ��� <br>
                                        </td>
                                      </tr>
									  <tr>
                                        <td class="tbl_grc">��ȭ�� ��ũ��</td>
                                        <td class="tbl_gleft">
                                            ���Ǹ�ȭ�ǹ�<br>
											���Ǹ�ȭ����� ��ʿ���
                                        </td>
                                      </tr>
                                    </table>
                                    </td>
                                  <td width="27">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr>
                            <td><img src="/images/user/kocca/course/st_sub_box_bottom.gif" ></td>
                          </tr>
                        </table>
</form>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
