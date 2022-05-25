<%
//**********************************************************
//  1. ��      ��: ����ó�� ����Ʈ
//  2. ���α׷���: za_Finish_L.java
//  3. ��      ��: ����ó�� ����Ʈ �� ó��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 20
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getStringDefault("s_grseq","ALL");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����
	String  v_action       = box.getString("p_action");

	ArrayList list = null;
	
	if (v_action.equals("go")) {
    	list = (ArrayList)request.getAttribute("CompleteList");
    }
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
%>
<html>
<head>
<title>����ó��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--

// ��ȸ(GO��ư) ����
function whenSelection(p_action) {
  if (p_action=="go"){
     if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
         alert("�����׷��� �����ϼ���.");
         return;
      }
      top.ftop.setPam();
  }
  document.form1.target = "_self";
  document.form1.p_process.value = 'listPage';
  document.form1.p_action.value = p_action;
  document.form1.submit();
}

// ����ó�� ��û
function whenComplete(p_subj, p_year, p_subjseq, p_isonoff, p_student) {
  if (p_student==0) {
	  alert("�������� �����ϴ�.");
	  return;
  }
  if (confirm("����ó���� �Ͻðڽ��ϱ�?")) {
    document.form1.target = "_self";

    if(p_isonoff == "ON"){
      document.form1.p_process.value = 'subjectComplete';
    }else{
      document.form1.p_process.value = 'offSubjectCompleteNew';
    }

    document.form1.p_subj.value = p_subj;
    document.form1.p_year.value = p_year;
    document.form1.p_subjseq.value = p_subjseq;
    document.form1.submit();
  }
}

// ����ó�� ��� ��û
function whenCancel(p_subj, p_year, p_subjseq, p_process, p_student) {
    if (p_student==0) {
	    alert("�������� �����ϴ�.");
	    return;
    }
    if (confirm("����ó���� ��� �Ͻðڽ��ϱ�?")) {
		document.form1.target = "_self";                 
  	    document.form1.p_process.value = p_process;                   

        document.form1.p_subj.value = p_subj;
        document.form1.p_year.value = p_year;
        document.form1.p_subjseq.value = p_subjseq;
        document.form1.submit();
     }
}


function whenScoreCompute(p_subj, p_year, p_subjseq) {
	if (confirm("����ó���� �Ͻðڽ��ϱ�?")) {
	  document.form1.target = "_self";
	  document.form1.p_process.value = 'scoreCompute';
	  document.form1.p_subj.value = p_subj;
	  document.form1.p_year.value = p_year;
	  document.form1.p_subjseq.value = p_subjseq;
	  //document.form1.submit();
    }
}

function whenCourseCompute(p_course, p_cyear, p_courseseq) {
  document.form1.target = "_self";
  document.form1.p_process.value   = 'courseScoreCompute';
  document.form1.p_course.value    = p_course;
  document.form1.p_cyear.value     = p_cyear;
  document.form1.p_courseseq.value = p_courseseq;
  document.form1.submit();
}

// ����ó�� ��ȭ������ �̵�
function selectSubj(subj, year, subjseq, isclosed, subjnm, isonoff, isapproval, subjseqgr) {
  document.form1.target = "_self";
  document.form1.p_process.value = "subjectSelect";
  document.form1.p_subj.value    = subj;
  document.form1.p_year.value    = year;
  document.form1.p_subjseq.value = subjseq;
  document.form1.p_isclosed.value = isclosed;
  document.form1.p_subjnm.value = subjnm;
  document.form1.p_isonoff.value = isonoff;
  document.form1.p_isapproval.value = isapproval;
  document.form1.p_subjseqgr.value = subjseqgr;
  document.form1.submit();
}

function whenApproval(subj,year,subjseq) {
   document.form1.target = "_self";
   document.form1.p_subj.value = subj;
   document.form1.p_year.value = year;
   document.form1.p_subjseq.value = subjseq;
   document.form1.p_process.value = "requestApprovalPage";

   window.self.name = "winChiefApproval";
   var url = "/servlet/controller.complete.FinishServlet";
   var new_Open = window.open(url,"proposeChief",'scrollbars=yes,width=550,height=200,scrollbars=no,resizable=no');

   document.form1.target = "proposeChief";
   document.form1.submit();
}

// sorting ��ȸ
function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

    document.form1.p_orderColumn.value = column;
    whenSelection("go");
}

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" action="/servlet/controller.complete.FinishServlet">
	<input type="hidden" name="p_process"    value="">
	<input type="hidden" name="p_action"   value="">

    <input type="hidden" name="p_subj"    value="">
    <input type="hidden" name="p_year"    value="">
    <input type="hidden" name="p_subjseq" value="">
    <input type="hidden" name="p_subjseqgr" value="">
    <input type="hidden" name="p_isapproval" value="">
    <input type="hidden" name="p_subjnm"    value="">
    <input type="hidden" name="p_isclosed" value="">
    <input type="hidden" name="p_isonoff" value="">
    <input type="hidden" name="p_returnurl" value="/servlet/controller.complete.FinishServlet">
    <input type="hidden" name="p_rprocess" value="listPage">

	<input type="hidden" name="p_orderColumn">
	<input type="hidden" name="p_orderType" value="<%=v_orderType%>">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title10.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
        <!-- �����׷�, �⵵ ���� -->
        <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <td>
                      
						<!------------------- ���ǰ˻� ���� ------------------------->
				  		 <table cellspacing="0" cellpadding="0" width="99%">
				  		 	<tr>
				  		 		<td>
				  		 			<table border="0" cellspacing="0" cellpadding="0" width="99%">
				  		 				<tr>
				  		 					<td width="25%"><font color="red">��</font> 
											<!-- �����׷� ���� -->
				  								<%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
											<!-- �����׷� ���� -->
				  							</td>
				  							<td width="75%">
											<!-- �����⵵, �з� ���� -->
				  								<%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
												<%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
				  								<!--input type="hidden" name="s_grseq"  value="0001"-->
				  								&nbsp;<%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
				  								&nbsp;<%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
				  								&nbsp;<%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
											<!-- �����⵵, �з� �� -->
				  							</td>
				  						</tr>
				  					</table>
								</td>
							</tr>
							<tr>
								<td height="3"></td>
							</tr>
							<tr>
								<td>
									<table border="0" cellspacing="0" cellpadding="0" width="99%">
										<tr>
											<td width="65%">&nbsp;&nbsp;&nbsp;-
											<!-- ����,����,ȸ�� ���� -->
				  								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
				  								&nbsp;<%= SelectSubjBean.getSubjseq(box, false, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    ��������  -->
											<!-- ����,����,ȸ�� ���� -->
				  							</td>
				  							<td  width="10%" align="right">	
				  				    			<%@ include file="/learn/admin/include/za_GoButton.jsp" %><!-- whenSelection('go') -->
				  				    		</td>
				  				 		</tr>
				  				 	</table>
				  				</td>
				  			</tr>
				  		</table>
				  		<!-------------------- ���ǰ˻� �� ---------------------------->
					  </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!-- �����׷�, �⵵ �� -->

      <br>
      <br>
      <!----------------- ����ó�� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="13" class="table_top_line"></td>
        </tr>
        <tr> 
          <td rowspan="2" width="5%" class="table_title">NO</td>
          <!--td rowspan="2" class="table_title" width="50"><a href="javascript:whenOrder('office')" class="e">ȸ���</a></td-->
          <td rowspan="2" class="table_title" width="40"><a href="javascript:whenOrder('isonoff')" class="e">����</a></td>
		  <td rowspan="2" class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">����</a></td>
          <td rowspan="2" class="table_title"><a href="javascript:whenOrder('subjseqgr')" class="e">����</a></td>
          <td rowspan="2" class="table_title" width="90"><a href="javascript:whenOrder('edustart')" class="e">�����Ⱓ</a></td>
          <td colspan="3" class="table_title">�ο�</a></td>
          <td rowspan="2" class="table_title"><a href="javascript:whenOrder('isclosed')" class="e">����ó��</a></td>
          <!--<td rowspan="2" class="table_title"><a href="javascript:whenOrder('approvalstatus')" class="e">�̷°���</a></td>-->
          <td rowspan="2" class="table_title"><a href="javascript:whenOrder('isoutsourcing')" class="e">��Ź����</a></td>
          <td rowspan="2" class="table_title"><a href="javascript:whenOrder('iscpresult')" class="e">���־�ü<br>������</a></td>
          <td rowspan="2" class="table_title"><a href="javascript:whenOrder('iscpflag')" class="e">���־�ü<br>�������</a></td>
        </tr>
        <tr> 
          <td class="table_title"><a href="javascript:whenOrder('studentcnt')" class="e">����</td>
          <td class="table_title"><a href="javascript:whenOrder('stoldycnt')" class="e">����</td>
          <td class="table_title"><a href="javascript:whenOrder('stoldncnt')" class="e">�̼���</td>
        </tr>
<%		if (v_action.equals("go")) { 
		
			if (list.size()==0) { %>
			<tr><td colspan=13 class="table_02_1">�˻��� ������ �����ϴ�.</td></tr>
<%			} else { 
			
			
			for (int i=0; i<list.size(); i++) {
            	DataBox dbox = (DataBox)list.get(i); 
            	
            	String v_subjnm   = dbox.getString("subjnm");
            	String v_isclosed = dbox.getString("isclosed");
            	String v_approval = dbox.getString("d_approvalstatus");
            	int    v_student  = dbox.getInt("d_studentcnt");
            	
            	String v_isonoff = dbox.getString("d_isonoff");
            	String v_subj    = dbox.getString("d_subj");
            	String v_year    = dbox.getString("d_year");
            	String v_subjseq = dbox.getString("d_subjseq");
            		
            	%>
        <tr> 
          <td class="table_01" ><%=(i+1)%></td>
          <!--td class="table_02_1" >&nbsp;</td-->          
          <td class="table_02_1"><%=dbox.getString("isonoffnm")%></td>
          <td class="table_02_2">
          <% if (v_student==0) { %>
          	<a href="javascript:alert('�������� �����ϴ�.');" class='b'><%=v_subjnm%></a>
          <% } else { %>
          	<a href="javascript:selectSubj('<%=dbox.getString("subj")%>','<%=dbox.getString("year")%>','<%=dbox.getString("subjseq")%>','<%=dbox.getString("isclosed")%>','<%=v_subjnm%>','<%=dbox.getString("isonoff")%>','<%=dbox.getString("approvalstatus")%>','<%=dbox.getString("subjseqgr")%>');" class='b'> <%=dbox.getString("subjnm")%></a>
          <% } %>
          </td>
          <td class="table_02_1"><%=StringManager.cutZero(dbox.getString("subjseqgr"))%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(dbox.getString("edustart"),"yyyy/MM/dd")%>~<br> <%=FormatDate.getFormatDate(dbox.getString("eduend"),"yyyy/MM/dd")%></td>
          <td class="table_02_1"><%=v_student%></td>		<!--����-->
          <td class="table_02_1"><%=dbox.getInt("d_stoldycnt")%></td>			<!--����-->
          <td class="table_02_1"><%=dbox.getInt("d_stoldncnt")%></td>			<!--�̼���-->
          <td class="table_02_1"><!-- ����ó�� -->
              <% if (v_isclosed.equals("Y")){ %><!--����-->
			  <% if(v_isonoff.equals("ON")){%>
                <a href="javascript:whenCancel('<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>','subjectCompleteCancel', <%=v_student%>);"><img src='/images/admin/button/btn_soorucancel.gif' border=0></a>&nbsp;
                <%}else{%>
                <a href="javascript:whenCancel('<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>','offSubjectCompleteCancel', <%=v_student%>);"><img src='/images/admin/button/btn_soorucancel.gif' border=0></a>&nbsp;
                <%}%>
              <% }else{ %><!--�̼���-->
                <%if(v_isonoff.equals("ON")){%>
                  <a href="javascript:whenComplete('<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>', '<%=v_isonoff%>', <%=v_student%>)"><img src='/images/admin/button/btn_sooruok.gif' border=0></a>&nbsp;
                <%}else{%>
                  <a href="javascript:whenComplete('<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>', '<%=v_isonoff%>', <%=v_student%>)"><img src='/images/admin/button/btn_sooruok.gif' border=0></a>&nbsp;
                <%}
                }%>
          </td> 
      		  <!--<td class="table_02_1"><%if (v_approval.equals("Y")) out.print("����Ϸ�"); else if (v_approval.equals("B")) out.print("�����"); else out.print("");%></td>--> <!-- ���� ���� -->
      		  <td class="table_02_1"><%=dbox.getString("isoutsourcing")%></td> <!-- ��Ź�������� -->
      		  <td class="table_02_1"><%=dbox.getString("iscpresult")%></td> <!-- ���־�ü������ -->
      		  <td class="table_02_1"><%=dbox.getString("iscpflag")%></td> <!-- ���־�ü������� -->
          </td>
        </tr>
<% 			}
		}
	} %>
      </table>
      <!----------------- ����ó�� �� ----------------->
      <br>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
