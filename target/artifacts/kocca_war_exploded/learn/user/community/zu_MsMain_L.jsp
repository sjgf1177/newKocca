<%
//**********************************************************
//  1. ��      ��: Ŀ�´�Ƽ ����Ÿ���� 
//  2. ���α׷��� : zu_MsMain.jsp
//  3. ��      ��: Ŀ�´�Ƽ ����Ÿ����.
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005.07.01 
//  7. ��      ��: 2005.07.01 
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getStringDefault("p_process","selectmsmainPage");
    String  v_cmuno      = box.getString("p_cmuno");//������ ������������ ������ ������.

    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);

/*
    ArrayList list     = (ArrayList)request.getAttribute("list");
    ArrayList list1    =new ArrayList();
    ArrayList list2    =new ArrayList();
    ArrayList list3    =new ArrayList();
    ArrayList list4    =new ArrayList();
    ArrayList list5    =new ArrayList();    
    ArrayList list6    =new ArrayList();    
     if(list.size() != 0){
       list1       = (ArrayList)list.get(0);  
       list2       = (ArrayList)list.get(1);  
       list3       = (ArrayList)list.get(2);  
       list4       = (ArrayList)list.get(3);  
       list5       = (ArrayList)list.get(4);  
       list6       = (ArrayList)list.get(5);  
    }
 */

%>  

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../../css/user_style_community2.css" rel="stylesheet" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
//��ü�˸� �������� �̵�
function uf_msPopNotice() {

   open_window('msPopNotice', '/servlet/controller.community.CommunityPopUpServlet?p_process=gomsnoticePop&p_static_cmuno=<%=box.getString("p_static_cmuno")%>&p_cmuno=<%=v_cmuno%>', 100, 100, 810, 480, 'no', 'no', 'no', 'no', 'no');
  
}
function uf_msPopMember1() {
   open_window('msPopMember1', '/servlet/controller.community.CommunityPopUpServlet?p_process=gomsmemberPop&p_static_cmuno=<%=box.getString("p_static_cmuno")%>&p_cmuno=<%=v_cmuno%>&p_cbxflag=Y', 100, 100, 610, 480, 'no', 'no', 'no', 'no', 'no');
  
}

//�⺻�������� �������� �̵�
function wf_moveRoomOK() {
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "moveroomPage";
    document.form1.submit();
}

//ȸ������ �������� �̵�
function uf_moveMsMemberJoinOK() {
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemsmemberjoinPage";
    document.form1.submit();
}

//ȸ����޺��� �������� �̵�
function uf_moveMsMemberGradeOK() {
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemsmembergradePage";
    document.form1.submit();
}

//Ŀ�´�Ƽ ��޸��� �������� �̵�
function uf_moveMsCmuGradeNmOK() {
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemsmembergradenmPage";
    document.form1.submit();
}

//Ŀ�´�Ƽ ����Ÿ���� �������� �̵�
function uf_moveMsMasterChagneNmOK() {
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemasterchagnePage";
    document.form1.submit();
}

//����Ʈ��� �������� �̵�
function uf_msPopCloseCommunity() {
   open_window('msPopNotice', '/servlet/controller.community.CommunityMasterServlet?p_process=movecommunityclosePage&p_static_cmuno=<%=box.getString("p_static_cmuno")%>&p_cmuno=<%=v_cmuno%>', 100, 100, 650, 450, 'no', 'no', 'no', 'no', 'no');
  
}

//Ŀ�´�Ƽ �޴���� �������� �̵�
function uf_moveMsMenuOK() {
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemenuPage";
    document.form1.submit();
}

//Ŀ�´�Ƽ ȸ��Ȱ����Ȳ�������� �̵��Ѵ�.
function uf_moveMsMemberActivityOK() {
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movememberactivityPage";
    document.form1.submit();
}



//Ŀ�´�Ƽ ȫ����� �������� �̵��Ѵ�.
function uf_moveMsPrOK() {
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "moveprPage";
    document.form1.submit();
}
//����,�����۷��̵�
function uf_viewOK(faqno) {
    document.form1.p_faqno.value = faqno;
    document.form1.action = "/servlet/controller.community.CommunityQnAServlet";
    document.form1.p_process.value = "viewPage";
    document.form1.submit();
}

// ���� �ۼ� �������� �̵��Ѵ�
function uf_moveMsPoll()
{
	document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    document.form1.p_process.value = "movewirtePage";
	document.form1.p_manager.value = "manager";
    document.form1.submit();
}

//-->
</script>
</head>

<body leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<form name = "form1"    method = "post">
<input type = "hidden" name = "p_process"     value="">
<input type = "hidden" name = "p_manager"     value="">
<input type = "hidden" name = "p_userid"      value = "">
<input type = "hidden" name = "p_cmuno"      value = "<%=v_cmuno%>">
<table width="900" cellspacing="3" cellpadding="3">
 <tr>
  <td> 
   <table width="890" border="0" cellspacing="0" cellpadding="0">
    <tr><td align="right"><a href="/servlet/controller.community.CommunityIndexServlet" onFocus="blur()"><img src="../../images/community/sm_home.gif" border="0"></a></td></tr>
   </table>
   <!-- �ǹٱ� �׵θ��� ���̺� -->
   <table width="890" border="1" cellspacing="0" cellpadding="5"   style="border-collapse:collapse;" bordercolor="#B7BEC1">
    <tr>
     <td valign="top">
      <!-- ��ü ��׶��� �ִ� ���̺�-->
      <table width="876" border="0" cellspacing="0" cellpadding="0">
       <tr>
        <%if(s_grtype.equals("KOCCA")){%>
			<td valign="top" background="/images/community/back_total.jpg">
		<%}else if(s_grtype.equals("KGDI")){%>
			<td valign="top" background="/images/user/game/community/back_total.jpg"><%}%>
         <!-- top table -->
         <table width="876" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="168" valign="top"><a href="/servlet/controller.community.CommunityIndexServlet" onfocus="blur()">
					<%if(s_grtype.equals("KOCCA")){%><img src="/images/user/kocca/community/top_img01.jpg" border="0"></a></td><%}else if(s_grtype.equals("KGDI")){%><img src="/images/user/game/community/top_img01.jpg" border="0"></a></td><%}%>	
				<td width="708" valign="top">
					<%if(s_grtype.equals("KOCCA")){%><img src="/images/user/kocca/community/topimg.jpg"></td>
					<%}else if(s_grtype.equals("KGDI")){%><img src="/images/user/game/community/topimg.jpg"></td><%}%>	
			</tr>
		</table>
         <!-- center table start -->
         <table width="876" border="0" cellpadding="0" cellspacing="0">
          <tr> 
           <td valign="top" style="padding-left:5px">
            <table width="860" border="0" cellspacing="0" cellpadding="0">
             <tr> 
              <!-- left -->
              <td width="174"  valign="top" background="../../images/community/bg_left.gif" style="padding-left:5px"> 
               <%@ include file="/learn/user/include/topCommunityB.jsp"%>
              </td>
              <!-- center -->
              <td width="686" rowspan="2" valign="top" background="../../images/community/bg_center.gif" > 
               <table width="686" border="0" cellspacing="0" cellpadding="0" >
                <tr><td><img src="../../images/community/center_top.gif"></td></tr>
               </table>
               <table width="686" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                 <td align="center" valign="top"> 
                  <!-- Ŀ�´�Ƽmain center start-->
                  <!-- ��üŸ��Ʋ -->
                  <table width="652" border="0" cellspacing="0" cellpadding="0">
                   <tr><td height="1" bgcolor="CCCCCC"></td></tr>
                   <tr> 
                    <td>
                     <table width="243" border="0" cellspacing="0" cellpadding="0">
                      <tr><td valign="bottom" class="title"><strong>������ ����</strong> </td></tr>
                     </table>
                    </td>
                   </tr>
                   <tr><td height="1" bgcolor="CCCCCC"></td></tr>
                   <tr><td height="10"></td></tr>
                  </table>
                  <!-- �����ڸ���Ʈ -->
                  <br>
                  <table width="652" border="0" cellspacing="0" cellpadding="0">
                   <tr> 
                    <td width="288" rowspan="3" align="right" valign="bottom"><img src="../../images/community/ma_mainimg.jpg"></td>
                    <td width="21" height="20" valign="top" background="../../images/community/ma_vlinebg.gif"><img src="../../images/community/ma_vlinetop.gif"></td>
                    <td width="171" rowspan="3" valign="top">
                     <table width="322" border="0" cellspacing="0" cellpadding="0">
                      <tr><td width="322">&nbsp;</td></tr>
                      <tr><td class="ma_list"><img src="../../images/community/ma_bl.gif"><a href="javascript:uf_msPopNotice();"> ��ü�˸�</a></td></tr>
                       <tr><td height="1" background="../../images/community/ma_line.gif"></td></tr>
                       <tr><td class="ma_list"><img src="../../images/community/ma_bl.gif"><a href="javascript:wf_moveRoomOK();"> �⺻��������</a></td></tr>
                       <tr><td height="1" background="../../images/community/ma_line.gif"></td></tr>
                       <tr><td class="ma_list"><img src="../../images/community/ma_bl.gif"><a href="javascript:uf_moveMsMenuOK();"> �޴�����</a></td></tr>
                       <tr><td height="1" background="../../images/community/ma_line.gif"></td></tr>                        
                       <tr><td class="ma_list"><img src="../../images/community/ma_bl.gif"> 
                             ȸ������ : <a href="javascript:uf_moveMsMemberJoinOK();">���԰���</a> 
                                    �� <a href="javascript:uf_moveMsMemberGradeOK();">��ް���</a> 
                                    �� <a href="javascript:uf_moveMsCmuGradeNmOK();">��޸���</a></td>
                       </tr>
                       <tr><td height="1" background="../../images/community/ma_line.gif"></td></tr>
                       <tr><td class="ma_list"><img src="../../images/community/ma_bl.gif"><a href="javascript:uf_moveMsMasterChagneNmOK();"> �����ͺ���</a></td></tr>
                       <tr><td height="1" background="../../images/community/ma_line.gif"></td></tr>
                       <tr><td class="ma_list"><img src="../../images/community/ma_bl.gif"><a href="javascript:uf_msPopCloseCommunity();"> Ŀ�´�Ƽ���</a></td></tr>
                       <tr><td height="1" background="../../images/community/ma_line.gif"></td></tr>                        
                       <tr><td class="ma_list"><img src="../../images/community/ma_bl.gif"><a href="javascript:uf_moveMsMemberActivityOK();"> ȸ��Ȱ����Ȳ</a></td></tr>
                       <tr><td height="1" background="../../images/community/ma_line.gif"></td></tr>
                       <tr><td class="ma_list"><img src="../../images/community/ma_bl.gif"><a href="javascript:uf_moveMsPrOK();"> ȫ����û</a></td></tr>
                       <tr><td height="1" background="../../images/community/ma_line.gif"></td></tr>
				<!-- ���� ���� �߰� --> 
						<tr><td class="ma_list"><img src="../../images/community/ma_bl.gif"><a href="javascript:uf_moveMsPoll();"> �����ۼ�</a></td></tr>
                       <tr><td height="1" background="../../images/community/ma_line.gif"></td></tr>
				<!-- ���� ���� �� -->
                     </table>
                    </td>
                    <td width="172" rowspan="3" valign="top">
                     <table width="21" border="0" cellspacing="0" cellpadding="0">
                      <tr><td width="21" background="../../images/community/ma_vlinebg-1.gif"><img src="../../images/community/ma_vlinetop-1.gif" width="21" height="20"></td></tr>
                      <tr><td height="289" background="../../images/community/ma_vlinebg-1.gif">&nbsp;</td></tr>
                      <tr><td valign="bottom" background="../../images/community/ma_vlinebg-1.gif"><img src="../../images/community/ma_vlinebo-1.gif" width="21" height="20"></td></tr>
                     </table>
                    </td>
                   </tr>
                   <tr><td height="271" valign="top" background="../../images/community/ma_vlinebg.gif">&nbsp;</td></tr>
                   <tr><td height="20" valign="bottom" background="../../images/community/ma_vlinebg.gif"><img src="../../images/community/ma_vlinebo.gif"></td></tr>
                  </table> 
                 </td>
                </tr>
                <tr><td height="10" align="center" valign="top"></td></tr>
               </table>
              </td>
             </tr>
             <tr>
              <td height="100" valign="bottom" background="../../images/community/bg_left2.gif" style="padding-left:5px"><table width="162" border="0" cellspacing="0" cellpadding="0">
                <%@ include file="/learn/user/include/topCommunityC.jsp"%>
              </td>
             </tr>
            </table>
            <!-- footer table -->
            <table width="860" border="0" cellspacing="0" cellpadding="0">
			  <tr> 
				<td><img src="/images/community/footer_top.gif"></td>
			  </tr>
			  <tr> 
				<td height="28" align="center" bgcolor="F0F2F0">
					<%if(s_grtype.equals("KOCCA")){%><img src="/images/user/kocca/community/footer_copy.gif">
					<%}else if(s_grtype.equals("KGDI")){%><img src="/images/user/game/community/footer_copy.gif"><%}%>
				</td>
			  </tr>
			</table>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
</form>

</body>
</html>
