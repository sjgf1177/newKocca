<%
//**********************************************************
//  1. ��      ��: ������������������
//  2. ���α׷���: za_SubjGongAll_L.jsp
//  3. ��      ��: ��������������������ü ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 23
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");

    String  v_grcode    = "";
    String  v_grcodenm  = "";
    String  v_gyear     = "";
    String  v_grseq     = "";
    String  v_course    = "";
    String  v_cyear     = "";
    String  v_courseseq = "";
    String  v_coursenm  = "";
    String  v_subj      = "";
    String  v_year      = "";
    String  v_subjseq   = "";
    String  v_subjseqgr = "";
    String  v_subjnm    = "";
    String  v_isonoff   = "";
    String  v_edustart  = "";
    String  v_eduend    = "";
    String  v_isgoyong  = "";


    String  v_subjtypenm  = "";
    String  v_isnewcourse = "";
    int     v_rowspan     =  0;
    int     i = 0;


    //DEFINED in relation to select START
    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getString("s_grseq");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����
    String  ss_isclosed     = box.getString("s_isclosed");        //���࿩��

//    String  v_ongo      = "whenSelection('selectAll')";
    //DEFINED in relation to select END

    int    v_codecnt   = StringManager.toInt(box.getString("p_typescnt"));       // �������а���
    
    String  ss_action    = box.getString("s_action");
    
    ArrayList list1      = null;
    ArrayList list2      = null;
    //if (ss_action.equals("go")) {    //go button ���ýø� list ���
        list1    = (ArrayList)request.getAttribute("selectList1");         // �������и���Ʈ
        list2    = (ArrayList)request.getAttribute("selectList2");         // ���������� ����Ʈ
    //}
    
    System.out.println("ss_action = " + ss_action);


    String   v_codenm       = "";  // �������и�
    String   v_typescnt_org = "";  
    String[] v_typescnt     = new String[v_codecnt];
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function whenSelection(p_action) {
    
    

      document.form1.p_process.value = 'selectPre';

if (p_action=='go') {
      if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
        alert("�����׷��� �����ϼ���.");
        return ;
      }
      top.ftop.setPam();
      document.form1.p_process.value = 'selectAll';
}
      //if (p_action=='go') {}

      document.form1.action = "/servlet/controller.course.SubjGongAdminServlet";
      document.form1.submit();
    }

    // ���ð������
    function insert() {
        if(document.form1.all['p_checks'] == '[object]') {
            var v_chkcnt = 0;
            
            if (document.form1.p_checks.checked) {
                v_chkcnt=1;
            }
            
            if (document.form1.p_checks.length > 0) {
              for (i=0; i<document.form1.p_checks.length; i++) {
                if (document.form1.p_checks[i].checked == true)
                    v_chkcnt+=1;
              }
            }  
              if (v_chkcnt==0) {
                alert('������ ������ �����ϴ�.');
                return;           
              }
            
        } else {
            alert('������ ������ �����ϴ�.');
            return;
        }
            
        //if (document.form1.p_process.value == '') {
        //  alert("������ ����� ������ �˻����ּ���");
        //  return;
        //}
        
        document.form1.action = "/servlet/controller.course.SubjGongAdminServlet";
        document.form1.p_process.value = "insertPageAll";
        document.form1.submit();
    }

    // ���������� �������׸���Ʈ
    function listSub(subj,year,subjseq,subjnm) {
        document.form1.action = "/servlet/controller.course.SubjGongAdminServlet";
        document.form1.p_process.value = "select";

        document.form1.p_subj.value    = subj;
        //document.form1.s_subjcourse.value    = subj;
        document.form1.p_year.value    = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_hsubjnm.value = subjnm;

        document.form1.submit();
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

function whenOrder(column) {
    if (document.form1.p_orderType.value == " asc") {
        document.form1.p_orderType.value = " desc";
    } else {
        document.form1.p_orderType.value = " asc";
    }

    document.form1.p_orderColumn.value = column;
    
    whenSelection("go");

}

-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
    <form name="form1" method="post" action="">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_subj"    value="">
    <input type="hidden" name="p_year"    value="">
    <input type="hidden" name="p_subjseq" value="">
    <input type="hidden" name="p_hsubjnm" value="">
    
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->   
    
    <input type="hidden" name="p_orderColumn">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>
        <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">

            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">

                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td width="27%" colspan="2" align="left" valign="middle">
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
                                            <td width="65%">&nbsp;&nbsp;&nbsp;
                                            <!-- ����,����,ȸ�� ���� -->
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
                                                &nbsp;<%= SelectSubjBean.getSubjseq(box, false, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    ��������  -->
                                                <%//= SelectCompanyBean.getCompany(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    ȸ��  -->
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
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->
          <br>

        <!----------------- ������ü����  ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="right" ><a href="javascript:insert()"><img src="/images/admin/button/btn_selectgongi.gif" border="0"></a></td>
          </tr>
          <tr> 
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- ������ü���� ��ư �� ----------------->

        <!----------------- �������װ��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="13" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="5%" height="50" rowspan="2" class="table_title"><b>NO</b></td>
            <td width="26%" rowspan="2" class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">����</a></td>
            <td width="5%" rowspan="2" class="table_title"><a href="javascript:whenOrder('subjseqgr')" class="e">����</a></td>
            <td width="6%" rowspan="2" class="table_title"><a href="javascript:whenOrder('isonoff')" class="e">����</a></td>
            <td width="17%" rowspan="2" class="table_title"><a href="javascript:whenOrder('edustart')" class="e">�����Ⱓ</a></td>
            <td height="22" colspan="8" class="table_title"><b>��������</b></td>
            <td width="4%" rowspan="2" class="table_title"><%@ include file="/learn/admin/include/za_checkboxall.jsp" %></td>
          </tr>
          <tr>         
            <td width="4%" class="table_title">�԰�</td>
            <td width="4%" class="table_title">�ȳ�</td>
            <td width="5%" class="table_title">����Ʈ</td>
            <td width="4%" class="table_title">����</td>
            <td width="6%" class="table_title">��������</td>
            <td width="6%" class="table_title">��������</td>
            <td width="4%" class="table_title">��dŸ</td>
            <td width="4%" class="table_title">��ü</td>              
            <%
      // ���� ����Ʈ
//if (ss_action.equals("go")) {    //go button ���ýø� list ���
       for(i = 0; i < list1.size(); i++) {

                CodeData data1  = (CodeData)list1.get(i);
                v_codenm    = data1.getCodenm();
%>
            <!--td class="table_title" height="25"><b><%//=v_codenm%></b></td-->
            <%
        }
%>
          </tr>
          <%
            for(i = 0; i < list2.size(); i++) {
                SubjGongData data2= (SubjGongData)list2.get(i);

                v_grcode    = data2.getGrcode();
                v_grcodenm  = data2.getGrcodenm();
                v_gyear     = data2.getGyear();
                v_grseq     = data2.getGrseq();
                v_course    = data2.getCourse();
                v_cyear     = data2.getCyear();
                v_courseseq = data2.getCourseseq();
                v_coursenm  = data2.getCoursenm();
                v_subj      = data2.getSubj();
                v_year      = data2.getYear();
                v_subjseq   = data2.getSubjseq();
                v_subjseqgr = data2.getSubjseqgr();
                v_subjnm    = data2.getSubjnm();
                v_isonoff   = data2.getIsonoff();
                v_edustart  = data2.getEdustart();
                v_eduend    = data2.getEduend();



                v_subjtypenm  = data2.getSubjtypenm();
                v_rowspan     = data2.getRowspan();
                v_isnewcourse = data2.getIsnewcourse();

%>
          <tr> 
            <td class="table_01"><%= i+1 %></td>
            <%  if(v_course.equals("000000")){   %>
            <!-- ������ ��� -->
            <td class="table_02_2"><a href="javascript:listSub('<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%=v_subjnm%>')"  class="b"><%=v_subjnm%></a></td>
            <% }else if(v_isnewcourse.equals("Y")){ %>
            <!-- �ڽ��̸鼭 ���� �ڽ��� ��ġ���� �ʴ°�� -->
            <!--td class="table_02_1" rowspan="<%//=v_rowspan%>"> 
              <font class="text_color03">[�ڽ�] <%//=v_coursenm%><%//=v_courseseq%></font> </td-->
            <% } %>
            <%  if(!v_course.equals("000000")){   %>
            <!-- �ڽ��� ��� -->
            <!--td class="table_02_1"><font class="text_color04"><%//=v_subjnm%></font></td-->
            <% } %>
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <td class="table_02_1"><%=v_subjtypenm%></td>
            <td class="table_02_1"><%= FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd") %> ~ <%= FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd") %></td>
            
            <%
           // ���� ����Ʈ
           if(v_codecnt > 0) {
                v_typescnt_org  = data2.getTypescnt();

               StringTokenizer st = new StringTokenizer(v_typescnt_org,"/");
               int j = 0;

               // ������������ ���� ������ ���к� ���� ���� �迭�� ����
               while (st.hasMoreElements()) {
                   v_typescnt[j] = StringManager.chkNull((String)st.nextToken());
                   j++;

               }

               // ��ġ ������ ���� ���а� (�Ǿռ��� ���ڸ�) ����
               for (j = 0;j<v_codecnt;j++){
                  v_typescnt[j] = StringManager.rightstring(v_typescnt[j], v_typescnt[j].length()-1);
               }

               // �ش� ���� üũ�ڽ��� ����
               for (int k=0; k < v_codecnt ; k++) {
                   v_typescnt[k] = StringManager.chkNull(v_typescnt[k]);
                   if (v_typescnt[k].equals("")) v_typescnt[k] = "0";

%>
            <td class="table_02_1"><%=v_typescnt[k]%></td>
            <%
                }
            }
%>          <td class="table_02_1">
                <input name="p_checks" type="checkbox" value="<%=v_subj + "/" + v_gyear + "/" + v_subjseq%>"></td>
          </tr>
          <%
        }
//}//go

//if (ss_action.equals("go")) {    //go button ���ýø� list ���
          if(v_process.equals("selectAll") && i == 0){ %>
          <tr> 
            <td class="table_02_1" colspan="<%= (v_codecnt + 9) %>">��ϵ� ������ �����ϴ�</td>
          </tr>
          <%  } 
//} //go%>
        </table>
        <!----------------- �������װ��� �� ----------------->
        <br>
     </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
