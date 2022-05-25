<%
/**
 * file name : gu_InterestList_L.jsp
 * date      : 2005/12/16
 * programmer:	lyh
 * function  : ���ɰ��� list ���
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
	box.put("leftmenu","09"); 
	String v_userid = box.getSession("userid");
	

    ArrayList list = (ArrayList)request.getAttribute("InterestList");
    
%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topMystudy.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->
<SCRIPT LANGUAGE="JavaScript">
<!--
//���ɰ��� ����
function deleteGo( subj, year, subjseq ){

	var ok= confirm("���ɰ������� �����Ͻðڽ��ϱ�?");

	if(ok){

	document.frm3.p_subj.value=subj;
	document.frm3.action ="/servlet/controller.study.InterestServlet?p_process=InterestDelete";
	document.frm3.submit();

	}else{
		return;	
	}

}

// ���� ���뺸��
function whenSubjInfo(subj,tabnum){
    document.frm3.p_subj.value     = subj;
    document.frm3.p_tabnum.value   = tabnum;
    document.frm3.p_process.value  = 'SubjectPreviewPage';
    document.frm3.p_rprocess.value = 'SubjectList';
    document.frm3.action='/servlet/controller.course.CourseIntroServlet';
    document.frm3.target = "_self";
    document.frm3.submit();
}

//-->
</SCRIPT>
</head>

<body>
	<!-- title -->
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td width="720" height="35" align="right"  background="/images/user/game/mystudy/<%=tem_subimgpath%>/tit_interest.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
		  HOME > ���� ���ι� > ���ɰ���</td>
	  </tr>
	  <tr> 
		<td height="20"></td>
	  </tr>
	</table>
	<!-- ���ɰ���table  -->
	<table width="720" border="2" cellspacing="0" 
							 cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
		<form name="frm3" method="post" >
			<INPUT TYPE="hidden" NAME="p_subj">
			<INPUT TYPE="hidden" NAME="p_year">
			<INPUT TYPE="hidden" NAME="p_subjseq">
			<INPUT TYPE="hidden" NAME="p_tabnum">
			<INPUT TYPE="hidden" NAME="p_process">
			<INPUT TYPE="hidden" NAME="p_rprocess">
			

	  <tr  class="lcolor"> 
		<td height="3" colspan="8" class="linecolor_my"></td>
	  </tr>
		  <tr> 
			<td class="tbl_ptit2" rowspan="2">��������</td>
			<td class="tbl_ptit" colspan="3">���¸�</td>
			<td class="tbl_ptit2" >��米��</td>
			<td class="tbl_ptit" colspan="2"></td>
			<td class="tbl_ptit2">����</td>
		  </tr>
		  <tr> 
			<td width="10%" class="tbl_ptit">����</td>
			<td width="30%" class="tbl_ptit2">��û�Ⱓ</td>
			<td width="7%" class="tbl_ptit2">�Ⱓ</td>
			<td width="13%" class="tbl_ptit">������</td>
			<td width="10%"class="tbl_ptit2" >���ð���</td>
			<td width="10%" class="tbl_ptit2">������</td>
			<td width="10%" class="tbl_ptit2">������û</td>
	  </tr>

  <%

	NumberFormat s_fmt = NumberFormat.getInstance();				//��ȭ���� ,ǥ��
	String v_biyong = "";
	String v_today = "";
	int totalCnt = list.size();
	DataBox dbox = null;

for(int i=0; i < list.size() ; i++){

		ArrayList subList = (ArrayList)list.get(i);

	if( subList.size() != 0){ 
		
		for(int j=0; j < subList.size() ; j++){
			dbox =  (DataBox)subList.get(j);
			v_biyong = s_fmt.format(dbox.getInt("d_biyong"));
			v_today			= FormatDate.getDate("yyyyMMddhh");

	// ����� row�� ����Ÿ��Ʋ���� ������������ �����Ͽ� ��´�.
	if(dbox.getString("d_isgubun").equals("Y")){		// ����������̸�

%>
	
	  <tr> 
		<td class="tbl_grc"><%=dbox.getString("d_classname")%></td>
		<td class="tbl_gleft" colspan="3"><a href="javascript:whenSubjInfo('<%=dbox.getString("d_subj")%>','<%=dbox.getString("d_sphere")%>')"><%=dbox.getString("d_subjnm")%></a><br>
		</td>
		<td class="tbl_grc">
		<% if(!dbox.getString("d_musernm").equals("")){ %>
			<%=dbox.getString("d_musernm")%> ����
		<% }%>			
		</td>
		<td class="tbl_grc" colspan="2"></td>
		<td class="tbl_grc"><A HREF="javascript:deleteGo('<%=dbox.getString("d_subj")%>','<%=dbox.getString("d_year")%>','<%=dbox.getString("d_subjseq")%>')"><img src="/images/user/game/button/b_del.gif"></A></td>
	</tr>

<%
	}else{			//�������� ������̶��  

			String v_subj = dbox.getString("d_subj");
			String v_subjnm = dbox.getString("d_subjnm");
            String v_statusString = "";
            String v_subjseqgr = "";
            int    v_iedustart = 0;
		    int     v_studentlimit =0;
			String v_subjseq            =  "";
			String v_year               =  "";
			String v_propstart          =  "";
			String v_propend            =  "";
			String v_edustart           =  "";
			String v_eduend             =  "";           
			String v_ispropose          =  ""; 
			int v_propcnt            =  0;
			int k = 0;
			String v_preurl = "";
			String v_issampleString  = "";
				v_studentlimit       = dbox.getInt("d_studentlimit");
                v_subjseq            = dbox.getString("d_subjseq");
                v_year               = dbox.getString("d_year");
                v_subjseqgr          = dbox.getString("d_subjseqgr");
                v_propstart          = dbox.getString("d_propstart");
                v_propend            = dbox.getString("d_propend");
                v_edustart           = dbox.getString("d_edustart");
                v_eduend             = dbox.getString("d_eduend");
                v_ispropose          = dbox.getString("d_ispropose");
                v_propcnt            = dbox.getInt("d_propcnt");
                v_today = FormatDate.getDate("yyyyMMddhh");
				v_preurl        = dbox.getString("d_preurl");

				if(!v_preurl.equals(""))
				{ 
					v_issampleString = "<a href=\"javascript:whenPreShow('" + v_preurl + "','" + v_subj +"')\" focus=\"this.blur()\"><img src=\"/images/user/game/button/b_samplecourse.gif\" border=\"0\"></a>";
				}else {
					v_issampleString = "-";
				}



                if(v_edustart.equals("")){v_iedustart = 0;}
                else{v_iedustart = Integer.parseInt(v_edustart);}

                if(v_iedustart >= Integer.parseInt(v_today)){
                    v_statusString = "<a href=\"javascript:whenSubjPropose('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_subjnm+"')\" onfocus=this.blur()><img src='/images/user/game/button/b_apply.gif' border=0></a>";

                    //out.println("v_ispropose"+v_ispropose);
                    if(v_propcnt > 0){
                        v_statusString = "";
                    }
                }

                //��¥ ó��
                if(v_propstart.equals("")){v_propstart = "����";}
                else{v_propstart     = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");}

                if(v_propend.equals("")){v_propend = "����";}
                else{v_propend = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");}

                if(v_edustart.equals("")){v_edustart = "����";}
                else{v_edustart     = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");}

                if(v_eduend.equals("")){v_eduend = "����";}
                else{v_eduend     = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");}

%>

	 <tr>
		<td width="10%"></td>
		<td width="23" bgcolor="#ECF2E3"><%=v_subjseq%></td>
		<td class="tbl_grc"><%=v_propstart%> ~ <%=v_propend%></td>
		<td class="tbl_grc"><%=FormatDate.datediff("date", dbox.getString("d_edustart"), dbox.getString("d_eduend"))/7%>��</td>
		<td class="tbl_grc"><%=v_edustart%></td>
		<td class="tbl_grc"><%=v_issampleString%></td>
		<td class="tbl_grc"><%=v_biyong%></td>
		<td class="tbl_grc"><%=v_statusString%></td>

	  </tr>
 
<%
	}
  }//for

 }	

}	//for
%>

	  </form>
	</table>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->

