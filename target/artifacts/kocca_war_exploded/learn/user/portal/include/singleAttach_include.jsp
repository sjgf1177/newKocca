<%@ page contentType="text/html;charset=MS949"%>
<%@ page errorPage="/learn/library/error.jsp"%>

<%
/*
	<jsp:include page="/learn/user/portal/include/singleAttach_include.jsp">
		<jsp:param name="i_imageFlag"           value="Y" />                                    <!-- �̹��� �̸����� ����(Y/N) -->
		<jsp:param name="i_targetImg"           value="img_photo" />                            <!--  i_imageFlag �� 'Y' �϶��� img ������Ʈ id ���-->
		<jsp:param name="i_realFileName"        value="" />                                     <!-- ���� ���ϸ� ��� -->    
		<jsp:param name="i_saveFileName"        value="" />                                     <!-- ���� ���ϸ� ��� -->                        
		<jsp:param name="i_inputFileParamName"  value="p_img_path" />                           <!-- Input File�� name �Ķ���� �� -->
		<jsp:param name="i_formName"            value="form1" />                                <!-- Form �̸� -->
		<jsp:param name="i_ServletName"         value="CommunityCreateServlet" />               <!-- ���� ���� �̸� -->
		<jsp:param name="i_searchOnImagePath"   value="/images/portal/btn/file_search_on.gif" /><!-- ã�ƺ��� ��ư ���콺 ���� �̹��� ��� -->
		<jsp:param name="i_searchOffImagePath"  value="/images/portal/btn/file_search.gif" />   <!-- ã�ƺ��� ��ư ���콺 �ƿ� �̹��� ���-->
		<jsp:param name="i_style"               value="" />                                     <!-- ��Ÿ�� ���(��ư ��ġ ����) -->
		<jsp:param name="i_year"                value="" />                                     <!-- �����⵵ -->
        <jsp:param name="i_subj"                value="" />                                     <!-- �����ڵ�-->
	</jsp:include>                                                           

*/
%>

<%@ page import="com.dunet.common.util.UploadUtil"%>
<%@ page import="com.dunet.common.util.StringUtil"%>

<%
    // ���ް� �ʱ�ȭ
	String  i_imageFlag            = StringUtil.getString(request.getParameter("i_imageFlag"));
	String  i_targetImg            = StringUtil.getString(request.getParameter("i_targetImg"));
	String  i_realFileName         = StringUtil.getString(request.getParameter("i_realFileName"));
	String  i_saveFileName         = StringUtil.getString(request.getParameter("i_saveFileName"));
	String  i_inputFileParamName   = StringUtil.getString(request.getParameter("i_inputFileParamName"));
	String  i_formName             = StringUtil.getString(request.getParameter("i_formName"));
	String  i_ServletName          = StringUtil.getString(request.getParameter("i_ServletName"));
	String  i_searchOnImagePath    = StringUtil.getString(request.getParameter("i_searchOnImagePath"));
	String  i_searchOffImagePath   = StringUtil.getString(request.getParameter("i_searchOffImagePath"));
	String  i_style                = StringUtil.getString(request.getParameter("i_style"));
	String  i_year                 = StringUtil.getString(request.getParameter("i_year")); 
	String  i_subj                 = StringUtil.getString(request.getParameter("i_subj")); 
	String  i_fileSize             = StringUtil.getString(request.getParameter("i_fileSize"));

	// �����޽� �⺻�� ����
	if (i_imageFlag.equals(""))            i_imageFlag = "N";
	if (i_formName.equals(""))             i_formName = "form1";
	if (i_ServletName.equals(""))          i_ServletName = "HomePageQna";
	if (i_searchOnImagePath.equals(""))    i_searchOnImagePath = "/images/portal/btn/file_search_on.gif";
	if (i_searchOffImagePath.equals(""))   i_searchOffImagePath = "/images/portal/btn/file_search.gif";
	if (i_style.equals(""))                i_style = "vertical-align:10px;";
	if (i_fileSize.equals(""))             i_fileSize = "0";

	
	UploadUtil uploadUtil = new UploadUtil();
	
	String sRelativeDir = uploadUtil.getRelativePath(i_ServletName, i_year, i_subj); 

	//���ε� ��� ����
	sRelativeDir = StringUtil.replaceAll(sRelativeDir, '\\', '/');
	
	
	//�������ϸ� ����� ���
	StringBuffer i_sUploadFileHtml = new StringBuffer();
	if(!i_realFileName.equals("")){
		i_sUploadFileHtml.append("&nbsp;&nbsp;"); 
		i_sUploadFileHtml.append("<img src=\"/images/portal/ico/ico_file.gif\" alt=\"file\" class=\"mg_r6\" />");
		i_sUploadFileHtml.append("<a href = \"/servlet/controller.library.DownloadServlet?p_savefile=").append(i_saveFileName).append("&p_realfile="+i_realFileName+"\">").append(i_realFileName).append(" (").append(StringUtil.setString(i_fileSize)).append(" Bytes)</a>");
		i_sUploadFileHtml.append("<span id=\"span_del\" name=\"span_del\" onclick=\"").append(i_inputFileParamName).append("_fnFileDel(this)\"> <img src=\"/images/portal/btn/btn_s_close.gif\" alt=\"x\" style='cursor:pointer;' align='absmiddle'/></span>");
	}
%>

<div id="<%=i_inputFileParamName%>_div_attachMain" style="float: left; padding: 0 5px 0 0;">
    <span id="<%=i_inputFileParamName%>_div_inputFile" style="float: left; padding: 0 5px 0 0;"> 
    <input type="file" name="<%=i_inputFileParamName%>" id="<%=i_inputFileParamName%>"
	       imageswap="true" imagesrc="<%=i_searchOffImagePath%>"
	       onchange="<%=i_inputFileParamName%>_fnFileFocus();"
	       style="<%=i_style%>float:left;padding:0 5px 0 0;cursor:pointer;"
	       onmouseover="this.parentNode.style.backgroundImage='url(<%=i_searchOnImagePath%>)';"
	       onmouseout="this.parentNode.style.backgroundImage='url(<%=i_searchOffImagePath%>)';" />
    </span> 
    <a href="javascript:<%=i_inputFileParamName%>_fnFileReset();" class="board_btn" style="float: left; padding: 0 0px 0 0;">
	<span>�ʱ�ȭ</span></a>
    <span id="<%=i_inputFileParamName%>_div_tempFileNm">
    <%=i_sUploadFileHtml.toString()%>
    </span> 
    <span id="<%=i_inputFileParamName%>_div_attach"> 
        <input type="hidden" name="<%=i_inputFileParamName%>_status"    id="<%=i_inputFileParamName%>_status" value="old"> 
        <input type="hidden" name="p_inputFileParamName"                value="<%=i_inputFileParamName%>"> 
        <input type="hidden" name="<%=i_inputFileParamName%>_realfile"  id="<%=i_inputFileParamName%>_realfile"     value="<%=i_realFileName%>">
        <input type="hidden" name="<%=i_inputFileParamName%>_savefile"  id="<%=i_inputFileParamName%>_savefile"     value="<%=i_saveFileName%>">
        <input type="hidden" name="<%=i_inputFileParamName%>_filevalue" id="<%=i_inputFileParamName%>_filevalue"    value=""> 
        <input type="hidden" name="<%=i_inputFileParamName%>_temppath"  id="<%=i_inputFileParamName%>_temppath"     value="">
        <input type="hidden" name="<%=i_inputFileParamName%>_filesize"  id="<%=i_inputFileParamName%>_filesize"     value="<%=i_fileSize %>">  
    </span> 
    
    <IFRAME ID="<%=i_inputFileParamName%>_IFRAME_THUB" NAME="<%=i_inputFileParamName%>_IFRAME_THUB" SRC="about:blank"
	       WIDTH="0" HEIGHT="0" FRAMEBORDER="0" MARGINHEIGHT="0" MARGINWIDTH="0"
	       SCROLLING="NO" style="display: none;" ></IFRAME> 
	
	<input type="hidden" name="<%=i_inputFileParamName%>_servletnm" value = "<%=i_ServletName %>"/> 
	<input type="hidden" name="<%=i_inputFileParamName%>_relativedir" id="<%=i_inputFileParamName%>_relativedir" value="<%=sRelativeDir%>" />

<script language="JavaScript">
<!--

    var <%=i_inputFileParamName%>_initAttachHtml ="";                       

    var <%=i_inputFileParamName%>_frm     = document.<%=i_formName%>;         // ���� form ����
    
    var <%=i_inputFileParamName%>_tempDivInnerHtml    = "";                   // ÷������ �ʱ�ȭ�� Inner HTML            
    var <%=i_inputFileParamName%>_tempUploadPath      = "<%=sRelativeDir%>";  // �ӽ� ���ε� ���
    var <%=i_inputFileParamName%>_tempImgSrc          = "";                   // ÷������ �ʱ�ȭ�� Img SRC

    
    <%// Ÿ�� �̹��� ��ΰ� ������ �ʱ�ȭ �� ���ư� ��θ� �����Ѵ�.
    if (!i_targetImg.equals("")) {%>
    var <%=i_inputFileParamName%>_img_obj = document.getElementById("<%=i_targetImg%>");  
    <%=i_inputFileParamName%>_tempImgSrc = <%=i_inputFileParamName%>_img_obj.src;            // ���� �� �̹��� src�� �ӽ� �Ķ���Ϳ� ����
    <%}%>

    // ÷������ �߰�
    function <%=i_inputFileParamName%>_fnAddAttach()
    {
        alert("÷������ �߰�. ����� �����ϴ�.");return;
    }

    // ���� ���ε��� ���� �߻���
    function <%=i_inputFileParamName%>_fnFileUploadError()
    {
        //fnFileReset(att_idx);
        var fileNm_obj      = document.getElementById("<%=i_inputFileParamName%>_div_inputFile");
        var img_obj         = document.getElementById("<%=i_inputFileParamName%>_div_fileName");

        // �ε��� �̹��� ����
        <%=i_inputFileParamName%>_fileNm_obj.style.display   = "block";
        <%=i_inputFileParamName%>_img_obj.style.display      = "none";
        <%=i_inputFileParamName%>_bFileDownYN         = false;
    }

    // ����
    function <%=i_inputFileParamName%>_fnFileDel(obj)
    {
        var idx             = <%=i_inputFileParamName%>_getIndex(obj);
        var status_obj      = document.getElementsByName("<%=i_inputFileParamName%>_status");
        
        if ( status_obj[idx].value == "old" )
        {
        	<%=i_inputFileParamName%>_fnDeleteFileAdd(idx);
        }

        <%=i_inputFileParamName%>_fnDelAttach();
    }

    // ÷������ ����
    function <%=i_inputFileParamName%>_fnDelAttach( )
    {
        var div_tempFileNm      = document.getElementById("<%=i_inputFileParamName%>_div_tempFileNm");
        var status_obj          = document.getElementById("<%=i_inputFileParamName%>_status");
        var saveFileName_obj    = document.getElementById("<%=i_inputFileParamName%>_savefile");
        var realFileName_obj    = document.getElementById("<%=i_inputFileParamName%>_realfile");
        var fileValue_obj       = document.getElementById("<%=i_inputFileParamName%>_filevalue");
        var tempPath_obj        = document.getElementById("<%=i_inputFileParamName%>_temppath");
        
        div_tempFileNm.innerHTML = "";
        status_obj.value        = "old";
        saveFileName_obj.value  = "";
        realFileName_obj.value  = "";
        fileValue_obj.value     = "";
        tempPath_obj.value      = "";
        
        <%if (!i_targetImg.equals("")) {%>
        //<%=i_inputFileParamName%>_img_obj.src   = <%=i_inputFileParamName%>_tempImgSrc;
        <%=i_inputFileParamName%>_img_obj.src   = "/images/portal/thumb/thumb_335_200.gif";
        <%}%>
        
    }

    // ÷������ �ʱ�ȭ
    function <%=i_inputFileParamName%>_fnFileReset()
    {
        var bRtn = confirm("��� ÷������ ��������� �ʱ�ȭ�˴ϴ�. �����Ͻðڽ��ϱ�?");
        if(bRtn) {
            document.getElementById("<%=i_inputFileParamName%>_div_attachMain").innerHTML = <%=i_inputFileParamName%>_initAttachHtml;
            <%if (!i_targetImg.equals("")) {%>
            <%=i_inputFileParamName%>_img_obj.src   = <%=i_inputFileParamName%>_tempImgSrc;
            <%}%>
        }

        myFileButton.run();
    }

    // ã�ƺ��� ��ư�� Ŭ���ߴ��� ����
    var <%=i_inputFileParamName%>_bFileDownYN     = false;
    var <%=i_inputFileParamName%>_att_idx         = 0;

    // 
    var <%=i_inputFileParamName%>_search_obj;

    // ã�ƺ��� ��ư�� Ŭ���� �� ��Ŀ���� ���� ���ε带 ��Ų��
    function <%=i_inputFileParamName%>_fnFileFocus(obj)
    {
        if (!<%=i_inputFileParamName%>_bFileDownYN)
        {
        	<%=i_inputFileParamName%>_bFileDownYN     = true;
        	<%=i_inputFileParamName%>_fnAttachNormal();
        }
        else
        {
            alert("������ ���ε� �ϴ� ���Դϴ�. ��� �Ŀ� �ٽ� �õ��ϼ���.");
            return;
        }
    }


    // ÷������ �ӽ������� ����
    function <%=i_inputFileParamName%>_fnAttachNormal()
    {
    	<%=i_inputFileParamName%>_search_obj      = document.getElementById("<%=i_inputFileParamName%>");

        // ���ϸ� üũ�� ���ϰ�δ� �����ϰ� üũ�Ѵ�
        var sCheckFileName  = <%=i_inputFileParamName%>_search_obj.value;
            sCheckFileName  = sCheckFileName.substr(sCheckFileName.lastIndexOf("/") + 1, sCheckFileName.length);

        if (sCheckFileName.indexOf(',') > -1)
        {
            alert("Special character \",\" You can not attach files that contain.");
            return;
        }
        if (sCheckFileName.indexOf('\'') > -1)
        {
            alert ("Special character \"'\" You can not attach files that contain.");
            return;
        }
        // input file�� ���� ������ false(�� ���⼭ �޼��� �ڽ��� �������� �ʴ´�(��ҹ�ư�� Ŭ������ ��쿡 �ش��)
        if (<%=i_inputFileParamName%>_frm["<%=i_inputFileParamName%>"].value == "") return;

        // �ε��� ǥ��
        <%=i_inputFileParamName%>_setImageLoadding();
        
        var oldTarget   = <%=i_inputFileParamName%>_frm.target;

        var param = "?p_servletnm=<%=i_ServletName%>"
                  + "&p_paramnm=<%=i_inputFileParamName%>"
                  + "&p_real_filename="+sCheckFileName
                  + "&p_fileseq=0"
                  + "&p_year=<%=i_year%>"
                  + "&p_subj=<%=i_subj%>"
                  + "&p_inputFileParamName=<%=i_inputFileParamName%>";
        
        <%=i_inputFileParamName%>_frm.action      = "/learn/user/portal/include/singleAttach_save.jsp"+param;
        <%=i_inputFileParamName%>_frm.target      = "<%=i_inputFileParamName%>_IFRAME_THUB";
        <%=i_inputFileParamName%>_frm.encoding    = "multipart/form-data";
        <%=i_inputFileParamName%>_frm.submit();
        
        <%=i_inputFileParamName%>_frm.target      = oldTarget;
    }

    // ���� ���ε� �Ϸ���
    function <%=i_inputFileParamName%>_setUploadFile( obj )
    {
        var divAttachObj    = document.getElementById("<%=i_inputFileParamName%>_div_attach");

        var status_obj       = document.getElementById("<%=i_inputFileParamName%>_status");
        var saveFileName_obj  = document.getElementById("<%=i_inputFileParamName%>_savefile");
        var realFileName_obj  = document.getElementById("<%=i_inputFileParamName%>_realfile");
        var fileValue_obj     = document.getElementById("<%=i_inputFileParamName%>_filevalue");
        var tempPath_obj      = document.getElementById("<%=i_inputFileParamName%>_temppath");
        var fileSize_obj      = document.getElementById("<%=i_inputFileParamName%>_filesize");

        if(status_obj.value != null && status_obj.value == "old" && saveFileName_obj.value != ""){
        	<%=i_inputFileParamName%>_fnDeleteFileAdd();
        }

        // �ε��� �̹��� ����
        <%if (!i_targetImg.equals("")) {%>
        
        <%=i_inputFileParamName%>_img_obj.src   = obj.sWebUploadTempPath+obj.sUploadNm;

        <%}%>
        
        <%if (i_targetImg.equals("")) {%>
        var divTempFileNm       = document.getElementById("<%=i_inputFileParamName%>_div_tempFileNm");
        
        divTempFileNm.innerHTML  = "&nbsp;&nbsp;"; 
        divTempFileNm.innerHTML += "<img src=\"/images/portal/ico/ico_file.gif\" alt=\"file\" class=\"mg_r6\" />";
        divTempFileNm.innerHTML += "<a href = \"/servlet/controller.library.DownloadServlet?p_savefile="+obj.sWebUploadTempPath+obj.sUploadNm+"&p_realfile="+obj.sRealFileName+"\">"+obj.sRealFileName+" ("+numberFormatComma(obj.nFileSize)+" Bytes)</a>";
        divTempFileNm.innerHTML += "<span id=\"span_del\" name=\"span_del\" onclick=\"<%=i_inputFileParamName%>_fnFileDel(this)\"> <img src=\"/images/portal/btn/btn_s_close.gif\" alt=\"x\" style='cursor:pointer;' align='absmiddle'/></span>";
        <%} %>
        
        status_obj.value           = "new";
        saveFileName_obj.value     = obj.sUploadNm;
        realFileName_obj.value     = obj.sRealFileName;
        fileValue_obj.value        = obj.value;
        tempPath_obj.value         = obj.sUploadTempPath+obj.sUploadNm;
        fileSize_obj.value         = obj.nFileSize;
        
        <%=i_inputFileParamName%>_bFileDownYN  = false;

        // Input file �ʱ�ȭ
        var divInputFile = document.getElementById("<%=i_inputFileParamName%>_div_inputFile");
        var fileObj = document.getElementById("<%=i_inputFileParamName%>");
        fileObj.select();
        document.execCommand('Delete', false, null);
        divInputFile.innerHTML = divInputFile.innerHTML;
    }

    // �������� ��� �߰�
    function <%=i_inputFileParamName%>_fnDeleteFileAdd()
    {
        var divAttach           = document.getElementById("<%=i_inputFileParamName%>_div_attachMain");
        var saveFileName_obj    = document.getElementById("<%=i_inputFileParamName%>_savefile");
        var saveFileName        = saveFileName_obj.value;

        var oInput  = document.createElement("<input type='hidden' name='p_del_savefile' value='" + saveFileName + "'>");

        divAttach.insertAdjacentElement("afterBegin", oInput);
    }

    
    // �̹��� ����
    function <%=i_inputFileParamName%>_setImageLoadding()
    {
        <%if (!i_targetImg.equals("")) {%>

        <%=i_inputFileParamName%>_img_obj.src   = "/images/portal/common/ajax-loader1.gif";
        <%}%>
        <%if (i_targetImg.equals("")) {%>
        var divTempFileNm       = document.getElementById("<%=i_inputFileParamName%>_div_tempFileNm");
        divTempFileNm.innerHTML = "<img src='/images/portal/common/ajax-loader.gif' height='10px' width='30px'/>";
        <%}%>

    }

 // index �� ��������
    function <%=i_inputFileParamName%>_getIndex(obj)
    {
        var idx     = -1;
        var obj_arr = document.getElementsByName(obj.id);
        var len     = obj_arr.length;
        
        for (var i = 0; i < len ; i++ )
        {
            if (obj == obj_arr[i])
            {
                idx     = i;
                break;
            }
        }
        return idx;
    }

//-->
</script></div>
<script type="text/javascript" src="/script/portal/FileButton.js"></script>
<script language="JavaScript">
// �ʱ�ȭ �� �ʿ��� Input file ���� innerHtml �� �����
<%=i_inputFileParamName%>_initAttachHtml = document.getElementById("<%=i_inputFileParamName%>_div_attachMain").innerHTML;

// ��� ã�ƺ��� ��ư�� �̹����� ��ȯ
var myFileButton = new FileButton("imageswap", "imagesrc");
window.onload = function () {

    myFileButton.run(); //�����ε� �� �Ѳ����� �ٲ�

}
</script>
