<%@ page import = "com.credu.system.*" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%
    /**************************************************************************
     * �� ������ include�� ���, include�ϴ� ���Ͽ��� ���� �������� ����/�����ؾ� �Ѵ�.
     *
     *int    i_fileLimit        = NoticeAdminBean.getFILE_LIMIT();              // ���� ÷�� ���ϼ�
     *int    gubun              = //��޴� ���а�
     **************************************************************************/
%>

<%
    String styleGubun = "";
    if(gubun != null && gubun.equals("3")) styleGubun = "myclass_write";
    if(gubun != null && gubun.equals("6")) styleGubun = "study_write";
    else styleGubun = "board_write";
    
%>
<script type="text/javascript" src="/script/portal/FileButton.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
//÷�ΰ��� ��ũ��Ʈ
var myFileButton = new FileButton("imageswap", "imagesrc");

window.onload = function () { 
    myFileButton.run(); //�����ε� �� �Ѳ����� �ٲ� 

    var div_obj     = document.getElementsByName("divFile");
    var divLen = div_obj.length;
    
    for(var i = 0 ; i < divLen ; i++) {
        if(i != 0 ) {
        	div_obj[i].style.display= "none";
        }
    }
    
} 

// Bean Ŭ������ ��õ� ���� ���� ����
var fileMax = <%=i_fileLimit %>;

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
            <table class="<%=styleGubun %> bo_tn" border=0>
            <!--[if ie]><colgroup><col width="65px" /><col width="625px" /></colgroup><![endif]-->
            <colgroup><col width="85px" /><col width="625px" /></colgroup>
            <tr class="bgn">
                <th class="th">÷������</th>
                <td colspan="7" class="td pd_ln">
                <%  for(int i_i = 1 ; i_i <= i_fileLimit ; i_i ++ ) {%>
                  <div id="divFile" >
                  <table border="0"><tr>
                  <td >
                    <input type="text" name="tempFileText<%=i_i%>" id="tempFileText<%=i_i%>" class="inbox fl_l mg_r6" style="width:300px;" readonly/>
                  </td>
                  <td>
                    <input type="file" name="p_file<%=i_i%>" id="p_file<%=i_i%>" imageswap="true" imagesrc="/images/portal/btn/file_search.gif" onchange="document.getElementById('tempFileText<%=i_i%>').value=this.value;" style="vertical-align:7px;width:0px;cursor:pointer;"/>
                    <!--img src="/images/portal/btn/file_search.gif" /-->
                  </td>
                  <td width="50px" align="center">
                  <% if ( i_i == 1 ) { %>
                    <a href="javascript:addFile();"><img src="/images/portal/btn/file_add.gif" align="absmiddle"/></a>
                  <% } else { %>
                    <a href="javascript:delFile(<%=i_i %>);"><img src="/images/portal/btn/file_delete.gif" align="absmiddle"/></a>
                  <% } %>
                  </td>
                  </tr></table>
                  </div>
                <%} %>
                </td>
            </tr>
            </table>
                  
<%
    //*** ���ε�ȭ����� �ڵ�  ///////////////////////////////////////
    ArrayList alist = (ArrayList)CodeAdminBean.getUploadCodeName();
    String s_codenmlist = "";
    for(int a=0; a<alist.size(); a++){
       DataBox data  = (DataBox)alist.get(a);
       s_codenmlist+="."+data.getString("d_codenm");
       if(a<alist.size()-1) s_codenmlist+=",";
    }
    //*** ���ε�ȭ����� �ڵ�  ///////////////////////////////////////   
%>
<%//=s_codenmlist %>
<script language="javascript">  
//���� Ȯ���� ���͸�
function limitFile() {
    var ss_codenmlist = "<%=s_codenmlist%>";
    var extArray = ss_codenmlist.split(",");
    var allowSubmit = true;

    for(var j = 0 ; j < <%=i_fileLimit%> ; j++){
        var file = document.getElementById("p_file"+(j+1)).value;
        
        if(file != "") {
            var strAry = file.split(".");
            var strAryLen = strAry.length;

            var ext = "."+strAry[strAryLen-1].toLowerCase();
                             
            for(var i = 0 ; i < extArray.length ; i++) {          
                                   
	            if (extArray[i] != ext){ 
	                allowSubmit = false; 
	            } else {
	            	allowSubmit = true;
	            	break;
	            }
            }
            if(!allowSubmit) {
            	return false;
            }
        }
    }

    return true;
    
}
</script>