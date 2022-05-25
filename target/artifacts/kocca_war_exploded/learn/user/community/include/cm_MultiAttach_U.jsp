<%@ page contentType = "text/html;charset=euc-kr" %>
<%
    /**************************************************************************
     * �� ������ include�� ���, include�ϴ� ���Ͽ��� ���� �������� ����/�����ؾ� �Ѵ�.
     *String v_cmuno    // Ŀ�´�Ƽ ��ȣ
     *String v_menuno   // �޴� ��ȣ
     *String v_brdno    // ���� ��ȣ
     *String v_filecnt  // ���� �Խ����� �ִ� ÷�� ���ϼ�
     *int    v_attach_cnt // ���� �Խù��� ÷�ε� ���ϼ�
     **************************************************************************/
%> 

<script type="text/javascript" src="/script/portal/FileButton.js"></script>
<script type='text/javascript' src='/script/portal/prototype-1.6.0.2.js'></script>
<script language="JavaScript">
	
	//÷�ΰ��� ��ũ��Ʈ
	var myFileButton = new FileButton("imageswap", "imagesrc");

	function fileButtonInit() { 
	    myFileButton.run(); //�����ε� �� �Ѳ����� �ٲ� 
	
	    var div_obj     = document.getElementsByName("divFile");
	    var divLen = div_obj.length;
	    
	    for(var i = 0 ; i < divLen ; i++) {
	        if(i != 0 ) {
	            div_obj[i].style.display= "none";
	        }
	    }
	}
    function multiAttachInit(){
        
        var url     = "/servlet/controller.community.CommunityMultiAttachServlet";
        var pars  = "p_process=updatePage"
                  + "&p_cmuno=" + encodeURIComponent("<%=v_cmuno%>")
                  + "&p_menuno=" + encodeURIComponent("<%=v_menuno%>")
                  + "&p_brdno=" + encodeURIComponent("<%=v_brdno%>")
                  + "&p_maxFileCnt=" + encodeURIComponent("<%=v_filecnt%>");
    
        //new Ajax.Updater({success: 'multiAttach_div'}, url, {method : 'post', parameters : pars, onFailure: reportError, onSuccess: resultList});
        new Ajax.Request (
                url,
                {
                    method: 'post',
                    parameters: pars,
                    onComplete:
                    function(xmlHttp){
                	resultList(xmlHttp);
                    }
                }
        );    
    }

    function reportError() {
        alert("error!");
    }

    function resultList(xmlHttp) {
    	var serverData    = xmlHttp.responseText;         // JSon Data ���� �д´�.

        var multiAttach_div = document.getElementById("multiAttach_div");

        multiAttach_div.innerHTML = serverData;

        //alert(multiAttach_div.innerHTML);
    	
    	fileButtonInit();
    }

    function deleteAttachment(fileno, savefile){
        
        if (confirm("÷�������� �����Ͻðڽ��ϱ�?")) {  
              
	    	var url     = "/servlet/controller.community.CommunityMultiAttachServlet";
	        var pars  = "p_process=deleteAttachment"
	        	+ "&p_cmuno=<%=v_cmuno%>"
	        	+ "&p_menuno=<%=v_menuno%>"
	        	+ "&p_brdno=<%=v_brdno%>"
	        	+ "&p_fileno="+fileno
	        	+ "&p_savefile="+savefile;
	    
	                  //+ "&p_cmuno=" + encodeURIComponent("<%=v_cmuno%>")
	                  //+ "&p_menuno=" + encodeURIComponent("<%=v_menuno%>")
	                  //+ "&p_brdno=" + encodeURIComponent("<%=v_brdno%>")
	                  //+ "&p_fileno=" + encodeURIComponent(fileno)
	                  //+ "&p_savefile=" + encodeURIComponent(savefile);

            new Ajax.Request (
                    url,
                    {
                        method: 'post',
                        parameters: pars,
                        onComplete:
                        function(xmlHttp){
                            resultDeleteAttachment(xmlHttp);
                        }
                    }
            );

        }
    }

    function resultDeleteAttachment(xmlHttp) {   
    	
        var serverData    = xmlHttp.responseText;         // JSon Data ���� �д´�.
        var evalData      = eval('(' + serverData + ')');
        var sList_obj     = evalData.scfList;
        
        var reqState     = evalData.result[0].STATE;

        if (reqState.toLowerCase() != "succ")
        {
            alert("Ajax ����� ������ �߻��߽��ϴ�.");
            return;
        }else{
            alert("÷�������� �����Ǿ����ϴ�.");
            multiAttachInit();
        }
  }   

</script>
<SCRIPT LANGUAGE="JavaScript">
<!--

// Bean Ŭ������ ��õ� ���� ���� ����
var fileMax = <%=v_filecnt %>;

function addFile(){

    var div_obj     = document.getElementsByName("divFile");

    var viewCnt     = 0;

    for (var i = 0 ; i < div_obj.length ; i ++) {
        if ( div_obj[i].style.display != "none") {
            viewCnt++;
        }
    }
    
    if (parseInt(viewCnt) >= parseInt(fileMax)){
        alert("�� �̻� ÷�� �ϽǼ� �����ϴ�. �ִ� ÷�μ� : " + fileMax);
        return;
    }

    for (var i = 0 ; i <= fileMax ; i ++) {
        if ( div_obj[i].style.display == "none") {
            
            div_obj[i].style.display = "block";
            var fileObj     = document.getElementById("p_file"+i);
            break;
        }
    }
}

function delFile(p) {
 
    var div_obj     = document.getElementsByName("divFile")[p-1];
    var fileObj     = document.getElementById("p_file"+p);
    var tempObj     = document.getElementById("tempFileText"+p);
    
    fileObj.select();
    document.selection.clear();
    tempObj.value = "";
    div_obj.innerHTML = div_obj.innerHTML;
    
    div_obj.style.display   = "none";
}

function searchFile(idx){
    var fileObj    = document.getElementById("p_file"+idx);
    var tempObj    = document.getElementById("tempFileText"+idx);

    //tempObj.value = fileObj.value;
}

function changeFile(idx){
    var fileObj    = document.getElementById("p_file"+idx);
    var tempObj    = document.getElementById("tempFileText"+idx);

    tempObj.value = fileObj.value;
}

//-->
</SCRIPT>
<div id="multiAttach_div"></div>
<script language="JavaScript">
window.onload = function () { 
	 multiAttachInit();
}
</script>
