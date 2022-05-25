<%
//**********************************************************
//  1. ��      ��: ����Ʈ
//  2. ���α׷���: za_Reporting_L.jsp
//  3. ��      ��: 
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" /><%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
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
    String  ss_action    = box.getString("s_action");
    String  p_month      = box.getString("p_month"); // ��

     //���� �� ��������
     Calendar cal = Calendar.getInstance();
     SimpleDateFormat df_2 = new SimpleDateFormat("MM");
     String s_month = df_2.format(cal.getTime());       
     if(!p_month.equals("")) s_month = p_month; 

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    // �˻�
    function whenSelection(ss_action) {
        if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
            alert("�����׷��� �����ϼ���.");
            return ;
        }
        document.form1.target = "_self";  
        document.form1.action = "/servlet/controller.course.ReportingServlet";
        document.form1.p_process.value = "Reporting";
        document.form1.submit();
    }

    // ���� ��������
    function whenExcel(gubun) {
        if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
            alert("�����׷��� �����ϼ���.");
            return ;
        }
        window.self.name = "reporting";
        document.form1.target = "openExcel1";
              
        var v_grcode = document.form1.s_grcode.value;
        var v_gyear  = document.form1.s_gyear.value;
        var v_grseq  = document.form1.s_grseq.value;
        var v_param  = '?s_grcode='+v_grcode+'&s_gyear='+v_gyear+'&s_grseq='+v_grseq;    
                
        if(gubun==1){
            open_window("openExcel1","","100","100","800","600","yes","yes","yes","yes","yes");        
            document.form1.action='/servlet/controller.course.ReportingServlet'; 
            document.form1.p_process.value = 'SulmunFiveScale';            
        }else if(gubun==2){
            open_window("openExcel1","","100","100","800","600","yes","yes","yes","yes","yes");                
            document.form1.action='/servlet/controller.course.ReportingServlet';         
            document.form1.p_process.value = 'SulmunFiveScaleSubj';             
        }else if(gubun==3){
            open_window("openExcel1","","100","100","800","600","yes","yes","yes","yes","yes");                
            document.form1.action='/servlet/controller.course.ReportingServlet';         
            document.form1.p_process.value = 'SulmunThought';
        }else if(gubun==4){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/servlet/controller.course.ReportingServlet';         
            document.form1.p_process.value = 'PremiumStudent';
        }else if(gubun==5){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/servlet/controller.course.ReportingServlet';         
            document.form1.p_process.value = 'NotgraduStudent';           
        }else if(gubun==6){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/za_EduResult_E.jsp'+v_param;                       
        }else if(gubun==7){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/za_SulmunTotal_E.jsp'+v_param;                       
        }else if(gubun==8){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/za_SubjTime_E.jsp'+v_param;                                        
        }else if(gubun==9){

            if (document.form1.s_grseq.value == 'ALL' || document.form1.s_grcode.value == '----') {
                alert("���������� �����ϼ���.");
                return ;
            }
                    
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/Gayo_E.jsp'+v_param;                                        
        }

        document.form1.submit();
    }


    // ����Ʈ ��������
    function whenExcel2(gubun) {
        if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
            alert("�����׷��� �����ϼ���.");
            return ;
        }
        window.self.name = "reporting";
        document.form1.target = "openExcel1";
              
        var v_grcode = document.form1.s_grcode.value;
        var v_gyear  = document.form1.s_gyear.value;
        var v_grseq  = document.form1.s_grseq.value;
        var v_param  = '?s_grcode='+v_grcode+'&s_gyear='+v_gyear+'&s_grseq='+v_grseq;    
                
        if(gubun==1){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re1_StudyStatus_E.jsp'+v_param;             
        }else if(gubun==2){
            open_window("openExcel1","","100","100","800","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re2_Sulmun_E.jsp'+v_param;       
        }else if(gubun==4){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re4_SubjCode_E.jsp'+v_param;       
        }else if(gubun==5){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re6_PremiumStudent_E.jsp'+v_param;                  
        }else if(gubun==6){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re8_ToturList_E.jsp'+v_param;   
        }else if(gubun==7){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re8_ToturDataList_E.jsp'+v_param;               
        }else if(gubun==9){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re9_Member_E.jsp'+v_param;               
        }else if(gubun==8){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re10_CourseSubjList_E.jsp'+v_param;                              
        }else if(gubun==10){
            open_window("openExcel1","","100","100","800","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re12_Etest_E.jsp'+v_param;     
        }else if(gubun==11){
            open_window("openExcel1","","100","100","800","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re13_WeekReport_E.jsp'+v_param;                   
        }else if(gubun==12){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re12_MonthReport_E.jsp?p_month='+document.form1.p_month.value;       
        }else if(gubun==13){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re13_EduTerm_E.jsp?p_month='+document.form1.p_month.value; 			
        }else if(gubun==14){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/re14_SangdamList_E.jsp'+v_param;              
        }else if(gubun==15){
            open_window("openExcel1","","100","100","900","600","yes","yes","yes","yes","yes");                
            document.form1.action='/learn/admin/course/za_Sangdam_E.jsp'+v_param;                                   
        }

        document.form1.submit();
    }  
-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
    <form name="form1" method="post" action="">
    <input type="hidden" name="p_process" value="<%=v_process%>">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/tit_reporting.gif" ></td>
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
                                            <td width="90%"><font color="red">��</font> 
                                            <!-- �����׷� ���� -->
                                                <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                                            <!-- �����׷� ���� -->
                                            <!-- �����⵵, �з� ���� -->
                                                <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
                                                <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
                                                &nbsp;[������ �˻�]
                                                <select name='p_month'>
                                                    <option value='01' <%if(s_month.equals("01")){%>selected<%}%>>1��</option>
                                                    <option value='02' <%if(s_month.equals("02")){%>selected<%}%>>2��</option>
                                                    <option value='03' <%if(s_month.equals("03")){%>selected<%}%>>3��</option>
                                                    <option value='04' <%if(s_month.equals("04")){%>selected<%}%>>4��</option>
                                                    <option value='05' <%if(s_month.equals("05")){%>selected<%}%>>5��</option>
                                                    <option value='06' <%if(s_month.equals("06")){%>selected<%}%>>6��</option>
                                                    <option value='07' <%if(s_month.equals("07")){%>selected<%}%>>7��</option>
                                                    <option value='08' <%if(s_month.equals("08")){%>selected<%}%>>8��</option>
                                                    <option value='09' <%if(s_month.equals("09")){%>selected<%}%>>9��</option>
                                                    <option value='10' <%if(s_month.equals("10")){%>selected<%}%>>10��</option>           
                                                    <option value='11' <%if(s_month.equals("11")){%>selected<%}%>>11��</option>
                                                    <option value='12' <%if(s_month.equals("12")){%>selected<%}%>>12��</option>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                                                </select>
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
      

        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
            <td  class=sub_title>����</td>
		  </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr>
            <td bgcolor="#C6C6C6" align="center">
              <table class="form_table_bg" cellspacing="0" cellpadding="0" border='0'>
                <tr>
                  <td height="7"></td>
                </tr>
                <tr>
                  <td align="center">
                  <table border="0" cellspacing="3" cellpadding="3" width="99%" class="form_table">
        	      <tr>
        	        <td width='10%'></td>
                    <td width="40%"> <a href="javascript:whenExcel(9);">��Ȳ</a> </td>
        	        <td width='10%'></td>            
                    <td width="40%"></td>
                  </tr>                  
        	      <tr>
        	        <td width='10%'></td>
                    <td width="40%"><a href="javascript:whenExcel(6);">1.�������</a> </td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"> <a href="javascript:whenExcel(7);">2.�����м�</a> </td>        	        
                  </tr>
        	      <tr>
        	        <td width='10%'></td>
                    <td width="40%"><a href="javascript:whenExcel(8);">3.�ð��뺰 �н�����</a> </td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"> <a href="javascript:whenExcel(1);">4.5��ô��</a> </td>        	        
                  </tr>
        	      <tr>
        	        <td width='10%'></td>	      
                    <td width="40%"><a href="javascript:whenExcel(2);">5.5��ô��(������)</a> </td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"><a href="javascript:whenExcel(3);">6.�Ұ�</a> </td>        	        
                  </tr>
        	      <tr>
        	        <td width='10%'></td>	      
                    <td width="40%"><a href="javascript:whenExcel(4);">7.���������</a></td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"><a href="javascript:whenExcel(5);">8.�̼����뺸</a> </td>
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
        <!-----------------  �� ----------------->


        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
            <td  class=sub_title>����Ʈ</td>
		  </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr>
            <td bgcolor="#C6C6C6" align="center">
              <table class="form_table_bg" cellspacing="0" cellpadding="0" border='0'>
                <tr>
                  <td height="7"></td>
                </tr>
                <tr>
                  <td align="center">
                  <table border="0" cellspacing="3" cellpadding="3" width="99%" class="form_table">              
        	      <tr>
        	        <td width='10%'></td>
                    <td width="40%"><a href="javascript:whenExcel2(1);">�н���Ȳ(1)</a> </td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"> <a href="javascript:whenExcel2(2);">4�ܰ踸����(2)</a> </td>        	        
                  </tr>

        	      <tr>
        	        <td width='10%'></td>
                    <td width="40%"><!--<a href="javascript:whenExcel2(2);">����������(3)</a>--> </td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"> <a href="javascript:whenExcel2(4);">������ �����ڵ�(4)</a> </td>        	        
                  </tr>
        	      <tr>
        	        <td width='10%'></td>	      
                    <td width="40%"><a href="javascript:whenExcel2(5);">���������(5)</a> </td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"><a href="javascript:whenExcel2(6);">���纰ä������Ʈ(6)</a> </td>        	        
                  </tr>
        	      <tr>
        	        <td width='10%'></td>	      
                    <td width="40%"><a href="javascript:whenExcel2(7);">�����̷¸���Ʈ(7)</a></td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"><a href="javascript:whenExcel2(8);">���������Ʈ(8)</a> </td>
                  </tr>      
        	      <tr>
        	        <td width='10%'></td>	      
                    <td width="40%"><a href="javascript:whenExcel2(9);">�λ�DB(9)</a></td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"><a href="javascript:whenExcel2(10);">E-TEST(10)</a> </td>
                  </tr>   
        	      <tr>
        	        <td width='10%'></td>	      
                    <td width="40%"><a href="javascript:whenExcel2(11);">�ְ�����(11)</a></td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"><a href="javascript:whenExcel2(12);">������(12)</a> </td>
                  </tr>   
        	      <tr>
        	        <td width='10%'></td>	      
                    <td width="40%"><a href="javascript:whenExcel2(13);">�н��Ⱓ���ο�����(13)</a></td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"><a href="javascript:whenExcel2(14);">���λ������(14)</a> </td>
                  </tr>       
        	      <tr>
        	        <td width='10%'></td>	      
                    <td width="40%"><a href="javascript:whenExcel2(15);">������(15)</a></td>        	        
        	        <td width='10%'></td>            
                    <td width="40%"> </td>
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
        <!-----------------  �� ----------------->
                                
        <br>
     </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
