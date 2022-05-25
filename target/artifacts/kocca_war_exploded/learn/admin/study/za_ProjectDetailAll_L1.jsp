<%
//**********************************************************
//  1. ��      ��: PROJECT DETAIL LIST
//  2. ���α׷���: za_ProjectDetailAll_L.jsp
//  3. ��      ��: ��ü ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 6. 30
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
    String  v_process   = box.getString("p_process");    
    String  v_subj      = box.getString("p_subj");
    String  v_subjnm    = box.getString("p_subjnm");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_copysort    = box.getString("copysort");
    //String  v_lesson    = box.getString("p_lesson");
    //String  v_reptype   = box.getString("p_reptype");
	String  v_projseq   = "";
    String  v_ordseq    = "";
    String  v_lesson    = "";
    String  v_reptype   = "";
    String  v_projgrp   = "";
    String  v_projname  = "";
    String  v_assigndate= "";
    String  v_assigntitle= "";
    String  v_tname	    = "";
    String  v_title     = "";
    String  v_upfile    = "";
    String  v_upfile_value="";
    String  v_indate    = "";
    String  v_score_value="";
	String  v_isfinal   = "";
	String  v_isret   = "";
    String  v_isret_value="";
    String  v_ldate     = "";  // ä����
    int     v_seq       =  0;
    int     v_score     =  0;      
    int     i           =  0;
	String  v_deptnam        = "";
    String  v_upfilesize     = "";
	String  v_contentsbyte   = "";
	String  v_realfile       = "";
    ArrayList list      = null;
    //DEFINED class&variable END
     //����¡
    int v_pageno = box.getInt("p_pageno");

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_uclass    = box.getString("s_uclass");        //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_action    = box.getString("s_action");   
    //DEFINED in relation to select END
        
    list = (ArrayList)request.getAttribute("projectDetailListAll");  
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

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
    function projectList() {
		document.form1.target="_self";
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectSubmitAdmin';
        document.form1.submit();
    }    
    function projectDetailListAll() {
		document.form1.target="_self";
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectDetailListAll';
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
	
	function open_projectSearch() {
        window.self.name = "projectSearch";     //opener ��ü�� name �� �����Ѵ�
        open_window("openProjectSearch","","100","100","1024","768","1");      
        document.form1.target = "openProjectSearch";
        document.form1.action = "/search/ReportSearch";
        document.form1.p_process.value = "";
        document.form1.submit();
        document.form1.target = window.self.name;        
    }     
    
    function projectlist_select() {
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectSubmitList';
        document.form1.submit();
    }
    
    function projectlist_selectAll() {
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectDetailListAll';
        document.form1.submit();
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
    

	function whenOrder(copy, column) {
        if (column=='') return;
               
    	if (document.form1.p_orderType.value == " asc") {
    		document.form1.p_orderType.value =  " desc";
    	} else {
    		document.form1.p_orderType.value = " asc";
    	}    

    	document.form1.p_iscopy.value = copy;
        document.form1.p_orderColumn.value = column;                

		document.form1.target="_self";
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectDetailListAll';
        document.form1.submit();
  
    }
-->    	
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
   <form name="form1" method="post" action="">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_returnprocess" value="ProjectDetailListAll">
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
    <input type="hidden" name="p_wdata">	<!--�����-->
    <input type="hidden" name="p_iscopy">	<!--�����-->    
    <input type="hidden" name="p_copycnt">	<!--�����-->
    <input type="hidden" name="p_pageno"  value="<%=v_pageno%>">

    <input type="hidden" name="p_listcnt" value="<%=list.size()%>">
    

  <table width="1200" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title08.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>  
	          <!----------------- title �� ----------------->
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">
            <%=v_subjnm%> ���� &gt; <%=StringManager.cutZero(v_subjseq)%>��</td>
          </tr>
        </table>
        <br>
		        <!----------------- �� ���� ----------------->
		<table cellspacing="0" cellpadding="0" class="table1">
          <tr>
            <td width="125" height="23" align="center" valign="middle">

              <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="black_butt_left"></td>
                  <td class="black_butt_top"></td>
                  <td rowspan="3" class="black_butt_right"></td>
                </tr>
                <tr>
                  <td class="black_butt_middle"><a href="javascript:projectlist_select()" class="c">����Ʈ ����</a></td>
                </tr>
                <tr>
                  <td class="black_butt_bottom"></td>
                </tr>
              </table>

            </td>
            <td width="2"></td>
            <td width="125">

              <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="blue_butt_left"></td>
                  <td class="blue_butt_top"></td>
                  <td rowspan="3" class="blue_butt_right"></td>
                </tr>
                <tr>
                  <td class="blue_butt_middle">��ü ����Ʈ</td>
                </tr>
                <tr>
                  <td class="blue_butt_bottom"></td>
                </tr>
              </table>

            </td>
            <td align="right" valign="top">
        <!----------------- �߰�, ����Ʈ ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td align="right">&nbsp;<b>[����� �˻�]</b> &nbsp; 
			<select name="copysort" onChange="whenOrder('copy', this.value);">
			 <option value=''>�����ϼ���</option>
			 <option value='b.realfile' <%if(v_copysort.equals("b.realfile")){%>selected<%}%>>÷������</option>
			 <option value='b.upfilesize' <%if(v_copysort.equals("b.upfilesize")){%>selected<%}%>>���ϻ�����</option>
			 <option value='b.contentsbyte' <%if(v_copysort.equals("b.contentsbyte")){%>selected<%}%>>�������Ʈ��</option>
			</select> &nbsp;
			<a href="javascript:copyrep_view()"><img src="/images/admin/button/btn_copyrep.gif" border="0" align='absmiddle'></a></a> (�ִ�5��)&nbsp; 
		    </td>
            <td align="right" width=24% >
            <!--<a href="javascript:projectList()"><img src="/images/admin/button/btn_list.gif" border="0"></a>-->
            <a href="javascript:CopyRegist()"><img src="/images/admin/button/btn_copylack.gif" border="0" align='absmiddle' alt='������ǽɵ��'></a>
            </td>
          </tr>
          <tr> 
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- �߰�, ����Ʈ ��ư �� ----------------->
         </td>
          </tr>
        </table>
		<!----------------- �� ��   ----------------->
        <!----------------- ����Ʈ ��������Ʈ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="18" class="table_top_line"></td>
          </tr>
          <tr> 
            <td rowspan=2  class="table_title" width="10%"><b>��������</b></td>
            <td rowspan=2  class="table_title" width="5%"><a href="javascript:whenOrder('','a.userid')" class="e"><b>ID</b></a></td>
            <td rowspan=2  class="table_title" width="5%"><a href="javascript:whenOrder('','c.name')" class="e"><b>�̸�</b></a></td>

            <td rowspan=2  width="17%" class="table_title"><a href="javascript:whenOrder('','b.title')" class="e"><b>��������</b></a></td>                       
            <td rowspan=2  class="table_title" width="4%"><a href="javascript:whenOrder('','b.ldate')" class="e"><b>������</b></a></td>
            <td rowspan=2  class="table_title" width="5%"><a href="javascript:whenOrder('','resend')" class="e"><b>������<br>����</b></a></td>             
            <td rowspan=2  class="table_title" width="4%"><a href="javascript:whenOrder('','b.score')" class="e"><b>��<br>����</b></a></td>
            <td rowspan=2  class="table_title" width="4%"><a href="javascript:whenOrder('','isret')" class="e"><b>�ݷ�<br>����</b></a></td>
           
            <td rowspan=2 class="table_title" width="4%"><a href="javascript:whenOrder('','isret')" class="e"><b>ä����<br>(�ݷ���)</b></a></td>
            <td rowspan=2 class="table_title" width="4%"><a href="javascript:whenOrder('','tname')" class="e"><b>�����</b></a></td>            

            <td rowspan=2 class="table_title" width="3%"><img src='/images/user/common/bl_a2.gif' border=0 align=absmiddle><br><b>��</b></td>                                    
            <td rowspan=2  class="table_title" width="5%"><a href="javascript:whenOrder('','b.realfile')" class="e"><b>÷��<br>����</b></a></td>
            <td rowspan=2  class="table_title" width="5%"><a href="javascript:whenOrder('','b.upfilesize')" class="e"><b>����<br>������</b></a></td>
            <td rowspan=2  class="table_title" width="5%"><a href="javascript:whenOrder('','b.contentsbyte')" class="e"><b>����<br>����Ʈ��</b></a></td>
            <td colspan=3 class="table_title" width="3%"><img src='/images/user/common/bl_a2.gif' border=0 align=absmiddle><b>����Ⱥ�</b></td>           
          </tr>   
          <tr>
            <td class="table_title" width="3%">÷��</td>
            <td class="table_title" width="3%">����</td>
            <td class="table_title" width="3%">����</td>                  
          </tr>
          <% DataBox dbox = null;
          
            for(i = 0; i < list.size(); i++) {
                dbox = (DataBox)list.get(i);
                String  v_retexp = "-";
                
                v_projseq 	= dbox.getString("d_projseq");
                v_ordseq 	= dbox.getString("d_ordseq");
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
                //v_lesson	= dbox.getString("d_lesson");
                //v_reptype   = dbox.getString("d_reptype");
                v_deptnam        = dbox.getString("d_deptnam");      // �μ���
                v_upfilesize	 = dbox.getString("d_upfilesize");   // ������
                v_contentsbyte   = dbox.getString("d_contentsbyte"); // �������Ʈ��		
                v_ldate          = dbox.getString("d_ldate");        // ������
                
                

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
            <td class="table_02_1" align="left">[<%=v_projseq%>]<%=v_assigntitle%></td>
            <td class="table_02_1" align="center"><%=v_projgrp%></td>
            <td class="table_02_1" align="center"><%=v_projname%></td>

            <td class="table_02_2"> <a href="javascript:open_projectSubmit('<%=v_seq%>','<%=v_projgrp%>','<%=v_ordseq%>','<%=v_lesson%>','<%=v_reptype%>')" class='b'><%=v_title%></a> 
            </td>
            <td class="table_02_1" align="center"><%=v_indate%></td>
            <td class="table_02_1" align="center"><%if(dbox.getInt("d_resend")>0){%><font color=blue>������</font><%}%></td> 
            
            <td class="table_02_1" align="center"><%=v_score_value%></td>
            <td class="table_02_1" align="center"><%=v_isret_value%></td>
            <td class="table_02_1" align="center"><%=v_ldate%></td>           
                                     
            <td class="table_02_1" align="center"><%=v_tname%></td>           
            <td class="table_02_1" align="center"> <input type='checkbox' name='cchk' value='<%=v_ordseq%>|<%=v_projgrp%>|<%=v_seq%>'> </td>

            <td class="table_02_1" align="center"> <% if(v_upfile.length() > 0){ %>
              <a href = '/servlet/controller.library.DownloadServlet?p_year=<%=v_year%>&p_subj=<%=v_subj%>&p_savefile=<%= v_upfile %>&p_realfile=<%= v_upfile_value %>'><img src="/images/admin/button/icon_file.gif" border=0></a> <br><%= v_realfile %>
              <% } %>
			</td>
            <td class="table_02_1" align="center"><%=v_upfilesize%></td>
            <td class="table_02_1" align="center"><%=v_contentsbyte%></td>                        
            <td class="table_02_1" align="center"><input type='checkbox' name='p_copyupnm<%=i%>' value='Y' <%=v_upnmchk%>> </td>
            <td class="table_02_1" align="center"><input type='checkbox' name='p_copysize<%=i%>' value='Y' <%=v_sizechk%>> </td>
            <td class="table_02_1" align="center"><input type='checkbox' name='p_copybyte<%=i%>' value='Y' <%=v_bytechk%>> </td>                                    
            <input type='hidden' name='p_projrep<%=i%>' value='<%=v_ordseq%>|<%=v_projgrp%>|<%=v_seq%>'>
          </tr>
          <%}  
          if(i == 0){ %>
          <tr> 
            <td align="center" class="table_02_1" height="50" colspan="18">��ϵ� 
              ������ �����ϴ�</td>
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
