<%
//**********************************************************
//  1. ��      ��: PERSONAL SELECT LIST
//  2. ���α׷���: za_PersonalEducation_L.jsp
//  3. ��      ��: ���� �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 31
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%
    //DEFINED class&variable START
    String v_grcode     = "";
    String v_grcodenm   = "";
    String v_grseqnm   = "";
    String v_gyear      = "";
    String v_grseq      = "";
    String v_subj       = "";
    String v_year       = "";
    String v_subjnm     = "";
    String v_isnewcourse ="";
    String v_course     = "";
    String v_cyear      = "";
    String v_courseseq  = "";
    String v_coursenm   = "";
    String v_subjseq    = "";
    String v_isonoff    = "";
    String v_edustart   = "";
    String v_eduend     = "";
    String v_eduurl     = "";
    String v_onoff_value= "";
    String v_gradu_value= "";
    String v_isgraduated="";
    String v_owner      = "";
    String v_upperclassname      = "";
    int    v_tstep      =  0;
    int    v_mtest      =  0;
    int    v_ftest      =  0;
    int    v_htest      =  0;
    int    v_report     =  0;
    int    v_etc1       =  0;
    int    v_etc2       =  0;
    int    v_avtstep    =  0;
    int    v_avmtest    =  0;
    int    v_avftest    =  0;
    int    v_avhtest    =  0;
    int    v_avreport   =  0;
    int    v_avetc1     =  0;
    int    v_avetc2     =  0;
    int    v_score      =  0;
    int    v_point      =  0;
    int     v_rowspan    = 0;
    int     i            = 0;
    ArrayList list2      = null;
    //DEFINED class&variable END
    list2 = (ArrayList)request.getAttribute("PersonalEducationList");
%>
 <br>
                        <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940">
                          <tr>
                            <td colspan="16" class="table_top_line"></td>
                          </tr>
                          <tr>
                            <td class="table_title" width="8%"><b>�����׷�</b></td>
                            <td class="table_title" width="4%" ><b>�⵵</b></td>
                            <td class="table_title" width="5%" ><b>��������</b></td>
                            <td class="table_title" width="19%"><font class="text_color04">����</font></td>
                            <td class="table_title" width="5%" ><b>��������</b></td>
                            <td class="table_title" width="7%"><b>�з�</b></td>
                            <td class="table_title" width="15%"><b>�����Ⱓ</b></td>
                            <td class="table_title" width="5%"><b>������</b></td>
                            <td class="table_title" width="4%" ><b>�߰���</b></td>
                            <td class="table_title" width="4%" ><b>������</b></td>
                            <td class="table_title" width="4%" ><b>������</b></td>
                            <td class="table_title" width="4%" ><b>����Ʈ</b></td>
                            <td class="table_title" width="4%" ><b>������</b></td>
                            <td class="table_title" width="4%" ><b>��Ÿ</b></td>
                            <td class="table_title" width="4%" ><b>����</b></td>
                            <td class="table_title" width="4%" ><b>���ᰡ��</b></td>
                          </tr>
                      </table>
                      <div style='width:960px;height:230px;overflow:auto;visibility:visible;border:1'>
                      <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940" >
<%
                for(i = 0; i < list2.size(); i++) {
                    StudyStatusData data2  = (StudyStatusData)list2.get(i);
                    v_grcode     = data2.getGrcode();
                    v_grcodenm   = data2.getGrcodenm();
                    v_grseqnm    = data2.getGrseqnm();
                    v_gyear      = data2.getGyear();
                    v_grseq      = data2.getGrseq();
                    v_course     = data2.getCourse();
                    v_cyear      = data2.getCyear();
                    v_courseseq  = data2.getCourseseq();
                    v_coursenm   = data2.getCoursenm();
                    v_subj       = data2.getSubj();
                    v_year       = data2.getYear();
                    v_subjnm     = data2.getSubjnm();
                    v_subjseq    = data2.getSubjseq();
                    v_isonoff    = data2.getIsonoff();
                    v_edustart   = data2.getEdustart();
                    v_eduend     = data2.getEduend();
                    v_tstep      = data2.getTstep();
                    v_mtest      = data2.getMtest();
                    v_ftest      = data2.getFtest();
                    v_htest      = data2.getHtest();
                    v_report     = data2.getReport();
                    v_etc1       = data2.getEtc1();
                    v_etc2       = data2.getEtc2();
                    v_avtstep    = data2.getAvtstep();
                    v_avmtest    = data2.getAvmtest();
                    v_avftest    = data2.getAvftest();
                    v_avhtest    = data2.getAvhtest();
                    v_avreport   = data2.getAvreport();
                    v_avetc1     = data2.getAvetc1();
                    v_avetc2     = data2.getAvetc2();
                    v_score      = data2.getScore();
                    v_point      = data2.getPoint();
                    v_rowspan    = data2.getRowspan();
                    v_isnewcourse= data2.getIsnewcourse();
                    v_isgraduated= data2.getIsgraduated();
                    v_upperclassname=data2.getUpperclassname();

                    v_edustart   = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
                    v_eduend     = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");

                    v_owner = GetCodenm.get_owner(v_subj);

                    v_eduurl    = "/servlet/controller.contents.EduStart?p_isFromLMS=Y&p_subj="+v_subj;
                    v_eduurl    +="&p_year="+v_year+"&p_subjseq="+v_subjseq+"&p_userid="+v_userid+"&p_process=eduList";

                    //if(v_isonoff.equals("ON"))      {  v_onoff_value  = "���̹�����"; }
                    //else                            {  v_onoff_value  = "���հ���";   }
                    //else if(v_isonoff.equals("OFF")){  v_onoff_value  = "���հ���";   }
/*
                    if(v_score < v_point)           {  v_gradu_value  =  "N";         }
                    else                            {  v_gradu_value  =   "Y";        }
*/
               %>
               <tr>
                 <td class="table_01"   width="8%"><%=v_grcodenm%></td>
                 <td class="table_02_1" width="4%" ><%=v_gyear%></td>
                 <td class="table_02_1" width="5%" ><%=v_grseq%></td>
                 <td class="table_02_2" width="19%"><font class="text_color04"><%=v_subjnm%></font></td>
                 <td class="table_02_1" width="5%" ><%=StringManager.cutZero(v_subjseq)%>��</td>
                 <td class="table_02_1" width="7%"><%=v_upperclassname%></td>
                 <td class="table_02_1" width="15%"><%=v_edustart%>~<%=v_eduend%></td>
                 <td class="table_02_1" width="5%"><%=v_tstep%>(<%=v_avtstep%>)</td>
                 <td class="table_02_1" width="4%" ><%=v_mtest%>(<%=v_avmtest%>)</td>
                 <td class="table_02_1" width="4%" ><%=v_ftest%>(<%=v_avftest%>)</td>
                 <td class="table_02_1" width="4%" ><%=v_htest%>(<%=v_avhtest%>)</td>
                 <td class="table_02_1" width="4%" ><%=v_report%>(<%=v_avreport%>)</td>
                 <td class="table_02_1" width="4%" ><%=v_etc1%>(<%=v_avetc1%>)</td>
                 <td class="table_02_1" width="4%" ><%=v_etc2%>(<%=v_avetc2%>)</td>
                 <td class="table_02_1" width="4%" ><%=v_score%></td>
                 <td class="table_02_1" width="4%" ><%=v_isgraduated%></td>
               </tr>
           <%
              }
          if(i == 0){ %>
              <tr>
                <td class="table_02_1" colspan="13">��ϵ� ������ �����ϴ�</td>
              </tr>
         <%  } %>
                        </table>
                        <!----------------- �������� �� ----------------->

                        <table>
                          <tr>
                            <td height="5"></td>
                          </tr>
                        </table>
                        </div>