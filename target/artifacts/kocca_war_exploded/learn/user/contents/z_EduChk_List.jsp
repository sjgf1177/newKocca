<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/tags/KoccaPageUtilTaglib" prefix="pu" %>
<%@ page isELIgnored="false" %>
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
    String v_isgraduated = "-";


    String  p_lesson_link = box.getString("p_lesson_link");
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
<!DOCTYPE html>
<html>
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>�ѱ���������ī����</title>

    <!-- Bootstrap / Jquery UI -->
    <link href="/common/js/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet">
    <link href="/common/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="/common/js/jquery-3.3.1.min.js"></script>
    <script src="/common/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script src="/common/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    
    
    <!-- Custom CSS -->
    <link href="/common/css/custom.css" rel="stylesheet">
    <link href="/common/css/header.css" rel="stylesheet">
    <link href="/common/css/footer.css" rel="stylesheet">
    
    <!-- Custom JS -->
    <script src="/common/js/custom.js"></script>
    
    <script type="text/javascript" src="/script/portal/common.js"></script>
    
    <script type="text/javascript">
	    var v_subj    = '<%=p_subj%>';
	    var v_year    = '<%=p_year%>';
	    var v_subjseq = '<%=p_subjseq%>';
	    function init() {
	        this.moveTo(0,0);
	        this.resizeTo(800,900);
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
	
	    function PopSulmun() {
	        upWin('/servlet/controller.study.StudySulmunServlet?&p_subj='+v_subj+'&p_year='+v_year+'&p_subjseq='+v_subjseq,800,600);
	    }
	    function upWin(url,w,h) {
	        window.open(url,"","toolbar=no,statusbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=YES,resizable=yes,width="+w+",height="+h+" ").focus();
	    }
	</script>
</head>
<body id="pop_study" onLoad='init();'>
<%=p_isFromLMS%>
    <section>
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="subContainer_pop">
                            <div class="sub_section">
                                <div class="sub_contents_header">
                                    <span>���� ������</span>
                                </div>
                                <div class="sub_contents_body">
                                    <div class="sub_info_body">
                                        <div class="sub_course_alert_box">
                                            <p><%= GetCodenm.get_subjnm(p_subj) %></p>
                                        </div>
                                        <div class="sub_course_view_wrap" style="margin-bottom:50px;">
                                            <ul class="myCourseDetail">
                                                <li><span>�ֱ��н���</span> : <%=FormatDate.getFormatDate(v_edudate,"yyyy.MM.dd") %></li>
                                                <li><span>�н�Ƚ��</span> : <%=v_educount %>ȸ</li>
                                                <li><span>���� �����Ⱓ</span> : <%=FormatDate.getDate("yyyy.MM.dd") %> ~ <%= FormatDate.getFormatDate(sd.getEduend(),"yyyy.MM.dd") %></li>
                                            </ul>
                                            <ul class="myCourseDetail">
                                                <li><span>�����Ⱓ</span> : <%=FormatDate.getFormatDate(sd.getEdustart(),"yyyy.MM.dd") %> ~ <%=FormatDate.getFormatDate(sd.getEduend(),"yyyy.MM.dd") %></li>
                                                <li><span>���� ������</span> : <span class="progress_bar blue"><%= sd.getTstep() %>%<span style="width:<%= sd.getTstep() %>%;"></span></span></li>
                                                <li><span>���� ������</span> : <span class="progress_bar gray"><%= v_promotion %>%<span style="width:<%= v_promotion %>%;"></span></span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="sub_boarder_body">
                                        <p class="sub_course_view_title">�н������Ȳ</p>
                                        <table class="td_align_center">
                                            <colgroup>
                                                <col width="15%">
                                                <col width="auto">
                                                <col width="auto">
                                                <col width="auto">
                                                <col width="auto">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>�̼� ��������</th>
                                                    <th>����ġ(%)</th>
                                                    <th>�������</th>
                                                    <th>ȯ������</th>
                                                </tr>
                                            </thead>
                                            <tbody>
<%
	Hashtable 	ht;
	int			htsize		= 0;
	String		v_datatype	= "";

	if(sd!=null) {
	    htsize=sd.eduScoreList.size();
	    for (int i=0; i<htsize; i++) {
	        if((Hashtable)sd.getEduScoreList() != null){
	            ht  = (Hashtable)sd.getEduScoreList();
	            sds = (EduScoreDataSub)ht.get(String.valueOf(i));
	            v_datatype=get_datatypenm(sds.getDatatype());
%>
												<tr>
													<td><%= get_datatypenm(sds.getDatatype()) %></td>
													<td><%= sds.getGradscore() %> ��</td>
													<td><%= sds.getWeight() %> %</td>
													<td><%= new java.text.DecimalFormat("###,###,###.#").format(sds.getScore()) %> ��</td>
													<td><%= new java.text.DecimalFormat("###,###,###.#").format(sds.getAvscore()) %> ��</td>
												</tr>
<%
				v_totscore=v_totscore+sds.getAvscore();
			}
		}

	    //����
		if(v_iseduend.equals("Y")) {
			if(sd.getIsgraduated().equals("Y")) v_isgraduated="����";
			else v_isgraduated="�̼���";
		} else {
				v_isgraduated="-";
		}
%>
												<tr>
													<td>�������</td>
													<td><%= sd.getGradscore() %> ��</td>
													<td>-</td>
													<td>-</td>
													<td><%= new java.text.DecimalFormat("###,###,###.#").format(v_totscore) %> ��</td>
												</tr>
												<tr>
													<td>���Ῡ��</td>
													<td colspan="4"><%=v_isgraduated%></td>
												</tr>
<%		}       %>
                                            </tbody>
                                        </table>
                                    </div>
<%
if(p_iurl.equals("0")){
%>

<%
	ArrayList    examdata = (ArrayList)request.getAttribute("ExamData");
	ArrayList    examresultdata = (ArrayList)request.getAttribute("ExamResultData");
%>
<!-- 
                                    <div class="sub_info_body">
                                        <p class="sub_course_view_title">��</p>
                                        <table>
                                            <colgroup>
                                                <col width="15%">
                                                <col width="auto">
                                                <col width="15%">
                                                <col width="auto">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th>������</th>
                                                    <td><%=examdata.get(2) %> ���� <%=examresultdata.get(2) %> �� ����</td>
                                                    <th>�߰���</th>
                                                    <td><%=examdata.get(0) %> ���� <%=examresultdata.get(0) %> �� ����</td>
                                                </tr>
                                                <tr>
                                                    <th>������</th>
                                                    <td><%= examdata.get(1) %> ���� <%= examresultdata.get(1) %> �� ����</td>
                                                    <th>����Ʈ</th>
                                                    <td><%= box.getString("p_report") %> ���� <%= box.getString("p_reportdata") %> �� ����</td>
                                                </tr>
                                                <tr>
                                                    <th>��������</th>
                                                    <td>
<%
	if(box.getString("p_ispaper2").equals("0")){
%>
														������ ����
<%
	} else {
		if(box.getString("p_suldata").equals("0")){
%>
														<a href="javascript:PopSulmun();" class="btn_record">�����ϱ�</a>
<%
		} else if (box.getString("p_suldata").equals("1")) {
%>
														���ÿϷ�
<%
		}
	}
%>
                                                    </td>
                                                    <th>���ļ���</th>
                                                    <td>
<%		
	if(box.getString("p_ispaper").equals("0")){
%>
														������ ����
<%
	} else {
		if(box.getString("p_contentsdata").equals("0")){
%>
														<a href="javascript:PopSulmun();" class="btn_record">�����ϱ�</a>
<%
		}else if(box.getString("p_contentsdata").equals("1")){%>
														<span>���ÿϷ�</span>
<%
		}
	}
%>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
-->
                                    <div class="sub_boarder_body"> 
                                        <p class="sub_course_view_title" style="margin-top:50px;">����</p>
                                        <table>
                                            <colgroup>
                                                <col width="20%">
                                                <col width="auto">
<%--                                                 <col width="auto"> --%>
<%--                                                 <col width="15%"> --%>
                                                <col width="20%">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>���</th>
                                                    <th>����</th>
<!--                                                     <th>���ýð�</th> -->
<!--                                                     <th>������</th> -->
                                                    <th>��������</th>
                                                </tr>
                                            </thead>
                                            <tbody>
<%
	ArrayList    ExamList1 = (ArrayList)request.getAttribute("ExamUserList");
	ArrayList    ExamList2 = (ArrayList)request.getAttribute("ExamUserResultList");
	int totCnt = 0;
	int rowCnt = ExamList1.size();
	      
	for (int i=0; i<ExamList1.size(); i++) {
		DataBox dbox = (DataBox)ExamList1.get(i);
%>
<!-- 
												<tr>
<%			if (i==0 && rowCnt>1) {  %>
													<td rowspan="<%= rowCnt %>"><a href="javascript:upWin('/servlet/controller.study.StudyExamServlet?p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>',800,600)"><span>����</span></a></td>
<%			}else if (rowCnt==1) {  %>
													<td><a href="javascript:upWin('/servlet/controller.study.StudyExamServlet?p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>',800,600)"><span>����</span></a></td>
<%			}   %>
													<td><%= dbox.getString("d_examtypenm") %></td>
													<td><%= FormatDate.getFormatDate(dbox.getString("d_startdt"),"yyyy/MM/dd HH:mm") %> ~ <%= FormatDate.getFormatDate(dbox.getString("d_enddt"),"yyyy/MM/dd HH:mm") %></td>
													<td><%= FormatDate.getFormatDate(dbox.getString("d_ldate"),"yyyy/MM/dd HH:mm") %></td>
													<td class="end"><%= dbox.getString("d_score") %></td>
												</tr>
 -->
<%
	}
	totCnt += rowCnt;

	ArrayList    ProjectList = (ArrayList)request.getAttribute("ProjectList");
	rowCnt = ProjectList.size();
	for (int i=0; i<ProjectList.size(); i++) {
		ProjectData data  = (ProjectData)ProjectList.get(i);
		String v_title  = data.getTitle();
		String v_expiredate        = data.getExpiredate();
		String v_deadlinesdate         = data.getDeadlinesdate();
		String v_deadlineedate       = data.getDeadlineedate();
		String v_ldate       = data.getLdate();
		
		if (v_deadlineedate.equals("")) {
			v_deadlineedate = v_expiredate;
		}
		
		int v_score        = data.getScore2();
%>
<!-- 
                                                <tr>
<%      	if (i==0 && rowCnt>1) {  %>
												<td rowspan="<%= rowCnt %>"><a href="javascript:upWin('/servlet/controller.study.ProjectServlet?p_process=choicePage&p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>',800,600)"><span>����Ʈ</span></a></td>
<%      	}else if (rowCnt==1) {  %>
												<td><a href="javascript:upWin('/servlet/controller.study.ProjectServlet?p_process=choicePage&p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>',800,600)"><span>����Ʈ</span></a></td>
<%      	}   %>
												<td><%= v_title %></td>
												<td><%= FormatDate.getFormatDate(v_deadlinesdate,"yyyy/MM/dd") %> ~ <%= FormatDate.getFormatDate(v_deadlineedate,"yyyy/MM/dd") %></td>
												<td><%= FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd HH:mm") %></td>
												<td class="end"><%= v_score %></td>
												</tr>
-->
<%
	}
	totCnt += rowCnt;
	
	ArrayList  TopicList = (ArrayList)request.getAttribute("TopicList");
	rowCnt = TopicList.size();
	for (int i=0; i<TopicList.size(); i++) {
		ToronData data  = (ToronData)TopicList.get(i);
		
		String v_title     = data.getTitle();
		String v_started   = data.getStarted();
		String v_ended     = data.getEnded();
		String v_addate    = data.getLdate();
	
		int v_score       = data.getPosition();
		String v_scoremsg = "����";
	
		if(v_score == 0){v_scoremsg="������";}
%>
<!-- 
												<tr>
<%      if (i==0 && rowCnt>1) {  %>
													<td rowspan="<%= rowCnt %>"><a href="javascript:upWin('/servlet/controller.study.ToronServlet?p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>',800,600)"><span>���</span></a></td>
<%      }else if (rowCnt==1) {  %>
													<td><a href="javascript:upWin('/servlet/controller.study.ToronServlet?p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>',800,600)"><span>���</span></a></td>
<%      }   %>
													<td><%= v_title %></td>
													<td><%= FormatDate.getFormatDate(v_started,"yyyy/MM/dd HH") %>�� ~ <%= FormatDate.getFormatDate(v_ended,"yyyy/MM/dd HH") %>��</td>
													<td><%= FormatDate.getFormatDate(v_addate,"yyyy/MM/dd") %></td>
													<td class="end"><%= v_scoremsg %></td>
												</tr>
-->
<%
	}
	totCnt += rowCnt;

	ArrayList  SulmunList = (ArrayList)request.getAttribute("SulmunSubjUserList");
	rowCnt = SulmunList.size();
	for (int i=0; i<SulmunList.size(); i++) {
		DataBox dbox1 = (DataBox)SulmunList.get(i);
%>
												<tr>
<%      	if (i==0 && rowCnt>1) {  %>
													<td rowspan="<%= rowCnt %>"><a href="javascript:upWin('/servlet/controller.study.StudySulmunServlet?p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>',800,600)"><span>��������</span></a></td>
<%      	} else if (rowCnt==1) {  %>
													<td><a href="javascript:upWin('/servlet/controller.study.StudySulmunServlet?p_subj=<%=p_subj%>&p_year=<%=p_year%>&p_subjseq=<%=p_subjseq%>',800,600)" style="text-align: center;"><span>��������</span></a></td>
<%      	}   %>
													<td><%= dbox1.getString("d_sulpapernm") %></td>
													<td>
<%      	if (dbox1.getString("d_eachcnt").equals("0") && (Double.parseDouble(v_progress)>=Double.parseDouble(dbox1.getString("d_progress")))){  %>
														<span>���ð���</span>
<%      	} else if (dbox1.getString("d_eachcnt").equals("0") && (Double.parseDouble(v_progress)<Double.parseDouble(dbox1.getString("d_progress")))){  %>
														<span>�����̴�</span>
<%      	} else if (dbox1.getString("d_eachcnt").equals("1")){  %>
														<span>���ÿϷ�</span>
<%      	}   %>
													</td>
												</tr>
<%
	}
	totCnt += rowCnt;

	if (totCnt==0) {
 %>
                                                <tr>
                                                    <td colspan="5">������� �����Ͱ� �����ϴ�.</td>
                                                </tr>
<%
	}
%>
                                            </tbody>
                                        </table>
                                        
                                        <p class="sub_course_view_title" style="margin-top:50px;">��������</p>
                                        <table class="td_align_left1">
                                            <colgroup>
                                                <col width="auto">
                                                <col width="15%">
                                                <col width="20%">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>����</th>
                                                    <th>����</th>
                                                    <th>�����н���</th>
                                                </tr>
                                            </thead>
                                            <tbody>
<%
	String v_module="", v_brlink="", v_lesssonlink="";
	String today = FormatDate.getDate("yyyyMMdd");

	MfBranchData    bData;
	int n = 0;
	for (int i=0; i<list.size(); i++) {
		x = (EduListData)list.get(i);
		int m=0;
		
		for(int k=n;k < list.size();k++) {
			EduListData y = (EduListData)list.get(k);
			
			if (y.getRecordType().equals("STEP")) {
				if(y.getModule().equals(x.getModule()) ) {
					m++;
				} else {
					n=k;
					break;
				}
			}
		}
         
		if(x.getRecordType().equals("STEP")){
%>
                                                <tr>
<%
			if(!v_module.equals(x.getModule())){
				v_module = x.getModule();
			}

			if(x.getRecordType().equals("STEP")){
				if(x.getIsbranch().equals("Y")){
					v_brlink = "<br>";
					
					for(int j=0;j<brlist.size();j++){
						bData = (MfBranchData)brlist.get(j);
						v_brlink=v_brlink + "<a href=\"javascript:whenBr('"+x.getLesson()+"','"+bData.getBranch()+"')\">"+bData.getSdesc()+"</a>&nbsp;&nbsp";
					}
				}
				
				String fromdate = FormatDate.getRelativeDate(x.getEdustart(), Integer.parseInt(x.getFromdate()));
				String todate   = FormatDate.getRelativeDate(x.getEdustart(), Integer.parseInt(x.getTodate()));
				v_lesssonlink   = "<a href=\"javascript:whenSelect('" + x.getLesson() + "')\">"+ x.getLesson() + "-" + x.getSdesc() + "</a>";

				if (Integer.parseInt(x.getTodate()) != 0) {
					if ((Integer.parseInt(today) >= Integer.parseInt(fromdate)) && (Integer.parseInt(today) <= Integer.parseInt(todate))) {
						if (p_lesson_link.equals("Y")) {
							v_lesssonlink = "<a href=\"javascript:whenSelect('" + x.getLesson() + "')\">"+ x.getLesson() + "-" + x.getSdesc() + "</a>";
						} else {
							v_lesssonlink = x.getLesson() + "-" + x.getSdesc();
						}
					} else {
						v_lesssonlink = x.getLesson() + "-" + x.getSdesc();
					}
				}
%>
                                                    <td><%= x.getLesson() + "-" + x.getSdesc() %></td>
                                                    <td><%= get_isEducatedTxt(x.getIsEducated()) %></td>
                                                    <td><%= FormatDate.getFormatDate(x.getLdate(),"yyyy/MM/dd-HH:mm") %></td>
<%
			}
%>
                                                </tr>
<%
		}
	}
%>
                                            </tbody>
                                        </table>
                                    </div>
<%
}
%>
                                </div>
<!--                                 <div class="popup_btnBox"> -->
<!--                                     <a href="#" class="btn_courseCancel">�ݱ�</a> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
<%!
public String   get_isEducatedTxt(String val){
    if(val.equals("Y"))
        return  "<img src=\"/images/portal/ico/ico_yes.gif\" alt=\"\" />";
    else if(val.equals("P"))
        return "";
    else
        return  "<img src=\"/images/portal/ico/ico_no.gif\" alt=\"\" />";
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
    else if (val.equals("HTEST" ))      return  "���� ��";
    else if (val.equals("REPORT"))      return  "Report";
    else if (val.equals("ACT"   ))      return  "Activity";
    else if (val.equals("ETC1"  ))      return  "������";
    else if (val.equals("ETC2"  ))      return  "��Ÿ";

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
