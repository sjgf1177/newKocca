<%
//**********************************************************
//  1. ��      ��: EDUCATION YEARLY SCHEDULE
//  2. ���α׷���: zu_EducationYearlySchedule_L.jsp
//  3. ��      ��: ���� ���� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.1.27
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<jsp:useBean id = "bean" class = "com.credu.propose.ProposeCourseBean"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    box.put("leftmenu","04");                       // �޴� ���̵� ����

    String  v_process   = box.getString("p_process");
    String  v_select    = box.getStringDefault("p_select","TOTAL");
    String  v_grcode    = box.getStringDefault("p_grcode","ALL");
    String  v_course    =  "";
    String  v_Bcourse   =  ""; //���� �ڽ�
    String  v_Bcourseseq=  ""; //���� �ڽ� ����
    String  v_cyear     =  "";
    String  v_courseseq =  "";
    String  v_coursenm  =  "";
    String  v_subj      =  "";
    String  v_Bsubj     =  ""; //���� ����
    String  v_year      =  "";
    String  v_subjnm    =  "";
    String  v_subjseq   =  "";
    String  v_subjseqgr =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_eduend1   =  "";
    String  v_isonoff   =  "";
    String  v_proposetype= "";
    String  v_proposeyn =  "";
    String  v_proposeend=  "";
    String  v_isonoff_value="";
    String  v_gubun_class_type= "";
    String  v_temp_code =  "";
    String  v_title     =  "";
    String  v_start     =  "";
    String  v_last      =  "";
    String  v_code      =  "";
    String  v_name      =  "";
    int     v_studentlimit= 0;
    int     v_chk       =   0;
    int     v_stucnt    =   0;
    int     li1         =   0;
    int     li2         =   0;
    int     li3         =   0;
    int     sum         =   0;
    int     begin       =   0;
    int     end         =   0;
    int     oldbegin    =   0;
    int     oldend      =   0;
    int     v_total     =   0;
    int     i           =   0;
    boolean v_firstok   = false;

    ArrayList list      = null;
    //DEFINED class&variable END

    list = (ArrayList)request.getAttribute("EducationYearlyList");
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<script language="JavaScript" type="text/JavaScript">
<!--

    // �����˻� ����ó��
    function search_enter(e)  {
        if (e.keyCode =='13'){  subjSearch();  }
    }

    // �����˻�
    function subjSearch() {
        if (document.form1.p_lsearchtext.value=="") {
            alert("�˻�� �Է����ּ���");
            return;
        }
        document.form1.action = "/servlet/controller.propose.MainSubjSearchServlet";   // 
        document.form1.p_process.value = "SubjSearch";
        document.form1.submit();
    }

    function whenSelect(sel){
        document.form1.p_select.value = sel;
        //alert(sel);
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.propose.ProposeCourseServlet?p_process=EducationYearlySchedule';
        //document.form1.p_process.value = '';
        //alert(document.form1.p_process.value);
        //alert(document.form1.action);
        document.form1.submit();
    }


function whenSubjInfo(subj,year,subjseq,isonoff,subjnm) {
    //window.self.name = "SeqPreviewPagePop";
    var url = "/servlet/controller.propose.ProposeCourseServlet?p_process=SeqPreviewPage&p_subj="+subj+"&p_year="+year+"&p_subjseq="+subjseq+"&p_isonoff="+isonoff;

     var new_Open = window.open(url,"seqInfo",'scrollbars=yes,width=747,height=600,resizable=no');
     document.form1.target = "seqInfo";
     //document.form1.p_process.value = "SeqPreviewPage";
     //document.form1.p_subj.value = subj;
     //document.form1.p_year.value = year;
     //document.form1.p_subjseq.value = subjseq;
     //document.form1.p_isonoff.value = isonoff;
     //document.form1.p_subjnm.value = subjnm;
     //document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
     //document.form1.submit();
}

function whenCourseSubjView(course,cyear,courseseq,coursenm){
    window.self.name = "schdule";
    open_window("openInfo","","100","100","478","220","","","","yes","");
    document.form1.target = "openInfo";
    document.form1.p_course.value = course;
    document.form1.p_cyear.value = cyear;
    document.form1.p_courseseq.value = courseseq;
    document.form1.p_coursenm.value = coursenm;
    document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
    document.form1.p_process.value = 'CourseSubjOpenPage';
    document.form1.submit();
    document.form1.target = window.self.name;
}

function selectMonth(month){
    document.form1.target = "_self";
    document.form1.action="/servlet/controller.propose.ProposeCourseServlet?p_process=EducationMonthlySchedule&p_month="+month;
    //document.form1.leftmenu.value = '6';
    //document.form1.p_process.value = 'EducationMonthlySchedule';
    //document.form1.p_month.value = month;
    document.form1.submit();
}

//-->
</script>


<form name="form1" method="post" >
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_course'>
    <input type='hidden' name='p_cyear'>
    <input type='hidden' name='p_courseseq'>
    <input type='hidden' name='p_coursenm'>
    <input type='hidden' name='p_subj'>
    <input type='hidden' name='p_year'>
    <input type='hidden' name='p_subjseq'>
    <input type='hidden' name='p_proposestart'>
    <input type='hidden' name='p_proposeend'>
    <input type='hidden' name='p_proposeyn'>
    <input type='hidden' name='p_proposetype'>
    <input type='hidden' name='p_purl'>
    <input type='hidden' name='p_month'>
    <input type='hidden' name='p_select' value='<%=v_select%>'>
    <input type='hidden' name='p_isonoff' >
    <input type='hidden' name='p_subjnm' >




          <!-- center start -->
            <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="20" align="center" valign="top" class="location">
                  HOME &gt; ������û/�ȳ� &gt; ������������</td>
              </tr>
              <tr>
                <td align="center" valign="top">
                <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="75"><img src="/images/user/support/search_img.gif" alt="�����˻�"></td>
                      <td width="75">
                        <select name="p_lsearch">
                          <option value="isonoff">����</option>
                          <option value="upperclass">�з�</option>
                          <option value="subjnm">������</option>
                        </select>
                      </td>
                      <td width="132"><input type="text" class="input" name="p_lsearchtext" onkeypress="search_enter(event)" size="20"></td>
                      <td width="394"><a href="javascript:subjSearch()"><img src="/images/user/button/btn_search.gif" alt="�˻�"></a></td>
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
                      <td valign="top"><img src="/images/user/apply/<%=tem_subimgpath%>/tit_year.jpg" ></td>
                    </tr>
                    <tr>
                      <td height="20"></td>
                    </tr>
                  </table>


                  <!-- ���������� -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="5" colspan="4"></td>
                      </tr>
                      <tr>
                        <td width="98" valign="top">
                            <% if(v_select.equals("TOTAL") || v_select=="" ){ %>
                              <a href="javascript:whenSelect('TOTAL')"><img src="/images/user/apply/tab_total_on.gif" alt="��ü" ></a>
                            <% }else{ %>
                              <a href="javascript:whenSelect('TOTAL')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image37','','/images/user/apply/tab_total_on.gif',1)"><img src="/images/user/apply/tab_total.gif" alt="��ü" name="Image37" border="0"></a>
                            <% } %>
                         </td>

                            <td>
                            <% if(v_select.equals("ON")){ %>
                              <a href="javascript:whenSelect('ON')"><IMG src="/images/user/apply/tab_cyber1_on.gif" alt="���̹�����" border="0"></a>
                            <% }else{ %>
                              <td width="98" valign="top" ><a href="javascript:whenSelect('ON')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image37','','/images/user/apply/tab_cyber1_on.gif',1)"><img src="/images/user/apply/tab_cyber1.gif" alt="���̹�����" name="Image37" border="0"></a>
                            <% } %>
                            </td>
                            <td>
                            <% if(v_select.equals("OFF")){ %>
                              <a href="javascript:whenSelect('OFF')"><IMG src="/images/user/apply/tab_jib1_on.gif" alt="���հ���" border="0"></a>
                            <% }else{ %>
                              <a href="javascript:whenSelect('OFF')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image29','','/images/user/apply/tab_jib1_on.gif',1)"><img src="/images/user/apply/tab_jib1.gif" alt="���հ���" name="Image29" width="98" height="22" border="0"></a>
                            <% } %>
                            </td>
                        <td width="381" ></td>
                    </tr>
                    <tr>
                      <td height="20" colspan="4"></td>
                    </tr>
                  </table>

                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="560" valign="top"><img src="/images/user/apply/year_text.gif" width="201" height="17">
                      </td>
                      <td width="115" align="right" valign="top"><table width="114" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="46"><img src="/images/user/apply/text_01.gif" alt="�˻��⵵" width="46" height="13"></td>
                            <td width="68">
<%
                                  SelectEduBean selectEdu = new SelectEduBean();
                                  String  gyear    = box.getStringDefault("gyear",FormatDate.getDate("yyyy"));

                                  String yearStr  = "";
                                  yearStr = "<select name='gyear' onChange=whenSelect('"+v_select+"') style='border-style:solid;border-width: 1px 1px 1px 1px;border-color:cccccc;color:333333;font-size:9pt;background-color:none;width : 65px;height:19px;font-size:9pt;'>";

                                  ArrayList gyearList = selectEdu.getGyear(box);
                                  for(int k = 0; k < gyearList.size(); k++) {
                                    DataBox dbox = (DataBox)gyearList.get(k);
                                    yearStr += "<option value = '"+ dbox.getString("d_gyear")+"' ";
                                    if (gyear.equals(dbox.getString("d_gyear"))) {
                                      yearStr += " selected";
                                    }
                                    yearStr += " >";
                                    yearStr += dbox.getString("d_gyear");
                                    yearStr += "</option>";
                                  }
                                  yearStr += "</select>";
                                  out.print(yearStr);
%>
                              <script>
                              //NV_write("<%=yearStr%>",10);
                              </script>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="5" colspan="2"></td>
                    </tr>
                  </table>

                  <table width="695" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>
                        <table width="675" border="2" cellspacing="0"
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                          <tr  class="lcolor">
                            <td height="3" colspan="13" class="lcolor"></td>
                          </tr>
                          <tr>
                            <td width="219" class="tbl_gtit">������</td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('01')">1��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('02')">2��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('03')">3��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('04')">4��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('05')">5��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('06')">6��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('07')">7��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('08')">8��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('09')">9��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('10')">10��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('11')">11��</a></td>
                            <td width="35" class="year_textb"><a href="javascript:selectMonth('12')">12��</a></td>
                          </tr>
                        </table>
                      </td>
                    </tr>

                    <tr>
                      <td width="695" valign="top">
                       <div style='width:695px;height:200px;overflow:auto;scrollbar-3dlight-color:#B5B5B5;scrollbar-arrow-color:#B5B5B5;scrollbar-darkshadow-color:#FFFFFF;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color:#FFFFFFc;scrollbar-shadow-color:#B5B5B5;'>
                          <table width="675" border="2" cellspacing="0" cellpadding="0"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">

<%
            for(i = 0; i < list.size(); i++) {
                ProposeCourseData data  = (ProposeCourseData)list.get(i);
                v_course        =  data.getCourse();
                v_cyear         =  data.getCyear();
                v_courseseq     =  data.getCourseseq();
                v_coursenm      =  data.getCoursenm();
                v_subj          =  data.getSubj();
                v_year          =  data.getYear();
                v_subjnm        =  data.getSubjnm();
                v_subjseq       =  data.getSubjseq();
                v_subjseqgr     =  data.getSubjseqgr();
                v_edustart      =  data.getEdustart();
                v_eduend        =  data.getEduend();
                v_isonoff       =  data.getIsonoff();
                v_proposetype   =  data.getProposetype();
                v_proposeend    =  data.getProposeend();
                v_studentlimit  =  data.getStudentlimit();
                v_stucnt        =  data.getStucnt();

                if(v_isonoff.equals("ON"))      {   v_isonoff_value =   "���̹�";
                }else if(v_isonoff.equals("OFF")){  v_isonoff_value =   "����";     }


                if(v_isonoff.equals("ON"))        { v_gubun_class_type = "/images/user/apply/year_cyber_bg.gif";
                }else if(v_isonoff.equals("OFF")) { v_gubun_class_type = "/images/user/apply/year_jib_bg.gif";
                }
            //out.println(v_gubun_class_type);
                int idx = 0;
                idx = v_subjnm.indexOf("[���]");
                if(idx >-1) { v_gubun_class_type = "graph3"; }  //���

                //���� �׷��� ���� START

                //��¥���� substring
                if(!v_edustart.equals("")){   v_edustart = v_edustart.substring(0,8);
                }else{                        v_edustart = "11111111";                 }

                if(!v_eduend.equals("")){     v_eduend = v_eduend.substring(0,8);
                }else{                        v_eduend = v_edustart;                   }

                    v_start   =   v_edustart.substring(0,4)+ "0101";
                    v_last    =   String.valueOf(Integer.parseInt(v_edustart.substring(0,4)) + 1) + "0101";

                    v_eduend1 = (Integer.parseInt(v_eduend) > Integer.parseInt(v_last)) ? v_last : v_eduend;

                li1 = bean.datediff(v_start,v_edustart);
                li2 = bean.datediff(v_edustart,v_eduend1);
                li3 = bean.datediff(v_eduend1,v_last);
                sum = li1 + li2 + li3;

//System.out.println(v_start+",  "+v_edustart+",  "+v_eduend1+", "+ v_last);
//System.out.println(li1+",  "+li2+",  "+li3+"<br>");

                li1 = (int) Math.round(((float)li1 / sum * 100));
                li2 = (int) Math.round(((float)li2 / sum * 100));
                if (li2 == 0) li2 = 1;
                li3 = 100 - (li1 + li2);

//System.out.println(li1+",  "+li2+",  "+li3);

                begin = li1;
                end = li1 + li2;
                //���� �׷��� ���� END

                    if ( !v_Bsubj.equals(v_subj) ) {
                        if ( v_chk != 0 ) { //������ ó������ ���� ó���� �ƴ� ��� ����
%>

                                        <td width="<%= (100 - oldend) %>%"></td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
<%
                            v_firstok = false;
                            v_chk = 0;
                        }
%>
                            <tr> 
                              <td width="197" class="tblfont_gleft2"><%=v_subjnm%></td>
                              <td width="470" background="/images/user/apply/year_bg.gif">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                                  <tr> 

<%
                    }
                    v_chk = 1;

                        if (!v_firstok) { //onclick=\"whenSubjInfo('"+v_subj+"','"+v_year+"','"+v_subjseq+"')\"
                            out.println(" <td width=\""+li1+"%\">&nbsp;</td> ");
                            //out.println(" <td width=\""+li2+"%\" background=\""+v_gubun_class_type+"\"  title=\"���� :  "+StringManager.cutZero(v_subjseqgr)+"\n �����Ⱓ : "+FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")+"~"+FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")+"\"  style='cursor:hand'>&nbsp;</td> ");
                            out.println(" <td width=\""+li2+"%\" height='12' title=\"���� :  "+StringManager.cutZero(v_subjseqgr)+"��\n�����Ⱓ : "+FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")+"~"+FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")+"\"  style='cursor:hand'><a href=\"javascript:whenSubjInfo('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_isonoff+"','"+v_subjnm+"')\"><img src=\""+v_gubun_class_type+"\" width='100%' height='12' border=0></a></td> ");
                            v_firstok = true;
                        }else if (begin <= oldend){
                          li2 = end - oldend;
                          if (li2 < 0)  li2 = 0;
                          if (li2 == 0) li2 = 1;
                            //out.println(" <td width=\""+li2+"%\" background=\""+v_gubun_class_type+"\"  title=\"���� :  "+StringManager.cutZero(v_subjseqgr)+"\n �����Ⱓ : "+FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")+"~"+FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")+"\"  style='cursor:hand'>&nbsp;</td> ");
                            out.println(" <td width=\""+li2+"%\" height='12' title=\"���� :  "+StringManager.cutZero(v_subjseqgr)+"��\n�����Ⱓ : "+FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")+"~"+FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")+"\"  style='cursor:hand'><a href=\"javascript:whenSubjInfo('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_isonoff+"','"+v_subjnm+"')\"><img src=\""+v_gubun_class_type+"\" width='100%' height='12' border=0></a></td> ");
                        }else{
                            li3 =  begin - oldend;
                            out.println(" <td width=\""+li3+"%\">&nbsp;</td> ");
                            //out.println(" <td width=\""+li2+"%\" background=\""+v_gubun_class_type+"\"  title=\"���� :  "+StringManager.cutZero(v_subjseqgr)+"\n �����Ⱓ : "+FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")+"~"+FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")+"\"  style='cursor:hand'>&nbsp;</td> ");
                            out.println(" <td width=\""+li2+"%\" height='12' title=\"���� :  "+StringManager.cutZero(v_subjseqgr)+"��\n�����Ⱓ : "+FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")+"~"+FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")+"\"  style='cursor:hand'><a href=\"javascript:whenSubjInfo('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_isonoff+"','"+v_subjnm+"')\"><img src=\""+v_gubun_class_type+"\" width='100%' height='12' border=0></a></td> ");
                        }

                    v_Bsubj = v_subj;
                    oldend = end;

            }  // for end

            if ( v_chk == 1 ) {
   %>

                                        <td height="12" width="<%= (100 - end) %>"></td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
     <%
            }

            if(i == 0){
%>
                            <tr>
                              <td height="20" colspan="2" align="center">��ϵȰ����� �����ϴ�.</td>
                            </tr>
<%
            }
%>

                          </table>
                       </div>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
</form>

              <tr>
                <td width="470" height="2" align="center" valign="top" bgcolor="#999999"></td>
              </tr>
            </table>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->