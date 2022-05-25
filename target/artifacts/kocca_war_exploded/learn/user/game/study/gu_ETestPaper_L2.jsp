
<%
/**
 * file name : gu_EtestPaper_L2.jsp
 * date      : 2005/12/14
 * programmer:	lyh
 * function  : ���ǰ��ι� e-Test list ���
 */
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.etest.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    String  ss_userid    = box.getSession("userid");
    box.put("leftmenu","06"); 
    
    String v_updir = conf.getProperty("dir.etest.paperpath");       

	String today = FormatDate.getDate("yyyyMMddHHmmss");
    
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topMystudy.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--


// �˾�
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

// e-test ���� ��
function etestWright(p_etestsubj, p_year, p_etestcode,p_startdt,p_enddt,p_etestnum,p_trycnt){
    var now = document.form1.p_servertime.value;
    if (now < p_startdt) {
        alert("���� ����ð��� �ƴմϴ�.");
        return;
    }else if(now > p_enddt) {
        alert("������ �̹� ����ƽ��ϴ�.");
        return;
    }
    
	if(p_trycnt> 0){
		if (confirm("������ �����ϼ̴� ���������� �����ǰ� �������Ͻ� ������ �ݿ��˴ϴ�.\r\n�׷��� �����Ͻðڽ��ϱ�?")){
			p_trycnt = p_trycnt; 
		} else {return;} 	
	}	
      
      window.self.name = "winIndividualInsertPage";     //      opener ��ü�� name �� �����Ѵ�
	  farwindow = window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=690, height=600, top=0, left=0");
	  document.form1.target = "openWinInsert"
	  document.form1.p_process.value = 'ETestUserPaperListPage';
    
      document.form1.p_etestsubj.value  = p_etestsubj; 
	  document.form1.p_gyear.value		= p_year; 
	  document.form1.p_etestcode.value	= p_etestcode;
	  document.form1.p_startdt.value	= p_startdt;
	  document.form1.p_enddt.value		= p_enddt;
	   
    document.form1.p_etestnum.value = p_etestnum;
    
    document.form1.action = "<%=v_updir%>" + p_year + "_" + p_etestsubj + "/" + p_etestsubj + p_year + p_etestcode + p_etestnum + ".jsp";
   // alert(document.form1.action);
   //alert(p_enddt);
    
    //document.form1.action = "/servlet/controller.etest.ETestUserServlet";
    document.form1.submit();

    farwindow.window.focus();
    document.form1.target = window.self.name;
    
}

// e-test �Ϸ� ��
function IndividualResult(p_etestsubj, p_year, p_etestcode, p_userid, p_etesttext, p_average, p_personcnt,p_isopenexp) {

  //if(p_isopenexp == 'Y'){
	  window.self.name = "winIndividualResult";
	  farwindow = window.open("", "openIndividualResult", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=690, height=600, top=0, left=0");
	  document.form2.target = "openIndividualResult";
	  document.form2.action = "/servlet/controller.etest.ETestUserServlet";
	  document.form2.p_process.value = "ETestUserPaperResult2";
	  
	  document.form2.p_etestsubj.value  = p_etestsubj; 
	  document.form2.p_gyear.value		= p_year; 
	  document.form2.p_etestcode.value	= p_etestcode; 
	  document.form2.s_etestsubj.value  = p_etestsubj; 
	  document.form2.s_gyear.value		= p_year; 
	  document.form2.s_etestcode.value	= p_etestcode; 
	  document.form2.p_etesttext.value  = p_etesttext; 
	  document.form2.p_userid.value		= p_userid;
	  document.form2.submit();
	
	  farwindow.window.focus();
	  document.form2.target = window.self.name;
	//}else{
	 //alert("�ؼ��� ������ �������� �ʽ��ϴ�");
	//}	  
}


// �з��� ������� 
function GubunResult(p_etesttext,p_etestsubj, p_year, p_etestcode) {

  window.self.name = "winGubunResult";
  farwindow = window.open("", "openGubunResult", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=800, height=600, top=0, left=0");
  document.form2.target = "openGubunResult";
  document.form2.action = "/servlet/controller.etest.ETestResultServlet";
  document.form2.p_process.value = "ETestGubunResult";

  document.form2.p_etesttext.value  = p_etesttext;   
  document.form2.p_etestsubj.value  = p_etestsubj; 
  document.form2.p_gyear.value      = p_year; 
  document.form2.p_etestcode.value  = p_etestcode; 
  document.form2.p_etestcode.value  = p_etestcode; 
  document.form2.submit();

  farwindow.window.focus();
  document.form2.target = window.self.name;
}


function EtestReload(){
	self.location="/servlet/controller.etest.ETestUserServlet?p_process=ETestUserListPage";
}
//-->
</script>
<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/mystudy/<%=tem_subimgpath%>/tit_etest.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > ���� ���ι� > E-Test</td>
  </tr>
  <tr> 
    <td height="20">
      <!--e-test-->
    </td>
  </tr>
</table>
<table width="675" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="474" valign="top"><img src="/images/user/game/mystudy/st_sub_etest01.gif" width="77" height="13"> 
    </td>
    <td width="201" align="right" valign="top">&nbsp;</td>
  </tr>
  <tr> 
    <td height="5" colspan="2"></td>
  </tr>
  <tr> 
    <td colspan="2" class="font_ex"><img src="/images/user/game/mystudy/text_etest01.gif" width="248" height="11"></td>
  </tr>
  <tr> 
    <td height="5" colspan="2"></td>
  </tr>
  <tr valign="top"> 
    <td colspan="2"> 
      <!--e-test��-->

<%
         ArrayList blist = (ArrayList)request.getAttribute("ETestUserList");
		 DataBox dbox01 = null;
		 if(blist.size() > 0){
		     dbox01 = (DataBox)blist.get(0);
		 }else{
		     dbox01 = new DataBox("resoponsebox");
		 }

		 int count = 0;
		 int count2=0;

%>
 <form name="form1" method="post" action="/servlet/controller.etest.ETestUserServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="p_etestsubj"    value="<%=dbox01.getString("d_etestsubj")%>">
        <input type="hidden" name="p_gyear"  value="<%=dbox01.getString("d_year")%>">
        <input type="hidden" name="p_etestcode"  value="<%=dbox01.getString("d_etestcode")%>">
        <input type="hidden" name="p_startdt"  value="<%=dbox01.getString("d_startdt")%>">
        <input type="hidden" name="p_enddt"  value="<%=dbox01.getString("d_enddt")%>">
        <input type="hidden" name="p_etestnum"  value="">
        <input type="hidden" name="p_userid"  value="">
        <input type="hidden" name="p_servertime" value="<%=today%>">
</form>



      <table width="720" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
        <tr  class="lcolor"> 
          <td height="3" colspan="8" class="linecolor_my"></td>
        </tr>
        <tr> 
			<td width="10%" class="tbl_ptit2">��ȣ</td>
			<td width="25%" class="tbl_ptit">�׽�Ʈ��</td>
			<td width="8%" class="tbl_ptit2">����</td>
			<td width="7%" class="tbl_ptit">������</td>
			<td width="15%" class="tbl_ptit2">���ӽ��۽ð�</td>
			<td width="15%" class="tbl_ptit">��������ð�</td>
			<td width="10%"  class="tbl_ptit2">����ð�</td>
			<td width="10%"  class="tbl_ptit2">����Ƚ��</td>                            
        </tr>
<%
		int v_trycnt =0;
		int v_retrycnt =0;
        for (int i=0; i<blist.size(); i++) {
            count ++; 
            DataBox dbox = (DataBox)blist.get(i);   
			//System.out.println("d_papercnt=="+dbox.getInt("d_papercnt"));
			Random ran = new Random();
      		int random = 0;
			//while(random==0){
				random = ran.nextInt(dbox.getInt("d_papercnt"))+1;
				//System.out.println("random=="+random);
			//	 break;
			//}
			
			v_trycnt = dbox.getInt("d_trycnt");
			v_retrycnt = dbox.getInt("d_retrynum");
    
%>
                          <tr> 
                            <td class="tbl_grc"><%=String.valueOf(i+1)%></td>
                            <td class="tbl_bleft">                                     
							<% if(v_trycnt < v_retrycnt){ %><a href="javascript:etestWright('<%=dbox.getString("d_etestsubj")%>','<%=dbox.getInt("d_year")%>','<%=dbox.getString("d_etestcode")%>','<%=dbox.getString("d_startdt")%>','<%=dbox.getString("d_enddt")%>','<%=random%>',<%=v_trycnt%>)"><% }else{ %>
                                              <a href="javascript:alert('�̹� ���� �ϼ̽��ϴ�.')"><% } %>
                                              <%=String.valueOf(dbox.getString("d_etesttext"))%>
                                              </a>
							</td>
                            <td class="tbl_grc"><%=dbox.getInt("d_year")%></td>
                            <td class="tbl_grc"><%=dbox.getInt("d_etestcnt")%></td>
                            <td class="tbl_grc"><%=FormatDate.getFormatDate(dbox.getString("d_startdt"),"yyyy-MM-dd HH:mm")%></td>
                            <td class="tbl_grc"><%=FormatDate.getFormatDate(dbox.getString("d_enddt"),"yyyy-MM-dd HH:mm")%></td>
                            <td class="tbl_grc"><%=dbox.getInt("d_etesttime")%>��</td>
                            <td class="tbl_grc"><%=v_trycnt%>/(�� <%=v_retrycnt%>ȸ)</td>                            
                          </tr>
<%    
        } 

%>

		  <% if(count == 0){ %>
		  <tr>
			<td align=center class=boardskin1_textn colspan="8">�ش��ϴ� �׽�Ʈ�� �����ϴ�.</td>
		  </tr>
		  <% } %>

        <tr  bgcolor="#ededed"> 
          <td height="2" colspan="6"></td>
        </tr>
      </table></td>
  </tr>

  <tr> 
    <td height="20" colspan="2"></td>
  </tr>
  <tr> 
    <td colspan="2"><img src="/images/user/game/mystudy/st_sub_etest02.gif" width="76" height="13"></td>
  </tr>
  <tr> 
    <td height="5" colspan="2"></td>
  </tr>
  <tr> 
    <td colspan="2" class="font_ex"><img src="/images/user/game/mystudy/text_etest02.gif" width="446" height="14">.</td>
  </tr>
  <tr> 
    <td height="5" colspan="2"></td>
  </tr>
  <tr valign="top"> 
    <td colspan="2"> 
      <!--e-test���-->

<%
         ArrayList blist1 = (ArrayList)request.getAttribute("ETestUserHistoryList");
		 DataBox dbox0 = null;
		 if(blist1.size() > 0){
		     dbox0 = (DataBox)blist1.get(0);
		 }else{
		     dbox0 = new DataBox("resoponsebox");
		 }

%>
 <form name="form2" method="post" action="/servlet/controller.etest.ETestUserServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="p_etestsubj"    value="<%=dbox01.getString("d_etestsubj")%>">
        <input type="hidden" name="p_gyear"  value="<%=dbox01.getString("d_year")%>">
        <input type="hidden" name="p_etestcode"  value="<%=dbox01.getString("d_etestcode")%>">
        <input type="hidden" name="s_etestsubj"    value="<%=dbox01.getString("d_etestsubj")%>">
        <input type="hidden" name="s_gyear"  value="<%=dbox01.getString("d_year")%>">
        <input type="hidden" name="s_etestcode"  value="<%=dbox01.getString("d_etestcode")%>">
        <input type="hidden" name="p_startdt"  value="<%=dbox01.getString("d_startdt")%>">
        <input type="hidden" name="p_enddt"  value="<%=dbox01.getString("d_enddt")%>">
        <input type="hidden" name="p_userid"  value="">
        <input type="hidden" name="p_etesttext"  value="">
  	    <input type="hidden" name="p_personcnt"   value="1">
		<input type="hidden" name="p_average"  value="1">
		<input type="hidden" name="p_print"  value="1">
</form>
<!--�з��� ��� �μ�--><!-- �н��������� -->

      <table width="720" border="2" cellspacing="0"  
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
        <tr  class="lcolor"> 
          <td height="3" colspan="5" class="linecolor_my"></td>
        </tr>
        <tr> 
          <td width="10%" class="tbl_ptit2">��ȣ</td>
          <td width="15%" class="tbl_ptit">����</td>
          <td width="40%" class="tbl_ptit2">�׽�Ʈ��</td>
          <td width="20%" class="tbl_ptit">������</td>
          <td width="15%" class="tbl_ptit2">����</td>
        </tr>

<%
		String v_isopenanswer =""; //��������
		String v_isopenexp ="";		//�ؼ�����
		String v_ended ="";
		String v_isDo ="N";

		//jkh 0313
        int v_isnotended = 0;
        String v_score= "0";
        for (int i=0; i<blist1.size(); i++) {
            count2 ++; 
            DataBox dbox1 = (DataBox)blist1.get(i);   
            v_isopenanswer = dbox1.getString("d_isopenanswer");
            v_isopenexp = dbox1.getString("d_isopenexp");
            v_ended =dbox1.getString("d_ended");
             v_isDo ="N"; 
            if(v_ended.length() >0){ v_isDo ="Y"; }
            
			//jkh 0313	
			 v_trycnt = dbox1.getInt("d_trycnt");
			 v_isnotended = dbox1.getInt("d_isnotended");
			 
			 if(v_trycnt > 0 || v_isnotended < 0){
			     v_score = dbox1.getInt("d_score")+"";
%>

                          <tr> 
                            <td class="tbl_grc"><%=String.valueOf(i+1)%></td>
                            <td class="tbl_grc"><%=dbox1.getInt("d_year")%></td>
                            <td class="tbl_grc">
								  <% if("Y".equals(v_isDo)) { %>
									<a href="javascript:IndividualResult('<%=dbox1.getString("d_etestsubj")%>','<%=dbox1.getString("d_year")%>','<%=dbox1.getString("d_etestcode")%>','<%=ss_userid%>','<%=dbox1.getString("d_etesttext")%>','1','1','<%=v_isopenexp%>')" class="e"><%=String.valueOf(dbox1.getString("d_etesttext"))%></a></td>
								  <% }else{ %>
									<%=String.valueOf(dbox1.getString("d_etesttext"))%>
								  <% } %>
							</td>
                            <td class="tbl_grc">
								  <% if("Y".equals(v_isDo)) { %>
								  <%=FormatDate.getFormatDate(dbox1.getString("d_ended"),"yyyy-MM-dd HH:mm:ss")%>
								  <% }else{ %>
									<% if(v_trycnt > 0) { v_score ="" ; %>
										����ݿ���
									<% }else{ %>
										������
									<% } %>
								  <% } %>							
							</td>
                            <td class="tbl_grc">
								  <% if("Y".equals(v_isopenanswer)){ %>
								  <%=v_score%>
								  <% }else{ %>
								  �����
								  <% }%>							
							</td>
                          </tr>
<%    
        	}
        } // for end
%>
						  <% if(count2 == 0){ %>
						  <tr>
							<td class=boardskin1_textn colspan="8" align=center>�׽�Ʈ �̷��� �����ϴ�.</td>
						  </tr>
						  <% }%>

                        </table>
        <tr> 
          <td height="26" class="tbl_grc">&nbsp;</td>
          <td height="26" class="tbl_grc">&nbsp;</td>
          <td height="26" class="tbl_grc">&nbsp;</td>
          <td class="tbl_bleft">&nbsp;</td>
          <td class="tbl_grc">&nbsp;</td>
          <td class="tbl_grc">&nbsp;</td>
        </tr>
      </table>
	  </td>
  </tr>
</table>
            
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->