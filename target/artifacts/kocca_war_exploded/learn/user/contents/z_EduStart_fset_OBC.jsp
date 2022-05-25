<%
//**********************************************************
//  1. ��      ��: OBC MasterForm - main FrameSet 
//  2. ���α׷���: z_EduStart_fset_OBC.jsp
//  3. ��      ��: OBC MasterForm - main FrameSet 
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2006/10/12
//  7. ��      ��:
//*********************************************************** 
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/website/common/error.jsp" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
    	box = RequestManager.getBox(request);
    }

    String	p_process	= box.getString("p_process");    
    String  p_subj   	= box.getString("p_subj");
    String  p_year   	= box.getString("p_year");
    String  p_subjseq  	= box.getString("p_subjseq");
    String	c_gadmin	= box.getSession("gadmin");
    String  v_sitegubun = box.getString("p_sitegubun");
    String  v_ispreview = box.getString("p_ispreview"); // ������
    String  v_review    = box.getString("p_review");    // ����


    box.setSession("s_subj",	p_subj);
    box.setSession("s_year",	p_year);
    box.setSession("s_subjseq",	p_subjseq);
    
    System.out.println("----------------------session id = "+box.getSession("userid"));
    
    //�н����� ��� (Y/P/N)
    String  v_eduauth = "";

    if (v_ispreview.equals("Y")) {          // ������ �ϰ��
        box.setSession("s_eduauth","P");    //������ ���� ���� ����(P:������ ��ȸ�� ����, �ԷºҰ�)
        v_eduauth = "P";
    } else {
        if (v_review.equals("Y")) {
        box.setSession("s_eduauth","P");    //������ ���� ���� ����(P:������ ��ȸ�� ����, �ԷºҰ�)
        v_eduauth = "P";
        } else {
            v_eduauth = EduEtc1Bean.get_eduAuth(box);
            box.setSession("s_eduauth",v_eduauth);  //������ ���� ���� ����(P:������ ��ȸ�� ����, �ԷºҰ�)
            System.out.println("XXXX v_eduauth = " + v_eduauth);
        }
    }
    
    System.out.println("v_eduauthv_eduauthv_eduauth = " + v_eduauth);

//    if(v_eduauth.equals("N")){
%>
<!-- 
	<html><head><title>Sorry</title></head><body></body></html>
	<script>
	alert("[<%=box.getSession("gadmin")%>][<%=box.getSession("s_subj")%>]�˼��մϴ�. �н������� �����Ƿ� �н�â�� �ݽ��ϴ�.\n\n���ǻ����� ��ڿ��� �����Ͽ� �ֽʽÿ�");
	window.close();
	</script>
-->	
<%    
//    }

	MasterFormData	da	=(MasterFormData)request.getAttribute("MasterFormData");
	//String	v_ismfbranch 	= da.getIsmfbranch();
	//String 	v_subjnm		= da.getSubjnm();
	
	String	v_mftype		= da.getMftype();		//Frame Structure
	String	v_contenttype	= da.getContenttype();
	String	v_iscentered	= da.getIscentered();
	String  v_ismfbranch    = da.getIsmfbranch();
	int		v_width			= da.getWidth();
	int		v_height		= da.getHeight();
	
	box.setSession("s_contenttype",	v_contenttype);
    box.setSession("s_mftype",	v_mftype);
    box.setSession("s_ismfbranch",	v_ismfbranch);
    box.setSession("s_width",	v_width);
    box.setSession("s_height",	v_height);
	
	String	v_base_url		= "/servlet/controller.contents.EduStart?p_process=";
	String  v_url_echk      = "/website/user/contents/z_EduChk_after.jsp?p_check=true";
	String	v_url_up		= v_base_url+"fup";
	String	v_url_menu		= v_base_url+"fmenu&p_ispreview="+v_ispreview;
	String	v_url_tree		= v_base_url+"tree";
	String	v_url_bott		= v_base_url+"bott";
	String	v_url_fsetsub	= v_base_url+"fsetsub&p_ispreview="+v_ispreview+"&p_review="+v_review;

	String	v_url_gong		= v_base_url+"fmain&p_ispreview="+v_ispreview
								+ "&p_subj=" + p_subj+"&p_year="+p_year+"&p_subjseq="+p_subjseq;
	//	String	v_url_gong		= "/servlet/controller.study.SubjGongStudyServlet?p_process=select&p_subj="
	//							+ p_subj+"&p_year="+p_year+"&p_subjseq="+p_subjseq+"&p_ispreview="+v_ispreview;
	
	String 	v_spaceUrl		= "/contents/" + p_subj + "/docs/menuimg/space.html";	//�߾����Ľ� ����HTML ��ġ.
	// if(v_iscentered.equals("Y"))	v_spaceUrl = EduEtc1Bean.make_eduURL(p_subj,"DOC")+"docs/menuimg/space.html";
	
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<!-- Don't Modify!. CopyRights. Credu.Corp.  written by LeeSuMin -->
</head>
<script language="javascript">
	var f_min = false;
	
	function resizeWindow() {
		var w = <%=v_width%>;
		var h = <%=v_height%>;
		var v_w = '', v_h='';

		if (w==99999)	v_w = screen.availWidth;
		else if(w==0)	v_w = 1024;
		else			v_w = w;
		if (h==99999)	v_h = screen.availHeight;
		else if(h==0)	v_h = screen.availHeight;
		else			v_h = h;
		
		if (parseInt(navigator.appVersion)>3) {
		   top.moveTo(0,0);
		   top.resizeTo(v_w, v_h);
		}
	}

	function switchTreeFrameSize(){
		if (f_min){
			f_min = false;
			top.etree_fset.document.body.cols = "200,*";
		}else{
			f_min = true;
			top.etree_fset.document.body.cols = "60,*";
		}
	}
	resizeWindow();
</script>
<%
	if (v_iscentered.equals("Y")) {			// ������ �߾� ����
%>
		<frameset rows="*,697,*" cols="*,1020,*" scrolling="NO" frameborder="NO" border="0" framespacing="0">
			<frame src="<%=v_spaceUrl%>" scrolling="NO">
			<frame src="<%=v_spaceUrl%>" scrolling="NO">
			<frame src="<%=v_spaceUrl%>" scrolling="NO">
			<frame src="<%=v_spaceUrl%>" scrolling="NO">
<%
	}
%>
<%
	if (v_mftype.equals("ND")) {			// �޴� ������ ��ġ : ��
%>
			<frameset rows="0,0,60,592,45" cols="*" frameborder="NO" border="0" framespacing="0">
				<frame src="" name="ememo" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_echk%>" name="echk" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_up%>" name="etop" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_fsetsub%>" name="etree_fset" scrolling="AUTO"  frameborder="NO" border="0">
	  			<frame src="<%=v_url_menu%>" name="emenu" scrolling="NO" frameborder="NO" border="0" noresize>
			</frameset>
<%
	} else if ( v_mftype.equals("NU") ) {	// �޴� ������ ��ġ : ��
%>
			<frameset rows="0,0,60,45,592" cols="*" border="0" framespacing="0" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
				<frame src="" name="ememo" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_echk%>" name="echk" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_up%>" name="etop" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_menu%>" name="emenu" scrolling="NO" frameborder="NO">
	  			<frame src="<%=v_url_fsetsub%>" name="etree_fset" scrolling="AUTO"  frameborder="NO" border="0" noresize>
			</frameset>
<%
	} else if ( v_mftype.equals("NL") ) {	// �޴� ������ ��ġ : �� 
%>	
			<frameset rows="0,0,60,592" cols="*" border="0" framespacing="0" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
				<frame src="" name="ememo" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_echk%>" name="echk" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_up%>" name="etop" scrolling="NO" frameborder="NO">
	  			<frameset cols="120,1*" frameborder="NO" border="0" framespacing="0">
	  				<frame src="<%=v_url_menu%>" name="emenu" scrolling="NO" frameborder="NO">
	  				<frame src="<%=v_url_fsetsub%>" name="etree_fset" scrolling="AUTO"  frameborder="NO" border="0">
		  		</frameset>
			</frameset>
<%
	} else if ( v_mftype.equals("NR") ) {	// �޴� ������ ��ġ : ��
%>
			<frameset rows="0,0,60,592" cols="*" border="0" framespacing="0" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
				<frame src="" name="ememo" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_echk%>" name="echk" scrolling="NO" frameborder="NO" border="0">
	  			<frame src="<%=v_url_up%>" name="etop" scrolling="NO" frameborder="NO">
	  			<frameset cols="1*,120" frameborder="NO" border="0" framespacing="0">
	  				<frame src="<%=v_url_fsetsub%>" name="etree_fset" scrolling="AUTO"  frameborder="NO" border="0">
	  				<frame src="<%=v_url_menu%>" name="emenu" scrolling="NO" frameborder="NO">
		  		</frameset>
			</frameset>
<%
	}
%>
<%
	if (v_iscentered.equals("Y")) {			// ������ �߾� ����
%>
			<frame src="<%=v_spaceUrl%>" scrolling="NO">
			<frame src="<%=v_spaceUrl%>" scrolling="NO">
			<frame src="<%=v_spaceUrl%>" scrolling="NO">
			<frame src="<%=v_spaceUrl%>" scrolling="NO">
		</frameset>
<%
	}
%>

<noframes>
<body bgcolor="#FFFFFF"></body>
</noframes>
</html>
