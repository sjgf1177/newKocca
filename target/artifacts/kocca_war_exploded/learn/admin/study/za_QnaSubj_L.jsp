<%
//**********************************************************
//  1. ��      ��: QNA DATA
//  2. ���α׷���: za_QnaSubj_L.jsp
//  3. ��      ��: ���� admin bean
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 6. 24
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_subj      = "";
    String  v_year      = "";
    String  v_subjseq   = "";
    String  v_subjseqgr = "";
    String  v_isclosed  = "";
    String  v_subjnm    = "";
    String  v_isnewcourse="";
    String  v_course    = "";
    String  v_cyear     = "";
    String  v_courseseq = "";
    String  v_coursenm  = "";
    String  v_isonoff   = "";
	String  v_closed_value = "";
    int  v_qcnt     = 0;
    int  v_nanscnt  =0;
    String  v_onoff_value= "";
    int     v_rowspan    = 0;
    int     i            = 0;
    ArrayList list1      = null;
    //DEFINED class&variable END

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
System.out.println("ss_grcode1" + ss_grcode);
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getStringDefault("s_grseq","");         //��������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";
    //DEFINED in relation to select END

    if(ss_action.equals("go")){    //go button ���ýø� list ���
        list1 = (ArrayList)request.getAttribute("qnaSubjList");
    }
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function whenSelection(ss_action) {
      if (ss_action=="go")  {
        if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
            alert("�����׷��� �����ϼ���.");
            return ;
        }
        top.ftop.setPam();
      }
      document.form1.s_action.value = ss_action;
      document.form1.target = "_self";
      document.form1.action='/servlet/controller.study.QnaAdminServlet';
      document.form1.p_process.value = 'QnaSubjList';
      document.form1.submit();
    }

    function qnaSubjseqlist_select(subj,year,subjseq) {
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.study.QnaAdminServlet';
        document.form1.p_process.value = 'QnaSubjseqList';
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
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

-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
<input type="hidden" name="p_process" value="<%=v_process%>">
<input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->
<input type="hidden" name="p_subj">
<input type="hidden" name="p_year">
<input type="hidden" name="p_subjseq">
<input type="hidden" name="p_orderColumn">
<input type="hidden" name="p_orderType" value="<%=v_orderType%>">
  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title05.gif" ></td>
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
                                            <td width="25%">
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
                                            <td width="65%">
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

        <!----------------- Activity ������� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="0">
          <tr> 
            <td colspan="6" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="5%" class="table_title">NO</td>
            <td class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">����</a></td>
            <td class="table_title"><a href="javascript:whenOrder('subjseqgr')" class="e">����</a></td>
            <td class="table_title"><a href="javascript:whenOrder('qcnt')" class="e">������</a></td>
            <td class="table_title"><a href="javascript:whenOrder('nanscnt')" class="e">�����䰹��</a></td>
            <td class="table_title"><a href="javascript:whenOrder('isclosed')" class="e">��������</a></td>
          </tr>
          <%
            if(ss_action.equals("go")){    //go button ���ýø� list ���
                for(i = 0; i < list1.size(); i++) {
                    QnaData data= (QnaData)list1.get(i);
                    v_subj      = data.getSubj();
                    v_course    = data.getCourse();
                    v_cyear     = data.getCyear();
                    v_courseseq = data.getCourseseq();
                    v_coursenm  = data.getCoursenm();
                    v_year      = data.getYear();
                    v_subjseq   = data.getSubjseq();
                    v_subjseqgr   = data.getSubjseqgr();
                    v_subjnm    = data.getSubjnm();
                    v_qcnt      = data.getQcnt();
                    v_isclosed  = data.getIsclosed();    // ��������
                    if(v_isclosed.equals("Y"))      {  v_closed_value = "�Ϸ�";   }
                    else                            {  v_closed_value = "������"; }
                    v_nanscnt   =   data.getNoanscnt();
                    v_rowspan   = data.getRowspan();
                    v_isnewcourse=data.getIsnewcourse();

               %>
          <tr> 
            <td class="table_01"><%= i+1 %></td>
            <%  if(v_course.equals("000000")){   %>
            <!-- ������ ��� -->
            <td class="table_02_2" ><a href="javascript:qnaSubjseqlist_select('<%=v_subj%>','<%=v_year%>','<%=v_subjseq%>')"><%=v_subjnm%></a></td>
            <% }else if(v_isnewcourse.equals("Y")){ %>
            <!-- �ڽ��̸鼭 ���� �ڽ��� ��ġ���� �ʴ°�� -->
            <!--td class="table_02_1" rowspan="<%=v_rowspan%>">
                     <font class="text_color03">[�ڽ�] <%=v_coursenm%><%=v_courseseq%></font>
                     </td-->
            <% } %>
            <%  if(!v_course.equals("000000")){   %>
            <!-- �ڽ��� ��� -->
            <!--td class="table_02_1"><font class="text_color04"><%=v_subjnm%></font></td-->
            <% } %>
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <td class="table_02_1"><%=v_qcnt%></td>
            <td class="table_02_1"><%=v_nanscnt%></td>
            <td class="table_02_1"><%=v_closed_value%></td>
          </tr>
          <%
              }
          }
          if(ss_action.equals("go") && i == 0){ %>
          <tr> 
            <td class="table_02_1" height="50" colspan="6">��ϵ� ������ �����ϴ�</td>
          </tr>
          <%  } %>
        </table>     
        </td>
          </tr>
        <!----------------- Activity ������� �� ----------------->
        <br>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr> 
</table>
</form>
</body>
</html>
