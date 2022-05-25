<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: SUBJ QNA UPDATE
//  2. ���α׷��� : zu_SubjQna_A.jsp
//  3. ��      ��: ���� ���� �亯
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 11
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.contents.*" %>
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_gadminYn   = box.getString("p_gadminYn");    //�����ڿ���
    String  v_subj       = box.getString("p_subj");        //�����ڵ�
    String  v_year       = box.getString("p_year");         //�⵵
    String  v_subjseq    = box.getString("p_subjseq");       //���� ����
    String  v_lesson     = box.getString("p_lesson");
    String  v_lessonnm   = box.getString("p_lessonnm");
    int     v_seq        = box.getInt("p_seq");
    int     v_ptypes     = box.getInt("p_types");

    String  v_user_id   = box.getSession("userid");
    String  v_user_name = box.getSession("name");

    String  v_title  ="", v_contents     ="",  v_inuserid="",v_inusernm="";
    String  v_indate ="", v_replygubun   ="";
    String  v_isopen ="", v_isopen_value ="";
    String  v_togubun = "";
    int  v_cnt = 0;
    int  v_types = 0;
    int  v_kind  = 0;    
    int  v_nanscnt  =0;
    int  i          = 0;
    
    // editor
    String content      = "";
    String width        = "600";
    String height       = "300";
        
    //QnaData qdata = (QnaData)request.getAttribute("SubjqnaDetail2");
    DataBox data1 = (DataBox)request.getAttribute("SubjqnaDetail2");

    SubjectBean		subjbean = new SubjectBean();
	SubjectData		subjdata = new SubjectData();
					subjdata = subjbean.SelectSubjectData(box);
					box.put("p_accessGubun","subjQna");
    EduStartBean	bean		= new EduStartBean();
    EduScoreData    scoredata	= new EduScoreData();
    				scoredata	= bean.SelectEduScore(box);

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>����������</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type="text/javascript" src="/namo_cross/js/namo_scripteditor.js"></script> 
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/user_patch.js'></script>
<script type="VBScript" src="/script/cresys_lib.vbs"></script>  
<script language="JavaScript">
<!--
  function qna_insert() {     
        if(!confirm("�����Ͻðڽ��ϱ�?")) {
                 return;
            }
        if (document.ff.p_title.value == "") {
            alert("������ �Է��ϼ���");
            document.ff.p_title.focus();
            return;
        }

        if (realsize(document.ff.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.ff.p_title.focus();
            return;
        }

    	//if(document.all.use_editor[0].checked) {        
        //    document.ff.p_contents.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    	//}else {
		//    document.ff.p_contents.value = document.all.txtDetail.value;
	    //}

    	if(!CrossEditor.IsDirty()){ // ũ�ν������� ���� ������ �Է� Ȯ�� 
            alert("������ �Է��� �ּ��� !!"); 
            CrossEditor.SetFocusEditor();// ũ�ν������� Focus �̵� 
            return; 
        } 

        //if(!limitFile()){
        //    alert("���ε� �������� ���� ������ �����մϴ�.");
        //    return;
        //}
    	
        document.getElementById("p_content").value = CrossEditor.GetBodyValue();
        document.ff.action = "/servlet/controller.study.SubjQnaStudyServlet";
        document.ff.target = "_self";
        document.ff.p_search.value     = "";
        document.ff.p_searchtext.value = "";
        document.ff.p_process.value = 'SubjQnaReply';        
        document.ff.submit();
    }

    function goQnaDetailPage() {
      document.ff.submit();
    }
    
    function detail_qna() {
        document.ff.action = "/servlet/controller.study.SubjQnaStudyServlet";
        document.ff.p_process.value = "SubjQnaList";
        document.ff.submit();
    }
-->
</script>
</head>
<body id="pop_study"><!-- popup size : 890* -->
<form name="ff" method="post" action="/servlet/controller.study.SubjQnaStudyServlet" enctype = "multipart/form-data">
        <input type="hidden" name="p_process"    value="QnaDetail"/>
        <input type="hidden" name="p_search"     value = "<%=v_search %>"/>
        <input type="hidden" name="p_searchtext" value = "<%=v_searchtext %>"/>
        <input type="hidden" name="p_subj"       value="<%=v_subj%>"/>
        <input type="hidden" name="p_year"       value="<%=v_year%>"/>
        <input type="hidden" name="p_subjseq"    value="<%=v_subjseq%>"/>
        <input type="hidden" name="p_lesson"     value="<%=v_lesson%>"/>
        <input type="hidden" name="p_seq"        value="<%=v_seq%>"/>
        <input type="hidden" name="p_types"      value="<%=v_ptypes%>"/>
        <input type="hidden" name="p_lessonnm"   value="<%=v_lessonnm%>"/>
        <input type="hidden" name="p_gadminYn"   value="<%=v_gadminYn%>"/>
        <input type="hidden" name="p_contents">

	<div id="pop_header">
		<h1><img src="/images/portal/myclass/study/pop_h1_tit4.gif" alt="���� ������" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap">
			<div id="con_scoll">
			
<%	if (scoredata != null) { %>
				<div id="btn_close"><a href="javascript:top.window.close()"><img src="/images/portal/btn/btn_close.gif" alt="�ݱ�" /></a></div>
				<div class="study_tltle study_tltle_sub"><div class="study_tltle_left"><div class="study_tltle_right">
					<dl class="class_info"> 
						<dt><span>������</span></dt>
						<dd><%= subjdata.getSubjnm() %></dd>
					</dl>
					<dl class="class_info">
						<dt><span>�����Ⱓ</span></dt>
						<dd class="class_day"><%= FormatDate.getFormatDate(scoredata.getEdustart(),"yyyy.MM.dd") %> ~<%= FormatDate.getFormatDate(scoredata.getEduend(),"yyyy.MM.dd") %></dd>
					</dl>
				</div></div></div>
<%	} %>
				
				<div class="content">
					<div class="h3_wrap">
						<h3><img src="/images/portal/myclass/study/pop_stit6.gif" alt="���� ������" /></h3>
					</div>
<%
                v_kind       = data1.getInt("d_kind");
                v_seq        = data1.getInt("d_seq");
                v_title      = data1.getString("d_title");
                v_inuserid   = data1.getString("d_inuserid");
                v_inusernm   = data1.getString("d_inusernm");
                v_contents   = data1.getString("d_contents");
                v_indate     = FormatDate.getFormatDate(data1.getString("d_indate"),"yyyy/MM/dd");;
                v_replygubun = data1.getString("d_replygubun");
                v_isopen     = StringManager.chkNull(data1.getString("d_isopen"));
                v_togubun    = data1.getString("d_topgubun");
                v_cnt        = data1.getInt("d_cnt");
%>  
					<table class="study_view">
					<!--[if ie]><colgroup><col width="50px" /><col width="215px" /><col width="50px" /><col width="80px" /><col width="50px" /><col width="80px" /><col width="25px" /><col width="60px" /></colgroup><![endif]-->
					<colgroup><col width="70px" /><col width="215px" /><col width="70px" /><col width="80px" /><col width="70px" /><col width="80px" /><col width="45px" /><col width="60px" /></colgroup>
					<tr>
						<th>����</th>
						<td colspan="5" class="tit">[ <%if(v_togubun.equals("1")){out.println("��ڿ���");}else{out.println("���翡��");}%>] <%= v_title %> <%= "N".equals(v_isopen) ? "<img src=\"/images/portal/ico/ico_board_s.gif\" alt=\"\" class=\"mg_l9\" />" : "" %></td>
					</tr>
					<tr>
						<th>�ۼ���</th>
						<td><%= v_inusernm %></td>
						<th>�ۼ���</th>
						<td class="num"><%= v_indate %></td>
						<th>��ȸ</th>
						<td class="num"><%= v_cnt %></td>
					</tr>
					<tr>
						<td colspan="6" class="con"><%= v_contents %></td>
					</tr>
					</table>

		            <table class="study_write bo_tn">
		            <colgroup><col width="70px" /><col width="620px" /></colgroup>
		            <tr class="bgn">
		                <th class="th">÷������</th>
		                <td colspan="7" class="td pd_ln">
		                    <p><%=SubjQnaBean.selectQnaFileList(v_subj, v_year, v_subjseq, v_seq, v_kind)%></p>
		                </td>
		            </tr>
		            </table>

					<h3 class="mg_t30"><img src="/images/portal/myclass/study/stit_answer.gif" alt="���Ǵ亯" /></h3>
					<table class="study_write">
					<!--[if ie]><colgroup><col width="45px" /><col width="100px" /><col width="30px" /><col width="" /></colgroup><![endif]-->
					<colgroup><col width="65px" /><col width="100px" /><col width="50px" /><col width="" /></colgroup>
					<tr class="bo">
						<th class="th">����</th>
						<td colspan="7" class="td"><input type="text" name="p_title" class="inbox" style="width:590px;"/></td>
					</tr>
					<tr>
						<th class="th">�ۼ���</th>
						<td class="td txt"><%= v_user_name %></td>
						<th class="th">�ۼ���</th>
						<td class="td stxt ff_t"><%= FormatDate.getDate("yyyy.MM.dd") %></td>
					</tr>
					<tr>
						<td colspan="8" class="td con">
		                    <textarea  id="p_content" name="p_content" style="display:none;"></textarea>
							<script type="text/javascript">
							    var CrossEditor = new NamoSE("contents");
							    CrossEditor.editorStart();
							    //CrossEditor.SetUISize("500","600");
							</script>
						</td>
					</tr>
					</table>

                    <!-- ����÷�� ���� -->
                    <%
                    Vector i_realfileVector    = null;        // ���� ���ϸ�
                    Vector i_savefileVector    = null;        // ���� ���ϸ�
                    Vector i_fileseqVector     = null;         // ���� �Ϸù�ȣ
                    
                    int    i_fileLimit         = HomePageQnaBean.getFILE_LIMIT();             // ���� ÷�� ���ϼ�
                    
                    String i_formName          = "ff";                                        // Form �̸�A
                    String i_ServletName       = "HomePageQNAServlet";                        // ���� ���� �̸�
                    String i_boardStyle        = "study_write";                               // �Է� ���̺� Class ��
                    %>
                    
                    <%@ include file="/learn/user/portal/include/multiAttach_include.jsp" %>
                    <!-- ����÷�� ���� -->

					<p class="list_btn"><a href="javascript:qna_insert()" class="btn_gr"><span>����</span></a><a href="javascript:detail_qna()" class="btn_gr"><span>���</span></a></p>

				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
