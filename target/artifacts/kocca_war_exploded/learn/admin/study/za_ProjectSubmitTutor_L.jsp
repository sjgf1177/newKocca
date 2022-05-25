<%
//**********************************************************
//  1. ��      ��: PROJECT SUBMIT ADMIN LIST
//  2. ���α׷���: za_ProjectSubmitAdmin_L.jsp
//  3. ��      ��: ����Ʈ �� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
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
	String  v_subjseqgr   = "";
    String  v_isclosed  = "";
    String  v_subjnm    = "";
    String v_isnewcourse =""; 
    String  v_course    = "";    
    String  v_cyear     = "";
    String  v_courseseq = "";          
    String  v_isonoff   = "";
    String  v_pjcnt     = "";
    String  v_micnt     = "";    
    String  v_coursenm  = "";   
    String  v_closed_value = "";
    String  v_onoff_value  = "";
    int     v_rowspan   =  0;       
    int     i            = 0;
    ArrayList list1      = null; 
    //DEFINED class&variable END

    //DEFINED in relation to select START
    
	String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_grseq     = box.getStringDefault("s_grseq","ALL");            //��������
    String  ss_grseqnm   = box.getString("s_grseqnm");          //����������
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����


    String  ss_action    = box.getString("s_action");
    String  v_ongo      = "whenSelection('go')";       

    //DEFINED in relation to select END
        
    if(ss_action.equals("go")){    //go button ���ýø� list ���
        list1 = (ArrayList)request.getAttribute("projectSubmitAList");      
    }    
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    
    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
$(document).ready(function(){
	$("#p_propstart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propstart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
    function whenSelection(ss_action) {
      if (ss_action=="go")	{
//            if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
  //              alert("�����ְ��� �����ϼ���.");
    //            return ;
      //      }
            top.ftop.setPam();
      }
//�ӽ�      document.form1.s_action.value = ss_action;
      document.form1.action='/servlet/controller.study.ProjectAdminServlet';
      document.form1.p_process.value = 'ProjectSubmitTutor';      
      document.form1.submit();
    }
    
    function projectlist_select(subj,subjnm,year,subjseq) {
        document.form1.action='/servlet/controller.study.ProjectAdminServlet';
        document.form1.p_process.value = 'ProjectSubmitList';
        document.form1.p_subj.value = subj;        
        document.form1.p_subjnm.value = subjnm;        
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

// �ӽ�    document.form1.s_action.value = "go";

    document.form1.p_orderColumn.value = column;
    whenSelection("go");
}
-->    	
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
    <form name="form1" method="post" action="">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="s_action"  value="<%=ss_action%>">    <!--in relation to select-->    
    <input type="hidden" name="p_subj">
    <input type="hidden" name="p_subjnm">
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
          <td><img src="/images/admin/course/co_title08.gif" ></td>
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
										  <td width="45%" colspan="2">�н��Ⱓ
											<input name="p_propstart1" id="p_propstart1" type="text" class="datepicker_input1" size="10" value=""> �� ~ 
											<input name="p_propstart1" id="p_propstart1" type="text" class="datepicker_input1" size="10" value=""> ��
										   </td>
				  		 					<td width="45%">
											<!-- �����ְ� ���� -->
				  								<!--<%= SelectEduBean.getGrcode(box, true, true)%>--> <!-- getGrcode(RequestBox, isChange, isALL)   �����ְ�  -->
											<!-- �����ְ� ���� -->
				  							</td>
				  							<!-- <td width="75%">
											<!-- �����⵵, �з� ���� ->
				  								<%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
				  								<!-- <input type="hidden" name="s_grseq"  value="0001">
				  								&nbsp;<%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
				  								<!--&nbsp;<%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
				  								<!--&nbsp;<%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
											<!-- �����⵵, �з� �� ->
				  							</td> -->
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
        <br>

        <!----------------- Activity ������� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="10" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="5%" class="table_title"><b>NO</b></td>
            <td class="table_title"><a href="javascript:whenOrder('grcode')" class="e">�����׷�</a></td>
            <td class="table_title"><a href="javascript:whenOrder('gyear')" class="e">�����⵵</a></td>
            <td class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">ȸ���</a></td>
            <td class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">�н��Ⱓ</a></td>
            <td class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">����</a></td>
            <td class="table_title"><a href="javascript:whenOrder('pjcnt')" class="e">���ⰳ��</a></td>
            <td class="table_title" width="15%"><b>����Ʈ list ��ȸ</b></td>
            <td class="table_title"><a href="javascript:whenOrder('micnt')" class="e">��ä��</a></td>
            <td class="table_title" width="10%"><b>��������</b></td>
          </tr>
          <% 
            if(ss_action.equals("go")){    //go button ���ýø� list ���
                for(i = 0; i < list1.size(); i++) {
                    ProjectData data= (ProjectData)list1.get(i);
                    v_course        = data.getCourse();
                    v_cyear         = data.getCyear();
                    v_courseseq     = data.getCourseseq();
                    v_coursenm      = data.getCoursenm();                          
                    v_subj      = data.getSubj();     
                    v_year      = data.getYear();     
                    v_subjseq   = data.getSubjseq();  
					v_subjseqgr   = data.getSubjseqgr();  
                    v_isclosed  = data.getIsclosed(); 
                    v_subjnm    = data.getSubjnm();   
                    v_isonoff   = data.getIsonoff();  
                    v_pjcnt     = data.getPjcnt();  
                    v_micnt     = data.getMicnt();  
                    v_rowspan   = data.getRowspan();
                    v_isnewcourse=data.getIsnewcourse();
                    if(v_isclosed.equals("Y"))      {  v_closed_value = "�Ϸ�";   }
                    else                            {  v_closed_value = "������"; }
                    //else if(v_isclosed.equals("N")) {  v_closed_value = "������"; }                    
                    if(v_isonoff.equals("ON"))      {  v_onoff_value  = "���̹�����"; }
                    else                            {  v_onoff_value  = "���հ���";   } 
                    //else if(v_isonoff.equals("OFF")){  v_onoff_value  = "���հ���";   } 
               %>
          <tr> 
            <td class="table_01"><%= i+1 %></td>
            <td class="table_02_1"></td>
            <td class="table_02_1"></td>
            <td class="table_02_1">�����ڵ���</td>
            <td class="table_02_1">2005.01.01~2005-01.31</td>
            <%  if(v_course.equals("000000")){   %>
            <!-- ������ ��� -->
            <td class="table_02_1"> <%=v_subjnm%> </td>
            <% }else if(v_isnewcourse.equals("Y")){ %>
            <!-- �ڽ��̸鼭 ���� �ڽ��� ��ġ���� �ʴ°�� -->
            <!--td class="table_02_1" rowspan="<%=v_rowspan%>">
                 <font class="text_color03">[�ڽ�] <%=v_coursenm%><%=v_courseseq%></font>
                 </td-->
            <% } %>
            <%  if(!v_course.equals("000000")){   %>
            <!-- �ڽ��� ��� -->
            <!--td class="table_02_1">
                <a href="javascript:projectlist_select('<%=v_subj%>','<%=v_subjnm%>','<%=v_year%>','<%=v_subjseq%>')" class="b"><%=v_subjnm%></a>
                </td-->
            <% } %>
            <td class="table_02_1"><%=v_pjcnt%>��</td>
            <td class="table_02_1"> <a href="javascript:projectlist_select('<%=v_subj%>','<%=v_subjnm%>','<%=v_year%>','<%=v_subjseq%>')"><img src="/images/admin/button/b_reportlist.gif" border="0"></a> 
            </td>
            <td class="table_02_1"><%=v_micnt%>��</td>
            <td class="table_02_1"><%=v_closed_value%></td>
          </tr>
          <% 
              } 
          }  
          if(ss_action.equals("go") && i == 0){ %>
          <tr> 
            <td class="table_02_1" colspan="8">��ϵ� ������ �����ϴ�</td>
          </tr>
          <%  } %>
        </table>
        <!----------------- Activity ������� �� ----------------->
        <br>
     </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>    
</table>
</form>

</body>
</html>
