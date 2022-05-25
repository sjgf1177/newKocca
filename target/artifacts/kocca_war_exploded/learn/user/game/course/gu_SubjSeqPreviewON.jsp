<%
//**********************************************************
//  1. ��      ��: SUBJECT PREVIEW PAGE
//  2. ���α׷���: zu_SubjectPreview.jsp
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004. 01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<jsp:useBean id = "memberBean" class = "com.credu.system.MemberAdminBean"  scope = "page" />
<jsp:useBean id = "code" class = "com.credu.system.CodeConfigBean"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process      = box.getString("p_process");
    String  v_subj         = box.getString("p_subj");
    String  v_subjseq      = box.getString("p_subjseq");
    String  v_isonoff      = box.getString("p_isonoff");
    String  v_upperclassnm = box.getString("p_upperclassnm");
    String  v_upperclass   = box.getString("p_upperclass");
    String  v_select       = box.getString("p_select");
    String  v_ispossible   = box.getString("p_ispossible");
    String  gyear          = box.getString("gyear");
    

    String  v_preurl    =  "";
    String  v_sdesc     =  "";
    String  v_propstart =  "";
    String  v_propend   =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_proposetype = "";
    String  v_useproposeapproval = "";
    String  v_subjnm    =  "";
    String  v_place     =  "";
    String  v_tutor     =  "";
    String  v_muserid   =  "";
    String  v_isgoyong  =  "";
    String  v_subjtarget=  "";
    String  v_edumans   =  "";
    String  v_intro     =  "";
    String  v_explain   =  "";
    String  v_isonoff_value="";
    String  v_prop_img  =  "";
    String  v_isgoyong_value="";
    String  v_edutype   =  "";
    String  v_masteruser=  "";
    String  v_env       =  "";
    String  v_owner     =  "";  //�������ڵ�
    String  v_ownerman  =  "";  //ũ�����ڸ�
    String  v_ownertel  =  "";  //����� ��ȭ��ȣ
    String  v_isessential = ""; // ��������
	String  v_bookprice = "";	// �����
    String  v_purl        = ""; 
    int     v_studentlimit =0;
    int     v_biyong    =  0;
    int     v_wstep     =  0;
    int     v_wmtest    =  0;
    int     v_wftest    =  0;
    int     v_whtest    =  0;
    int     v_wreport   =  0;
    int     v_wact      =  0;
    int     v_wetc1     =  0;
    int     v_wetc2     =  0;
    int     v_Twetc     =  0;
    int     v_stepcnt   =  0;
    int     v_testcnt   =  0;
    int     v_reportcnt =  0;
    int     v_actcnt    =  0;
    int     v_gradscore =  0;
    int     v_gradreport = 0;
    int     v_gradstep  =  0;
    int     v_gradexam  =  0;
    int     v_gradftest =  0;
    int     v_gradhtest =  0;
    int     v_edudays   =  0;
    //int     v_edutimes  =  0;
    int     v_ratewbt   =  0;
    int     v_ratevod   =  0;
    int     v_score     =  0;   // ��������
    int     v_edutimes = 0;
    String  v_isessential_view = "";
    String  v_lesson    =  "";
    String  v_lecture   =  "";
    String  v_lecturedate= "";
    String  v_biyong_view = "";
    String  v_studentlimit_view  = "";
    int     i           =  0;
    String  s_userid = box.getSession("userid");
    String  s_jikwi  = box.getSession("jikwi");
    String  v_prop_check = "";
    String v_subjseqgr = "";
    
    DataBox dbox = (DataBox)request.getAttribute("subjseqPreview");
    
    v_subjseqgr          = dbox.getString("d_subjseqgr");
    v_subjnm             = dbox.getString("d_subjnm");
    v_studentlimit       = dbox.getInt("d_studentlimit");
    v_propstart          = dbox.getString("d_propstart");
    v_propend            = dbox.getString("d_propend");
    v_edustart           = dbox.getString("d_edustart");
    v_eduend             = dbox.getString("d_eduend");
    v_biyong             = dbox.getInt("d_biyong");
    v_proposetype        = dbox.getString("d_proposetype");
    v_useproposeapproval = dbox.getString("d_useproposeapproval");
    v_gradscore          = dbox.getInt("d_gradscore");
    v_gradstep           = dbox.getInt("d_gradstep");
    v_gradreport         = dbox.getInt("d_gradreprot");
    v_wstep              = dbox.getInt("d_wstep");
    v_wmtest             = dbox.getInt("d_wmtest");
    v_wftest             = dbox.getInt("d_wftest");
    v_whtest             = dbox.getInt("d_whtest");
    v_wreport            = dbox.getInt("d_wreport");
    v_wetc1              = dbox.getInt("d_wetc1");
    v_wetc2              = dbox.getInt("d_wetc2");
    v_edutimes           = dbox.getInt("d_edutimes");
    v_gradexam           = dbox.getInt("d_gradexam");
    v_gradftest          = dbox.getInt("d_gradftest");
    v_gradhtest          = dbox.getInt("d_gradhtest");
    v_isgoyong           = dbox.getString("d_isgoyong");

	v_ownerman			 = dbox.getString("d_name");
	v_ownertel			 = dbox.getString("d_ownertel");
	v_bookprice			 = dbox.getString("d_bookprice");

    
    v_Twetc = v_wetc1 + v_wetc2;
    v_biyong_view = NumberFormat.getInstance().format(v_biyong);
    
    if(v_isgoyong.equals("Y"))      {   v_isgoyong_value      =   "ȯ��";  }
    else                           {   v_isgoyong_value      =   "��ȯ��"; }
    
%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/user_style1.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="F6F6F6">
<table width="700" border="0" cellpadding="0" cellspacing="0" bgcolor="F6F6F6">
  <tr>
    <td><img src="/images/user/game/apply/pop_tit_chasuinfo.gif" ></td>
  </tr>
  <tr>
    <td>
	<table width="700" border="0" cellspacing="0" cellpadding="0">
        <tr background="/images/user/game/apply/pop_box_topbg.gif">
          <td width="22" height="10" valign="top" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toph.gif" width="22" height="10"></td>
          <td width="657" height="10" background="/images/user/game/apply/pop_box_topbg.gif"></td>
          <td width="21" height="10" align="right" background="/images/user/game/apply/pop_box_topbg.gif"><img src="/images/user/game/apply/pop_box_toptail.gif" width="21" height="10"></td>
        </tr>
        <tr>
          <td valign="top" background="/images/user/game/apply/pop_box_lbg.gif">&nbsp;</td>
          <td align="center" valign="top" bgcolor="#FFFFFF">
		  <!-- ����Ÿ��Ʋ -->
		    <table width="657" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td valign="bottom" ><img src="/images/user/game/apply/pop_st_suguide.gif"></td>
              </tr>
              <tr> 
                <td height="15"></td>
              </tr>
            </table>
			<!-- �����ȳ� -->
            <table width="620" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
              <tr  class="lcolor"> 
                <td height="3" class="linecolor_app"></td>
                <td height="3" class="linecolor_app2"></td>
                <td height="3" class="linecolor_app"></td>
                <td height="3" class="linecolor_app2"></td>
              </tr>
			  <tr> 
                <td width="97" class="tbl_gtit2">������</td>
                <td width="280" class="tbl_gleft"><%=v_subjnm%></td>
                <td width="100" class="tbl_gtit">����</td>
                <td width="162" class="tbl_gleft"><%=Integer.parseInt(v_subjseqgr)%>��</td>
              </tr>

              <tr> 
                <td width="97" class="tbl_gtit2">������û������</td>
                <td width="280" class="tbl_gleft"><%=FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd")%></td>
                <td width="100" class="tbl_gtit">������û������</td>
                <td width="162" class="tbl_gleft"><%=FormatDate.getFormatDate(v_propend,"yyyy/MM/dd")%></td>
              </tr>
              <tr> 
                <td height="26" class="tbl_gtit2">����������</td>
                <td class="tbl_gleft"><%=FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")%></td>
                <td class="tbl_gtit">����������</td>
                <td class="tbl_gleft"><%=FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")%></td>
              </tr>
              <tr> 
                <td class="tbl_gtit2">��������</td>
                <td class="tbl_gleft"><%=v_studentlimit%>��</td>
                <td class="tbl_gtit">�����ð�</td>
                <td class="tbl_gleft"><%=v_edutimes%>�ð�</td>
              </tr>
              <tr> 
                <td class="tbl_gtit2">�ִ�簭��</td>
                <td class="tbl_gleft">-</td>
                <td class="tbl_gtit">������</td>
                <td class="tbl_gleft"><%=v_ownerman%>&nbsp;(tel:<%if(v_ownertel.equals("")){out.print("-");}else{out.print(v_ownertel);}%>)</td>
              </tr>
			  <tr> 
                <td class="tbl_gtit2">�����</td>
                <td class="tbl_gleft"><%if(v_bookprice.equals("")){out.print("-");}else{out.print(v_bookprice +"��");}%></td>
                <td class="tbl_gtit"></td>
                <td class="tbl_gleft"></td>
              </tr>
            </table>
            <table width="657" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td valign="bottom" ><img src="/images/user/game/apply/pop_st_esu.gif"></td>
              </tr>
              <tr> 
                <td height="15"></td>
              </tr>
            </table>
            <!-- �̼����� -->
            <table width="620" border="2" cellspacing="0" cellpadding="3" style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
              <tr  class="lcolor"> 
                <td height="3" colspan="3" class="linecolor_app"></td>
              </tr>
              <tr>
                <td height="10" colspan="2">
				<table width="620" border="2" cellspacing="0" cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                    <tr  class="lcolor">
                      <td height="3" colspan="3" class="lcolor"></td>
                    </tr>
                    <tr>
                      <td width="147" class="tbl_gtit">�򰡱���</td>
                      <td width="232" class="tbl_gtit2">����ġ</td>
                      <td width="268" class="tbl_gtit2">�����׸񺰼������</td>
                    </tr>
                    <tr>
                      <td class="tbl_gtit">������</td>
                      <td class="tbl_grc"><%if(v_wstep==0){out.print("-");}else{out.print(v_wstep+"%");}%></td>
                      <td class="tbl_grc"><%if(v_gradstep==0){out.print("-");}else{out.print(v_gradstep+"%");}%></td>
                    </tr>
                    <tr>
                      <td class="tbl_gtit">��</td>
                      <td class="tbl_grc">
							<table width="100%" border="2" cellspacing="1" cellpadding="2" style="border-collapse:collapse;" bordercolor="#ededed">
							  <%if(!(v_wmtest==0)){%>
							  <tr>
								<td width="30%" class="tbl_gtit">�߰��� </td>
								<td width="70%" class=boardskin1_textn><%if(v_wmtest==0){out.print("-");}else{out.print(v_wmtest+"%");}%></td>
							  </tr>
							  <%}%>
							  <%if(!(v_wftest==0)){%>
							  <tr>
								<td width="30%" class="tbl_gtit">������</td>
								<td width="70%" class="tbl_grc"><%if(v_wftest==0){out.print("-");}else{out.print(v_wftest+"%");}%></td>
							  </tr>
							  <%}%>
							  <%if(!(v_whtest==0)){%>
							  <tr>
								<td width="30%" class="tbl_gtit">������</td>
								<td width="70%" class="tbl_grc"><%if(v_whtest==0){out.print("-");}else{out.print(v_whtest+"%");}%></td>
							  </tr>
							  <%}%>
							</table>
                      </td>
                      <td class="tbl_grc">
							<table width="100%" border="2" cellspacing="1" cellpadding="2" style="border-collapse:collapse;" bordercolor="#ededed">
							  <%if(!(v_gradexam==0)){%>
							  <tr>
								<td width="30%" class="tbl_gtit">�߰��� </td>
								<td width="70%" class="tbl_grc"><%if(v_gradexam==0){out.print("-");}else{out.print(v_gradexam+"��");}%></td>
							  </tr>
							  <%}%>
							  <%if(!(v_gradftest==0)){%>
							  <tr>
								<td width="30%" class="tbl_gtit">������</td>
								<td width="70%" class="tbl_grc"><%if(v_gradftest==0){out.print("-");}else{out.print(v_gradftest+"��");}%></td>
							  </tr>
							  <%}%>
							  <%if(!(v_gradhtest==0)){%>
							  <tr>
								<td width="30%" class="tbl_gtit">������</td>
								<td width="70%" class="tbl_grc"><%if(v_gradhtest==0){out.print("-");}else{out.print(v_gradhtest+"��");}%></td>
							  </tr>
							  <%}%>
						  </table>
                      </td>
                    </tr>
					<tr>
                      <td class="tbl_gtit">����Ʈ</td>
                      <td class="tbl_grc"><%if(v_wreport==0){out.print("-");}else{out.print(v_wreport+"%");}%></td>
                      <td class="tbl_grc"><%if(v_gradreport==0){out.print("-");}else{out.print(v_gradreport+"��");}%></td>
                    </tr>
                    <tr>
                      <td class="tbl_gtit">��Ÿ����ġ</td>
                      <td class="tbl_grc"><%if(v_Twetc==0){out.print("-");}else{out.print(v_Twetc+"%");}%></td>
                      <td class="tbl_grc">-</td>
                    </tr>
                    <tr>
                      <td bgcolor="#F5F5F5" class="tbl_grc">�����������(����)</td>
                      <td colspan="2" bgcolor="#F5F5F5" class="tbl_grc">���� <%=v_gradscore%>�� �̻�</td>
                    </tr>
				</table>
				<table width="620" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td colspan="2" align="right">&nbsp;</td>
				  </tr>
				  <tr> 
					<td colspan="2" align="right"><a href="javascript:self.close()"><img src="/images/user/game/button/btn_close.gif" border="0"></a></td>
				  </tr>
				</table>
				
				</td>
			</tr>
		</table>
			</td>
          <td background="/images/user/game/apply/pop_box_rbg.gif">&nbsp;</td>
        </tr>
        <tr>
          <td valign="bottom" background="/images/user/game/apply/pop_box_lbg.gif"><img src="/images/user/game/apply/pop_box_boh.gif" width="22" height="21"></td>
          <td background="/images/user/game/apply/pop_box_bobg.gif">&nbsp;</td>
          <td valign="bottom" background="/images/user/game/apply/pop_box_rbg.gif"><img src="/images/user/game/apply/pop_box_botail.gif" width="21" height="21"></td>
        </tr>
      </table></td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>

