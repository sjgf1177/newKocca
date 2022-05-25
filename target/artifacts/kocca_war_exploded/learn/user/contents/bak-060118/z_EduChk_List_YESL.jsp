<%
//********************************************************************
//  1. ��      ��: �������� -����/����ȭ�� - Normal
//  2. ���α׷��� : z_EduChk_List_YESL.jsp
//  3. ��      ��: �������� -����/����ȭ�� - Normal
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
	String  v_edutime = "";  // �н��ð�
	String  v_edudate = "";  // �ֱ��н���
	int     v_educount= 0;   // ���ǽ�����Ƚ��

    // �߰�
    DecimalFormat df = new DecimalFormat("###.00");    
    double  v_totscore =0.0;
    double  v_ftestscore = 0.0;
    double  v_htestscore = 0.0;
    double  v_reportscore = 0.0;
    String v_isgraduated = "";
    
    
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
    
	if (p_subj.equals("")) p_subj=box.getString("p_subj");
	
	p_subj      = box.getStringDefault("p_subj"    , box.getSession("s_subj"));
  p_year      = box.getStringDefault("p_year"    , box.getSession("s_year"));
  p_subjseq   = box.getStringDefault("p_subjseq" , box.getSession("s_subjseq"));
  p_userid    = box.getStringDefault("p_userid"  , box.getSession("userid"));


	String p_subjnm = box.getString("p_subjnm");  // ������
	String p_iurl   = box.getString("p_iurl");    // ����url(����:'1')
	String v_iseduend="";
	v_iseduend= box.getString("p_iseduend");    // ����(����:'Y')
		
    if(p_iurl.equals("")) p_iurl="0";
    String v_promotion  = (String)request.getAttribute("promotion");       //����������
    String v_progress   = (String)request.getAttribute("progress");       // �ڱ�������

    MasterFormData  md  = (MasterFormData)request.getAttribute("MasterFormData");
    ArrayList   brlist  = null;
    //if (md.getIsmfbranch().equals("Y")){        //�б�� �����̸� �б⼱�� ��ũ ����.
    //    brlist = (ArrayList)request.getAttribute("BranchList");
    //}

    ArrayList  list = (ArrayList)request.getAttribute("EduList");
    EduListData x = null;

    ArrayList  list2 = (ArrayList)request.getAttribute("EduTime");  // �н��ð�
    EduListData edutime = null;
	if(list2.size()>0) {
		edutime = (EduListData)list2.get(0);
		v_edutime = edutime.getTotal_time();
		v_edudate = edutime.getFirst_edu();
		v_educount= edutime.getLesson_count();
    }

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
        this.resizeTo(880,900);
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
<%=p_isFromLMS%>
<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="850" height="100%">
  <tr>
    <td>
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr>
          <td align="center" valign="top" class="body_color">
<br>
<form name='form1' method='post'>
            <!----------------- Ÿ��Ʋ ���� ----------------->
  <table border=0 cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    <tr> 
      <td><img src="/images/user/study/course_title.gif"></td>
      <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      <td><img src="/images/user/study/gongi_tail.gif"></td>
    </tr>
  </table> <br>
<% if(!v_iseduend.equals("Y")){ %>     
  
    <!--�����ΰ��-->
    <% if(p_iurl.equals("1")){ %>    

            <table width="773" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="663" class="font_ex">�Ʒ� ������ ���� ȭ���ϸ��� ������Ʈ�� �˴ϴ�. <br>
                  ������ ������ ���̰� ���� �� �ֽ��ϴ�. �ڼ��� ������ �������� �������⸦ �����ϼ���</td>
              </tr>
              <tr>
                <td height="5"></td>
              </tr>
            </table>
    <% } %>
            <!----------------- Ÿ��Ʋ �� ---------------->                   
			<!----------------- ���� ������, ���� ������ ���� ----------------->
            <table width="786" border="0" cellspacing="0" cellpadding="0">
              <tr >
                <td  width="13" background="/images/user/study/box_t_bg.gif"><img src="/images/user/study/box_t_head.gif"></td>
                <td width="100%" background="/images/user/study/box_t_bg.gif">&nbsp;</td>
                <td align="right" width="13" background="/images/user/study/box_t_bg.gif"><img src="/images/user/study/box_t_tail.gif"></td>
              </tr>
              <tr>
                <td background="/images/user/study/box_l_bg.gif">&nbsp;</td>
                <td><table width="750" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="146" height="27" class="tblfont_sindoleft">���� 
                        ������&nbsp:&nbsp<font color="#006699"><!--%=v_progress%--><%=sd.getTstep()%>%</font></td>
                      <td width="254"><table width="100%" border="1" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#cccccc" >
                          <tr> 
                            <td><table width="<%=sd.getTstep()+1%>%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="7" background="/images/user/study/stu_graph03.gif"></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="7" ></td>
                          </tr>
                        </table></td>
                      <td width="22" rowspan="2" align="center"><img src="/images/user/study/stu_box_vline.gif" width="7" height="55"></td>
                      <td width="115" class="tblfont_sindoleft">���� �н��Ⱓ : </td>
                      <td width="213" class="tbl_gleft"><%=FormatDate.getDate("yyyy/MM/dd")%>~<%=FormatDate.getFormatDate(sd.getEduend(),"yyyy/MM/dd")%></td>
                    </tr>
                    <tr> 
                      <td class="tblfont_sindoleft">���� ������ : <font color="#006699"><%=v_promotion%>%</font></td>
                      <td><table width="100%" border="1" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#cccccc" >
                          <tr> 
                            <td><table width="<%=v_promotion+1%>%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="7" background="/images/user/study/stu_graph02.gif"></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                      <td colspan="2">&nbsp;</td>
                    </tr>
					<!--
                    <tr> 
                      <td colspan="5" class="tblfont_sindoleft">
					  <table width="717" border="0" cellspacing="0" cellpadding="0">
                          <tr > 
                            <td background="/images/user/study/stu_box_vline2.gif" height="4" colspan="6"></td>
                          </tr>
                          <tr > 
                            <td height="4" colspan="6"></td>
                          </tr>
                          <tr> 
                            <td width="70"><font color="#000000"><strong>�н��ð� 
                              :</strong></font> </td>
                            <td width="168"><%=v_edutime%></td>
                            <td width="79"><font color="#000000"><strong>�ֱ��н���:</strong></font> 
                            </td>
                            <td width="159"><%=FormatDate.getFormatDate(v_edudate,"yyyy/MM/dd")%></td>
                            <td width="106"><font color="#000000"><strong>���ǽ�����Ƚ�� 
                              :</strong> </font></td>
                            <td width="135"><%=v_educount%> ��</td>
                          </tr>
                        </table></td>
                    </tr>
					-->
                  </table></td>
                <td background="/images/user/study/box_r_bg.gif">&nbsp;</td>
              </tr>
              <tr >
                <td width="13" background="/images/user/study/box_bo_bg.gif"><img src="/images/user/study/box_bo_head.gif"></td>
                <td background="/images/user/study/box_bo_bg.gif">&nbsp;</td>
                <td width="13" background="/images/user/study/box_bo_bg.gif"><img src="/images/user/study/box_bo_tail.gif"></td>
              </tr>
            </table>
            <% } %>
</form>            
            <!----------------- ���� ������, ���� ������ �� ----------------->
            <br>
            <!----------------- ���� ���� ----------------------------------->
            <table width="786" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="116" valign="top"><img src="/images/user/study/stu_leftimg.gif" width="116" height="79"></td>
                <td colspan="2">
				<table width="650" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="84"><img src="/images/user/study/stu_courname.gif" width="81" height="14"></td>
                      <td width="566" class="tblfont_sindotit"><%=GetCodenm.get_subjnm(p_subj)%></td>
                    </tr>
                    <tr > 
                      <td background="/images/user/study/stu_box_vline2.gif" height="4" colspan="2"></td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/study/stu_gigan.gif" width="81" height="14"></td>
                      <td class="tblfont_gleft2"><%=FormatDate.getFormatDate(sd.getEdustart(),"yyyy/MM/dd")%>
                                                ~<%=FormatDate.getFormatDate(sd.getEduend(),"yyyy/MM/dd")%></td>
                    </tr>
                  </table></td>
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
                                            <td class="board_title_bg1" width="20%">�̼���������</td>
                                            <td class="board_title_bg1" width="20%">����ġ(%)</td>
                                            <td class="board_title_bg1" width="20%">�������</td>
                                            <td class="board_title_bg1" width="20%">ȯ������</td>
                                        </tr>

<%                     Hashtable ht;
                           int htsize=0;
                           String v_datatype="";
                           if(sd!=null) {
                               htsize=sd.eduScoreList.size();
                               for (int i=0; i<htsize; i++) {
                                   //sds = (EduScoreDataSub)sd.eduScoreList.get(String.valueOf(i));
                                   if((Hashtable)sd.getEduScoreList() != null){
                                       ht  = (Hashtable)sd.getEduScoreList();
                                       sds = (EduScoreDataSub)ht.get(String.valueOf(i));
                                       v_datatype=get_datatypenm(sds.getDatatype());
  %>
                                        <tr>
                                            <td class="board_text8"><%=get_datatypenm(sds.getDatatype())%></td>
                                            <td class="board_text1"><%=sds.getGradscore()%></td>
                                            <td class="board_text1"><%=sds.getWeight()%></td>
                                            <td class="board_text1"><%=sds.getScore()%></td>
                                            <td class="board_text1"><%=sds.getAvscore()%></td>
                                        </tr>
<%										v_totscore=v_totscore+sds.getAvscore();

											if(sds.getDatatype().equals("FTEST")){
												v_ftestscore = sds.getScore();
											}
											if(sds.getDatatype().equals("HTEST")){
												v_htestscore = sds.getScore();
											}
											if(sds.getDatatype().equals("REPORT")){
												v_reportscore = sds.getScore();
											}

									}
                                }       
                                //����
                                if(v_iseduend.equals("Y")) {
                                        if(sd.getIsgraduated().equals("Y")) v_isgraduated="����";	
                                        else v_isgraduated="�̼���";
                                }else{
                                    if(v_totscore >= sd.getGradscore() && v_ftestscore >= sd.getGradftest() && v_htestscore >= sd.getGradhtest() && v_reportscore >= sd.getGradreport()) {
                                    	v_isgraduated="����";	
                                    }
                                    else{
                                    	v_isgraduated="�̼���";
                                	}
                                }
%>
                                        <tr>
                                            <!--td class="board_course_detail1">������� ����</td>
                                            <td class="board_course_detail1"><%=sd.getGradscore()%>��</td-->
                                            <td class="board_course_detail1">�̼����� ���������</td>
                                            <td class="board_course_detail1"><%=sd.getGradscore()%></td>
                                            <td class="board_course_detail1"></td>
                                            <td class="board_course_detail1"><font color='red'>������ �� �������</font></td>
                                            <td class="board_course_detail1"><%//df.format(v_totscore)%><%=v_totscore%>��</td>
                                        </tr>
                                        <tr>
                                            <td class="board_course_detail1" colspan="4">���Ῡ��</td>
                                            <td class="board_course_detail1"><b>[<%=v_isgraduated%>]</b></td>
                                        </tr>
                                        <!--tr>
                                            <td class="board_course_detail1">������� ������</td>
                                            <td class="board_course_detail1"><%=sd.getGradstep()%>%</td>
                                            <td class="board_course_detail1">������ ������</td>
                                            <td class="board_course_detail1"><%=sd.getTstep()%>%</td>
                                            <td class="board_course_detail1"></td>                                            
                                        </tr-->
                                        <!--tr>
                                            <td class="board_course_detail1">���Ῡ��</td>
                                            <td class="board_course_detail2"" colspan="4"><b>[<%=sd.getIsgraduated()%>]</b> : <%=get_reason(sd.getIsgraduated())%></td>
                                        </tr-->

<%                          }       %>
                                    </table>
                                </td>
                            </tr>
                        </table>
            <br>
            




<% if(p_iurl.equals("0")){ %>  
            <!-------------------�н� ���� ��Ȳ ����---------------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
              <tr> 
                <td><img src="/images/user/study/study_ing.gif" border="0"></td>
              </tr>
              <tr>
                <td height=8></td>
              </tr>
            </table>
						<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
                            <tr>
                                <td class="board_color_line"></td>
                            </tr>
                        </table>
                        <table cellspacing="1" cellpadding="3" class="open_board_table_out2" align="center">
						<%
						    ArrayList    examdata = (ArrayList)request.getAttribute("ExamData");
							ArrayList    examresultdata = (ArrayList)request.getAttribute("ExamResultData");
						%>
                            <tr>
                                <td class="board_title_bg1" width="25%">������</td>
                                <td class="board_title_bg3" width="25%">
								<font color="red"><%=examdata.get(2)%> </font>���� <font color="red"><%=examresultdata.get(2)%> </font>�� ����
								</td>
                                <td class="board_title_bg1" width="25%">�߰���</td>
                                <td class="board_title_bg3" width="25%">
								<font color="red"><%=examdata.get(0)%> </font>���� <font color="red"><%=examresultdata.get(0)%> </font>�� ����
								</td>
                            </tr>
                            <tr>
                                <td class="board_title_bg1">������</td>
                                <td class="board_title_bg3">
								<font color="red"><%=examdata.get(1)%> </font>���� <font color="red"><%=examresultdata.get(1)%> </font>�� ����
								</td>
                                <td class="board_title_bg1">����Ʈ</td>
                                <td class="board_title_bg3"><font color="red"><%=box.getString("p_report")%> </font>���� <font color="red"><%=box.getString("p_reportdata")%> </font>�� ����</td>
                            </tr>
                            <tr>
                                <td class="board_title_bg1">��������</td>
                                <td class="board_title_bg3">
								<%if(box.getString("p_suldata").equals("0")){%>
								<font color="red">������</font>
								<%}else if(box.getString("p_suldata").equals("1")){%>
								<font color="red">���ÿϷ�</font>
								<%}%>
								</td>
                                <td class="board_title_bg1">��������</td>
                                <td class="board_title_bg3">
								<%if(box.getString("p_ispaper").equals("0")){%>
									������ ����
                                <%}else{%>
									<%if(box.getString("p_contentsdata").equals("0")){%>
										<a href="javascript:PopSulmun();">
										  <u><font color="red">������</font></u>
										</a>
									<%}else if(box.getString("p_contentsdata").equals("1")){%>
									<font color="red">���ÿϷ�</font>
									<%}%>
                                <%}%>
								</td>
                            </tr>
                        </table>
                    <!--------------------�н� ���� ��Ȳ ����----------------->
            <br>
      
<%}%>
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
    if      (val.equals("STEP"  ))      return  "1.����";
    else if (val.equals("MTEST" ))      return  "�߰� ��";
    else if (val.equals("FTEST" ))      return  "2.���� ��";
    else if (val.equals("REPORT"))      return  "3.Report";
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
