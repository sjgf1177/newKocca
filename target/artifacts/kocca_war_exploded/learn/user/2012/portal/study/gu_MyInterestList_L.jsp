<%
//**********************************************************
//  1. ��      ��: ���ǰ��ǽ� > ���� ���ɰ���
//  2. ���α׷��� : gu_MyInterest_L.jsp
//  3. ��      ��: ���� ���ɰ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.30
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import = "com.credu.library.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

	String v_userid = box.getSession("userid");
	
	String	v_biyong		= "";
	String	v_today			= "";
	String	v_subj			= "";
	String	v_subjnm		= "";
    String	v_statusString	= "";
    String	v_subjseqgr		= "";
    int		v_iedustart		= 0;
    int		v_studentlimit	= 0;
	String	v_subjseq		= "";
	String	v_year			= "";
	String	v_propstart		= "";
	String	v_propend		= "";
	String	v_edustart		= "";
	String	v_eduend		= "";           
	String	v_ispropose		= "";           
	String	v_classname		= "";           
	String	v_sphere		= ""; 
	int		v_propcnt		= 0;
	String	v_preurl		= "";
	String	v_issampleString= "";
	String	v_isonoff		= "";
	String	v_upperclass	= "";

    Date today1 = new Date();
    Calendar nowCalendar = Calendar.getInstance();
    nowCalendar.setTime(today1);// ���÷� ����.
    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
    String today=format.format(today1);

    ArrayList list1 = (ArrayList)request.getAttribute("InterestList");
    
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript">
<!--
//���ɰ��� ����
function deleteGo( subj, year, subjseq ){

	var ok= confirm("���ɰ������� �����Ͻðڽ��ϱ�?");

	if(ok){

	document.frm3.p_subj.value=subj;
	document.frm3.action ="/servlet/controller.study.InterestServlet?p_process=InterestDelete";
	document.frm3.submit();

	}else{
		return;	
	}

}

// ���� ���뺸��
function whenSubjInfo_old(subj,tabnum){
    document.frm3.p_subj.value     = subj;
    document.frm3.p_tabnum.value   = tabnum;
    document.frm3.p_process.value  = 'SubjectPreviewPage';
    document.frm3.p_rprocess.value = 'SubjectList';
    document.frm3.action='/servlet/controller.course.CourseIntroServlet';
    document.frm3.target = "_self";
    document.frm3.submit();
}


//���� ���뺸��
function whenSubjInfo(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq){
document.frm3.p_subj.value = subj;
document.frm3.p_subjnm.value = subjnm;
document.frm3.p_iscourseYn.value = courseyn;
document.frm3.p_upperclass.value = upperclass;
document.frm3.p_upperclassnm.value = upperclassnm;
document.frm3.p_year.value = year;
document.frm3.p_subjseq.value = subjseq;
document.frm3.p_process.value = 'SubjectPreviewPage';
document.frm3.p_rprocess.value = 'SubjectList';
document.frm3.action='/servlet/controller.propose.ProposeCourseServlet';
document.frm3.target = "_self";
document.frm3.submit();
}

//������û
function whenSubjPropose(subj,year,subjseq, subjnm) {

	if(<%= box.getSession("userid").length()==0 %>) {
		alert("�α����� �ʿ��մϴ�.");
		return;
	}
	if(!confirm(subjnm+"������ ������û�Ͻðڽ��ϱ�?")){
	 return;
	}
	var new_Open = window.open("","proposeWindow",'scrollbars=yes,width=800,height=600,resizable=no');
	document.form1.p_process.value = "SubjectEduProposePage";
	document.form1.target = "proposeWindow";
	document.form1.p_subj.value = subj;
	document.form1.p_year.value = year;
	document.form1.p_subjseq.value = subjseq;
	document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
	document.form1.submit();
	document.form1.target = "_self";
}

//-->
</script>
<form name="form1" method="post">
	<input type="hidden" name="p_process"	value="SubjectList"/>
	<input type="hidden" name="p_rprocess"	value=""/>
	<input type="hidden" name="p_year"	value=""/>
	<input type="hidden" name="p_subj"	value=""/>
	<input type="hidden" name="p_subjseq"	value=""/>
	<input type="hidden" name="p_subjnm"	value=""/>
	<input type="hidden" name="p_order"	value=""/>
	<input type="hidden" name="p_iscourseYn"	value=""/>
	<input type="hidden" name="p_upperclass"	value="C01"/>
	<input type="hidden" name="p_upperclassnm"	value=""/>
	<input type="hidden" name="p_action"	value=""/>
	<input type="hidden" name="p_pageno"	value="1"/>
	<input type="hidden" name="p_pagesize"  value="0"/>
	<input type="hidden" name="p_area" id="p_area"	value=""/>
</form>

<!-- Form ���� ���� -->
	<form name="frm3" method="post" >
		<input type="hidden" name="p_subj"/>
		<input type="hidden" name="p_subjnm"/>
		<input type="hidden" name="p_iscourseYn"/>
		<input type="hidden" name="p_upperclass"/>
		<input type="hidden" name="p_upperclassnm"/>
		<input type="hidden" name="p_year"/>
		<input type="hidden" name="p_subjseq"/>
		<input type="hidden" name="p_tabnum"/>
		<input type="hidden" name="p_process"/>
		<input type="hidden" name="p_rprocess"/>
		<input type="hidden" name="p_frominterestyn" value="Y"/>

			<h2><img src="/images/portal/myclass/h2_tit11.gif" alt="���ǰ��ɰ���" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>���ǰ��ɰ���</strong></p></h2>
 
			<p><img src="/images/portal/myclass/myinterest_txt.gif" alt="���ɰ������� ������ ����Դϴ�. ������ ��Ͽ��� �ٷ� ������û�Ͻ� �� ������, ���� ������û�� ���ɰ��� ��Ͽ��� �����˴ϴ�." /></p>
			
			<table class="board_list mg_t30">
			<colgroup><col width="90px" /><col width="282px" /><!--col width="50px" /--><col width="90px" /><col width="90px" /><col width="138px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p>�з�</p></th>
				<th><p>������</p></th>
				<!--th><p>����</p></th-->
				<th><p>�����Ⱓ</p></th>
				<th><p>������</p></th>
				<th class="end"><p>��������</p></th>
			</tr>
			</thead>
			<tbody>
<%
	NumberFormat s_fmt = NumberFormat.getInstance();				//��ȭ���� ,ǥ��
	int totalCnt = list1.size();
	//DataBox dbox = null;
    String v_propstart1;
    String v_propend1;
    
	for (int i=0; i<list1.size(); i++) {
        DataBox dbox = (DataBox)list1.get(i);  
			v_biyong		= s_fmt.format(dbox.getInt("d_biyong"));
			v_today			= FormatDate.getDate("yyyyMMddhh");
			v_classname		= dbox.getString("d_classname");
			v_subj			= dbox.getString("d_subj");
			v_subjnm		= dbox.getString("d_subjnm");
			v_studentlimit	= dbox.getInt("d_studentlimit");
			v_subjseq		= dbox.getString("d_subjseq");
			v_year			= dbox.getString("d_year");
			v_subjseqgr		= dbox.getString("d_subjseqgr");
			v_propstart		= dbox.getString("d_propstart");
			v_propend		= dbox.getString("d_propend");
            if (v_propstart.equals("")) {
                v_propstart1    = "";
            } else {
                v_propstart1    = dbox.getString("d_propstart").substring(0,8);
            }
            if (v_propend.equals("")) {
                v_propend1    = "";            
            } else {
                v_propend1		= dbox.getString("d_propend").substring(0,8);
            }
			v_edustart		= dbox.getString("d_edustart");
			v_eduend		= dbox.getString("d_eduend");
			v_ispropose		= dbox.getString("d_ispropose");
			v_propcnt		= dbox.getInt("d_propcnt");
			v_today			= FormatDate.getDate("yyyyMMddhh");
			v_preurl        = dbox.getString("d_preurl");
			v_sphere        = dbox.getString("d_sphere");
			v_upperclass    = dbox.getString("d_upperclass");
			v_isonoff       = dbox.getString("d_isonoff");

			if(!v_preurl.equals(""))
			{ 
				v_issampleString = "<a href=\"javascript:whenPreShow('" + v_preurl + "','" + v_subj +"')\" focus=\"this.blur()\"><img src=\"/images/user/portal/button/b_samplecourse.gif\" border=\"0\"></a>";
			}else {
				v_issampleString = "-";
			}

            if(v_edustart.equals("")){v_iedustart = 0;}
            else{v_iedustart = Integer.parseInt(v_edustart);}

            if(v_iedustart >= Integer.parseInt(v_today)){
                if(v_propcnt > 0){
                    v_statusString = "";
                }
                else
                	v_statusString = "<a href=\"javascript:whenSubjPropose('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_subjnm+"')\" class=\"board_btn2\"><span>������û</span></a>";
            }

            //��¥ ó��
            if(v_propstart.equals("")){v_propstart = "����";}
            else{v_propstart     = FormatDate.getFormatDate(v_propstart,"yyyy.MM.dd");}

            if(v_propend.equals("")){v_propend = "����";}
            else{v_propend = FormatDate.getFormatDate(v_propend,"yyyy.MM.dd");}

            if(v_edustart.equals("")){v_edustart = "����";}
            else{v_edustart     = FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");}

            if(v_eduend.equals("")){v_eduend = "����";}
            else{v_eduend     = FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");}

%>
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td class="ta_l"><%= v_classname %></td>
				<td class="ta_l">
                    <a href="javascript:whenSubjInfo('<%= v_subj %>','<%= v_subjnm %>','<%= v_isonoff %>','<%= v_upperclass %>','<%= v_classname %>','<%= v_year %>','<%= v_subjseq %>')"><%= v_subjnm %></a>
                </td>
				<!--td><%//= StringManager.cutZero(v_subjseq) %>��</td-->
				<td class="num ta_l"><%= v_edustart %> ~<br /><%= v_eduend %></td>
				<td class="num ta_r"><strong><%= v_biyong %></strong></td>
				<td><% if(v_propstart1.compareTo(today)>=0 && v_propend1.compareTo(today)<=0) { out.print(v_statusString); }%>
                    <a href="javascript:deleteGo('<%=dbox.getString("d_subj")%>','<%=dbox.getString("d_year")%>','<%=dbox.getString("d_subjseq")%>')" class="board_btn2"><span>����</span></a></td>
			</tr>
<%
	}
%>
<%
		if(list1.size()==0){
%>
			<tr height="25"> 
			  <td colspan="6" align="center" valign="middle">�˻��� ������ �����ϴ�.</td>
			</tr>
<%
		}
%>
			</tbody>
			</table>
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->