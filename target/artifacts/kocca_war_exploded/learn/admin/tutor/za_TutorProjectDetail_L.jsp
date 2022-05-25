<%
//**********************************************************
//  1. ��      ��: PROJECT DETAIL LIST
//  2. ���α׷���: za_TutorProjectDetail_L.jsp
//  3. ��      ��: ����Ʈ ������ ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 6. 29
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_process       = box.getString("p_process");    
    String  v_subj          = box.getString("p_subj");
    String  v_subjnm        = box.getString("p_subjnm");
    String  v_year          = box.getString("p_year");
    String  v_subjseq       = box.getString("p_subjseq");
    String  v_copysort      = box.getString("copysort");
    String  v_lesson        = box.getString("p_lesson");
    String  v_reptype       = box.getString("p_reptype");
    String  v_projgrp       = "";
    String  v_projname      = "";
    String  v_assigndate    = "";
    String  v_assigntitle   = "";
    String  v_tname         = "";
    String  v_title         = "";
    String  v_upfile        = "";
    String  v_upfile_value  = "";
    String  v_indate        = "";
    String  v_score_value   = "";
    String  v_isfinal       = box.getString("p_isfinal");
    String  v_isret         = "";
    String  v_isret_value   = "";
    String  v_retdate       = "";
    String  v_ldate         = "";
    String  v_tudate        = "";
    String  v_projseq       =  "";
    String  v_ordseq        =  "";
    int     v_seq           =  0;
    int     v_score         =  0;      
    int     i               =  0;
    String  v_deptnam       = "";
    String  v_upfilesize    = "";
    String  v_contentsbyte  = "";
    String  v_realfile      = "";
    String  v_upfile2       = "";    // �������
    String  v_realfile2     = "";    // ������Ͻǳ���
    String  v_compnm        = ""; 

    ArrayList list      = null;
    //DEFINED class&variable END
    
    DataBox dbox = null;
 
    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_uclass    = box.getString("s_uclass");        //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_action    = box.getString("s_action");   
    //DEFINED in relation to select END
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

    list = (ArrayList)request.getAttribute("projectDetailList");  

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function open_window(name, url, left, top, width, height, scrollbar, toolbar, menubar, statusbar, resizable)
    {
        toolbar_str = toolbar ? 'yes' : 'no';
        menubar_str = menubar ? 'yes' : 'no';
        statusbar_str = statusbar ? 'yes' : 'no';
        scrollbar_str = scrollbar ? 'yes' : 'no';
        resizable_str = resizable ? 'yes' : 'no';
        window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str).focus();
    }

    function projectDetailList(subj,subjnm,year,subjseq,ordseq,lesson) {
        document.form1.target="_self";
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectDetailList';
        document.form1.p_subj.value = subj;
        document.form1.p_subjnm.value = subjnm;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_ordseq.value = ordseq;
        document.form1.p_lesson.value = lesson;
        document.form1.submit();
    }

    // ������ Ȯ�� ��
    function open_projectSubmit(seq,projgrp,ordseq,lesson,reptype) {
        window.self.name = "projectDetail";     //opener ��ü�� name �� �����Ѵ�
        open_window("openProjectSubmit","","50","50","750","700","1");         
        //open_window("openProjectSubmit","","100","100","548","550","1");      
        document.form1.target = "openProjectSubmit";
        document.form1.action = "/servlet/controller.study.ProjectAdminServlet";
        document.form1.p_process.value = "ProjectSubmitOpenPage";
        document.form1.p_seq.value = seq;
        document.form1.p_projgrp.value = projgrp;
        document.form1.p_ordseq.value = ordseq;
        document.form1.p_lesson.value = lesson;
        document.form1.p_reptype.value = reptype;
        document.form1.submit();
        document.form1.target = window.self.name;        
    }


    // ����� �� view
    function copyrep_view() {
        var p_wdata = "";
        var flag    = 0;
        if (document.form1.cchk != null)
        {
            if (document.form1.cchk.length != null)
            {
                for (var i=0; i < document.form1.cchk.length;i++)
                {
                    if (document.form1.cchk[i].checked == true )
                    {   
                        flag++;
                        p_wdata = p_wdata+document.form1.cchk[i].value+"^";
                    }
                }
            }
            
            if(flag<2) {alert("����� �񱳴� 2�� �̻��Դϴ�.");return;}
            if(flag>5) {alert("����� �񱳴� 5�� �����Դϴ�.");return;}
     
            window.self.name = "ProjectCopyView";     //opener ��ü�� name �� �����Ѵ�
            open_window("openCopyView","","50","50","650","700","1");      
            document.form1.target = "openCopyView";
            document.form1.action = "/servlet/controller.study.ProjectAdminServlet";
            document.form1.p_process.value = "ProjectCopyView";
            document.form1.p_copycnt.value = flag;
            document.form1.p_wdata.value = p_wdata;
            document.form1.submit();
            document.form1.target = window.self.name;               
        
        }else{
            alert("�񱳴���� �����ϴ�.");return;
        }
    }


    // ����� ��� 
    function CopyRegist() {
        if (confirm("����Ⱥ� üũ�׸��� ����Ͻðڽ��ϱ�?")){
            document.form1.action = "/servlet/controller.study.ProjectAdminServlet";
            document.form1.p_process.value = "ProjectCopyRegist";
            document.form1.submit();
        }
    }
      
    // ÷����� �˾�
    function open_correctionList() {
        window.self.name = "correctionList";     //opener ��ü�� name �� �����Ѵ�
        open_window("openCorrectionList","","100","0","800","600","1");      
        document.form1.target = "openCorrectionList";
        document.form1.action = "/servlet/controller.tutor.TutorAdminMainServlet";
        document.form1.p_process.value = "CorrectionList";
        document.form1.submit();
        document.form1.target = window.self.name;        
    }  

    // �������ȭ������ �̵�
    function tutorMain() {
      document.form1.action='/servlet/controller.tutor.TutorAdminMainServlet';
      document.form1.target = "_self";
      document.form1.p_process.value = 'listPage';
      document.form1.p_action.value = 'go';
      document.form1.submit();
    }

    // ����
    function whenOrder(copy, column) {
        if (column==' ') { alert("����� �˻��� �����ϼ���."); return; } 
        
        if (copy == 'copy'){
            document.form1.p_iscopy.value = copy;
        }
        
        if (document.form1.p_orderType.value == " asc") {
            document.form1.p_orderType.value =  " desc";
        } else {
            document.form1.p_orderType.value = " asc";
        }    
       document.form1.p_orderColumn.value = column;                
    document.form1.action='/servlet/controller.tutor.TutorAdminMainServlet';
    document.form1.target = "_self";
    document.form1.p_process.value = 'ProjectDetailList';
    document.form1.submit();
        
        //projectlist_select();
  
    }

function projectlist_select(subj,subjnm,year,subjseq) {
    document.form1.action='/servlet/controller.tutor.TutorAdminMainServlet';
  document.form1.target = "_self";
    document.form1.p_process.value = 'ProjectDetailList';
    //alert(document.form1.action);
    //alert(document.form1.p_process.value);
    document.form1.p_subj.value = subj;        
    document.form1.p_subjnm.value = subjnm;        
    document.form1.p_year.value = year;     
    document.form1.p_subjseq.value = subjseq;  
    document.form1.submit();
}
-->     
</SCRIPT>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
   <form name="form1" method="post" action="">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_returnprocess" value="ProjectDetailList1">
    <input type="hidden" name="s_action"    value="<%=ss_action%>">     <!--in relation to select-->
    <input type="hidden" name="s_grcode"    value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"     value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_grseq"     value="<%=ss_grseq%>">      <!--in relation to select-->
    <input type="hidden" name="s_uclass"    value="<%=ss_uclass%>">     <!--in relation to select-->
    <input type="hidden" name="s_subjcourse"value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"   value="<%=ss_subjseq%>">    <!--in relation to select-->  
    <input type="hidden" name="p_subj"      value="<%=v_subj%>">
    <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
    <input type="hidden" name="p_year"      value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
    <input type="hidden" name="p_ordseq"    value="<%=v_ordseq%>">
    <input type="hidden" name="p_lesson"    value="<%=v_lesson%>">     
    <input type="hidden" name="p_reptype"   value="<%=v_reptype%>">  
    <input type="hidden" name="logChk"      value="1"> 
    <input type="hidden" name="p_projgrp">   
    <input type="hidden" name="p_seq">
    <input type="hidden" name="p_orderColumn">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
    <input type="hidden" name="p_wdata">    <!--�����-->
    <input type="hidden" name="p_iscopy">   <!--�����-->    
    <input type="hidden" name="p_copycnt">  <!--�����-->
    <input type="hidden" name="p_action">   <!--�����-->
    <input type="hidden" name="p_listcnt" value="<%=list.size()%>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="/images/admin/tutor/tit_new_reportlist.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� --------------- -->
      <br>
        <!----------------- ����Ʈ ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="20%"><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">
            <b><%=v_subjnm%></b> ����</td>
          </tr>
        </table>
        <br>
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td align="center" valign="middle">
                  <table border="0" cellspacing="10" cellpadding="0" width="99%" class="form_table">
                  <tr>
                      <td width="20%">
                        <input type="radio" name="p_isfinal" value="" <%=v_isfinal.equals("")?"checked":""%>>��ü 
                        <input type="radio" name="p_isfinal" value="Y" <%=v_isfinal.equals("Y")?"checked":""%>>ä�� 
                        <input type="radio" name="p_isfinal" value="N" <%=v_isfinal.equals("N")?"checked":""%>>��ä��                       
                      </td> 
                      <td width="70%" align="left"><a href="javascript:projectlist_select('<%=v_subj%>','<%=v_subjnm%>','<%=v_year%>','<%=v_subjseq%>')"><img src="/images/admin/button/b_go.gif" border="0" valign="bottom"></a></td>
                      <td width="8%" align="right"><a href="javascript:open_correctionList()"><img src="/images/admin/button/btn_chmanage.gif" border="0"></a></td>
                      <td width="8%" align="right"><a href="javascript:tutorMain()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>

        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="40%">
            <b>[�������]</b>
            <% 
            if(list.size()>0){
                for(int k=0; k<list.size(); k++){
                dbox = (DataBox)list.get(k);

    //              ProjectData data= (ProjectData)list.get(k);
                    v_upfile2   = dbox.getString("d_upfile2");  
                    v_realfile2 = dbox.getString("d_realfile2");    

                    if(!v_upfile2.equals("")){
//                  System.out.println("v_upfile2===="+v_upfile2);
                %>
                <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_upfile2 %>&p_realfile=<%= v_realfile2 %>' target='_new'><u><%=v_realfile2%></u></a>
                <%  }else{ 
                //out.println("��ϵ� ��������� �����ϴ�.");
                    }
                }
            }
            %>
            </td>
            <td width="60%" align="right" style=padding-right:8px>
                <!----------------- ����� ���� ----------------->
                <table width="97%" border="0" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td align="right">&nbsp;<b>[����� �˻�]</b> &nbsp; 
                    <select name="copysort" onChange="whenOrder('copy', this.value);">
                     <option value=''>�����ϼ���</option>
                     <option value='realfile' <%if(v_copysort.equals("realfile")){%>selected<%}%>>÷������</option>
                     <option value='upfilesize' <%if(v_copysort.equals("upfilesize")){%>selected<%}%>>���ϻ�����</option>
                     <option value='contentsbyte' <%if(v_copysort.equals("contentsbyte")){%>selected<%}%>>�������Ʈ��</option>
                    </select> &nbsp;
                    <a href="javascript:copyrep_view()"><img src="/images/admin/button/btn_copyrep.gif" border="0" align='absmiddle'></a></a> (�ִ�5��)&nbsp; 
                    </td>
                    <td align="right" width="24%">
                    <!--<a href="javascript:projectList()"><img src="/images/admin/button/btn_list.gif" border="0"></a>-->
                    <a href="javascript:CopyRegist()"><img src="/images/admin/button/btn_copylack.gif" border="0" align='absmiddle' alt='������ǽɵ��'></a>
                    </td>
                  </tr>
                </table>
                <!----------------- ����� �� ----------------->  
            </td>           
          </tr>
          <tr><td height="6"></td></tr>
        </table>

        <!----------------- �߰�, ����Ʈ ��ư �� ----------------->

        <!----------------- ����Ʈ ��������Ʈ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="16" class="table_top_line"></td>
          </tr>
          <tr>
            <td rowspan=2 width="5%" class="table_title"><b>NO</b></td>
            <td rowspan=2 class="table_title" width="5%"><a href="javascript:whenOrder('','score')" class="e"><b>��<br>����</b></a></td>
            <td rowspan=2 class="table_title" width="12%"><a href="javascript:whenOrder('','ortitle')" class="e"><b>��������</b></a></td>
            <td rowspan=2 class="table_title" width="16%"><a href="javascript:whenOrder('','title')" class="e"><b>��������</b></a></td>
            <td rowspan=2 class="table_title" width="8%"><a href="javascript:whenOrder('','realfile')" class="e"><b>÷��<br>����</b></a></td>
            <td rowspan=2 class="table_title" width="7%"><a href="javascript:whenOrder('','contentsbyte')" class="e"><b>����<br>����Ʈ��</b></a></td>
            <td rowspan=2 class="table_title" width="5%"><a href="javascript:whenOrder('','upfilesize')" class="e"><b>����<br>������</b></a></td>
            <td rowspan=2 class="table_title" width="6%"><a href="javascript:whenOrder('','projgrp')" class="e"><b>���̵�</b></a></td>
            <td rowspan=2 class="table_title" width="6%"><a href="javascript:whenOrder('','projname')" class="e"><b>�̸�</b></a></td>
            <td rowspan=2 class="table_title" width="8%"><a href="javascript:whenOrder('','indate')" class="e"><b>������</b></a></td>
            <td rowspan=2 class="table_title" width="8%"><a href="javascript:whenOrder('','tudate')" class="e"><b>ü����</b></a></td>
            <td rowspan=2 class="table_title" width="5%"><a href="javascript:whenOrder('','isret')" class="e"><b>�ݷ�<br>����</b></a></td>
            <td rowspan=2 class="table_title" width="5%"><img src='/images/user/common/bl_a2.gif' border=0 align=absmiddle><b>��</b></td>
            <td colspan=3 class="table_title" width="3%"><img src='/images/user/common/bl_a2.gif' border=0 align=absmiddle><b>����Ⱥ�</b></td>           
          </tr>   
          <tr>
            <td class="table_title" width="3%">÷��</td>
            <td class="table_title" width="3%">����</td>
            <td class="table_title" width="3%">����</td>                  
          </tr>
          <%
            for(i = 0; i < list.size(); i++) {

                dbox = (DataBox)list.get(i);
                String  v_retexp = "-";
                
                v_projseq   = dbox.getString("d_projseq");
                v_ordseq    = dbox.getString("d_ordseq");
                v_seq       = dbox.getInt("d_seq");

                v_projgrp   = dbox.getString("d_projgrp");  // ���
                v_projname  = dbox.getString("d_projname");
                v_assigndate  = dbox.getString("d_assigndate");
                v_assigntitle  = dbox.getString("d_assigntitle");
                v_title     = dbox.getString("d_title");
                v_score     = dbox.getInt("d_score");
                v_isfinal   = dbox.getString("d_isfinal");
                v_isret     = dbox.getString("d_isret");
                v_upfile    = dbox.getString("d_upfile");
                v_indate    = dbox.getString("d_indate");
                v_tname     = dbox.getString("d_tname");
                v_realfile  = dbox.getString("d_realfile");
                //v_lesson  = dbox.getString("d_lesson");
                //v_reptype    = dbox.getString("d_reptype");
                v_deptnam      = dbox.getString("d_deptnam");      // �μ���
                v_upfilesize   = dbox.getString("d_upfilesize");   // ������
                v_contentsbyte = dbox.getString("d_contentsbyte"); // �������Ʈ��      
                v_ldate        = dbox.getString("d_ldate");        // ������
                v_tudate       = dbox.getString("d_tudate");        // ������
                v_compnm       = dbox.getString("d_compnm");        // ������

                if(!dbox.getString("d_retdate").equals("")){
                    v_retexp = "��";
                }
                //if(v_score == 0){       v_score_value = "<font color='#FF0000'>����</font>";  }
                        if(v_isfinal.equals("N")){       v_score_value = "<font color='#FF0000'>����</font>";  }
                else                {       v_score_value = v_score+"��";                       }
                
                if(v_isret.equals("Y")){       
                    v_isret_value = "<font color='#FF0000'>�ݷ�</font>"; 
                    v_ldate = FormatDate.getFormatDate(dbox.getString("d_retdate"),"yyyy/MM/dd"); // �ݷ���
                }else{
                    v_isret_value = "";                       
                    if(!v_ldate.equals("")) v_ldate = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");  // ������
                }
                
                
                v_indate    = FormatDate.getFormatDate(v_indate,"yyyy/MM/dd");
                v_tudate    = FormatDate.getFormatDate(v_tudate,"yyyy/MM/dd");
                v_assigndate    = FormatDate.getFormatDate(v_assigndate,"yyyy/MM/dd");
                
                if(v_upfile.length() == 0){    v_upfile   = "";    
                }else{  
                    //v_upfile_value = v_projgrp + v_upfile.substring(v_upfile.lastIndexOf("."));    
                    v_upfile_value = v_upfile;    
                }         
                
                // ����Ⱥ�
                String v_upnmchk = "";
                String v_sizechk = "";
                String v_bytechk = "";
                if (dbox.getString("d_copyupnm").equals("Y")) v_upnmchk = "CHECKED";
                if (dbox.getString("d_copysize").equals("Y")) v_sizechk = "CHECKED";
                if (dbox.getString("d_copybyte").equals("Y")) v_bytechk = "CHECKED";
                       
          %>
          <tr> 
            <td class="table_01"><%= list.size() - i %></td>
            <td class="table_02_1" align="center"><%=v_score_value%></td>
            <td class="table_02_1" align="left">[<%=v_projseq%>]<%=v_assigntitle%></td>
            <td class="table_02_2"> <a href="javascript:open_projectSubmit('<%=v_seq%>','<%=v_projgrp%>','<%=v_ordseq%>','<%=v_lesson%>','<%=v_reptype%>')" class='b'><%=v_title%></a> 
            </td>
            <td class="table_02_1" align="center"><% if(v_upfile.length() > 0){ %>
              <a href = '/servlet/controller.library.DownloadServlet?p_year=<%=v_year%>&p_subj=<%=v_subj%>&p_savefile=<%= v_upfile %>&p_realfile=<%= v_upfile_value %>'><img src="/images/admin/button/icon_file.gif" border=0></a><br><br><%= v_realfile %> 
              <% } %> </td>
                        <td class="table_02_1" align="center"><%=v_contentsbyte%></td>
            <td class="table_02_1" align="center"><%=v_upfilesize%></td>
            <td class="table_02_1" align="center"><%=v_projgrp%></td>
            <td class="table_02_1" align="center"><%=v_projname%></td>            
            <td class="table_02_1" align="center"><%=v_indate%></td>
            <td class="table_02_1" align="center"><%=v_isret.equals("Y")?v_retdate:v_tudate%></td>
            <td class="table_02_1" align="center"><%=v_isret_value%></td>
            <td class="table_02_1" align="center"> <input type='checkbox' name='cchk' value='<%=v_ordseq%>|<%=v_projgrp%>|<%=v_seq%>'> </td>
            <td class="table_02_1" align="center"><input type='checkbox' name='p_copyupnm<%=i%>' value='Y' <%=v_upnmchk%>> </td>
            <td class="table_02_1" align="center"><input type='checkbox' name='p_copysize<%=i%>' value='Y' <%=v_sizechk%>> </td>
            <td class="table_02_1" align="center"><input type='checkbox' name='p_copybyte<%=i%>' value='Y' <%=v_bytechk%>> </td>                                    
            <input type='hidden' name='p_projrep<%=i%>' value='<%=v_ordseq%>|<%=v_projgrp%>|<%=v_seq%>'>
          </tr>
          <%}  
          if(i == 0){ %>
          <tr> 
            <td align="center" class="table_02_1" height="50" colspan="17">��ϵ� ������ �����ϴ�</td>
          </tr>
          <%  } %>
        </table>
        <!----------------- Activity ����Ʈ �� ----------------->
      </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>    
</table>
</form>
</body>
</html>
