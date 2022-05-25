<%
/**
 * file name : za_ExamPaper_L.jsp
 * date      : 2003/09/04
 * programmer:
 * function  : �򰡹����� ��ȸ
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.exam.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode      = box.getStringDefault("s_grcode", "ALL");           //�����׷�
    String  ss_gyear       = box.getStringDefault("s_gyear", "ALL");            //�⵵
    String  ss_grseq       = box.getStringDefault("s_grseq", "ALL");            //��������
    String  ss_upperclass  = box.getStringDefault("s_upperclass", "ALL");
    String  ss_middleclass = box.getStringDefault("s_middleclass","ALL");
    String  ss_lowerclass  = box.getStringDefault("s_lowerclass", "ALL");
    String  ss_subjcourse  = box.getStringDefault("s_subjcourse","ALL");    //����&�ڽ�
    String  ss_subjseq     = box.getStringDefault("s_subjseq","ALL");

%>
<html>
<head>
<title>�򰡹�������ȸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--
// ������ �߰� 
function InsertPaperPage(p_subj, p_gyear, p_subjseq) {
  document.form1.p_process.value = 'ExamPaperInsert';
  document.form1.p_subj.value    = p_subj;
  document.form1.p_gyear.value    = p_gyear;
  document.form1.p_subjseq.value = p_subjseq;
  document.form1.p_action.value = 'go';
  document.form1.submit();
}

// ������ �󼼺���
function UpdatePaperPage(p_subj, p_gyear, p_subjseq, p_lesson, p_examtype, p_papernum, p_subjseqgr) {
    window.self.name = "winSelectView";
    farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 1020, height = 667, top=0, left=0");
    document.form1.target = "openWinQuestion";
    document.form1.action = "/servlet/controller.exam.ExamPaperServlet";
    
    document.form1.p_process.value = 'ExamPaperUpdatePage';
    document.form1.p_subj.value    = p_subj;
    document.form1.p_gyear.value    = p_gyear;
    document.form1.p_subjseq.value = p_subjseq;
    document.form1.p_subjseqgr.value = p_subjseqgr;
    document.form1.p_lesson.value  = p_lesson;
    document.form1.p_examtype.value   = p_examtype;
    document.form1.p_papernum.value= p_papernum;
    document.form1.p_action.value = 'go';
    document.form1.submit();
    
    farwindow.window.focus();
    document.form1.target = window.self.name;
}

// ��ȸ �˻� 
function whenSelection(p_action) {
    var v_grcode, v_subj, v_subjseq;

	v_grcode        = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;
    v_subj        = document.form1.s_subjcourse.value;
    v_subjseq        = document.form1.s_subjseq.value;

	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
    if (p_action=="go") {
        if (v_subj=="----"){
            alert("������ �����ϼ���");
            return;
        }
        if (v_subjseq=="----"){
            alert("������ �����ϼ���");
            return;
        }
       top.ftop.setPam();
    }
  document.form1.p_process.value = 'ExamPaperListPage';
  document.form1.p_action.value  = p_action;
  document.form1.submit();
}

// ������ �̸�����
function PreviewPaper(p_subj, p_gyear, p_subjseq, p_lesson, p_examtype, p_branch, p_papernum, p_subjnm) {
  window.self.name = "winExamPreview";
  farwindow = window.open("", "openExamPreview", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=800, height=600, top=0, left=0");

  document.form4.target = "openExamPreview";
  document.form4.action = "/servlet/controller.exam.ExamPaperServlet";
  document.form4.p_process.value = "PreviewPage";
  document.form4.p_subj.value    = p_subj;
  document.form4.p_gyear.value    = p_gyear;
  document.form4.p_subjseq.value = p_subjseq;
  document.form4.p_lesson.value  = p_lesson;
  document.form4.p_examtype.value   = p_examtype;
  document.form4.p_branch.value  = p_branch;
  document.form4.p_papernum.value= p_papernum;
  document.form4.p_subjnm.value  = p_subjnm;
 
  document.form4.submit();
  farwindow.window.focus();
  document.form4.target = window.self.name;
}

// �����ڼ� Ŭ�� 
function ResultPage(p_subj, p_gyear, p_subjseq, p_lesson, p_examtype, p_branch, p_papernum) {

  document.form4.p_process.value = "ExamResultListPage";
  document.form4.action = "/servlet/controller.exam.ExamResultServlet";
  document.form4.p_subj.value    = p_subj;
  document.form4.p_gyear.value    = p_gyear;
  document.form4.p_subjseq.value = p_subjseq;
  document.form4.p_lesson.value  = p_lesson;
  document.form4.p_examtype.value   = p_examtype;
  document.form4.p_branch.value  = p_branch;
  document.form4.p_papernum.value= p_papernum;
   
  document.form4.submit();

}

function TestPage() {
  document.form1.p_process.value = 'TotalTestPage';
  document.form1.submit();
}


function ReloadPage(p_action) {
  document.form1.p_process.value = 'ExamPaperListPage';
  document.form1.p_action.value  = p_action;
  document.form1.submit();
}
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" action="/servlet/controller.exam.ExamPaperServlet">
    <input type="hidden" name="p_process" value="">
    <input type="hidden" name="p_action"  value="">
    <input type="hidden" name="p_subj"     value="">
    <input type="hidden" name="p_gyear"     value="">
    <input type="hidden" name="p_subjseq"  value="">
	<input type="hidden" name="p_subjseqgr"      value="">
    <input type="hidden" name="p_lesson"   value="">
    <input type="hidden" name="p_examtype"    value="">
    <input type="hidden" name="p_branch"   value="">
    <input type="hidden" name="p_papernum" value="">
    <input type="hidden" name="p_subjnm"   value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/exam/e_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>

      <!----------------- form ���� ----------------->
      <table class="form_table_out" cellspacing="0" cellpadding="1">
        <tr> 
          <td align="center"> 
            <table class="form_table_bg" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td align="center"> 
                  <table class="form_table" cellspacing="0" cellpadding="0" width="99%">
                    <tr> 
                      <td><font color="red">��</font> 
                         <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
	                     <%= SelectEduBean.getGyear(box, true )%><!-- getGyear(RequestBox, isChange)   �ش翬��  -->
                         <%= SelectSubjBean.getUpperClass(box, true, true, false)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
                		 <%= SelectSubjBean.getMiddleClass(box, true, true, false)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
				         <%= SelectSubjBean.getLowerClass(box, true, true, false)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
                      </td>
                    </tr>
                    <tr> 
                      <td>
				         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				         <font color="red">��</font> 
				         <%= SelectSubjBean.getSubj(box, true, false)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->&nbsp;
				         <font color="red">��</font> <%= SelectSubjBean.getSubjseq(box, true, false)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
                         &nbsp; <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                      </td>
                    </tr>                    
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
            </table>
          </td>
        </tr>
      </form>  
      </table>
      <!----------------- form �� ----------------->
      <br>
      <br>

      <table cellpadding="0" cellspacing="0" class="table1">
        <tr> 
          <td align="right"><b>���̵��� ���׼� (��/��/�� : ��ü)</b></td>
        </tr>
        <tr> 
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- �򰡹����� ��ȸ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="11" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="6%" class="table_title">NO</td>
          <td class="table_title">����</td>
          <td class="table_title">������</td>
          <td width="12%" class="table_title">��������</td>
          <td class="table_title">��Ÿ��</td>
		  <td  class="table_title">������</td>
          <td class="table_title">�����ڼ�</td>
          <td class="table_title">��������</td>
          <td class="table_title">���̵��� ���׼�</td>
          <td class="table_title">������</td>
          <td class="table_title">���</td>
        </tr>
<%  
    ArrayList    list = (ArrayList)request.getAttribute("ExamPaperList");

    if(list.size() > 0) {
        for (int i=0; i<list.size(); i++) {
		ArrayList blist = (ArrayList)list.get(i);

            DataBox dbox = (DataBox)blist.get(0);
			int v_studentcnt = Integer.parseInt(blist.get(1).toString());  
			int v_examstudentcnt = Integer.parseInt(blist.get(2).toString());  
    
	              if (i==0){
%>
        <tr> 
          <td rowspan="<%=String.valueOf(list.size())%>" class="table_01"><%=String.valueOf(i+1)%></td>
          <td rowspan="<%=String.valueOf(list.size())%>" class="table_02_1"><%=dbox.getString("d_year")%></td>
          <td rowspan="<%=String.valueOf(list.size())%>" class="table_02_1"><%=dbox.getString("d_subjnm")%></td>
          <td rowspan="<%=String.valueOf(list.size())%>" class="table_02_1"><%=StringManager.cutZero(dbox.getString("d_subjseqgr"))%>��</td>
<% 
	        }
%>
<%
	if (dbox.getInt("d_papernum") > 0){
%>
		  <td class="table_02_1"><%=dbox.getString("d_examtypenm")%></td>
		  <td class="table_02_1">
<%//if (v_examstudentcnt < 1){ %>
          <a href="javascript:UpdatePaperPage('<%=dbox.getString("d_subj")%>', '<%=dbox.getString("d_year")%>', '<%=dbox.getString("d_subjseq")%>','<%=dbox.getString("d_lesson")%>','<%=dbox.getString("d_examtype")%>','<%=dbox.getInt("d_papernum")%>','<%=dbox.getString("d_subjseqgr")%>')" class="a">
<%//}%>
          <%=dbox.getString("d_lesson")%>����
<%if (v_examstudentcnt < 1){ %>
          </a>
<%}%>
          </td>
          <td class="table_02_1">
          <%if (v_examstudentcnt > 110){ %>
          <a href="javascript:ResultPage('<%=dbox.getString("d_subj")%>', '<%=dbox.getString("d_year")%>', '<%=dbox.getString("d_subjseq")%>','<%=dbox.getString("d_lesson")%>','<%=dbox.getString("d_examtype")%>','','<%=dbox.getInt("d_papernum")%>', '<%=dbox.getString("d_subjnm")%>')" class="a">
          <%}%>
          <%=v_examstudentcnt%>/<%=v_studentcnt%>
          <%if (v_examstudentcnt > 110){ %></a><%}%>
		  </td>
          <td class="table_02_1"><%=dbox.getString("d_lessonstart")%>-<%=dbox.getString("d_lessonend")%></td>
          <td class="table_02_1"><%=dbox.getInt("d_cntlevel1")%>/<%=dbox.getInt("d_cntlevel2")%>/<%=dbox.getInt("d_cntlevel3")%> : <%=dbox.getInt("d_examcnt")%></td>
          <td class="table_02_1"><%=String.valueOf(dbox.getInt("d_totalscore"))%></td>
          <td class="table_02_1">
          <a href="javascript:PreviewPaper('<%=dbox.getString("d_subj")%>', '<%=dbox.getString("d_year")%>', '<%=dbox.getString("d_subjseq")%>','<%=dbox.getString("d_lesson")%>','<%=dbox.getString("d_examtype")%>','','<%=dbox.getInt("d_papernum")%>', '<%=dbox.getString("d_subjnm")%>')" class="a"><img src="/images/admin/button/b_preview.gif" border="0">
          </a>
          </td>
        </tr>
<%
     }  else {
%>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
         </tr>
<%
    }	
%>
<%   
    } 
    } else {

		if (box.getString("p_action").equals("go")) {
%>
        <tr> 
          <td class="table_01">1</td>
          <td class="table_02_1"><%=box.getString("s_gyear")%></td>
          <td class="table_02_1"><%=GetCodenm.get_subjnm(box.getString("s_subjcourse"))%></td>
          <td class="table_02_1">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr> 
                <td height="17"><%=StringManager.cutZero(GetCodenm.get_subjseqgr(ss_subjcourse, ss_grcode, ss_gyear, ss_subjseq))%>��</td>
                <td align="right" width="74" height="17"><a href="javascript:InsertPaperPage
('<%=box.getString("s_subjcourse")%>', '<%=box.getString("s_gyear")%>', '<%=box.getString("s_subjseq")%>')" class="a"><img src="/images/admin/button/b_add.gif" border="0"></a></td>
              </tr>
            </table>
          </td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
          <td class="table_02_1"></td>
         </tr>
<%
		}
  }
%>
      </table>
      <!----------------- �򰡹����� ��ȸ �� ----------------->
      <br>
        </td>
  </tr>
</form>

<form name="form4" method="post" action="/servlet/controller.exam.ExamPaperServlet">
  <input type="hidden" name="p_process"  value="">
  <input type="hidden" name="p_action"   value="">
  <input type="hidden" name="p_subj"     value="">
  <input type="hidden" name="p_gyear"     value="">
  <input type="hidden" name="p_subjseq"  value="">
  <input type="hidden" name="p_lesson"   value="">
  <input type="hidden" name="p_examtype"    value="">
  <input type="hidden" name="p_branch"   value="">
  <input type="hidden" name="p_papernum" value="">
  <input type="hidden" name="p_userid"   value="">
  <input type="hidden" name="p_subjnm"   value="">
</form>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
