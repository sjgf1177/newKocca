<%
     /*
            Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
            Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
            Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ
            
            int    i_fileLimit         = HomePageQnaBean.getFILE_LIMIT();             // ���� ÷�� ���ϼ�
            
            String i_formName          = "form1";                                     // Form �̸�
            String i_ServletName       = "HomePageQNAServlet";                        // ���� ���� �̸�
            String i_boardStyle        = "";                                          // ���� ��Ÿ��
     */
%>
<%@ page import="com.dunet.common.util.UploadUtil" %>
<%
    UploadUtil uploadUtil = new UploadUtil();
    String  sRelativeDir    = uploadUtil.getRelativePath(i_ServletName);
%>

<%

// ���������� ����� ���ؼ�..
if ( 1 == 1 )
{
    int     attMinCnt               = 0;
    int     attMaxCnt               = i_fileLimit;
    int     attDefaultCnt           = i_realfileVector != null ? i_realfileVector.size() : 0;
    int     startNum                = 0;

%>

<div id="div_attachMain">

<table cellpadding="0" cellspacing="0" border="1" width="840">
            <% if (i_fileLimit == 1 ) { %>
            <!--[if ie]><colgroup><col width="105px" /><col width="" /></colgroup><![endif]-->
            <colgroup><col width="125px" /><col width="" /></colgroup>
            <% } else { %>
            <!--[if ie]><colgroup><col width="65px" /><col width="625px" /></colgroup><![endif]-->
            <colgroup><col width="85px" /><col width="625px" /></colgroup>
            <% } %>
            <tr >
                <td class="tit_table" width="90"><label for="file"><%=i_fileLimit == 1 ? "��ǥ�̹��� ���" : "÷������" %></label></td>
                <td class="ct_tit_table_lright">
                    <div id="div_inputFile">
                    <table border="0" cellpadding="0" cellspacing="0">
                    <tr><td width="70px">
                    <!--input type="text" name="TX_TMP_FILENAME" id="tempFileText" class="inbox fl_l mg_r6" style="width:300px;" readonly/-->
                    <input type="file" name="p_file" id="p_file" imageswap="true" imagesrc="/images/portal/btn/file_search.gif"  onChange="fnFileFocus()" style="vertical-align:7px;cursor:pointer;" onmouseover="this.parentNode.style.backgroundImage='url(/images/portal/btn/file_search_on.gif)';" onmouseout="this.parentNode.style.backgroundImage='url(/images/portal/btn/file_search.gif)';"/>
                    </td><td>
                    <a href="javascript:fnFileReset();" class="board_btn"><span>�ʱ�ȭ</span></a></td></tr></table>
                    </div>
                    
                    <div id="div_fileName" style="width:300px;display:none;"></div>
                </td>
            </tr>
            <tr >
                <td class="tit_table">&nbsp;</td>
                <td class="ct_tit_table_lright">&nbsp;<div id="div_attach">
				<%
			        if( i_realfileVector != null && i_realfileVector.size() > 0 ) {
			        	String v_realfile = "";
			        	String v_savefile = "";
			        	String v_fileseq  = "";
				        for (int i_i = 0 ; i_i < i_realfileVector.size(); i_i++) {
				        	v_realfile = (String)i_realfileVector.elementAt(i_i);
				            v_savefile = (String)i_savefileVector.elementAt(i_i);
				            v_fileseq  = (String)i_fileseqVector.elementAt(i_i);
				            if( !v_realfile.equals("") ) {
				%>
                    <p id="file_list" class="file_list">
                    <img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6" /><a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a><span id="span_del" onclick="fnFileDel(this)" style="cursor:pointer;"><img src="/images/portal/btn/btn_s_close.gif" alt="x" /></span>
                    <input type = "hidden"    name = "p_status"    value = "old">
                    <input type = "hidden"    name = "p_fileseq"   value = "<%= v_fileseq%>">
                    <input type = "hidden"    name = "p_realfile"  value = "<%=v_realfile%>">
                    <input type = "hidden"    name = "p_savefile"  value = "<%=v_savefile%>">
                    <input type = "hidden"    name = "p_filevalue" value = "">
                    <input type = "hidden"    name = "p_temppath"  value = "">
                    </p>
               
                <%      	}
                		}
                    } 
                %>
                </div>
                </td>
            </tr>          
        </table>


<IFRAME ID="IFRAME_THUB" NAME="IFRAME_THUB" SRC="about:blank" WIDTH="0" HEIGHT="0" FRAMEBORDER="0" MARGINHEIGHT="0" MARGINWIDTH="0" SCROLLING="NO"></IFRAME>
<input type = "hidden" name = "p_servletnm"/>
<input type = "hidden" name = "p_relativedir" value="<%=sRelativeDir %>"/>

<script type="text/javascript" src="/script/portal/FileButton.js"></script>
<script language="JavaScript">  
<!--
var initAttachHtml ="";
//���� ÷�� ���� ��ũ��Ʈ
var myFileButton = new FileButton("imageswap", "imagesrc");

window.onload = function () { 
    //myFileButton.run(); //�����ε� �� �Ѳ����� �ٲ� 

} 
    // [JS_AUTH1] �̹��� Dom

    var frm     = document.<%= i_formName %>;

    var attMinCnt    = <%=attMinCnt%>;
    var attMaxCnt    = <%=attMaxCnt%>;

    var addCnt       = 0;

    // ÷������ �߰�
    function fnAddAttach()
    {
        alert("÷������ �߰�. ����� �����ϴ�.");return;
    }

    // ���� ���ε��� ���� �߻���
    function fnFileUploadError()
    {
        //fnFileReset(att_idx);
        var fileNm_obj      = document.getElementById("div_inputFile");
        var img_obj         = document.getElementById("div_fileName");

        // �ε��� �̹��� ����
        fileNm_obj.style.display   = "block";
        img_obj.style.display      = "none";
        bFileDownYN         = false;
    }

    // ����
    function fnFileDel(obj)
    {
        var idx             = getIndex(obj);
        var status_obj      = document.getElementsByName("p_status");
        
        if ( status_obj[idx].value == "old" )
        {
            fnDeleteFileAdd(idx);
        }

        fnDelAttach( idx );
    }

    // ÷������ ����
    function fnDelAttach( idx )
    {
        var att_main_obj    = document.getElementById("div_attach");
        var att_obj         = document.getElementsByName("file_list");
        var len             = att_obj.length;
        
        if (attMinCnt < len)
        {
            if (idx < len)
            {
                att_main_obj.removeChild(att_obj[idx]);
            }
        }
        else
        {
            fnFileReset( idx );
        }
    }

    // �������� ��� �߰�
    function fnDeleteFileAdd( idx )
    {
    	var divAttach         = document.getElementById("div_attachMain");
        
        var fileSeq_obj       = document.getElementsByName("p_fileseq");
        var saveFileName_obj  = document.getElementsByName("p_realfile");
        var realFileName_obj  = document.getElementsByName("p_savefile");

        var fileSeq         = fileSeq_obj[idx].value;
        var saveFileName    = saveFileName_obj[idx].value;
        var realFileName    = realFileName_obj[idx].value;

        var oInput1  = document.createElement('<input type="hidden" name="p_del_fileseq"  value="' + fileSeq + '">');
        var oInput2  = document.createElement('<input type="hidden" name="p_del_realfile" value="' + realFileName + '">');
        var oInput3  = document.createElement('<input type="hidden" name="p_del_savefile" value="' + saveFileName + '">');

        divAttach.insertAdjacentElement("afterBegin", oInput1);
        divAttach.insertAdjacentElement("afterBegin", oInput2);
        divAttach.insertAdjacentElement("afterBegin", oInput3);

        //frm.temptext.value = frm.innerHTML;
        
    }

    // ÷������ �ʱ�ȭ
    function fnFileReset( idx )
    {
        var bRtn = confirm("��� ÷������ ��������� �ʱ�ȭ�˴ϴ�. �����Ͻðڽ��ϱ�?");
    	if(bRtn) {
        	document.getElementById("div_attachMain").innerHTML = initAttachHtml;
    	}

    	myFileButton.run();
    }

    // ã�ƺ��� ��ư�� Ŭ���ߴ��� ����
    var bFileDownYN     = false;
    var att_idx         = 0;

    // 
    var search_obj;

    // ã�ƺ��� ��ư�� Ŭ���� �� ��Ŀ���� ���� ���ε带 ��Ų��
    function fnFileFocus(obj)
    {
        var attachLen = document.getElementsByName("p_status").length;

        if(attachLen >= <%=attMaxCnt%>){
            alert("���̻� ������ ÷���ϽǼ� �����ϴ�.");
            return;
        }
        
        if (!bFileDownYN)
        {
            bFileDownYN     = true;
            //att_idx         = getIndex(obj);
            fnAttachNormal(att_idx);
        }
        else
        {
            alert("Upload in progress. Please try again later.");
            return;
        }
    }

    // index �� ��������
    function getIndex(obj)
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

    // ÷������ �ӽ������� ����
    function fnAttachNormal(idx)
    {
        search_obj      = document.getElementById("p_file");

        // ���ϸ� üũ�� ���ϰ�δ� �����ϰ� üũ�Ѵ�
        var sCheckFileName  = search_obj.value;
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
        if (frm["p_file"].value == "") return;

        // �ε��� ǥ��
        setImageLoadding();
        
        var oldTarget   = frm.target;

        var param = "?p_servletnm=<%=i_ServletName%>"
                  + "&p_paramnm=p_file"
                  + "&p_real_filename="+sCheckFileName
                  + "&p_fileseq="+idx;
        
        frm.action      = "/learn/user/portal/include/multiAttach_save.jsp"+param;
        frm.target      = "IFRAME_THUB";
        frm.encoding    = "multipart/form-data";
        frm.submit();

        frm.target      = oldTarget;

        att_idx++;
        addCnt++;
    }

    // ���� ���ε� �Ϸ���
    function setUploadFile( obj )
    {
    	var divAttachObj = document.getElementById("div_attach");
    	var fileNm_obj      = document.getElementById("div_inputFile");
        var img_obj         = document.getElementById("div_fileName");

        // �ε��� �̹��� ����
        fileNm_obj.style.display   = "block";
        img_obj.style.display      = "none";

        var inHtml = "";
        
        inHtml += "<p id=\"file_list\" name=\"file_list\" class=\"file_list\">";
        inHtml += "<img src=\"/images/portal/ico/ico_file.gif\" alt=\"file\" class=\"mg_r6\" />";
        inHtml += "<a href = \"/servlet/controller.library.DownloadServlet?p_savefile="+obj.sWebUploadTempPath+obj.sUploadNm+"&p_realfile="+obj.sRealFileName+"\">"+obj.sRealFileName+"</a>";
        inHtml += "<span id=\"span_del\" name=\"span_del\" onclick=\"fnFileDel(this)\"> <img src=\"/images/portal/btn/btn_s_close.gif\" alt=\"x\" style='cursor:pointer;' align='absmiddle'/></span>";
        inHtml += "<input type = \"hidden\"    name = \"p_status\"    value = \"new\">";
        inHtml += "<input type = \"hidden\"    name = \"p_savefile\"  value = \""+obj.sUploadNm+"\">";
        inHtml += "<input type = \"hidden\"    name = \"p_realfile\"  value = \""+obj.sRealFileName+"\">";
        inHtml += "<input type = \"hidden\"    name = \"p_filevalue\"  value = \""+obj.value+"\">";
        inHtml += "<input type = \"hidden\"    name = \"p_temppath\"  value = \""+obj.sUploadTempPath+obj.sUploadNm+"\">";
        inHtml += "</p>";

        divAttachObj.innerHTML += inHtml;

        //frm.temptext.value = divAttachObj.innerHTML;  
        bFileDownYN                         = false;

        // Input file �ʱ�ȭ
        var divInputFile = document.getElementById("div_inputFile");
        var fileObj = document.getElementById("p_file");
        fileObj.select();
        //document.selection.clear(); //���� ����(X)
        document.execCommand('Delete');
        divInputFile.innerHTML = divInputFile.innerHTML;
    }

    // �̹��� ����
    function setImageLoadding()
    {
        var fileNm_obj      = document.getElementById("div_inputFile");
        var img_obj         = document.getElementById("div_fileName");
    
        fileNm_obj.style.display   = "none";
        img_obj.style.display      = "block";
    
        img_obj.innerHTML   = "<img src='/images/portal/common/ajax-loader.gif' />";
    }

//-->
</script>
</div>

<script language="JavaScript">
    initAttachHtml = document.getElementById("div_attachMain").innerHTML;
    myFileButton.run(); //�����ε� �� �Ѳ����� �ٲ�
</script>


<!--textarea name="temptext" style="width:600px;height:600px"></textarea-->

<%
}
%>