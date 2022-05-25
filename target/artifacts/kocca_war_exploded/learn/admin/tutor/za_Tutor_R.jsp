<%
//**********************************************************
//  1. ��      ��: TUTOR SELECT
//  2. ���α׷���: za_Tutor_R.jsp
//  3. ��      ��: ���� ��ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    String  v_process       = box.getString("p_process");
    String  v_search         = box.getString("p_search");        //�����о߰˻�
    String  v_select         = box.getString("p_select");        //�˻��׸�(������1,�����2)
    String  v_selectvalue    = box.getString("p_selectvalue");   //�˻���
    
    String  v_frompage      = box.getString("p_frompage");  //������Ȳ���� �Ѿ���� "TutorStatus"
    
    String  v_tutorgubun   = box.getStringDefault("s_tutorgubun","ALL");        //���籸��(I:�系����,O:��ܰ���,C:�׷찭��)
    String  v_srchsubjnm = box.getStringDefault("p_srchsubjnm","");     //������
    
    String  s_subjclass   = box.getString("p_subjclass");    //���Ǻо�
    String  v_tutorname   = box.getStringDefault("p_tutorname","");    //�����
    
    
    String v_userid         = "";
    String v_resno          = "";
    String v_pwd            = "";
    String v_name           = "";
    String v_sex            = "";
    String v_post1          = "";
    String v_post2          = "";
    String v_add1           = "";
    String v_add2           = "";
    String v_phone          = "";
    String v_handphone      = "";
    String v_fax            = "";
    String v_email          = "";
    String v_comp           = "";
    String v_dept           = "";
    String v_jik            = "";
    String v_academic       = "";
    String v_intro          = "";
    String v_major          = "";
    String v_isadd          = "";
    String v_iscyber        = "";
    String v_isgubun        = "";
    String v_isgubuntype    = "";
    String v_isstatus       = "";
    String v_istutor        = "";    
    String v_license        = "";
    String v_career         = "";
    String v_book           = "";
    String v_grcode         = "";
    String v_charge         = "";
    String v_isinfo         = "";
    String v_professional   = "";
    String v_etc            = "";
    String v_subjnm         = "";
   // String v_photo          = "";
    String v_userid_value   = "";
    String v_sex_value      = "";
    String v_isgubun_value  = "";
    String v_isgubuntype_value="";
    String v_fmon           = "";
    String v_tmon           = "";
    String v_manager_value  = "";
    String v_iscyber_value  = "";
    String v_subjclass     = "";
    String v_ismanager      = "";
    String v_loginid  = "";
    String v_loginpw  = "";
    String v_subjclassnm  = "";
    
    String v_subj     = "";
    
    int v_managerchk        = 0;
    int v_careeryear        = 0;        
    int i                   = 0;
    //DEFINED class&variable END

    //TutorData data          = (TutorData)request.getAttribute("tutorSelect");
    DataBox dbox = (DataBox)request.getAttribute("tutorSelect");
    ArrayList list2 = (ArrayList)request.getAttribute("tutorSubjHistoryList");
    
   
    v_userid                = dbox.getString("d_userid");
    v_resno                 = dbox.getString("d_resno");    
    v_pwd                   = dbox.getString("d_pwd");    
    v_name                  = dbox.getString("d_name");
    v_sex                   = dbox.getString("d_sex");
    v_subjclassnm           = dbox.getString("d_subjclassnm");
    v_post1                 = dbox.getString("d_post1");
    v_post2                 = dbox.getString("d_post2");
    v_add1                  = dbox.getString("d_add1");
    v_add2                  = dbox.getString("d_add2");
    v_phone                 = dbox.getString("d_phone");
    v_handphone             = dbox.getString("d_handphone");
    v_fax                   = dbox.getString("d_fax");
    v_email                 = dbox.getString("d_email");
    v_comp                  = dbox.getString("d_comp");
    v_dept                  = dbox.getString("d_dept");
    v_jik                   = dbox.getString("d_jik");
    v_academic              = dbox.getString("d_academic");
    v_major                 = dbox.getString("d_major");
    v_isadd                 = dbox.getString("d_isadd");
    v_iscyber               = dbox.getString("d_iscyber");
    v_isgubun               = dbox.getString("d_isgubun");
    v_isgubuntype           = dbox.getString("d_isgubuntype");
    v_isstatus              = dbox.getString("d_isstatus");
    v_istutor               = dbox.getString("d_istutor");
    v_careeryear            = dbox.getInt   ("d_careeryear");
    v_license               = dbox.getString("d_license");
    v_career                = dbox.getString("d_career");
    v_book                  = dbox.getString("d_book");
    v_grcode                = dbox.getString("d_grcodenm");
    v_professional          = dbox.getString("d_professional");
    v_charge                = dbox.getString("d_charge");
    v_isinfo                = dbox.getString("d_isinfo");
    v_etc                   = dbox.getString("d_etc");
   // v_photo                 = dbox.getString("d_photo");
    v_fmon                  = dbox.getString("d_fmon");        
    v_tmon                  = dbox.getString("d_tmon");   
    v_intro                 = dbox.getString("d_intro");   
    v_subjclass            = dbox.getString("d_subjclass"); 
    v_ismanager             = dbox.getString("d_ismanager");
   
    v_managerchk            = dbox.getInt("d_managerchk");
    
    if(v_ismanager.equals("Y")){      
        v_manager_value = "Y";   
        if(v_fmon.length() > 0) v_fmon  = FormatDate.getFormatDate(v_fmon,"yyyy/MM/dd");          
        if(v_tmon.length() > 0) v_tmon  = FormatDate.getFormatDate(v_tmon,"yyyy/MM/dd");          
    }else{                      
        v_manager_value = "N";   
        v_fmon = "";
        v_tmon = "";
    }

    Vector v_photoVector = null; 
    Vector v_newphotoVector = null;          //      ������ ������ִ� ���ϸ� �迭

    v_photoVector = (Vector)dbox.getObject("d_photo");
    v_newphotoVector = (Vector)dbox.getObject("d_newphoto");
        
    ArrayList list = (ArrayList)request.getAttribute("tutorSubjList");   
    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript" type="text/JavaScript">
    <!--
        // ����
        function r_update() {          
            document.form1.target = "_self";
            document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
            document.form1.p_process.value = "SaneTutorUpdatePage";
            document.form1.submit();
        }

        //����
        function r_delete() {            
            ok_del = confirm("�����Ͻðڽ��ϱ�?");
            if(ok_del){
                document.form1.target = "_self";
                document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
                document.form1.p_process.value = "TutorDelete";
                document.form1.submit();    
            }
        }

        // ���
        function cancel() {
            document.form1.target = "_self";
            document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
            document.form1.p_process.value = "TutorList";      
            document.form1.submit();    
        }
        
        // ����Ʈ ������
        function goListPage() {
            document.form1.target = "_self";
            document.form1.action = "/servlet/controller.budget.BudgetAdminServlet"
            document.form1.p_process.value  = 'TutorStatusList';
            document.form1.submit();
        }

        // �������
        function whenExcel() {

            window.self.name = "TutorStatusSelectExcel";
            open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
            document.form1.target = "openExcel";
            document.form1.action='/servlet/controller.tutor.TutorAdminServlet';
            document.form1.p_process.value = 'TutorSelectExcel';
            document.form1.submit();
        }
    -->         
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
<input type="hidden" name="p_process">
<input type="hidden" name="p_userid"    value="<%=v_userid%>">
<input type="hidden" name="p_search"    value="<%=v_search%>">
<input type="hidden" name="p_select"    value="<%=v_select%>">
<input type="hidden" name="p_selectvalue" value="<%=v_selectvalue%>">

<input type="hidden" name="s_tutorgubun" value="<%=v_tutorgubun%>">
<input type="hidden" name="p_srchsubjnm" value="<%=v_srchsubjnm%>">
<input type="hidden" name="p_subjclass" value="<%=s_subjclass%>">
<input type="hidden" name="p_tutorname" value="<%=v_tutorname%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
    
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/tutor/tit_new_01.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
     
     <!----------------- ������ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td class="table_top_line" width="200"></td><td class="table_top_line" width="200"></td><td class="table_top_line" width="200"></td>
            <td class="table_top_line" width="150"></td><td class="table_top_line" width="250"></td><td class="table_top_line" width="100"></td>
          </tr>

          <tr> 
            <td class="table_title" width="10%"><b>���籸��</b></td>
            <td colspan="4" class="table_02_2"> 
                <% if(v_isgubun.equals("1")){ %> ���� <%} %>
                <% if(v_isgubun.equals("2")){ %> ���� <%} %>

            </td>
            <td rowspan="3" colspan="1" align="center" bgcolor="white" valign="center">
                <%
                    if( v_photoVector != null ) { 

                        for(i = 0; i < v_photoVector.size(); i++) {      //     ÷������ ������ ����
                            String v_photo = (String)v_photoVector.elementAt(i);
                            String v_newphoto = (String)v_newphotoVector.elementAt(i);  

                            if(v_newphoto != null && !v_newphoto.equals("")) { %>
                                <img src ="<%=v_newphoto%>"  width="85" height="113">
                          <%}else{%>
                                <img src="/images/user/kocca/course/photo_blank.gif">
                         <%}%>  
                    <%  }   %>
                <%          } %>
            </td>
          </tr>
          <tr> 
            <td class="table_title" ><b>�������</b></td>
            <td colspan="4" class="table_02_2"><%=v_ismanager%></td>
          </tr>
          <tr> 
            <td class="table_title" ><b>�����(ID)</b></td>
            <td colspan="4" class="table_02_2"><%=v_name%>(<%=v_userid%>)</td>
          </tr>


          <tr> 
            <td class="table_title"><b>�ֹε�Ϲ�ȣ</b></td>
            <td colspan="2" class="table_02_2"> <%=v_resno.length()<6?"":v_resno.substring(0,6)+" - *******"%></td>
            <td class="table_title"><b>E-mail</b></td>
            <td colspan="2" class="table_02_2"><%=v_email%></td>
          </tr>
          <tr> 
            <td class="table_title" width="15%"><b>�ּ�</b></td>
            <td class="table_02_2" colspan="5">
            <% if (!v_post1.equals("")) { %>
            (<%=v_post1%>-<%=v_post2%>)
            <% } %>
            
            <% if (!v_add1.equals("")) { %>
                <%=v_add1+" "+v_add2%>
            <% } %>
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>��ȭ��ȣ</b></td>
            <td colspan="2" class="table_02_2"><%=v_phone%></td>
            <td class="table_title"><b>�޴���</b></td>
            <td colspan="2" class="table_02_2"><%=v_handphone%></td>
          </tr>
          <tr> 
            <td class="table_title"><b>����Ҽ�</b></td>
            <td colspan="5" class="table_02_2" ><%=v_comp%></td>
          </tr>
          <tr> 
            <td class="table_title" width="15%"><b>���� �Ұ���</b></td>
            <td colspan="5" class="table_02_2"> <%=StringManager.replace(v_intro,"\r","<br>")%> 
            </td>
          </tr>          
          <tr> 
            <td class="table_title" width="15%"><b>�з»���</b></td>
            <td colspan="5" class="table_02_2"> <%=StringManager.replace(v_academic,"\r","<br>")%> 
            </td>
          </tr>          
          <tr> 
            <td class="table_title" width="15%"><b>��»���</b></td>
            <td colspan="5" class="table_02_2"> <%=StringManager.replace(v_career,"\r","<br>")%> 
            </td>
          </tr>
          <tr> 
            <td class="table_title" width="15%"><b>����</b></td>
            <td colspan="5" class="table_02_2"><%=StringManager.replace(v_book,"\r","<br>")%> 
            </td>
          </tr>
        </table>
        <!----------------- ������ �� ----------------->
        <br>
        <!----------------- ����, ����, ��� ��ư ����----------------->
        <% if (v_frompage.equals("TutorStatus")) { //������Ȳ���� �Ѿ�°��%>
       <table  border="0" cellspacing="0" cellpadding="0">
          <tr> 
          <td><a href="javascript:goListPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
          <td width=8></td>
            <td>
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a>
            </td>
          </tr>
        </table>
        <% } else { %>
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td>
            <a href="javascript:r_update()"><img src="/images/admin/button/btn_modify.gif"  border="0"></a>
            </td>
            <td width=8></td>
            
            <%//������ �Ѱ������ڸ� %>
            <% if (StringManager.substring(box.getSession("gadmin"),0,1).equals("A") || StringManager.substring(box.getSession("gadmin"),0,1).equals("B")) { %>
            <td>
            <a href="javascript:r_delete()"><img src="/images/admin/button/btn_del.gif"  border="0"></a>
            </td>
            <td width=8></td>
            <% } %>
            
            <td>
            <a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif"  border="0"></a>
            </td>
            <td width=8></td>
          </tr>
        </table>
        <% } %>
        <!----------------- ����, ����, ��� ��ư ��----------------->
        
        <br>
        <br>
        <!-------------������ ����-------------------------->
        <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
            <td class=sub_title>�����̷�����</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->
        
        
        <!--- ���� �̷º��� ���� -->
        <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td width="5%" class="table_title">��ȣ</td>
            <td class="table_title">������</td>
            <td width="15%" class="table_title">�н��Ⱓ</td>
            <td width="7%" class="table_title">�԰��ο�</td>
            <td width="7%" class="table_title">�����ο�</td>
<!--            <td width="10%" class="table_title">�����</td> -->
            <td width="7%" class="table_title">������</td>
            <td width="7%" class="table_title">��������</td>
          </tr>
          <% 
            for(i = 0; i < list2.size(); i++) {
                DataBox dbox2 = (DataBox)list2.get(i); %>
          <tr> 
            <td class="table_02_1"><%=i+1%></td>
            <td class="table_02_2"><%=dbox2.getString("d_subjnm")%></td>
            <td class="table_02_1"><%=FormatDate.getFormatDate(dbox2.getString("d_edustart"),"yyyy/MM/dd")%>~<%=FormatDate.getFormatDate(dbox2.getString("d_eduend"),"yyyy/MM/dd")%></td>
            <td class="table_02_1"><%=dbox2.getString("d_stucnt")%></td>
            <td class="table_02_1"><%=dbox2.getString("d_grayncnt")%></td>
<!--            <td class="table_02_1" style="padding-right:10px;"><%=dbox2.getInt("d_pay")%></td> -->
            <td class="table_02_1"><%=dbox2.getDouble("d_grade")%></td>
            <td class="table_02_1"><%=dbox2.getString("d_isclosed").equals("Y")?"��������":"������"%></td>
          </tr>
          <% } %>
          
          <% if (list2.size()==0) { %>
          <tr><td colspan=8 class="table_02_1">�����̷� ������ �����ϴ�.</td></tr>
          <% } %>
        </table>
        <!-- ���� �̷º��� �� -->
        <br>
      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
