<%
//**********************************************************
//  1. ��      ��: SCORM MasterForm Tree Frame -
//  2. ���α׷���: z_EduStart_ftree_SCORM.jsp
//  3. ��      ��: SCORM MasterForm Tree Frame - 
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 12. 06
//  7. ��      ��:
//*********************************************************** 
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>


<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

	ConfigSet conf = new ConfigSet();

    String  s_userid    = box.getSession("userid");    
    String  s_name      = box.getSession("name");
    String  s_subj      = box.getSession("s_subj");
    String  s_year      = box.getSession("s_year");
    String  s_subjseq   = box.getSession("s_subjseq");
    String  s_gadmin    = box.getSession("gadmin");	
	String  s_sbujnm    = box.getString("subjnm");
	int  i_edulimit  	= box.getInt("edulimit");
	int  oid_count  	= box.getInt("oid_count");    
	int  jindo_count  	= box.getInt("jindo_count");
	String s_ispreview  = box.getString("p_ispreview");
 

	session.setAttribute("user_id", s_userid);
	session.setAttribute("user_name", s_name);
	session.setAttribute("subjseq", s_subjseq);
	session.setAttribute("subj", s_subj);
	session.setAttribute("year", s_year);
	
	String  s_tree_stur = "";	
	String  s_scorealpath = conf.getProperty("dir.scorealpath");

	String s_selectedlesson = box.getString("p_lesson");
	String s_selectedoid = box.getString("p_oid");	

    MasterFormData  da  =(MasterFormData)request.getAttribute("MasterFormData");
    String  v_otbgcolor     = da.getOtbgcolor();
    if(v_otbgcolor == null || v_otbgcolor.equals(""))   v_otbgcolor = "FFFFFF";
    String  v_fontobj       = da.getFontobj();
    String  v_dir           = da.getDir();

    String  v_contenttype   = da.getContenttype();
    String  v_isconfirmed   = "N";
	String  v_eduprocess    = da.getEduprocess(); // ���� ���� ���	

	
    String v_ispreview  = box.getString("p_ispreview");
    String  v_url_gong  = "/servlet/controller.study.SubjGongStudyServlet?p_process=select&p_subj="
                        + s_subj+"&p_year="+s_year+"&p_subjseq="+s_subjseq+"&p_ispreview="+v_ispreview;
	
	ArrayList td  = (ArrayList)request.getAttribute("TreeData");  // Tree Data
//	ArrayList LL = (ArrayList)request.getAttribute("LimitLesson");

    SubjGongAdminBean control = new SubjGongAdminBean();
	
	int v_controlstudy = control.allowStudy(box);

    
%>
<html>
<style>
    <!--
        A:link    {font: 9pt GulimChe,����ü; color: 000000; text-decoration: none}
        A:active  {font: 9pt GulimChe,����ü; color: 000000; text-decoration: none}
        A:visited {font: 9pt GulimChe,����ü; color: 000000; text-decoration: none}
        A:hover   {text-decoration: underline;}
        td        {font: 9pt GulimChe,����ü;}
        .tdw      {font: bold 9pt GulimChe,����ü;}
        .font     {font: bold 9pt GulimChe,����ü;}
        .netist   {font: bold 9pt GulimChe,����ü; color: gray;}
    -->
</style>

<%
SCOData d = null;
SCOData c = null;
String s_oid = "";
String s_desc = "";
String s_starting = "";
int i_depth = 0;
String s_jindo_bl = "";
String s_link = "";
String s_link2 = "";
String s_lesson = "";

String p_nextoid = "";
String p_nextlesson = "";
String p_nexturl = "";
String s_nextlink = "";
String p_backoid = "";
String p_backlesson = "";
String p_backurl = "";
String s_backlink = "";
String s_limitlesson = "";
String p_next_jindo_bl = "";
String p_pre_jindo_bl = "";
int i_limit = 0;

double oneday_jindo_pnt = (double)Math.round((double)jindo_count/oid_count*100*100)/100;
double i_edulimit_1 = (double)(i_edulimit);

s_tree_stur = "foldersTree = gFld_1('"+ s_sbujnm  +"', '','0');\n";  // �� ���� ����

boolean gojindo= false;
boolean nextjindo= false;
boolean backjindo= false;
int limitjindo = 0;

int j = 0, k = 0, l=0, n=0;
for (int i=0; i<td.size(); i++) {
	d = (SCOData)td.get(i);  
	s_oid = d.getOid();
	s_desc = d.getSdesc();
	s_starting = d.getStarting();
	i_depth = d.getThelevel();
	s_lesson = d.getLesson();
    s_jindo_bl =  d.getJindoStatus();   

	//////////////////////////////////////// ���� �н�����, �����Ⱓ ���� üũ �ȵ� ///////////////////////////////////////////////
//    if ( i_periodcnt == 0 ) { // �н��Ⱓ�� �ƴϸ�, �� �����Ⱓ�̸�
//		   limitjindo = 3;
//	} else { // �н��Ⱓ�̸�
		if ( (i_edulimit == 0 ) ||  (oneday_jindo_pnt <= i_edulimit_1) ){  //�н������� ���ų�, ������ ���� �ʾ�����
			limitjindo = 1;
		} else {  // ���� �Ҵ�� �н������� ���ų�,  �Ѿ��ٸ�

			
		/*		for(int b=0; b < LL.size(); b++)
				{
					c = (SCOData)LL.get(b); 
					s_limitlesson = c.getLesson();
					if (s_lesson.equals(s_limitlesson)) {  // ���� �н��� ���ö�� �н��� üũ�ȴ�.
							limitjindo = 1;
					} 
				}
				if (limitjindo != 1 ){  // ���� �н��� ���õ� �ƴϸ�,  �н��� üũ �ȵȴ�.
					limitjindo = 2;
				}	*/
				
				if (s_jindo_bl.equals("complete")){ 
					limitjindo = 1;
					i_limit = 1;
				} else {
					limitjindo = 2;
					i_limit = 2;
				}
		}	

		
//	}
 // out.println("limitjindo="+limitjindo); //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	if(i_depth == 1){
		s_link2 = "";
		j++;  // ������ ���߱� ���ؼ�
		if (s_selectedlesson.equals(s_lesson)){
			s_tree_stur += "aux2 = insFld(foldersTree, gFld(\""+ s_desc +"\",\""+ s_link2 + "\",'1'));\n"; // ���� ���� ����
		} else {
			s_tree_stur += "aux2 = insFld(foldersTree, gFld(\""+ s_desc +"\",\""+ s_link2 + "\",'0'));\n"; // ���� ���� ����
		}
	} else {
		if (s_starting.equals("") ){
			j++; // ������ ���߱� ���ؼ�
			s_tree_stur += "insDoc(aux2, gLnk(0, "+ i_depth +", \""+ s_desc +"\", '', ''));\n";
		} else {
	 
			if (v_eduprocess.equals("Y")) { //�����н�
			   l++;  // ù ������ ������ �� �ִ�.
			   if (l == 1 ){
				  gojindo = true;
			   } else {
				  gojindo = false;
			   }
			   
			   //�⵵�� 2000�̸� ������� �����н� �����ϵ��� �Ѵ�.
			   if (s_year.equals("2000")) {
				  gojindo = true;
			   }

			   if (s_jindo_bl.equals("complete")){  //�̹� ���ڰ� ������ ������ ��� ���� ���� ������ �� �ִ�.
				   j = i+1;
				}
				k = j - i;
                    
					
					if (v_controlstudy > 0) {
							s_link2 = "javascript:controlStudy()";
					} else {
                
						if ((gojindo) || (s_jindo_bl.equals("complete")) || ( k == 0 )){  // ó�� , ���� ���� ���, �� ���ڰ� ���� ���� ���
							s_link = s_scorealpath + s_starting;

							s_link2 = "javascript:StudyObject('"+ s_link +"', 'ebody', '"+s_oid+"', '"+s_lesson+"', '"+limitjindo+"')";
						} else {
							s_link2 = "javascript:DoNothing()";
						} 
					}
				

			} else { // �����н�
			    //   out.println(v_controlstudy);
			        if (v_controlstudy > 0) {
							s_link2 = "javascript:controlStudy()";
					} else {

						s_link = s_scorealpath + s_starting;
						s_link2 = "javascript:StudyObject('"+ s_link +"', 'ebody', '"+s_oid+"', '"+s_lesson+"','"+limitjindo+"' )";
					}
				
			}

			if (s_jindo_bl.equals("complete")){  // ���� ���� ��� 0: �Ϲ�, 1: ���� ���� ��� 2: ���� ���õ� ���
			    if (s_selectedoid.equals(s_oid)){ // ���� ���õ� SCO
					s_tree_stur += "insDoc(aux2, gLnk(0, "+ i_depth +", \""+ s_desc +"\", \""+ s_link2 +"\", 2 ));\n";  
				} else {
					s_tree_stur += "insDoc(aux2, gLnk(0, "+ i_depth +", \""+ s_desc +"\", \""+ s_link2 +"\", 1 ));\n";  
				}
			} else { 
				if (s_selectedoid.equals(s_oid)){  // ���� ���õ� SCO
					s_tree_stur += "insDoc(aux2, gLnk(0, "+ i_depth +", \""+ s_desc +"\", \""+ s_link2 +"\", 2 ));\n";  
				} else {
					s_tree_stur += "insDoc(aux2, gLnk(0, "+ i_depth +", \""+ s_desc +"\", \""+ s_link2 +"\", 0 ));\n";  
				}
			}

			 if (s_selectedoid.equals(s_oid)){   // �̹� ����, ���� ������ ���� ���� "Ŭ���ϼ���" ��ư ������ �� ����
                 nextjindo = true;		
				 backjindo = true;
			 } else {
				 					 	
				 if ( backjindo == false ){  // ���� ���� ���� ����			 		 
					 s_backlink = s_scorealpath + s_starting;	
					 p_backoid = s_oid;					
					 p_backlesson = s_lesson;
					 p_backurl = s_backlink;
					 p_pre_jindo_bl = s_jindo_bl;
				 }		

				 if ( nextjindo == true ){   // ���� ���� ���� ����

					 s_nextlink = s_scorealpath + s_starting;

					 p_nextoid = s_oid;
					 p_nextlesson = s_lesson;
					 p_nexturl = s_nextlink;
					 p_next_jindo_bl = s_jindo_bl;
					 
					 nextjindo = false;
				 }				 
			 }
		}
	}	
	//limitjindo = 0;
}
//out.println("i_limit="+i_limit);
s_tree_stur	+= "initializeDocument();\n";
%>

<script>
// Ʈ������ �籸��
function resizeEtree(){
	top.switchTreeFrameSize()
	if(top.f_min){
		document.resizeImg.src="/images/object/show.gif";
	}else{
		document.resizeImg.src="/images/object/hide.gif";
	}
}

// �������� ȭ��
function whenGong(){
            top.etree_fset.ebody.location="<%=v_url_gong%>&p_contenttype=<%=v_contenttype%>";
}

//�н����� �˸�
	function controlStudy(){
		alert("������ �н����ɽð��� �ƴմϴ�.\n�� �н��ð� �ȳ�\n*��~��:~19:00���� �н�����\n*�����,�Ͽ���,������:�н��Ұ�");
		return;	
	}

//1�� �н����� �˸�
<% if (i_limit == 2) {%>
//	alert("1�� �н����� ���Ƕ����� ������ ������ �ʽ��ϴ�.");
<% } %>

</script>
<body bgcolor=<%=v_otbgcolor%>>
 <FORM name="f1"  action="/servlet/controller.contents.EduStart" enctype = "multipart/form-data">    
	<input type=hidden name="p_process" value="tree">  
	<input type=hidden name="p_oid" value="<%=s_selectedoid%>">  
	<input type=hidden name="p_lesson" value="<%=s_selectedlesson%>"> 
	<input type=hidden name="p_subj" value="<%=s_subj%>">
	<input type=hidden name="p_year" value="<%=s_year%>">
	<input type=hidden name="p_subjseq" value="<%=s_subjseq%>">
	<input type=hidden name="p_userid" value="<%=s_userid%>">
	<input type=hidden name="p_nextoid" value="<%=p_nextoid%>">  
	<input type=hidden name="p_nextlesson" value="<%=p_nextlesson%>">
	<input type=hidden name="p_nexturl" value="<%=p_nexturl%>"> 	
	<input type=hidden name="p_backoid" value="<%=p_backoid%>"> 
	<input type=hidden name="p_backlesson" value="<%=p_backlesson%>">
	<input type=hidden name="p_backurl" value="<%=p_backurl%>"> 
	<input type=hidden name="p_ispreview" value="<%=s_ispreview%>"> 
	<input type=hidden name="limitjindo" value="<%=limitjindo%>"> 
	<input type=hidden name="p_next_jindo_bl" value="<%=p_next_jindo_bl%>"> 
	<input type=hidden name="p_pre_jindo_bl" value="<%=p_pre_jindo_bl%>"> 

    <TABLE border=0 cellpadding=0 cellspacing=0 align=right valign=top width=100% bgcolor=F4F3F3>
	    <TR><td align=right height=22>
            <a href="javascript:resizeEtree()"><img name="resizeImg" src="/images/object/hide.gif" alt="Resize" border=0 width=60></a>
        </td></TR>
    </TABLE><br><br>
    <TABLE border=0 align=center valign=top width=100%>
        <TR><td>
    
        <a href="javascript:whenGong()"><img src="/images/object/applet_gong.gif" alt="��������" border=0></a>
           </td>
 </TR></TABLE>
 </form>
<script src="/script/navigate.js"></script>
<script language="javascript">
<%=s_tree_stur%>
</script>
</body>
</html>

