<%
//**********************************************************
//  1. ��      ��: COMPLETE RATE LIST
//  2. ���α׷���: za_StudyDataAdmin_L.jsp
//  3. ��      ��: za_CompleteRate_L.jsp
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 26
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    int v_pageno        = box.getInt("p_pageno");

    String  v_grseq     =  "";
    String  v_course    =  "";
    String  v_cyear     =  "";
    String  v_courseseq =  "";
    String  v_coursenm  =  "";
    String  v_subj      =  "";
    String  v_year      =  "";
    String  v_subjnm    =  "";
    String  v_subjseq   =  "";
    String  v_subjseqgr =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_isnewcourse= "";
    String  v_isonoff   =  "";
    String  v_isonoff_value="";

	String v_tmp_subj	= "";
	String v_iscourseYn	= "";

	int		v_subjcnt	= 0;
    int     v_educnt    =  0;
    int     v_gradcnt1  =  0;
    int     v_gradcnt2  =  0;
    int     v_gradcnt   =  0;
    int     v_gradrate  =  0;
    int     v_teducnt   =  0;
    int     v_tgradcnt  =  0;
    int     v_totalpage =  0;
    int     v_rowcount  =  0;
    int     v_rowspan   =  0;
    int     v_total     =  0;
    int     i           =  0;
    int     l           =  0;

    ArrayList list      = null;
    //DEFINED class&variable END

    //DEFINED in relation to select START
    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getStringDefault("s_grseq","ALL");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����

    String  ss_edustart  = box.getString("s_start");         //����������
    String  ss_eduend    = box.getString("s_end");           //����������
	String  p_subjnm	 = box.getString("p_subjnm");		 //������

    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";
	//DEFINED in relation to select END

    if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("CompleteRateList");
    }

    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function whenSelection(p_action) {
	    if (p_action=="go"){
            var st_date = make_date(form1.s_start.value);
            var ed_date = make_date(form1.s_end.value);

            if((st_date.length > 0 && ed_date.length > 0) && st_date > ed_date) {
                alert("������������ ���������Ϻ��� Ů�ϴ�.");
                return;
            }

    	   if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
        	 alert("�����׷��� �����ϼ���.");
         	return;
  	    	}

            document.form1.s_edustart.value = st_date;
            document.form1.s_eduend.value   = ed_date;
	        top.ftop.setPam();
	    }
        document.form1.s_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.complete.CompleteStatusAdminServlet';
        document.form1.p_process.value = 'CompleteRateList';
        document.form1.submit();
    }

function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

    document.form1.s_action.value = "go";

    document.form1.p_orderColumn.value = column;
    whenSelection("go");
}

    function whenExcel() {
        if(document.form1.s_action.value != "go"){
            alert('���� ��ȸ�� �ֽʽÿ�');
            return;
      }
        //window.self.name = "CompleteRateList";
        //open_window("openExcel","","100","100","800","600","yes","yes","yes","yes","yes");
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.complete.CompleteStatusAdminServlet';
        document.form1.p_process.value = 'CompleteRateExcel';
        document.form1.submit();
    }

    function chkSelected() {
      var selectedcnt = 0;
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            if (document.form1.p_checks[i].checked == true) {
    	      selectedcnt++;
    	    }
          }
        } else {
          if (document.form1.p_checks.checked == true) {
    	    selectedcnt++;
          }
        }
      }
      return selectedcnt;
    }
    function whenAllSelect() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = true;
          }
        } else {
          document.form1.p_checks.checked = true;
        }
      }
    }

    function whenAllSelectCancel() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = false;
          }
        } else {
          document.form1.p_checks.checked = false;
        }
      }
    }

    function go(index) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = index;
         document.form1.action = '/servlet/controller.complete.CompleteStatusAdminServlet';
         document.form1.p_process.value = "CompleteRateList";
         document.form1.submit();
    }
    function goPage(pageNum) {
        document.form1.target = "_self";
         document.form1.p_pageno.value = pageNum;
         document.form1.action = '/servlet/controller.complete.CompleteStatusAdminServlet';
         document.form1.p_process.value = "CompleteRateList";
         document.form1.submit();
    }
-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false'
ondragstart='return false' onselectstart='return false'
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
<form name = "form1" method = "post">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_pageno" value="<%=v_pageno%>">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->
    <input type="hidden" name="s_edustart">
    <input type="hidden" name="s_eduend">

    <input type="hidden" name="p_orderColumn">
	<input type="hidden" name="p_orderType" value="<%=v_orderType%>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/course/co_title12.gif" ></td>
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
											<!--td width="25%"><%//@ include file="/incmenu/search_subjnm.jsp"%></td-->
											<td width="65%">&nbsp;&nbsp;&nbsp;
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
        <input type = "hidden" name="s_start">
    	<input type = "hidden" name="s_end">

      <br>
      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right" height="20">&nbsp;</td>
            <td align="right">
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a>
            </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ��������, ���Ϲ߼�, �������, ��μ���, ��μ������  ��ư �� ----------------->
      <!----------------- ��������ȸ ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out">
          <tr>
            <td colspan="10" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="4%">NO</td>
            <td width="38%" class="table_title" colspan="2"><a href="javascript:whenOrder('subjnm')" class="e">����</a></td>
            <td width="8%" class="table_title"><a href="javascript:whenOrder('subjseqgr')" class="e">����</a></td>
            <td class="table_title" width="8%"><a href="javascript:whenOrder('isonoff')" class="e">����</a></td>
            <td width="17%" class="table_title"><a href="javascript:whenOrder('edustart')" class="e">�����Ⱓ</a></td>
            <td width="7%" class="table_title"><a href="javascript:whenOrder('educnt')" class="e">����</a></td>
            <td width="8%" class="table_title"><a href="javascript:whenOrder('tgradcnt')" class="e">����</a></td>
            <td width="10%" class="table_title">������(%)</td>
          </tr>
          <%
            if (ss_action.equals("go")) {    //go button ���ýø� list ���
                v_total = list.size();
                for(i = 0; i < v_total; i++) {
                    DataBox dbox = (DataBox)list.get(i);

                    v_grseq         = dbox.getString("d_grseq");
                    v_course        = dbox.getString("d_course");
                    v_cyear         = dbox.getString("d_cyear");
                    v_courseseq     = dbox.getString("d_courseseq");
                    v_coursenm      = dbox.getString("d_coursenm");
                    v_subj          = dbox.getString("d_subj");
                    v_year          = dbox.getString("d_year");
                    v_subjnm        = dbox.getString("d_subjnm");
                    v_subjseq       = dbox.getString("d_subjseq");
                    v_subjseqgr     = dbox.getString("d_subjseqgr");
                    v_edustart      = dbox.getString("d_edustart");
                    v_eduend        = dbox.getString("d_eduend");
                    v_isnewcourse   = dbox.getString("d_isnewcourse");
                    v_educnt        = dbox.getInt("d_educnt");
                    v_gradcnt1      = dbox.getInt("d_gradcnt1");
                    v_gradcnt2      = dbox.getInt("d_gradcnt2");
                    v_iscourseYn    = dbox.getString("d_isbelongcourse");
                    v_subjcnt       = dbox.getInt("d_subjcnt");

                    v_totalpage     = dbox.getInt("d_totalpage");
                    v_isonoff       = dbox.getString("d_isonoff");

                    if(v_isonoff.equals("ON")){     v_isonoff_value="���̹�";   }
                    else                      {     v_isonoff_value="����";     }
                    v_edustart      = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
                    v_eduend        = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");
                    v_gradcnt       = v_gradcnt1 + v_gradcnt2;

                    if(v_educnt > 0) {
                    	v_gradrate      = (int)(((float)v_gradcnt/v_educnt) * 100);
                    } else {
                    	v_gradrate = 0;
                    }

                    v_teducnt      += v_educnt;
                    v_tgradcnt     += v_gradcnt;
               %>
          <tr>
            <td class="table_01"><%= i + 1 %></td>
            <!--td class="table_02_1"><%= v_grseq %>����</td-->
<% if(v_iscourseYn.equals("Y"))
	{
		if(l == v_subjcnt) v_tmp_subj = "";

		if(!v_tmp_subj.equals(v_course) && !v_tmp_subj.equals("000000"))
		{
			l = 1;
			%>
			<td class="table_02_2" rowspan="<%=v_subjcnt%>"><%=v_coursenm %></td>            <!-- ������ ��� -->
            <td class="table_02_2"> <%=v_subjnm%></td>
<%
			v_tmp_subj = v_course;
		}else{
			l++;
		%>

            <td class="table_02_2"> <%=v_subjnm%></td>
<%		}
	} else { %>

            <td class="table_02_2" colspan="2"> <%=v_subjnm%></td>
<% } %>
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <td class="table_02_1"><%=v_isonoff_value%></td>
            <td class="table_02_1"><%= v_edustart %> ~ <%= v_eduend %></td>
            <td class="table_02_1"><%=v_educnt%></td>
            <td class="table_02_1"><%= v_gradcnt1 + v_gradcnt2 %></td>
            <td class="table_02_1"><%=v_gradrate%>%</td>
          </tr>
          <%
               }
            }
         if(i == 0 && ss_action.equals("go")){ %>
          <tr>
            <td class="table_02_1" colspan="9">��ϵ� ������ �����ϴ�</td>
          </tr>
        </table>
       <% }else if(i > 0){
                if(v_teducnt > 0)  {
                	v_gradrate  =   (int)((float)v_tgradcnt/v_teducnt * 100);
                } else {
                	v_gradrate = 0;
                }
        %>
              <!--tr>
                <td class="table_02_1" colspan="3"><b>�հ�</b></td>
                <td class="table_02_1">&nbsp;</td>
                <td class="table_02_1">&nbsp;</td>
                <td class="table_02_1"><b><%=v_teducnt%></td>
                <td class="table_02_1"><b><%=v_tgradcnt%></td>
                <td class="table_02_1"><b><%=v_gradrate%>%</td>
              </tr-->
        </table>
        <% } else{ %>   </table> <% } %>

       <%  if(i > 0){ %>
        <table class="table1" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
          </tr>
        </table>
        <% } %>
      <!----------------- ������ ��ȸ �� ----------------->
     <br>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
