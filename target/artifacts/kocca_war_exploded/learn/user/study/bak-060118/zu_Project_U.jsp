<%
//**********************************************************
//  1. ��      ��: PROJECT HANDLING PAGE
//  2. ���α׷���: zu_Project_U.jsp
//  3. ��      ��: ����Ʈ ��� & ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 8. 
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
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");    
    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");    
    String  v_lesson    = box.getString("p_lesson");   
    String  v_reptype   = box.getString("p_reptype");   
    String  v_projgrp   = box.getString("p_projgrp");   
    String  v_status    = box.getStringDefault("p_status","Y");       
    int     v_ordseq    = box.getInt("p_ordseq");       
    int     v_projseq   = box.getInt("p_projseq");      
    int     v_getcnt    = box.getInt("p_getcnt");      
    String  v_title     = "";
    String  v_contents  = "";
    String  v_tucontents= "";
    String  v_title2    = "";
    String  v_contents2 = "";
    String  v_expiredate= "";
    String  v_upfile    = "";    
    String  v_upfile1   = "";
    String  v_upfile2   = "";
		String  v_ordrealfile1 = ""; //�������� ��������
		String  v_ordrealfile2 = ""; //������� ����
	
		String  v_realfile  = ""; //�л��� ������ ���� ����
		String 	v_upfilesize = "";
    String  v_upfile_value = "";
    String  v_upfile1_value= "";
    String  v_upfile2_value= "";
		String  v_isret     = "";
		String  v_retreason = "";
		String  v_issubmit = "";
		String  v_ansyn = "";
		String  v_eduend = "";
	
    int     v_score     =  0;
    int     v_score_mas =  0;
    int     i           =  0;
    ProjectData  data1  =null;
    ProjectData  data2  =null;
    //DEFINED class&variable END       
    // editor
    String content      = "";
    String width        = "600";
    String height       = "300";
    
       
    data1 = (ProjectData)request.getAttribute("selectProjectOrd");
    if(data1 != null){
        v_title     		= data1.getTitle();      
        v_contents  		= data1.getContents();   
        v_expiredate		= data1.getExpiredate(); 
        v_upfile    		= data1.getUpfile();     
        v_upfile2   		= data1.getUpfile2();
				v_ordrealfile1 	= data1.getRealfile();
 	    	v_ordrealfile2 	= data1.getRealfile2();
				v_ansyn        	= data1.getAnsyn();
				v_eduend       	= data1.getEduend();

        if(v_title.length() == 0)  v_title = "";
        if(v_eduend.length() == 0){ v_eduend = "";
        }else{
          if(Integer.parseInt(v_eduend) < Integer.parseInt(FormatDate.getDate("yyyyMMddHH"))){ v_status="N";  }
        }                            
        if(v_upfile.length() == 0){    v_upfile   = "";         //÷������
        }else{  
			//v_upfile_value =  v_upfile.substring(v_upfile.indexOf("_") + 1 );    
			v_upfile_value =  v_ordrealfile1;
		}
		
		
        if(v_upfile2.length() == 0){    v_upfile2   = "";       //�������
        }else{  
			//v_upfile2_value = v_upfile2.substring(v_upfile2.indexOf("_") + 1);    
			v_upfile2_value = v_ordrealfile2;
		
		}
        if(v_contents.length() == 0){ v_contents = "";
        }else{  v_contents = StringManager.replace(v_contents,"\r\n","<br>");      }  
    }    
    
    data2 = (ProjectData)request.getAttribute("selectProjectRep");
    if(data2 != null){
        v_title2    = data2.getTitle();      
        content     = StringManager.replace(data2.getContents(),"\n;","<br>");
        v_score     = data2.getScore();      
        v_upfile1   = data2.getUpfile();     
		v_realfile  = data2.getRealfile();    
		v_upfilesize = data2.getUpfilesize(); 
        v_tucontents= data2.getTucontents(); 
        v_score_mas = data2.getScore_mas();
		v_isret     = data2.getIsret();
		v_retreason = data2.getRetreason();
       
        if(v_title2.length() == 0)     v_title2    = "";        
        if(v_tucontents.length() == 0) v_tucontents= ""; 
        if(v_upfile1.length() == 0){    v_upfile1   = "";    
        }else{  
					v_upfile1_value = v_realfile;
		}
        if(v_score_mas > 0){ v_status = "N";    }
    }
    
    ProjectBean pjbean = new ProjectBean();
    if(pjbean.selectProjectRepCount(box) >0){
      v_issubmit = "Y";
    }else{
      v_issubmit = "N";
    }
    
    
    //������ ��������
    EduStartBean 	bean = new EduStartBean();

	//EduScoreData   dataStep  =null;
	EduScoreData   dataStep = bean.SelectEduScore(box);

%>    

<html>
<head>
<title>::: REPORT :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<!--<link href="/css/user_style1.css" rel="stylesheet" type="text/css">���信�� ��-->
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--


    // �߰�����
    function halfregist() {               
        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }                
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }                     

    	if(document.all.use_editor[0].checked) {        
            document.form1.p_content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    	}else {
		    document.form1.p_content.value = document.all.txtDetail.value;
	    }
	      
	    //���� Ȯ���� ���͸�  
	    var islimit = true;
	    var file = document.form1.p_file1.value;  
	    if(file!="") {
	        islimit = limitFile(file);
	    }
	    
	    if(islimit) {
	          document.form1.p_contentsbyte.value = realsize(document.form1.p_content.value);
            document.form1.action = "/servlet/controller.study.ProjectServlet?g_subj=<%=v_subj%>&g_year=<%=v_year%>";
            document.form1.p_process.value = "ProjectHalfSave";                
            document.form1.submit();
	    }else{
	        return;
	    }
    }
    
    // ������
    function whenProjectRep() {               
        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }                
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }                     

    	if(document.all.use_editor[0].checked) {        
            document.form1.p_content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    	}else {
		    document.form1.p_content.value = document.all.txtDetail.value;
	    }
	     
	      
	    //���� Ȯ���� ���͸�  
	    var islimit = true;
	    var file = document.form1.p_file1.value;  
	    if(file!="") {
	        islimit = limitFile(file);
	    }
	    
	    if(islimit) {
	        document.form1.p_contentsbyte.value = realsize(document.form1.p_content.value);  
            document.form1.action = "/servlet/controller.study.ProjectServlet?g_subj=<%=v_subj%>&g_year=<%=v_year%>";
            document.form1.p_process.value = "ProjectHandling";                
            document.form1.submit();
	    }else{
	        return;
	    }
    }

<%if(v_status.equals("Y")){ %>
    // ����ں��⼱��
    function SelectAnsyn(ansyn) {      
		if( ansyn == "TEXT" ) {
			document.all["tabtext_1"].style.display = "";
			document.all["tabfile_2"].style.display = "none";
		}
		if( ansyn == "FILE" ){
		    document.all["tabtext_1"].style.display = "none";		
			document.all["tabfile_2"].style.display = "";		        
		}
		if( ansyn == "ALL" ){
		    document.all["tabtext_1"].style.display = "";		
			document.all["tabfile_2"].style.display = "";		        
		}
    }
<%}%>    
-->
</script>   

</head>

<!-- /////////////////////////////////////////////////////////-->
<!--
  ����Ȯ����üũ INCLUDE
  
  1. page import = "com.credu.system.*" �߰�
  2. �ڹٽ�ũ��Ʈ ȣ��κ� �߰�
    ����)
    //���� Ȯ���� ���͸�  
	var islimit = true;
	var file = document.form1.p_file1.value;  
	if(file!="") {
	    islimit = limitFile(file);
	}
	
	if(islimit) {
        document.form1.submit();
	}else{
	    return;
	}

-->
<%@ include file = "/learn/library/fileFilter.jsp" %>
<!-- /////////////////////////////////////////////////////////-->

<body topmargin="0" leftmargin="0">
<form name="form1" method="post" enctype = "multipart/form-data">
<input type="hidden" name="p_process">
<input type="hidden" name="p_subj" value="<%=v_subj%>">
<input type="hidden" name="p_year" value="<%=v_year%>">
<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
<input type="hidden" name="p_ordseq" value="<%=v_ordseq%>">
<input type="hidden" name="p_projseq" value="<%=v_projseq%>">
<input type="hidden" name="p_lesson" value="<%=v_lesson%>">
<input type="hidden" name="p_reptype" value="<%=v_reptype%>">
<input type="hidden" name="p_projgrp" value="<%=v_projgrp%>">
<input type="hidden" name="p_upfile1" value="<%=v_upfile1%>">
<input type="hidden" name="p_contentsbyte" value="">
<input type="hidden" name="p_content"      value="">
<input type="hidden" name="p_getcnt"       value="<%=v_getcnt%>">

    
<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="783" height="100%">
  <tr> 
    <td> 
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr> 
            <td align="center" valign="top" class="body_color">
			<br>
              <!----------------- Ÿ��Ʋ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
                <tr> 
                  <td><img src="/images/user/study/report_title.gif"></td>
                  <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
                  <td><img src="/images/user/study/gongi_tail.gif"></td>
                </tr>
              </table>
              <!----------------- Ÿ��Ʋ �� ---------------->
            <br>

            <table width="94%" border="0" cellpadding="0" cellspacing="10" bgcolor="#EEEEEE">
              <tr> 
                <td> 
                  <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2">
                    <tr> 
                      <td align="center" bgcolor="#FFFFFF">


                        <br>


                        <table cellspacing="0" cellpadding="0" align="center" width="98%">
                          <tr> 
                            <td colspan="2">��<b> ������ ������</b></td>
                          </tr>
                          <tr> 
                            <td height="6"></td>
                          </tr>
                          <tr> 
                            <td width="2%">&nbsp;</td>
                            <%
                            	if(v_ansyn.equals("U")) {
                            %>
                            <td>������ ����� ÷������ (����,���� ��)�� ������ ��쿡�� ÷������ 
                              ���� [ã�ƺ���]�� Ŭ�� �� ������ ������ ���� �� ��, ����� ������ �����ϰ� �Է� 
                              ��, �Ʒ��� ���� ��ư�� Ŭ���մϴ�.<br>
                              <br>
                              ÷������ ���� �������� ���� �ô� ����,���븸�� �Է� �� �����ư�� Ŭ���մϴ�.<br>
                                ��, ������ 2,000�� �̸����� ���ѵǹǷ� <font color="red">������ 
                                ���� ��� ÷�����Ϸ� ������ �ֽʽÿ�.<br>
                                <b>÷�����ϸ��� ������ �̸����� �ۼ� �����ϼ���.</b> </font><br>
                                <br>
							  								<font color="#CC3300"><b>�� ���� : Ÿ���� ������ ������ ���(�����)  "0"��(�̼���) ó���˴ϴ�.</font>
													  </td>
													  <%
													  	} else if(v_ansyn.equals("T")) {
													  %>
													  <td>�Ʒ��� �������� ������������� �ۼ��Ͻñ� �ٶ��ϴ�.
														������ ������ ä���Ϸᰡ �Ǳ��������� ������ �����մϴ�.<br><br>
														<font color="red"><b>[���ǻ���]</b></font><br>
														������ �ۼ��� �ʹ� �������� ��ǻ�͸� �ѳ����� �ۼ��� ������ ������ ���� ���� ���� �ֽ��ϴ�.
														���Ϸ� �ۼ��ϼż� �ű�ðų� �߰��� ������ �ѹ��� �Ͻñ� �ٶ��ϴ�.
														�������� <font color=blue><b>A4��з�</b></font>���� �������ֽñ� �ٶ��ϴ�.
														�� ��� �ۼ��� �ݵ�� ������ ���� �ۼ� �ϼž߸� �Ǹ�, ���� Ÿ�ο��� ��� �ۼ��� �Ƿ��ϴ� �� �������, ������ ������� ����� �����Ͻø� ������ �� �����ϴ�.
														������̰ų� 0���� ������ �̼��ᰡ �˴ϴ�. �����ϰ� �ۼ����ֽñ� �ٶ��ϴ�.
														</td>
													  <%
													  	} else if(v_ansyn.equals("F")) {
													  %>
													  <td>�������� �ۼ��ϼż� ���Ϸ� �����Ͻñ� �ٶ��ϴ�.
														������ ������ ä���Ϸᰡ �Ǳ��������� ������ �����մϴ�.<br><br>
														<font color=red><b>[���ǻ���]</b></font><br>
														�� ��� �ۼ��� �ݵ�� ������ ���� �ۼ� �ϼž߸� �Ǹ�, ���� Ÿ�ο��� ��� �ۼ��� �Ƿ��ϴ� �� �������, ������ ������� ����� �����Ͻø� ������ �� �����ϴ�.
														������̰ų� 0���� ������ �̼��ᰡ �˴ϴ�. �����ϰ� �ۼ����ֽñ� �ٶ��ϴ�.</td>
													  <%
													  	}
													  %>
                          </tr>
                        </table>
                        <br>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <br>
            <br>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td width="13"><img src="/images/user/study/icon2.gif" width="13" height="11" border="0"></td>
                <td><b>������������</b></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <!----------------- ������������ ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="3" class="table2">                
                    <tr> 
                      <td class="board_title_bg1" width="15%">�� ��</td>
                      <td class="board_title_bg3" width="28%"><%=v_title%></td>
                      <td class="board_title_bg1" width="15%">÷������</td>
                      <td class="board_title_bg3" width="27%">
                      <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_upfile %>&p_realfile=<%= v_upfile%>'><%= v_upfile_value %></a>
                      </td>
                    </tr>
<% if(v_status.equals("N")){        //������ ������ ������ ���
%>                 
                    <tr> 
                      <td class="board_title_bg1" width="15%">�������</td>
                      <td class="board_title_bg3" colspan="3">
                      <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_upfile2 %>&p_realfile=<%= v_upfile2_value %>'><%= v_upfile2_value %></a>
                      </td>
                    </tr>
<% } %>                    
                    <tr> 
                      <td colspan="4" class="board_text1" align="center"> 
                        <table width="98%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="7"></td>
                          </tr>
                          <tr> 
                            <td><%= v_contents %></td>
                          </tr>
                          <tr> 
                            <td height="7"></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ������������ �� ---------------->
            <br>
            <br>
<% if(v_status.equals("Y")){        //������ ������ ������ ���   
%>

            <!----------------- ����, ��� ��ư ���� ---------------->

            <table border=0 cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td width="13" valign="bottom"><img src="/images/user/study/icon2.gif" width="13" height="11" border="0"></td>
                <td valign="bottom"><b>������ ���� ����</b></td>
                <td align="right" width="220">

                <%if(v_issubmit.equals("N")){%>
                    <a href="javascript:halfregist();"><img src="/images/user/button/btn_midsave.gif" border="0"></a>&nbsp;
                <%}%>
                <% if (dataStep.getTstep()<0.00) { %> 
                	<a href="javascript:alert('���� ������ <%=dataStep.getTstep()%>%�Դϴ�.\n80% �̻�� ����Ʈ ������ �����մϴ�.')"><img src="/images/user/button/btn_register.gif"border="0"></a>
                <% } else {%>
	                <a href="javascript:whenProjectRep()"><img src="/images/user/button/btn_register.gif" border="0"></a>
                <% } %>
                &nbsp;<a href="javascript:history.back()"><img src="/images/user/button/btn_cancel.gif"  border="0"></a>
                </td>
              </tr>                      
                                    
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <!----------------- ����, ��� ��ư �� ---------------->

            <!----------------- ������ ���� ���� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_vertical_table_out">
              <tr> 
                <td width="3" class="board_color_line"></td>
                <td> 
                  <table cellspacing="1" cellpadding="1" class="table2">
                    <tr> 
                      <td class="board_title_bg2" width="150"> </td>
                      <td class="table_text3"> 
                      <%if(v_ansyn.equals("U")){%><!--�������������-->
                        &nbsp;<input type=radio name='p_ansyn'  value='<%=v_ansyn%>' checked OnClick="SelectAnsyn('ALL');">ALL 
                        &nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>'  OnClick="SelectAnsyn('TEXT');">TEXT�Է¹��    
                        &nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>'  OnClick="SelectAnsyn('FILE');">���Ͼ��ε�                                              
                        
                      <%}else if(v_ansyn.equals("T")){%><!--TEXT�Է¹��-->
                        <!--&nbsp;<input type=radio name='p_ansyn'  value='<%=v_ansyn%>'  OnClick="SelectAnsyn('ALL');">ALL -->
                        &nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>' checked OnClick="SelectAnsyn('TEXT');">TEXT�Է¹��    
                        <!--&nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>'  OnClick="SelectAnsyn('FILE');">���Ͼ��ε�  -->
                      
                      <%}else if(v_ansyn.equals("F")){%> <!--���Ͼ��ε�-->
                        <!--&nbsp;<input type=radio name='p_ansyn'  value='<%=v_ansyn%>'  OnClick="SelectAnsyn('ALL');">ALL -->
                        <!--&nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>'  OnClick="SelectAnsyn('TEXT');">TEXT�Է¹��    -->
                        &nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>' checked OnClick="SelectAnsyn('FILE');">���Ͼ��ε�  

                      <%}%> 
                      </td>
                    </tr>                  
                    <tr> 
                      <td class="board_title_bg2" width="150">���� *</td>
                      <td class="table_text3"> 
                        <input size="90" maxlength="50" name="p_title" class="input" value="<%=v_title2%>">
                      </td>
                    </tr>
                    <tr id="tabtext_1" > 
                      <td class="board_title_bg2">����</td>
                      <td class="table_text3"> 
                        <!--<textarea name="p_contents" cols="85" rows="15" class="input"><%=v_contents2 %></textarea>-->
						<!-- DHTML Editor  -->
			            <%//@ include file="/portal/include/DhtmlEditor.jsp" %>
    		            <%@ include file="/include/DhtmlEditor.jsp" %>
                        <!-- DHTML Editor  -->                          
                      </td>
                    </tr>
                    <tr id="tabfile_2" > 
                      <td class="board_title_bg2" width="140">÷������</td>
                      <td class="table_text3"> 
                        <table cellspacing="0" cellpadding="0" class="table2">
                          <tr> 
                            <td width="100%"> 
                              <input type="file" name="p_file1" size="70" class="input"> 
                              <% if(v_upfile1.length() > 0){ %> 
                              <br>������ ���� : <a href = '/servlet/controller.library.DownloadServlet?p_year=<%=v_year%>&p_subj=<%=v_subj%>&p_savefile=<%= v_upfile1 %>&p_realfile=<%= v_upfile1_value %>'><%=v_upfile1_value%></a> (<%=v_upfilesize%>Byte)
							  <input type="checkbox" name="p_check" value="Y"> �������� ����
							  
                              <% } %>
                            </td>
                            <td></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2" width="150">����</td>
                      <td class="table_text3"><%=v_score%></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ������ ���� ���� �� ---------------->
<% }else if(v_status.equals("N")){ %>
            <!----------------- ����, ��� ��ư ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td width="13" valign="bottom"><img src="/images/user/study/icon2.gif" width="13" height="11" border="0"></td>
                <td valign="bottom"><b>������ ���� ����</b></td>
                <td align="right" width="61">
                <a href="javascript:history.back()"><img src="/images/user/button/btn_cancel.gif" border="0"></a>
                </td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <!----------------- ����, ��� ��ư �� ---------------->
            <!----------------- ������ ���� ���� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_vertical_table_out">
              <tr> 
                <td width="3" class="board_color_line"></td>
                <td> 
                  <table cellspacing="1" cellpadding="1" class="table2">
                    <tr> 
                      <td class="board_title_bg2" width="150">�� �� *</td>
                      <td class="table_text3"><%=v_title2%></td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2">�� ��</td>
                      <td class="table_text3">
                      <% if(v_contents2.length() > 0){ %>
                      <%=  v_contents2 = StringManager.replace(v_contents2,"\r\n","<br>") %>     
                      <% } %>                 
                       </td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2" width="150">÷������</td>
                      <td class="table_text3"> 
                        <table cellspacing="0" cellpadding="0" class="table2">
                          <tr> 
                            <td width="100%">
                              <% if(v_upfile1.length() > 0){ %> 
                              <a href = '/servlet/controller.library.DownloadServlet?p_year=<%=v_year%>&p_subj=<%=v_subj%>&p_savefile=<%= v_upfile1 %>&p_realfile=<%= v_upfile1_value %>'><%=v_upfile1_value%></a>
                              <% } %>
                            </td>
                            <td></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2" width="150">�� ��</td>
                      <td class="table_text3"><%=v_score%></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ������ ���� ���� �� ---------------->
<% } %>            

            <br>
            <br>




            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td width="13"><img src="/images/user/study/icon2.gif" width="13" height="11" border="0"></td>
                <td><b>���� ÷�賻��</b></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>      


		<% System.out.println("isret="+v_isret); %>
     
            <!----------------- ���� ÷�賻�� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr> 
                      <td class="board_title_bg1">����</td>
                    </tr>
                    <tr> 
                      <td class="board_text1" height="27"><%=v_tucontents%></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ���� ÷�賻�� �� ---------------->
            <br>
            <br>   
			
			<% if (v_isret.equals("Y")) { %>
			<table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td width="13"><img src="/images/user/study/icon2.gif" width="13" height="11" border="0"></td>
                <td><b>���� �ݷ�����</b></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>      

            <!----------------- ���� �ݷ����� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="3" class="table2">
                    
                    <tr> 
                      <td class="board_text1" height="27"><%=v_retreason%></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ���� �ݷ����� �� ---------------->
            <br>
            <br>   
			<% } %>

<%
    if(v_reptype.equals("C")){        //COP�� ��� ���������� ����Ʈ
      
        String v_couserid   = "";
        String v_coname     = "";
        String v_ldate      = "";
        int    v_score1     =  0;          
        ArrayList list = (ArrayList)request.getAttribute("selectCoprepList");
%>
     
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td width="13"><img src="/images/user/study/icon2.gif" width="13" height="11" border="0"></td>
                <td><b>������� �򰡺���</b></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>        
            <!----------------- ������� �򰡺��� ���� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td class="board_color_line"></td>
              </tr>
            </table>
            <table cellspacing="0" cellpadding="0" class="open_board_table_out2">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr> 
                      <td class="board_title_bg1" width="7%">��ȣ</td>
                      <td class="board_title_bg1" width="15%">�ۼ���</td>
                      <td class="board_title_bg1" width="15%">�ۼ���</td>
                      <td class="board_title_bg1" width="10%">����</td>
                    </tr>
     <% 
            for(i = 0; i < list.size(); i++) {        
                ProjectData data  = (ProjectData)list.get(i);
                v_couserid   = data.getCouserid();
                v_coname     = data.getConame();    
                v_ldate      = data.getLdate();     
                v_score1     = data.getScore();
                if(v_ldate != null){ v_ldate    = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd"); }
      %>          
                    <tr> 
                      <td class="board_text1" height="27"><%= list.size() - i %></td>
                      <td class="board_text1" height="27"><%= v_coname %></td>
                      <td class="board_text1" height="27"><%= v_ldate %></td>
                      <td class="board_text1" height="27"><%= v_score1 %></td>
                    </tr>
        <% } if(i == 0){ %>  
                      <td class="board_text1" height="27" colspan="4">���� �򰡰� �����ϴ�.</td>
                    <% } %>                                    
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ������� �򰡺��� ���� �� ---------------->
<% } %>




            <br>





          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>

<%if(v_status.equals("Y")){ %>
<SCRIPT LANGUAGE="JavaScript">
<!--
<%if(v_ansyn.equals("U")){%><!--�������������-->
		    document.all["tabtext_1"].style.display = "";
		    document.all["tabfile_2"].style.display = "";                                       
<%}else if(v_ansyn.equals("T")){%><!--TEXT�Է¹��-->
			document.all["tabtext_1"].style.display = ""
			document.all["tabfile_2"].style.display = "none";
<%}else if(v_ansyn.equals("F")){%> <!--���Ͼ��ε�-->
		    document.all["tabtext_1"].style.display = "none";
			document.all["tabfile_2"].style.display = ""
<%}%> 
//-->
</SCRIPT>  
<%}%> 
</body>
</html>
