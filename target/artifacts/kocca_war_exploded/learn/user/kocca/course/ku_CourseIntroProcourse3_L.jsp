<%
//**********************************************************
//  1. ��      ��: SUBJECT LIST
//  2. ���α׷���:  ku_CourseIntroProcourse3_L.jsp
//  3. ��      ��: ������ ����
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
    box.put("leftmenu","04");                       // �޴� ���̵� ����
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
      document.form1.p_process.value  = 'SubjectListProf';
      document.form1.action='/servlet/controller.course.KCourseIntroServlet';
      document.form1.target = "_self";
      document.form1.submit();
    }
//-->
</SCRIPT>
<script type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<body onload="MM_preloadImages('/images/user/kocca/course/tab_project_on.gif','/images/user/kocca/course/tab_market_on.gif','/images/user/kocca/course/tab_location_on.gif','/images/user/kocca/course/tab_story_on.gif','/images/user/kocca/course/tab_ct_on.gif','/images/user/kocca/course/tab_pd_on.gif')">

<form name="form1" method="post" >
    <input type='hidden' name='p_process'  value="<%=v_process%>">
    <input type='hidden' name='p_rprocess' value="">
    <input type='hidden' name='p_sphere'   value="<%=v_sphere%>">
    <input type='hidden' name='p_subj'     value="">

                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > �����Ұ� > ����������</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/course/<%=tem_subimgpath%>/tit_course_prof.gif"></td>
                          </tr>
                          <tr>
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/course/text_main.gif" ></td>
                          </tr>
                          <tr> 
                            <td height="19"></td>
                          </tr>
                        </table>
                        <!--�޴��Ǻκ� -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="82"><a href="javascript:whenTabSelect('005')"><img src="/images/user/kocca/course/tab_infopro.gif" name="Image7" width="82" height="30" border="0"  id="Image7" onmouseover="MM_swapImage('Image7','','/images/user/kocca/course/tab_infopro_on.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                            <td width="3">&nbsp;</td>
                            <td width="82"><a href="javascript:whenTabSelect('001')"><img src="/images/user/kocca/course/tab_project.gif" name="Image8" width="82" height="30" border="0"  id="Image8" onmouseover="MM_swapImage('Image8','','/images/user/kocca/course/tab_project_on.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                            <td width="3">&nbsp;</td>
                            <td width="82"><a href="javascript:whenTabSelect('002')"><img src="/images/user/kocca/course/tab_market.gif" name="Image9" width="81" height="30" border="0"  id="Image9" onmouseover="MM_swapImage('Image9','','/images/user/kocca/course/tab_market_on.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                            <td width="3">&nbsp;</td>
                            <td width="82"><img src="/images/user/kocca/course/tab_copyright_on.gif" name="Image10" width="82" height="30" border="0" id="Image10"></td>
                            <td width="3">&nbsp;</td>
                            <td width="82"><a href="javascript:whenTabSelect('004')"><img src="/images/user/kocca/course/tab_location.gif" name="Image11" width="81" height="30" border="0"  id="Image11" onmouseover="MM_swapImage('Image11','','/images/user/kocca/course/tab_location_on.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                            <td>&nbsp;</td>
                            <td width="82"><a href="javascript:whenTabSelect('006')"><img src="/images/user/kocca/course/tab_story.gif" name="Image12" width="81" height="30" border="0"  id="Image12" onmouseover="MM_swapImage('Image12','','/images/user/kocca/course/tab_story_on.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                            <td>&nbsp;</td>
                            <td width="66"><a href="javascript:whenTabSelect('007')"><img src="/images/user/kocca/course/tab_ct.gif" name="Image13" width="66" height="30" border="0"  id="Image13" onmouseover="MM_swapImage('Image13','','/images/user/kocca/course/tab_ct_on.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                            <td>&nbsp;</td>
                            <td width="98"><a href="javascript:whenTabSelect('008')"><img src="/images/user/kocca/course/tab_pd.gif" name="Image14" width="98" height="30" border="0"  id="Image14" onmouseover="MM_swapImage('Image14','','/images/user/kocca/course/tab_pd_on.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                          </tr>
                          <tr>
                            <td height="5" colspan="15" ></td>
                          </tr>
                          <tr>
                            <td height="1" colspan="15" class="linecolor_cource02"></td>
                          </tr>
                          <tr>
                            <td height="17" colspan="15">&nbsp;</td>
                          </tr>
                        </table>
                        <!--���۱� ���������� -->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="144"><div align="center"><img src="/images/user/kocca/course/text_sub_copyright01.gif" ></div></td>
                            <td width="1" class="tbl_bleft5"><img src="/images/user/kocca/course/vline.gif" ></td>
                            <td class="tbl_bleft5"><img src="/images/user/kocca/course/text_sub_copyright02.gif" ></td>
                          </tr>
                          <tr> 
                            <td height="20" colspan="3" >&nbsp;</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/course/st_sub_box_top.gif"></td>
                          </tr>
                          <tr> 
                            <td background="/images/user/kocca/course/bg_box.gif"><table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="26">&nbsp;</td>
                                  <td><table width="631" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="10" colspan="2"></td>
                                      </tr>
                                      <tr> 
                                        <td width="77" valign="top"><img src="/images/user/kocca/course/st_small_course.gif"></td>
                                        <td width="554"><img src="/images/user/kocca/course/im_copyright.gif" ></td>
                                      </tr>
                                    </table>
                                    <table width="631" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="15"></td>
                                      </tr>
                                      <tr> 
                                        <td><img src="/images/user/kocca/course/st_small_pageandprofer.gif"></td>
                                      </tr>
                                      <tr> 
                                        <td height="5"></td>
                                      </tr>
                                    </table>
                                    <table width="631" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="5" colspan="4"></td>
                                      </tr>
                                      <tr> 
                                        <td width="18" height="20" ><img src="/images/user/kocca/course/i_contents.gif"> 
                                        </td>
                                        <td width="479"><strong>���̼���</strong></td>
                                        <td width="76"><div align="right"></div></td>
                                        <td width="58"><!--a href="#"><img src="/images/user/kocca/course/i_sample_class.gif" border="0"></a--></td>
                                      </tr>
                                      <tr> 
                                        <td colspan="4"><table width="629" border="1" cellpadding="0" cellspacing="0" bordercolor="#cccccc">
                                            <tr> 
                                              <td><table width="627" border="0" cellspacing="0" cellpadding="0">
                                                  <tr> 
                                                    <td height="7" colspan="8"></td>
                                                  </tr>
                                                  <tr> 
                                                    <td width="7">&nbsp;</td>
                                                    <td width="95"><table width="86" border="0" cellpadding="0" cellspacing="3" bgcolor="#e7e7e7">
                                                        <tr> 
                                                          <td bgcolor="#FFFFFF"><table width="80" border="0" cellpadding="0" cellspacing="2" bgcolor="#cccccc">
                                                              <tr> 
                                                                <td><img src="/images/user/kocca/course/jky.jpg"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                      </table></td>
                                                    <td width="1"><img src="/images/user/kocca/course/vline.gif"></td>
                                                    <td width="150" class="tbl_grc">������<br>
                                                      (�����繫�� �׸� ��ȣ��)</td>
                                                    <td width="1"><img src="/images/user/kocca/course/vline.gif" ></td>
                                                    <td>&nbsp;</td>
                                                    <td width="360" bgcolor="#F7F1C5"  class="tbl_gleft"><p>���̼����� �⺻ ���� �� Ȱ���ȿ� ���Ͽ� �����Ѵ�.</p></td>
                                                    <td>&nbsp;</td>
                                                  </tr>
                                                  <tr> 
                                                    <td height="7" colspan="8"></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr> 
                                        <td height="5" colspan="4"></td>
                                      </tr>
                                    </table>
                                    <table width="631" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="5" colspan="4"></td>
                                      </tr>
                                      <tr> 
                                        <td width="17" height="20" ><img src="/images/user/kocca/course/i_contents.gif" > 
                                        </td>
                                        <td width="480"><strong>�����ΰ� ��ǥ</strong> 
                                        </td>
                                        <td width="76"><div align="right"></div></td>
                                        <td width="58"><!--a href="#"><img src="/images/user/kocca/course/i_sample_class.gif" border="0"></a--></td>
                                      </tr>
                                      <tr> 
                                        <td colspan="4"><table width="629" border="1" cellpadding="0" cellspacing="0" bordercolor="#cccccc">
                                            <tr> 
                                              <td><table width="627" border="0" cellspacing="0" cellpadding="0">
                                                  <tr> 
                                                    <td height="7" colspan="8"></td>
                                                  </tr>
                                                  <tr> 
                                                    <td width="7">&nbsp;</td>
                                                    <td width="95"><table width="86" border="0" cellpadding="0" cellspacing="3" bgcolor="#e7e7e7">
                                                        <tr> 
                                                          <td bgcolor="#FFFFFF"><table width="80" border="0" cellpadding="0" cellspacing="2" bgcolor="#cccccc">
                                                              <tr> 
                                                                <td><img src="/images/user/kocca/course/ysh.jpg"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                      </table></td>
                                                    <td width="1"><img src="/images/user/kocca/course/vline.gif" ></td>
                                                    <td width="150" class="tbl_grc">������<br>
                                                      (�Ѿ���б�)</td>
                                                    <td width="1"><img src="/images/user/kocca/course/vline.gif" ></td>
                                                    <td>&nbsp;</td>
                                                    <td width="360" bgcolor="#F7F1C5"  class="tbl_gleft"><p>�����ΰ� ��ǥ ���ݿ� ���� �������� ���ؿ� ���� ������ ������ �����Ͽ� ���� �� ��ǥ������ ������ ������ �� �� ���￡ ������ �� �ִ� �ǹ��ɷ��� ����� �� �ִ�. </p></td>
                                                    <td>&nbsp;</td>
                                                  </tr>
                                                  <tr> 
                                                    <td height="7" colspan="8"></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr> 
                                        <td height="5" colspan="4"></td>
                                      </tr>
                                    </table>
                                    <table width="631" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="5" colspan="4"></td>
                                      </tr>
                                      <tr> 
                                        <td width="17" height="20" ><img src="/images/user/kocca/course/i_contents.gif" > 
                                        </td>
                                        <td width="480"><strong>���۱�</strong></td>
                                        <td width="76"><div align="right"></div></td>
                                        <td width="58"><!--a href="#"><img src="/images/user/kocca/course/i_sample_class.gif" border="0"></a--></td>
                                      </tr>
                                      <tr> 
                                        <td colspan="4"><table width="629" border="1" cellpadding="0" cellspacing="0" bordercolor="#cccccc">
                                            <tr> 
                                              <td><table width="627" border="0" cellspacing="0" cellpadding="0">
                                                  <tr> 
                                                    <td height="7" colspan="8"></td>
                                                  </tr>
                                                  <tr> 
                                                    <td width="7">&nbsp;</td>
                                                    <td width="95"><table width="86" border="0" cellpadding="0" cellspacing="3" bgcolor="#e7e7e7">
                                                        <tr> 
                                                          <td bgcolor="#FFFFFF"><table width="80" border="0" cellpadding="0" cellspacing="2" bgcolor="#cccccc">
                                                              <tr> 
                                                                <td><img src="/images/user/kocca/course/jsw.jpg"></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
                                                      </table></td>
                                                    <td width="1"><img src="/images/user/kocca/course/vline.gif" ></td>
                                                    <td width="150" class="tbl_grc">������<br>
                                                      (��������(Ư�����)��)</td>
                                                    <td width="1"><img src="/images/user/kocca/course/vline.gif" ></td>
                                                    <td>&nbsp;</td>
                                                    <td width="360" bgcolor="#F7F1C5"  class="tbl_gleft"><p>��ȭ������ �о߿��� ��������, Ư�� ���۱��� ������ �ǹ̸� �ľ��ϰ�, ���۱��� ���� ���ظ� ���� ���۱��� ������ ������ ������ �� �ִ�.</p></td>
                                                    <td>&nbsp;</td>
                                                  </tr>
                                                  <tr> 
                                                    <td height="7" colspan="8"></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                      <tr> 
                                        <td height="5" colspan="4"></td>
                                      </tr>
                                    </table>
                                    <table width="631" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="15"></td>
                                      </tr>
                                      <tr> 
                                        <td><img src="/images/user/kocca/course/st_small_dayplan.gif"></td>
                                      </tr>
                                      <tr> 
                                        <td height="5"></td>
                                      </tr>
                                      <tr> 
                                        <td><table width="625" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#DFDFE0"  frame="hsides">
                                            <tr  class="lcolor"> 
                                              <td height="3" colspan="4" class="linecolor_cource"></td>
                                            </tr>
                                            <tr> 
                                              <td width="40" class="tbl_ytit">��</td>
                                              <td width="121" class="tbl_ytit">����</td>
                                              <td class="tbl_ytit">�����<br></td>
                                              <td width="103"  class="tbl_ytit">���</td>
                                            </tr>
                                            <tr> 
                                              <td height="5" colspan="4" ></td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">1��</td>
                                              <td rowspan="4" bgcolor="#ECF2E3" class="tbl_grc"><font color="#000000">���̼���</font></td>
                                              <td class="tbl_bleft">���������̼� &amp; 
                                                1�� ����Ư��<br></td>
                                              <td class="tbl_grc">��������</td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">2��</td>
                                              <td class="tbl_bleft">�� 1�� ���ǽ��ƿ�</td>
                                              <td class="tbl_grc">������ ������</td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">3��</td>
                                              <td class="tbl_bleft">�� ������ �¶��� �н�</td>
                                              <td class="tbl_grc">������ ������</td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">4��</td>
                                              <td class="tbl_bleft">�� 2�� ���ǽ��ƿ�</td>
                                              <td class="tbl_grc">������ ������</td>
                                            </tr>
                                            <tr> 
                                              <td height="5" colspan="4"></td>
                                            </tr>
                                            <tr> 
                                              <td height="29" class="tbl_grc">5��</td>
                                              <td rowspan="4" bgcolor="#E6EACA" class="tbl_grc"><font color="#000000">�����ΰ� ��ǥ</font></td>
                                              <td class="tbl_bleft">2�� ����Ư��</td>
                                              <td class="tbl_grc">��������</td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">6��</td>
                                              <td class="tbl_bleft">�� 3�� ���ǽ��ƿ�</td>
                                              <td class="tbl_grc">������ ������</td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">7��</td>
                                              <td class="tbl_bleft">�� ������ �¶��� �н�</td>
                                              <td class="tbl_grc">������ ������</td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">8��</td>
                                              <td class="tbl_bleft">�� 4�� ���ǽ��ƿ�<br></td>
                                              <td class="tbl_grc">������ ������</td>
                                            </tr>
                                            <tr> 
                                              <td height="5" colspan="4" ></td>
                                            </tr>
                                            <tr> 
                                              <td height="30" class="tbl_grc">9��</td>
                                              <td rowspan="4" bgcolor="#ECF2E3" class="tbl_grc"><font color="#000000">���۱�</font></td>
                                              <td class="tbl_bleft">3�� ����Ư��</td>
                                              <td class="tbl_grc">��������</td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">10��</td>
                                              <td class="tbl_bleft">�� 5�� ���ǽ��ƿ�</td>
                                              <td class="tbl_grc">������ ������</td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">11��</td>
                                              <td class="tbl_bleft">�� ������ �¶��� �н�</td>
                                              <td class="tbl_grc">������ ������</td>
                                            </tr>
                                            <tr> 
                                              <td height="26" class="tbl_grc">12��</td>
                                              <td class="tbl_bleft">�� 6�� ���ǽ��ƿ�<br></td>
                                              <td class="tbl_grc">������ ������ </td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table>
                                    <table width="631" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="15"></td>
                                      </tr>
                                      <tr> 
                                        <td><img src="/images/user/kocca/course/st_small_complete.gif"></td>
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
                                        <td width="19">&nbsp;</td>
                                        <td width="35" valign="top"><img src="/images/user/kocca/course/i_spack.gif" ></td>
                                        <td width="26">&nbsp;</td>
                                        <td width="552"><strong>�������</strong> 
                                          : ������ 70���̻� &amp; ���� 60���̻�<br> <strong>�򰡱���</strong> 
                                          : ������ 40% , �Ѱ��� 15% , ��������Ʈ 30%, ������(���,���̳� 
                                          ��)15%</td>
                                      </tr>
                                      <tr> 
                                        <td colspan="4"><img src="/images/user/kocca/course/bar_spack_bottom.gif" ></td>
                                      </tr>
                                    </table>
                                    <table width="631" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="15"></td>
                                      </tr>
                                      <tr> 
                                        <td><img src="/images/user/kocca/course/st_small_pay.gif"></td>
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
                                        <td width="19">&nbsp;</td>
                                        <td width="35" valign="top"><img src="/images/user/kocca/course/i_pay.gif" ></td>
                                        <td width="26">&nbsp;</td>
                                        <td width="552"><strong>12�� 10���� </strong> 
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td colspan="4"><img src="/images/user/kocca/course/bar_spack_bottom.gif" ></td>
                                      </tr>
                                      <tr> 
                                        <td height="20" colspan="4">&nbsp;</td>
                                      </tr>
                                    </table></td>
                                  <td width="23">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/kocca/course/st_sub_box_bottom.gif" ></td>
                          </tr>
                          <tr> 
                            <td height="20">&nbsp;</td>
                          </tr>
                        </table>



</form>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
