<%
//**********************************************************
//  1. ��      ��: ���İ��� �ֱ�����
//  2. ���α׷���: gu_KnowBoard_U.jsp
//  3. ��      ��: ���İ��� �ֱ����� ����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 06.01.03
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.dunet.common.util.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    int     v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");
    String p_categorycd = box.getString("p_categorycd");            // request ī�װ�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";
    String v_categorycd = "";
    String v_categorynm = "";
    String v_types = "";

    String content = "";
    String width = "650";
    String height = "200";

    Vector v_realfileVector = null;          //      �����ϸ� �迭
    Vector v_savefileVector = null;          //      ������ ������ִ� ���ϸ� �迭
    Vector v_fileseqVector  = null;          //      ����� ���Ϲ�ȣ �迭

    DataBox dbox = (DataBox)request.getAttribute("SelectView");
    if (dbox != null ) {
        v_seq         = dbox.getInt("d_seq");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        v_content     = dbox.getString("d_contents");
        v_cnt         = dbox.getInt("d_cnt");
        v_indate      = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");
        v_fileseqVector  = (Vector)dbox.getObject("d_fileseq");
        
        content = StringManager.replace(dbox.getString("d_contents"),"\n;","<br>");
        v_title = StringManager.replace(v_title, "`", "'");

        v_types      = dbox.getString("d_types");
        v_categorycd = dbox.getString("d_categorycd");
        v_categorynm = dbox.getString("d_categorynm");
    }

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");
    int v_filecnt       = box.getInt("fielcnt"); // �ִ� ���� ÷�� ����
%>

<script language="JavaScript" type="text/JavaScript">
<!--

//����� ������ ����
function update() {
    if(document.all.use_editor[0].checked) {
        form1.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    }else {
        form1.content.value = document.all.txtDetail.value;
    }
    if (blankCheck(document.form1.p_title.value)) {
        alert("������ �Է��ϼ���!");
        document.form1.p_title.focus();
        return;
    }
    if (realsize(document.form1.p_title.value) > 200) {
        alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
        document.form1.p_title.focus();
        return;
    }
    if (blankCheck(document.form1.content.value)) {
        alert("������ �Է��ϼ���!");
        document.form1.p_content.focus();
        return;
    }

            //���� Ȯ���� ���͸�
        var islimit = true;

        for(var i=1; i<=1; i++){
            var file = eval("document.form1.p_file1.value");

            if(file!="") {
                islimit = limitFile(file);

                if(!islimit) break;
            }
        }

        if(islimit) {
            document.form1.p_search.value     = "";
            document.form1.p_searchtext.value = "";
            document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
            document.form1.p_process.value = "update";
            document.form1.submit();
        }else{
            return;
        }

}

//����Ʈ ȭ������ �̵�
function cancel() {
     document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
     document.form1.p_process.value = "ListPage";
     document.form1.submit();
}

//�󳻿� üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;

    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);

    return (false);
}

//���� ������ üũ
function realsize( value ) {
    var len = 0;
    if ( value == null ) return 0;
    for(var i=0;i<value.length;i++){
        var c = escape(value.charAt(i));
        if ( c.length == 1 ) len ++;
        else if ( c.indexOf("%u") != -1 ) len += 2;
        else if ( c.indexOf("%") != -1 ) len += c.length/3;
    }
    return len;
}

//����÷�ο� ���� ����
function File_CancelKeyInput()
{
    if(event.keyCode == 9){ // Tab key�� ���
        return true;
    }else{
        alert('[ã�ƺ���] ��ư�� �̿��� ÷���Ͻ� ������ �����ϼ���.\n\n��θ� �������� �߸� �Է��Ͻ� ��� ���ε尡 ����� �̷������ �ʽ��ϴ�.');
        return false;
    }
}


// ī�װ� ����
function openCategory(){
    window.self.name = "winSelectList";
    open_window("openwinSelectList","","100","100","390","400","","","","yes","");
    document.form1.target = "openwinSelectList";
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "OpenCategoryPage";
    document.form1.submit();
    document.form1.target = window.self.name;

}
//-->
</script>
          <!-- center start -->
 
<%@ include file="/learn/user/portal/include/topfactory.jsp"%>

	<div id="container">
		<div class="contentL">
			<!-- ���� ������ ���� -->
			<div><img src="/images/factory/show.gif"></div>
			<ul class="tabmenu">
				<li><img src="/images/factory/tab01over.gif" id="tab01" onclick="postchg('1');" alt="����"></li>
				<li><img src="/images/factory/tab02.gif" id="tab02" onclick="postchg('2');" alt="��ۿ���"></li>
				<li><img src="/images/factory/tab03.gif" id="tab03" onclick="postchg('3');" alt="���Ӱ���"></li>
				<li><img src="/images/factory/tab04.gif" id="tab04" onclick="postchg('4');" alt="��ȭ������"></li>
				<li><img src="/images/factory/tab05.gif" id="tab05" onclick="postchg('5');" alt="���� �ۼ��� ��"></li>
			</ul>
			<!-- ���� �� ���� -->
			<form name = "form1" enctype = "multipart/form-data" method = "post">
		    <input type = "hidden" name = "p_process"     value="">			
			<input type = "hidden" name = "p_pageno"      value = "">
			<input type = "hidden" name = "p_userid"      value = "">
			<input type = "hidden" name = "p_brdno"       value = "<%=box.getInt("p_brdno") %>">
			<input type = "hidden" name = "p_rowseq"      value = "">
			<input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">
			<input type = "hidden" name = "p_searchtext"  value = "<%=v_searchtext%>">
			<input type = "hidden" name = "p_select"      value = "">
			<input type = "hidden" name = "p_brd_fg"       value = "">
    
			<table class="writeform" cellpadding="0" cellspacing="0">
				<colgroup><col width="150"><col width="*"></colgroup>
				
				<tr>
					<th class="colorA">����</th>
					<td class="colorA noline"><input name="p_title" type="text" size="60" value="<%=dbox.getString("d_title") %>"></td>
				</tr>
				 <tr>
	             <td colspan="8" class="td con">
	                    <textarea id="p_content" name="p_content" style="display:none;"><%=StringManager.replace(dbox.getString("d_content"), "&", "&amp") %></textarea>
						<script type="text/javascript">
						    var CrossEditor = new NamoSE("contents");
						    var contentValue = document.getElementById("p_content").value; // Hidden �� ����
						    CrossEditor.editorStart();
						    CrossEditor.SetUISize("650","400");
						    CrossEditor.SetBodyValue(contentValue); // ������ ���� ������ ����
						</script>
	                </td>
	            </tr>            
							
			</table>
			 <!-- ����÷�� ���� -->
            <%
            Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
            Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
            Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileno");          // ���� �Ϸù�ȣ
            
            int    i_fileLimit         = v_filecnt;             // ���� ÷�� ���ϼ�
            
            String i_formName          = "form1";                                     // Form �̸�
            String i_ServletName       = "CommunityFrBoardServlet";                   // ���� ���� �̸�
            String i_boardStyle        = "study_write";                               // �Է� ���̺� Class ��
            %>
            <%@ include file="/learn/user/portal/include/multiAttach_include.jsp" %>
            <!-- ����÷�� ���� -->
            <div class="writefooter">
            <a href="javascript:update();" class="btn_gr"><span>����</span></a><a href="javascript:cancel();" class="btn_gr"><span>���</span></a>			
			</div>
			</form>	
			<!-- ���� �� �� -->
			<!-- ���� ������ �� -->
		</div>	
		
	<%@ include file="/learn/user/portal/include/rightmenu.jsp"%>
		<div class="clearL"><!-- no cut --></div>
	</div>
		
	<!-- �ϴ� ���� -->
	<div id="footer">
		<div class="about">
			<table class="inabout" cellpadding="0" cellspacing="0">
				<colgroup><col width="112"><col width="66"><col width="111"><col width="65"><col width="*"><col width="180"></colgroup>
				<tr>
					<td><a href="#"><img src="/images/common/btn_btm_01.gif" alt="��������ó����ħ"></a></td>
					<td><a href="#"><img src="/images/common/btn_btm_02.gif" alt="�̿���"></a></td>
					<td><a href="#"><img src="/images/common/btn_btm_03.gif" alt="�̸��Ϲ��ܼ����ź�"></a></td>
					<td><a href="#"><img src="/images/common/btn_btm_04.gif" alt="����Ʈ��"></a></td>
					<td class="alignR"><img src="/images/common/txt_familysite.gif" alt="����Ʈ��"></td>
					<td class="alignL">
						<select>
              <option>���û���Ʈ�ٷΰ���</option>
              <option value='N000001:7:N'>��ȭü��������</option>
              <option value='N000001:25:N'>�ѱ������������</option>
              <option value='N000001:38:N'>������ ������</option>
              <option value='N000001:40:N'>�۷ι�������꼾��</option>
              <option value='N000001:41:N'>��ȭ������ ����</option>
              <option value='N000001:43:N'>�������̿뺸ȣ����</option>
              <option value='N000001:44:N'>���۱���Ź�����ý���</option>
              <option value='N000001:46:N'>�������ĺ�ü��(UCI)</option>
              <option value='N000001:47:N'>���ӱ�������ڰݰ���</option>
              <option value='N000001:48:N'>�����η������ý���</option>
              <option value='N000001:49:N'>���Ǿ�ī�̺�</option>
              <option value='N000001:52:N'>���������ī������ý���</option>
            </select>
					</td>
				</tr>
			</table>
		</div>
		<table class="copyright" cellpadding="0" cellspacing="0">
			<colgroup><col width="*"><col width="64"><col width="64"><col width="59"><col width="63"></colgroup>
			<tr>
				<td class="alignL"><img src="/images/common/copyright.gif" alt="copyright"></td>
				<td class="alignR"><a href="#"><img src="/images/common/i_safe_mark.gif" alt="i-Safe"></a></td>
				<td class="alignR"><a href="#"><img src="/images/common/eprivacy_mark.gif" alt="ePRIVACY"></a></td>
				<td class="alignR"><a href="#"><img src="/images/common/gsc_mark.gif" alt="good Content Service"></a></td>
				<td class="alignR"><a href="#"><img src="/images/common/mark_circle_blue_s.gif" alt="Ŭ���Ͻø� �̴Ͻý��� ��ȿ���� Ȯ�� �Ͻ� �� �ֽ��ϴ�."></a></td>
			</tr>
		</table>
	</div>
	<!-- �ϴ� �� -->
</div>
</body>
</html>


