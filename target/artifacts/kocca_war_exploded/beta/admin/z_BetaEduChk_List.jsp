<%
//********************************************************************
//  1. ��      ��: �������� -����/����ȭ��
//  2. ���α׷��� : z_EduChk_List.jsp
//  3. ��      ��: �������� -����/����ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 7
//  7. ��      ��:
//********************************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<%@ page import = "com.credu.common.*" %>
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  p_subj, p_year, p_subjseq, p_userid;

    String  p_isFromLMS = box.getString("p_isFromLMS");
    if (p_isFromLMS.equals("Y")){
        p_subj      = box.getString("p_subj");
        p_year      = box.getString("p_year");
        p_subjseq   = box.getString("p_subjseq");
        p_userid    = box.getString("p_userid");
    }else{
        p_subj      = box.getSession("s_subj");
        p_year      = box.getSession("s_year");
        p_subjseq   = box.getSession("s_subjseq");
        p_userid    = box.getSession("userid");
    }

    String v_promotion  = (String)request.getAttribute("promotion");       //����������
    String v_progress   = (String)request.getAttribute("progress");       // �ڱ�������

    MasterFormData  md  = (MasterFormData)request.getAttribute("MasterFormData");
    ArrayList   brlist  = null;
    if (md.getIsmfbranch().equals("Y")){        //�б�� �����̸� �б⼱�� ��ũ ����.
        brlist = (ArrayList)request.getAttribute("BranchList");
    }

    ArrayList  list = (ArrayList)request.getAttribute("EduList");
    EduListData x = null;

    EduScoreData    sd = (EduScoreData)request.getAttribute("EduScore");
    EduScoreDataSub sds;

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
</head>
<script language="javascript">
    function init() {
        this.moveTo(0,0);
        this.resizeTo(880,600);
    }

    function whenSelect(xx){
        opener.parent.etop.jumpTo(xx);
        window.close();
    }
    function whenBr(lesson,branch){
        opener.parent.etop.whenBranchFromProcessWin(lesson,branch);
        window.close();
    }
    function whenExamSelect(ptype,lesson){
        //var url = '/servlet/controller.contents.EduStart?p_process=exam&p_lesson='+lesson+'&p_type='+ptype;
        //opener.parent.ebody.location = url;
        opener.parent.etop.goExam(lesson,ptype);
        window.close();
    }
    function goReport(urls){
        window.open(urls,"Reports","toolbar=no,statusbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=700,height=500").focus();
    }
</script>


<body topmargin="0" leftmargin="0" onLoad='init();'>

<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="850" height="100%">
  <tr>
    <td>
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr>
          <td align="center" valign="top" class="body_color">


            <!----------------- Ÿ��Ʋ ���� ----------------->
            <table cellspacing="0" cellpadding="0" class="open_table_out">
              <tr>
                <td height="10"></td>
              </tr>
              <tr>
                <td background="/images/user/study/b_title_dot.gif"><img src="/images/user/study/course_detail_title1.gif" width="240" height="37" border="0"></td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
            </table>
            <!----------------- Ÿ��Ʋ �� ---------------->

            <br>


           <!----------------- ���� ������, ���� ������ ���� ----------------->
           <table cellspacing="0" cellpadding="0" width="50%" border="0" align="center">
             <tr>
               <td>
                 <table cellspacing="1" cellpadding="1" class="board_table1">
                   <tr>
                     <td class="table_title_bg3">���� ������&nbsp:&nbsp<font color="#0036D9"><!--%=v_progress%--><%=sd.getTstep()%>%</font></td>
                     <td class="table_title_bg4" >
                         <table width="<%=sd.getTstep()+1%>%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                            <td background="/images/user/study/graph_img1.gif" height="14"></td>
                           </tr>
                          </table>
                     </td>
                   </tr>
                   <tr>
                     <td class="table_title_bg3">���� ������&nbsp:&nbsp<font color="#DB5700"><%=v_promotion%>%</font></td>
                     <td class="table_title_bg4" >
                         <table width="<%=v_promotion+1%>%" border="0" cellspacing="0" cellpadding="0">
                           <tr>
                              <td background="/images/user/study/graph_img2.gif" height="14"></td>
                           </tr>
                         </table>
                      </td>
                   </tr>
                 </table>
               </td>
             </tr>
           </table>
           <!----------------- ���� ������, ���� ������ �� ----------------->

            <br>
            <br>

              <!----------------- ���� ���� ----------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr>
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2">
              <tr>
                <td>
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr>
                      <td class="board_title_bg1">������</td>
                      <td class="board_title_bg3" width="28%"><%=GetCodenm.get_subjnm(p_subj)%></td>
                      <td class="board_title_bg1" width="15%">Ŭ����</td>
                      <td class="board_title_bg3" width="27%"><%=GetCodenm.get_classnm(p_subj,p_year,p_subjseq,p_userid)%></td>
                    </tr>
                    <tr>
                      <td class="board_title_bg1" width="15%">�����ڵ�</td>
                      <td class="board_title_bg3" width="28%"><%=p_subj%></td>
                      <td class="board_title_bg1" width="15%"> ��������</td>
                      <td class="board_title_bg3" width="27%"><%=p_subjseq%></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ���� �� ----------------->
            <br>


            <!----------------- ������Ȳ ----------------->

            <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
              <tr>
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
              <tr>
                <td>
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr>
                      <td class="board_title_bg1">&nbsp;</td>
                      <td class="board_title_bg1" width="24%">����ġ(%)</td>
                      <td class="board_title_bg1" width="24%">����(100�� ����)</td>
                      <td class="board_title_bg1" width="24%%">����ġ ��������</td>
                    </tr>

    <%  Hashtable ht;
        int htsize=0;
        if(sd!=null) {
            htsize=sd.eduScoreList.size();
            for (int i=0; i<htsize; i++) {
                //sds = (EduScoreDataSub)sd.eduScoreList.get(String.valueOf(i));
                if((Hashtable)sd.getEduScoreList() != null){
                    ht  = (Hashtable)sd.getEduScoreList();
                    sds = (EduScoreDataSub)ht.get(String.valueOf(i));
    %>
                    <tr>
                      <td class="board_text8"><%=get_datatypenm(sds.getDatatype())%></td>
                      <td class="board_text1"><%=sds.getWeight()%></td>
                      <td class="board_text1"><%=sds.getScore()%></td>
                      <td class="board_text1"><%=sds.getAvscore()%></td>
                    </tr>

    <%          }
            }       %>
                    <tr>
                      <td class="board_course_detail1">������� ����</td>
                      <td class="board_course_detail1"><%=sd.getGradscore()%>��</td>
                      <td class="board_course_detail1">������ �� �������</td>
                      <td class="board_course_detail1"><%=sd.getScore()%>��</td>
                    </tr>
                    <tr>
                      <td class="board_course_detail1">������� ������</td>
                      <td class="board_course_detail1"><%=sd.getGradstep()%>%</td>
                      <td class="board_course_detail1">������ ������</td>
                      <td class="board_course_detail1"><%=sd.getTstep()%>%</td>
                    </tr>
                    <tr>
                      <td class="board_course_detail1">���Ῡ��</td>
                      <td class="board_course_detail2"" colspan="3"><b>[<%=sd.getIsgraduated()%>]</b> : <%=get_reason(sd.getIsgraduated())%></td>
                    </tr>

    <%  }   %>
                  </table>
                </td>
              </tr>
            </table>

            <br>

            <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
              <tr>
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
              <tr>
                <td>
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr>
                      <td class="board_title_bg1">����</td>
                      <td class="board_title_bg1">&nbsp;</td>
                      <td class="board_title_bg1" width="5%">����</td>
                      <td class="board_title_bg1">�����н�����</td>
                      <td class="board_title_bg1">�����н�����</td>
                      <td class="board_title_bg1">���н��ð�</td>
                      <td class="board_title_bg1" width="8%">�н�Ƚ��</td>
                      <td class="board_title_bg1" width="8%">����Ʈ</td>
                      <td class="board_title_bg1" width="8%">Activity</td>
                    </tr>

    <%  String v_module="", v_brlink="";
        MfBranchData    bData;
        for (int i=0; i<list.size(); i++) {
            x  = (EduListData)list.get(i); %>
                    <tr>
            <%  if(!v_module.equals(x.getModule())){    %>
                  <td class="board_text8" rowspan="<%=x.getRowspan()%>"><%=x.getModulenm()%></td>
            <%      v_module = x.getModule();
                }

                if(x.getRecordType().equals("STEP")){
                    if(x.getIsbranch().equals("Y")){
                        v_brlink = "<br>";
                        for(int j=0;j<brlist.size();j++){
                            bData = (MfBranchData)brlist.get(j);
                            v_brlink=v_brlink + "<a href=\"javascript:whenBr('"+x.getLesson()+"','"+bData.getBranch()+"')\">"+bData.getSdesc()+"</a>&nbsp;&nbsp";
                        }
                    }
            %>

                      <td class="board_text1">
                        <a href="javascript:whenSelect('<%=x.getLesson()%>')"><%=x.getLesson()%>-<%=x.getSdesc()%></a><%=v_brlink%>
                      </td>
                      <td class="board_text1"><%=get_isEducatedTxt(x.getIsEducated())%></td>
                      <td class="board_text1"><%=FormatDate.getFormatDate(x.getFirst_edu(),"yyyy/MM/dd-HH:mm")%></td>
                      <td class="board_text1"><%=FormatDate.getFormatDate(x.getFirst_end(),"yyyy/MM/dd-HH:mm")%></td>
                      <td class="board_text1"><%=x.getTotal_time()%></td>
                      <td class="board_text1"><%=x.getLesson_count()%></td>
                      <td class="board_text1"><%=x.getCntReport()%>/<%=x.getCntMyReport()%></td>
                      <td class="board_text1"><%=x.getCntAct()%>/<%=x.getCntMyAct()%></td>
            <%  } else if(x.getRecordType().equals("EXAM")){    %>
                      <td class="board_text1">
                        <a href="javascript:whenExamSelect('<%=x.getPtype()%>','<%=x.getLesson()%>')"><%=x.getLesson()%>-<%=get_examtypenm(x.getPtype())%></a>
                      </td>
                      <td class="board_text1"><%=get_isEducatedTxt(x.getIsEducated())%></td>
                      <td class="board_text1"><%=StringManager.chkNull(FormatDate.getFormatDate(x.getFirst_edu(),"yyyy/MM/dd-HH:mm"))%></td>
                      <td class="board_text1"><%=StringManager.chkNull(FormatDate.getFormatDate(x.getFirst_end(),"yyyy/MM/dd-HH:mm"))%></td>
                      <td class="board_text1" colspan=4><%=x.getScore()%> �� </td>
            <%  }       %>
                    </tr>
    <%  }   %>
                  </table>
                </td>
              </tr>
            </table>
              <!----------------- ���� �� ----------------->

            <!----------------- �ݱ��ư ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td height="11"></td>
              </tr>
              <tr> 
                <td align="right">
                    <a href="javascript:window.close()"><img src="/images/user/study/close_butt.gif" width="54" height="20" border="0"></a>
                </td>
              </tr>
            </table>
            <!----------------- �ݱ��ư �� ---------------->

            <br>
            <br>

          </td>
        </tr>
      </table>

    </td>
  </tr>
</table>

</body>
</html>

<%!
public String   get_isEducatedTxt(String val){
    if(val.equals("Y"))
        return  "<font color=blue><b>O</b></font>";
    else
        return  "<font color=red><b>X</b></font>";
}

public String   get_examtypenm(String val){
    if(val.equals("M"))         return  "�߰� ��";
    else if(val.equals("T"))    return  "���� ��";
    else                        return  "QUIZ";
}
public String   get_datatypenm(String val){
    if      (val.equals("STEP"  ))      return  "����";
    else if (val.equals("MTEST" ))      return  "�߰� ��";
    else if (val.equals("FTEST" ))      return  "���� ��";
    else if (val.equals("REPORT"))      return  "Report";
    else if (val.equals("ACT"   ))      return  "Activity";
    else if (val.equals("ETC1"  ))      return  "������";
    else if (val.equals("ETC2"  ))      return  "�⿩��";

    return " ";
}
public String   get_reason(String val){
    if  (val.equals("Y")){
        return "�����մϴ�. ��������� ����ϼ̽��ϴ�";
    }else{
        return "������� �������/�������� �̴��Ͽ� �̼�������Դϴ�";
    }
}
%>
