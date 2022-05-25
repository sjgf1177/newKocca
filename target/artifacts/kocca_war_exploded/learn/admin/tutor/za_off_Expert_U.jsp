<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_I.jsp
//  3. ��      ��: �������� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 8. 1
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.*" %>  
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    String  v_selcomp  = box.getString("p_selcomp");

    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    //String  v_comp    = box.getString("p_comp");
    
    int     v_seq          = box.getInt("p_seq");
    
    String v_gubun              = "";   // ��Ϻо� �ڵ�
    String v_gubunnm            = "";   // ��Ϻо� �ڵ� �̸�
    String v_name               = "";   // �̸�
    String v_eng_name           = "";   // ���� �̸�
    String v_resno              = "";   // �ֹε�Ϲ�ȣ
    String v_comp               = "";   // �Ҽ� ȸ��
    String v_dept               = "";   // �Ҽ� �μ�
    String v_comp_post1         = "";   // ȸ�� �����ȣ 1
    String v_comp_post2         = "";   // ȸ�� �����ȣ 2
    String v_comp_addr1         = "";   // ȸ�� �ּ� 1
    String v_comp_addr2         = "";   // ȸ�� �ּ� 2
    String v_comp_tel           = "";   // ȸ�� ��ȭ��ȣ
    String v_comp_fax           = "";   // ȸ�� �ѽ� ��ȣ
    String v_mobile_phone          = "";   // �ڵ��� ��ȣ
    String v_email              = "";   // �̸���
    String v_post1              = "";   // �� �����ȣ 1
    String v_post2              = "";   // �� �����ȣ 2
    String v_addr1              = "";   // �� �ּ� 1
    String v_addr2              = "";   // �� �ּ� 2
    String v_home_tel           = "";   // �� ��ȭ��ȣ
    String v_living_place       = "";   // ������ (����/�ؿ�)
    String v_education          = "";   // �����з� �ڵ�
    String v_educationnm        = "";   // �����з� �ڵ� �̸�
    String v_introduce          = "";   // �Ұ�(�з�, ����, ��� ��)
    String v_photo_real_file    = "";   // ���� ���� ����
    String v_photo_save_file    = "";   // ���� ���� ����
    String v_intro_real_file    = "";   // �Ұ� ���� ����
    String v_intro_save_file    = "";   // �Ұ� ���� ����
    String v_special_field      = "";   // �����о� �ʵ�
    String v_approve_yn         = "";   // ���� ����
    String v_reg_yn             = "";   // ��� ����
    String v_indate             = "";   // �����    
    
    v_gubun             = box.getString("p_gubun");    

    
    DataBox dbox = (DataBox)request.getAttribute("selectOffExpert");
    if (dbox != null) {
    	//v_gubun             = dbox.getString("d_gubun");           
    	v_gubunnm           = dbox.getString("d_gubunnm");         
    	v_name              = dbox.getString("d_name");            
    	v_eng_name          = dbox.getString("d_eng_name");        
    	v_resno             = dbox.getString("d_resno");           
    	v_comp              = dbox.getString("d_comp");            
    	v_dept              = dbox.getString("d_dept");            
    	v_comp_post1        = dbox.getString("d_comp_post1");      
    	v_comp_post2        = dbox.getString("d_comp_post2");      
    	v_comp_addr1        = dbox.getString("d_comp_addr1");      
    	v_comp_addr2        = dbox.getString("d_comp_addr2");      
    	v_comp_tel          = dbox.getString("d_comp_tel");        
    	v_comp_fax          = dbox.getString("d_comp_fax");        
    	v_mobile_phone         = dbox.getString("d_mobile_phone");       
    	v_email             = dbox.getString("d_email");           
    	v_post1             = dbox.getString("d_post1");           
    	v_post2             = dbox.getString("d_post2");           
    	v_addr1             = dbox.getString("d_addr1");           
    	v_addr2             = dbox.getString("d_addr2");           
    	v_home_tel          = dbox.getString("d_home_tel");        
    	v_living_place      = dbox.getString("d_living_place");    
    	v_education         = dbox.getString("d_education");       
    	v_educationnm       = dbox.getString("d_educationnm");     
    	v_introduce         = dbox.getString("d_introduce");       
    	v_photo_real_file   = dbox.getString("d_photo_real_file"); 
    	v_photo_save_file   = dbox.getString("d_photo_save_file"); 
    	v_intro_real_file   = dbox.getString("d_intro_real_file"); 
    	v_intro_save_file   = dbox.getString("d_intro_save_file"); 
    	v_special_field     = dbox.getString("d_special_field");   
    	v_approve_yn        = dbox.getString("d_approve_yn");      
    	v_reg_yn            = dbox.getString("d_reg_yn");          
    	v_indate            = dbox.getString("d_indate"); 
    	
    	v_resno = v_resno.substring(0, 6);
    }
    
    List selectListGubun = (List)request.getAttribute("selectListGubun");
    
    String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
    
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "javascript" src= "/script/cresys_lib.js"></script>
<script language = "VBScript"   src= "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
//����
    function insert_check() {

        document.form1.p_pageno.value = 1;
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.tutor.OffExpertAdminServlet";
        document.form1.p_process.value = "update";

        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.tutor.OffExpertAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }



    //�α䱸�� ���ý�
    function whenLoginSelect(){
      if(document.form1.p_login[2].checked == true) { //�α�����
          if (grcodeFrame.grcodeform.p_grcode.length > 0) {
            for (i=0; i<grcodeFrame.grcodeform.p_grcode.length; i++) {
              grcodeFrame.grcodeform.p_grcode[i].checked = false;
              grcodeFrame.grcodeform.p_grcode[i].disabled = true;
            }
          } else {
              grcodeFrame.grcodeform.p_grcode.checked = false;
              grcodeFrame.grcodeform.p_grcode.disabled = true;
          }
      }

      else if(document.form1.p_login[0].checked == true || document.form1.p_login[1].checked == true){ //�α�����
          if (grcodeFrame.grcodeform.p_grcode.length > 0) {
            for (i=0; i<grcodeFrame.grcodeform.p_grcode.length; i++) {
              grcodeFrame.grcodeform.p_grcode[i].checked = false;
              grcodeFrame.grcodeform.p_grcode[i].disabled = false;
            }
          } else {
              grcodeFrame.grcodeform.p_grcode.checked = false;
              grcodeFrame.grcodeform.p_grcode.disabled = false;
          }
      }
    }

    //üũ�ڽ� üũ
    function chkSelectedgrcode() {
      var selectedcnt = 0;

      document.form1.p_grocdecd.value = "";

        if (grcodeFrame.grcodeform.p_grcode.length > 0) {
          for (i=0; i<grcodeFrame.grcodeform.p_grcode.length; i++) {
            if (grcodeFrame.grcodeform.p_grcode[i].checked == true) {
              selectedcnt++;
              document.form1.p_grocdecd.value += grcodeFrame.grcodeform.p_grcode[i].value+",";
            }
          }
        } else {
          if (grcodeFrame.grcodeform.p_grcode.checked == true) {
            selectedcnt++;
            document.form1.p_grocdecd.value += grcodeFrame.grcodeform.p_grcode.value+",";
          }
        }

      <%if(v_gadmin.equals("K")){   //ȸ������ڰ� �϶�%>
          document.form1.p_grocdecd.value = "<%=box.getSession("tem_grcode")%>,";
          return 1;
      <%} else {%>
          return selectedcnt;
      <%}%>
    }

    // ���� üũ �� ÷�� ������ ���� ���� ��ũ��Ʈ ó��
    function checkDel(checkObj, type){
        var divObj;
        var fileObj;

        if(type == "photo") {
            divObj  = document.getElementById("divPhotoFile");
            fileObj = document.getElementById("p_photo_file");
        } else if (type == "intro") {
        	divObj = document.getElementById("divIntroFile");
        	fileObj = document.getElementById("p_intro_file");
        }

        if(checkObj.checked) {
        	divObj.style.display = "block";
        } else {
            alert(fileObj.id);
        	fileObj.select();
        	document.selection.clear();
        	divObj.style.display = "none";
        }
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' ondragstart='return false' onselectstart='return false' style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99"></div>
<form name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"    value = "<%= v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%= v_pageno %>">
    <input type = "hidden" name="p_pagesize"   value = "<%= v_pagesize %>">
    <input type = "hidden" name="p_search"     value = "<%= v_search %>">
    <input type = "hidden" name="p_searchtext" value = "<%= v_searchtext %>">
    <input type = "hidden" name="p_startdate"  value = "">
    <input type = "hidden" name="p_enddate"    value = "">
    <input type = "hidden" name="p_compcd"     value = "">
    <input type = "hidden" name="p_grocdecd"   value = "">
    <input type = "hidden" name="p_isAllvalue" value = "">
    <input type = "hidden" name="p_seq"        value = "<%= v_seq %>">
    

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
        <tr>
            <td><img src="/images/admin/homepage/s.1_002.gif" border="0"></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <br>
        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>�о�</strong></td>
            <td height="25" class="table_02_2" colspan="3"><%=v_gubunnm%></td>
          </tr>
          <tr class="table_02_2">
            <td width="15%" height="25" class="table_title" ><strong>����</strong></td>
            <td width="35%" height="25" class="table_02_2"><%= v_name %></td>
            <td width="15%" height="25" class="table_title" ><strong>�����̸�</strong></td>
            <td width="35%" height="25" class="table_02_2"><%= v_eng_name %></td>
          </tr>
          <tr>
            <td class="table_title"><strong>�ֹι�ȣ</strong></td>
            <td height="25" class="table_02_2"  colspan="3"><%=v_resno %>-*******</td>
          </tr>
          <tr class="table_02_2">
            <td width="15%" height="25" class="table_title" ><strong>ȸ���</strong></td>
            <td width="35%" height="25" class="table_02_2"><%= v_comp %></td>
            <td width="15%" height="25" class="table_title" ><strong>�μ���</strong></td>
            <td width="35%" height="25" class="table_02_2"><%= v_dept %></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title" rowspan="3"><strong>�����ּ�</strong></td>
            <td height="25" class="table_02_2" colspan="3"><%=v_comp_post1 + "-"+v_comp_post2 %></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_02_2" colspan="3"><%=v_comp_addr1%></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_02_2" colspan="3"><%=v_comp_addr2%></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title"><strong>������ȭ</strong></td>
            <td height="25" class="table_02_2"><%=v_home_tel %></td>
            <td height="25" class="table_title"><strong>������</strong></td>
            <td height="25" class="table_02_2">
              <input type="radio" name="p_living_place" value="A" <%=v_living_place.equals("A") ? "checked" : "" %>>����
              <input type="radio" name="p_living_place" value="B" <%=v_living_place.equals("B") ? "checked" : "" %>>�ؿ�
            </td>
          </tr>
          <tr>
            <td class="table_title"><strong>�����з�</strong></td>
            <td height="25" class="table_02_2"  colspan="3"><%=v_educationnm %></td>
          </tr>
          <tr>
            <td class="table_title"><strong>�Ұ�(�з�, ����, ��� ��)</strong></td>
            <td height="25" class="table_02_2"  colspan="3"><%=v_introduce %></td>
          </tr>
          <tr>
            <td class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"  colspan="3">&nbsp;
              <% if(v_photo_real_file != null && !v_photo_real_file.equals("")) {  %>
              <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_photo_save_file%>&p_realfile=<%= v_photo_real_file%>'>
              <%= v_photo_real_file%></a>&nbsp;
              <input type = "checkbox"  name = "p_photoDelCheck"    value = "Y" onclick="checkDel(this, 'photo');"> (������ üũ)<br>
              <input type = "hidden"    name = "p_photo_save_file"  value = "<%=v_photo_save_file%>">
              <input type = "hidden"    name = "p_photo_real_file"  value = "<%=v_photo_real_file%>">
              <% }  %>
              <div id="divPhotoFile" <%=v_photo_real_file != null && !v_photo_real_file.equals("") ? "style='display:none;'" : ""%>>
              <input type="FILE" name="p_photo_file" id="p_photo_file" size="50" class="input">
              </div>
            </td>
          </tr>
          <tr>
            <td class="table_title"><strong>�Ұ�����</strong></td>
            <td height="25" class="table_02_2"  colspan="3">&nbsp;
              <% if(v_intro_real_file != null && !v_intro_real_file.equals("")) {  %>
              <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_intro_save_file%>&p_realfile=<%= v_intro_real_file%>'>
              <%= v_intro_real_file%></a>&nbsp;
              <input type = "checkbox"  name = "p_introDelCheck"    value = "Y" onclick="checkDel(this, 'intro');"> (������ üũ)<br>
              <input type = "hidden"    name = "p_intro_save_file"  value = "<%=v_intro_save_file%>">
              <input type = "hidden"    name = "p_intro_real_file"  value = "<%=v_intro_real_file%>">
              <% }  %>
              <div id="divIntroFile" <%=v_intro_real_file != null && !v_intro_real_file.equals("") ? "style='display:none;'" : ""%>>
              <input type="FILE" name="p_intro_file" id="p_intro_file" size="50" class="input">
              </div>
            </td>
          </tr>
          <tr>
            <td class="table_title"><strong>�����о�</strong></td>
            <td height="25" class="table_02_2"  colspan="3">
              <% 
                if (selectListGubun !=null && selectListGubun.size() > 0 ) {
                	String v_parent_code   = "";
                	String v_parent_name   = "";
                	String v_upper_code    = "";
                	String v_upper_name    = "";
                	String v_code          = "";
                	String v_codenm        = "";
                	int    v_upper_cnt     =  0;
                	int    v_parent_cnt    =  0;
                	List   v_subList       = null;
                	
                	int cnt = 0;
                	
                	String temp_parent     = "";
                	
                    for(int i = 0 ; i < selectListGubun.size() ; i ++) {
                    	DataBox gbox    = (DataBox) selectListGubun.get(i);
                    	v_parent_code   = gbox.getString("d_parent_code"); 
                   		v_parent_name   = gbox.getString("d_parent_name");
                   		v_upper_code    = gbox.getString("d_upper_code");
                   		v_upper_name    = gbox.getString("d_upper_name");
                   		v_parent_cnt    = gbox.getInt("d_parent_cnt");
                   		v_subList       = (List)gbox.getObject("d_subList");
                   		
                   		cnt++;
                   		
                         if( !v_parent_code.equals(temp_parent)) { 
              %>
              <div id = "<%= v_parent_code %>" <%=v_gubun.equals(v_parent_code) ? "" : "style='display:none;'" %>>
              <table width="100%">
              <%         } %>
                <tr>
                  <td width="20.7%"><%=v_upper_name %></td>
                  <td width="0.3%" bgcolor="black"></td>
                  <td width="90%">
                    <table width="100%">
              <% 
                         for (int j = 0 ; j < v_subList.size() ; j++) { 
                             DataBox subBox    = (DataBox) v_subList.get(j);
                            
                             v_code      = subBox.getString("d_code");
                             v_codenm    = subBox.getString("d_codenm");
                                
                             if ( j == 0 || j % 3 == 0 ) {
              %>
                      <tr>
              <%             } %>
                        <td width="33%">
                          <input type="checkbox" name="p_special_field" value="<%=v_code %>" <%=v_special_field.indexOf(v_code) > -1 ? "checked" : "" %>><%=v_codenm %>
                        </td>
              <%             if ( (j + 1) % 3 == 0 || j == v_subList.size() - 1)
                                 if (v_subList.size() < 3) { 
                                     for(int k = 0 ; k < 3 - v_subList.size() ; k++) {%>
                        <td width="33%">&nbsp;</td>
              <%                     }  %>
                      </tr>
              <%                 }  %>
                      
              <%             }
                             temp_parent = v_parent_code;   %>
                    </table>
                  </td>  
                </tr>
                <tr>
                  <td colspan=5 height=1 bgcolor="black"></td>
                </tr>
              <%         if( cnt == v_parent_cnt || i == selectListGubun.size() -1) { 
            	             cnt = 0;
              %>
              </table>
            </div>
              <%         } %>
              <%    } }%>
            </td>
          </tr>
          <tr>
            <td class="table_title"><strong>���ο���</strong></td>
            <td height="25" class="table_02_2"  colspan="3">
              <kocca_select:select name="p_approve_yn" sqlNum="0001"  param="0084"              
                onChange="" attr=" " selectedValue="<%= v_approve_yn %>" isLoad="true" all="Y" />
            </td>
          </tr>
          <tr>
            <td class="table_title"><strong>��Ͽ���</strong></td>
            <td height="25" class="table_02_2"  colspan="3">
              <select name="p_reg_yn">
                <option value="Y" <%=v_reg_yn.equals("Y") ? "selected" : "" %>>���</option>
                <option value="N" <%=v_reg_yn.equals("N") ? "selected" : "" %>>�̵��</option>
              </select>
            </td>
          </tr>
        </table>
        <!----------------- �������� ���� �� ----------------->

        <br>
        <!----------------- ����, ��� ��ư ����----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td align="center"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->


      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
