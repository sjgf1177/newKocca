<%
//**********************************************************
//  1. ��      ��: OBC MasterForm Tree Frame - Use Applet Tree
//  2. ���α׷���: z_EduStart_ftree_OBC.jsp
//  3. ��      ��: OBC MasterForm Tree Frame - Use Applet Tree
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 06
//  7. ��      ��: ������  2006/10/12 - Applet Tree�� Javascript dTree�� ��ȯ
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/website/common/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null)
    {
        box = RequestManager.getBox(request);
    }

	String treeTitle = (String) request.getAttribute("treeTitle");
	Map progressDataMap = (HashMap) request.getAttribute("progressDataMap");

    String s_subj = box.getSession("s_subj");
    String s_year = box.getSession("s_year");
    String s_subjseq = box.getSession("s_subjseq");

    String v_ispreview = box.getString("p_ispreview"); //������
    String v_review = box.getString("p_review");       // ����

    if( v_ispreview.equals("Y") || v_review.equals("Y") || s_year.equals("2000") ) {
      s_year = "PREV";   //������ ���� �ʽ��ϴ�.
    }

    int p_branch = 0;
    if (!box.getString("p_branch").equals(""))
        p_branch = Integer.parseInt(box.getString("p_branch"));

    String p_tmp1 = box.getString("p_tmp1");

    MasterFormData da =(MasterFormData)request.getAttribute("MasterFormData");

    String v_otbgcolor = da.getOtbgcolor();
    if ( v_otbgcolor == null || v_otbgcolor.equals("") )
        v_otbgcolor = "FFFFFF";
    String v_fontobj = da.getFontobj();
    String v_dir = da.getDir();
    String v_contenttype = da.getContenttype();
    String v_isconfirmed = "N";

    int v_curbranch = 99;
    int v_mybranch = 99;
    int v_firstBranchObjectIndex = 0;
    String v_mybrname = "";

    if (v_mybranch!=99) v_isconfirmed = "Y";

    String  v_base_url  = "/servlet/controller.contents.EduStart?p_process=";
    String  v_eduChkURL = v_base_url + "eduCheck";  //����üũURL
    String  v_examURL   = "/servlet/controller.exam.ExamServlet?p_process=UserResultListPage&p_lesson=";        //��URL
    String  v_sulURL    = "/servlet/controller.research.SulmunServlet?p_process=UserResultListPage&p_f_gubun=C";//����URL
    String  v_brCntlURL = v_base_url + "branchControl";         //�б�����URL
    String  v_eduMemURL = v_base_url + "eduMemList";            //�����н��ں���URL
    String  v_url_gong  = v_base_url + "fmain&p_ispreview=" + v_ispreview
							+ "&p_subj=" + s_subj + "&p_year=" + s_year + "&p_subjseq=" + s_subjseq;
    //String  v_url_gong  = "/servlet/controller.study.SubjGongStudyServlet?p_process=select&p_subj="
    //                    + s_subj+"&p_year="+s_year+"&p_subjseq="+s_subjseq;
    String  v_branchurl = v_base_url + "tree&p_branch=";

    String  v_imgURL    = "/images/user/contents/"; //image Base URL

    ArrayList   td  = (ArrayList)request.getAttribute("TreeData");  // Tree Data
    OBCTreeData ot  = null;                                         // Tree Data Beans
%>
<html>
<head>
	<title>�н� ����</title>
	<style>
		body
		{
			scrollbar-3dlight-color:#FFFFFF;
			scrollbar-arrow-color:#666666;
			scrollbar-track-color:#FFFFFF;
			scrollbar-darkshadow-color:#FFFFFF;
			scrollbar-face-color:#FFFFFF;
			scrollbar-highlight-color:#C9C9C9;
			scrollbar-shadow-color:#C9C9C9;
		}
	</style>
	<link rel="StyleSheet" href="/website/user/common/dtree/dtree.css" type="text/css" />
	<script type="text/javascript" src="/website/user/common/dtree/dtree.js"></script>
	<script language="javascript" src="/website/user/common/control.js"></script>
    <SCRIPT LANGUAGE="JavaScript">
        var cModule ="";
        var cLesson ="";
        var cObject ="";
        var cIndex  =0;
        var cAR     =null;
        var vFrom   ="justChk";
        var myBranch = <%=v_mybranch%>;
        var curBranch= <%=v_curbranch%>;

		function nodeCheck() {
			//if ( top.echk.document.form1.p_check.value == "true" ) {
				d.setStatus( cIndex, d.icon.nodeCheck );
			//}
		}

		// ���� üũ
        function eduCheck( gubun ){
		<%
			if (!s_year.equals("PREV")){
		%>

            var  url = '<%=v_eduChkURL%>&p_module='+cModule+'&p_lesson='+cLesson+'&p_oid='+cObject
                     + '&p_curidx='+cIndex+'&p_from='+vFrom+'&p_branch='+curBranch+'&p_gubun='+gubun;

            top.echk.location = url;
            vFrom = "justChk";

			if ( gubun == "END" ){
				setTimeout("nodeCheck()",1000);
			}
		<%
			}
		%>
			return "OK";
        }

        function eduChk(){
        	eduCheck( "END" );
        }

        function eduChkStart(){
        	eduCheck( "START" );
        }

		// �������� Object ����
        function whenObj(idx){
            var rs = getMLO(idx);
            var as = rs.split(",");

            if (as[3]!="SC"){
                if (as[3] == "LE"){
                    if (as[9]=="BRANCH" && myBranch ==99){
                        gotoBranchPage();
                        return;
                    }
                }
                nodeStatusChange(idx);
                return;
            }

            jumpTo(idx);
        }

		// ���� Object�� �̵�
        function goNext(){
            setTimeout("jumpNext()",1500);
        }

        // ���� Object �� �̵�
        function jumpNext(){
            setNextMLO();
            jumpTo(cIndex);
        }

		// ���� Object�� �̵�
        function goPrev(){
            var bModule,bLesson,bObject;
            var bidx = 0;
            for(var i=0;i<document.ff.length;i++){
                as = document.ff.elements[i].value.split(",");
                if (as[3]=="SC"){
                    bModule = as[0];
                    bLesson = as[1];
                    bObject = as[2];
                    bidx    = i;
                }
                if (as[2]==cObject && as[0]==cModule && as[1]==cLesson){
                    jumpTo(bidx);
                }
            }
        }

		// �ش� idx�� Object�� �̵�
        function jumpTo(idx){
            var rs = null;

			rs = getMLO(idx);

            if(rs=="NOTEXIST"){
                alert("Object�� �������� �ʽ��ϴ�.");
                return;
            }

            setCurrentByIndex(idx);

            //if(isBranchSubj=="Y" && cAR[9]=="BRANCH" && myBranch==99){
            //    alert("HEY2");
            //    gotoBranchPage();
            //    return;
            //}

            if (cAR[3]!="SC"){
                cIndex = getNextSCO(idx);
                if (cIndex==9999)
                   return;
                setCurrentByIndex(cIndex);
            }

			// ������ �ش� Object ���� ��带 Open��
            d.openTo( cIndex-1, true );
			d.refresh();
			d.changeNodeIcon( cIndex, d.icon.nodeIng );

            top.etree_fset.ebott.changeObj(cObject,cAR[6]);
            top.etree_fset.ebott.changeUrl(cAR[8]);

            if (cAR[4].substring(0,1)=="T") {
                whenExam();
            }else if (cAR[4]=="RP"){
                whenReport();
            }else{
            	eduChkStart();

				// 1/1 ������ �� ���, ������ ������ üũ ��
            	var v_mypn = parseInt(top.etree_fset.ebott.document.fobj.p_mypage.value,10);
				var v_topn = parseInt(top.etree_fset.ebott.document.fobj.p_pages.value,10);

				if ( v_mypn == 1 && v_topn == 1 ) {
					setTimeout( "eduChk()", 1500);
				}

                /* �б���� ������
                if (curBranch==myBranch){
                    isOk = eduChk2('START');
                    top.echk.location = '<%=v_eduChkURL%>&p_module='+cModule+'&p_lesson='+cLesson+'&p_oid='+cObject
                                       + '&p_curidx='+cIndex+'&p_from='+vFrom+'&p_branch='+curBranch +'&p_gubun=START';
                }
                */
                top.etree_fset.ebody.location=cAR[8];
                top.etree_fset.ebott.setCompleted( true );
            }
        }

		// ���� Object�� ���� Module, Lesson, Object�� Setting
        function setNextMLO(){
            cIndex++;
            setCurrentByIndex(cIndex);
        }

		// ���� Object�� ���� Module, Lesson, Object�� Setting
        function setCurrentByIndex(idx){
            cIndex  = idx;
            var rs = getMLO(cIndex);
            if(rs =="NOTEXIST"){
            	alert( "�н��� ������ �κ��� �н��ϼ̽��ϴ�. ó������ �̵��ϰڽ��ϴ�." );
                setCurrentByIndex(1);
                return;
            }
            cAR    = null;
            cAR    = rs.split(",");
            cModule = cAR[0];
            cLesson = cAR[1];
            cObject = cAR[2];

            top.etop.setVals(cModule,cLesson,cObject,cIndex);
        }

        function setCurrent(idx,mod,les,oid){
            setCurrentByIndex(idx);
        }

        // Form idx�� ���� Object ������ �����´�
        function getMLO(idx){
            for(var i=0;i<document.ff.length;i++){
                if (parseInt(document.ff.elements[i].name,10) == idx){
                    return  document.ff.elements[i].value;
                }
            }
            return "NOTEXIST";
        }

        //
        function getNextSCO(idx){
            var as;
            for(var i=idx;i<document.ff.length;i++){
                as = document.ff.elements[i].value.split(",");
                if (as[3]=="SC"){
                    return parseInt(document.ff.elements[i].name,10);
                }
           //     if (as[3]=="LE" && isBranchSubj=="Y" && as[9]=="BRANCH" && myBranch==99){
           //         alert("HEY3");
           //         gotoBranchPage();
           //         return 9999;
           //     }
            }

            for(var i=0;i<idx;i++){
                as = document.ff.elements[i].value.split(",");
                if (as[3]=="SC"){
                    return parseInt(document.ff.elements[i].name,10);
                }
            }
      		// alert("Loading Failed.. Ask to Administrator please..");
            return 9999;
        }

		// �򰡷� �̵�
        function whenExam(){
            //var url = "zeduobj_gong.exjumps?p_subj=<%=s_subj%>&p_year=<%=s_year%>&p_subjseq=<%=s_subjseq%>&p_module="+cModule;
            //url+= "&p_lesson="+cLesson+"&'p_oid="+cObject;
            url = '<%=v_examURL%>'+cLesson+"&p_oid="+cObject;

            top.etree_fset.ebody.location = url;
        }

		// ����Ʈ�� �̵�
        function whenReport(){
            var url = "";
            top.etree_fset.ebody.location = url;
        }

		// ������������ �̵�
        function whenGong(){
            top.etree_fset.ebody.location="<%=v_url_gong%>&p_contenttype=<%=v_contenttype%>";
        }

		// ���� �������� �̵�
        function whenStart(mo,le,obj){

            for(var i=0;i<document.ff.length;i++){
                as = document.ff.elements[i].value.split(",");

                if (as[0]==mo && as[1]==le && as[2]==obj){
                    jumpTo(parseInt(document.ff.elements[i].name,10));
                    return;
                }
            }
            jumpTo(1);
        }

		// Tree ���� ������ ����
        function resizeEtree(){
            top.switchTreeFrameSize()
            if(top.f_min){
                document.resizeImg.src="/image/contents/show.gif";
            }else{
                document.resizeImg.src="/image/contents/hide.gif";
            }
        }

		/**
		 * �Ƹ��� ��� ���� �ʴ� �Լ��� : ���� ����
		// �ش� Page�� �̵�
        function jumpToPage(mod,les,obj,cpage,npage,urls){alert("5555goonica");

            for(var i=0;i<document.ff.length;i++){
                as = document.ff.elements[i].value.split(",");
                if (as[3]=="SC"){
                    bModule = as[0];
                    bLesson = as[1];
                    bObject = as[2];
                    bidx    = i;
                }
                if (as[2]==obj && as[0]==mod && as[1]==les){
                    jumpTo(bidx);
                    break;
                }
            }

            top.etree_fset.ebody.location = urls;
            top.etree_fset.ebott.fobj.p_mypage.value=parseInt(cpage,10,10);
            //Added 20020805. LeeSuMin(for use Multi-Server)
            top.etree_fset.ebott.changeUrl(urls);

        }

        //�б���� ���� �Լ��� �������ڵ��������� ������ �ʴ� �Լ��̴�.
        function eduChk2(gubun){
		<%
			if (!s_year.equals("PREV")){
		%>
            var  url = '<%=v_eduChkURL%>&p_module='+cModule+'&p_lesson='+cLesson+'&p_oid='+cObject
                     + '&p_curidx='+cIndex+'&p_from='+vFrom+'&p_branch='+curBranch+'&p_gubun='+gubun;
            top.echk.location = url;
            setTimeout("goOnIcarus()",2000);
		<%
			}
		%>
            return "OK";
        }

        function goOnIcarus(gubun){
		<%
			if (!s_year.equals("PREV")){
		%>
            vFrom = "justChk";
            return "OK";
		<%
			}
		%>
        }

		// Brach
        function selBranchOption(){
            var br = document.f1.p_branch.options[document.f1.p_branch.selectedIndex].value;
            document.location ="<%=v_branchurl%>"+br;
        }

		// Brach
        function calledFromBranchPage(branchId){
            document.location="<%=v_branchurl%>"+branchId+"&p_tmp1=first";
        }
		*/
    </SCRIPT>
    </head>

    <body bgcolor="<%=v_otbgcolor%>" topmargin="0" leftmargin="5" marginwidth="0" marginheight="0">
	<!-- Ʈ�� Show/Hide -->
	<div id="resize" style="text-align:right; width:100%; margin-bottom:6px; background:#F4F3F3">
	  <a href="javascript:resizeEtree();"><img name="resizeImg" src="/image/contents/hide.gif" alt="Resize" border="0" width="60"></a>
	</div>
    <!-- �������� -->
    <div style="margin-bottom:5px">
      <a href="#" onclick="javascript:whenGong();"><img src="/image/contents/notice_icon.gif" border="0"/></a>
    </div>
    <!-- dtree ���� -->
    <div id="dtree" class="dtree">
	  <script type="text/javascript">
        <!--
		d = new dTree('d');

		d.config.useSelection = false;
		d.config.useStatusText = false;

		d.add(0,-1,'');

<%
	//Paramter Rule = Index||����(MODULE,LESSON,SC)||������||Type(1001,1002,1003)||Mode(SC,TM,TT)||��������(Lesson_OID)
	String param[] = null;

	int id = 0;
	String objType = "";
	String title = "";
	String iconType = "";
	String iconMode = "";
	String lessonOid = "";;

	int pid = 0;
	int moduleId = 0;
	int lessonId = 0;

   	for ( int i=0; i<td.size(); i++ )
   	{
       	ot = (OBCTreeData)td.get(i);
		param = ot.getAp().split("\\|\\|", -1);

		id = Integer.parseInt(param[0]);
		objType = param[1];
		title = param[2];
		iconType = param[3];
		iconMode = param[4];
		lessonOid = param[5];

		// Ư������ ó��
		title = title.replaceAll("\'", "\\\\\'");
		title = title.replaceAll("\"", "\\\\\"");

		// pid set
		if ( objType.equals("MODULE") )
		{
		    pid = 0;
		    moduleId = id;
		}
		else if ( objType.equals("LESSON") )
		{
		    pid = moduleId;
		    lessonId = id;
		}
		else if ( objType.equals("SC") )
		{
		    pid = lessonId;
		}

		// tree node add
		String iconPrefix = "d.icon.";
		String iconName = "";
		if ( objType.equals("MODULE") )
		{
		    iconName = "module" + iconType;
%>
		d.add( <%= id %>, <%= pid %>, '<%= title %>', '', '<%= title %>', '', <%= iconPrefix+iconName %> );
<%
		}
		else if ( objType.equals("LESSON") )
		{
		    iconName = "lesson" + iconType;
%>
		d.add( <%= id %>, <%= pid %>, '<%= title %>', '', '<%= title %>', '', <%= iconPrefix+iconName %> );
<%
		}
		else
		{
		    
%>
		
<%

        if ( iconMode.equals("SC") )
        {
	        iconName = "node" + iconType;
        }
        else if ( iconMode.equals("TM") )
        {
	        iconName = "nodeTM";
        }
        else if ( iconMode.equals("TT") )
        {
	        iconName = "nodeTT";
        }
%>
		d.add( <%= id %>, <%= pid %>, '<%= title %>',
				'javascript:whenObj(\'<%=id%>\')', '<%= title %>', '', <%= iconPrefix+iconName %> );
<%
		}
%>
		d.setStatus( <%= id %>, <%= iconPrefix+iconName %> );
<%
   	}
%>
    	document.write(d);
		d.closeAll();
		//-->
	  </script>
    </div>
    <!-- dtree �� -->

    <form name="ff">
<%
	for(int i=0; i<td.size(); i++)
	{
        ot = (OBCTreeData)td.get(i);
%>
        <input type=hidden name="<%=i+1%>" value="<%=ot.getAh()%>">
<%
	}
%>
    </form>
</body></html>
