<%@ page contentType = "text/html;charset=euc-kr" %>
<%
    /**************************************************************************
     * �� ������ include�� ���, include�ϴ� ���Ͽ��� ���� �������� ����/�����ؾ� �Ѵ�.
     *Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
     *Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
     *Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ
     *
     *int    i_fileLimit        = NoticeAdminBean.getFILE_LIMIT();              // ���� ÷�� ���ϼ�
     **************************************************************************/
%>

<%@ page import = " com.credu.system.CodeAdminBean" %>

<% int i_fileCnt = i_realfileVector != null ? i_realfileVector.size() : 0 ; %>
<script type="text/javascript" src="/script/portal/FileButton.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    //���� ÷�� ���� ��ũ��Ʈ
    var myFileButton = new FileButton("imageswap", "imagesrc");
    
    window.onload = function () { 
        myFileButton.run(); //�����ε� �� �Ѳ����� �ٲ� 
    
        var div_obj     = document.getElementsByName("divFile");
        var divLen = div_obj.length;

        var endCnt = <%=i_fileLimit%> - <%=i_fileCnt%>;
        
        for(var i = divLen; i > 0 ; i--) {
            if(i-1 == 0) div_obj[i-1].style.display= "block";
            else div_obj[i-1].style.display= "none";
        }

        if(endCnt == 0){
            document.getElementById("tempMessage").style.display = "block";
        }
    } 
    
    var fileMax = <%=i_fileLimit - i_fileCnt %>; // �� �̺�Ʈ�� ��ȯ�Ǵ� �ִ� ÷�ΰ����� ��
    var curFileCnt = <%=i_fileCnt%>;//���� ÷�εǾ� �ִ� ���ϼ�
    var limitCnt    = <%=i_fileLimit%>; //���� �Խ����� ����÷�� ���Ѽ�
    var checkedCnt = 0; //üũ�ڽ� üũ�� ���ϼ�
    var minView = 1;

    function calculateAttachmentCnt(){
        var tempCnt = curFileCnt-checkedCnt; 
    }
    
    function addFile(){

        var div_obj     = document.getElementsByName("divFile");

        var viewCnt     = 0;

        for (var i = 0 ; i < div_obj.length ; i ++) {
            if ( div_obj[i].style.display != "none") {
                viewCnt++;
            }
        }
        
        if (parseInt(viewCnt) >= parseInt(fileMax)){
            alert("�� �̻� ÷�� �ϽǼ� �����ϴ�. �߰� ÷�� ���� : " + fileMax + " ��");
            return;
        }

        for (var i = 0 ; i <= fileMax ; i ++) {
            if ( div_obj[i].style.display == "none") {
                
                div_obj[i].style.display = "block";
                var fileObj     = document.getElementById("p_file"+i);
                break;
            }
        }

        //var divFirstButton = document.getElementById("firstDelButton");
        //
        //if( viewCnt > 0) {
        //    //divFirstButton.style.display = "none";
        //}

    }

    function delFile(p) {
      
        var div_obj     = document.getElementsByName("divFile")[p-1];
        var fileObj     = document.getElementById("p_file"+p);
        var tempObj     = document.getElementsByName("tempFileText")[p-1];
        
        fileObj.select();
      	//document.selection.clear();
        
        var $file = $("#p_file"+p);
        var clone = $file.clone();
        $file.before(clone).remove();
        
        tempObj.value = "";
        div_obj.innerHTML = div_obj.innerHTML;

        
        div_obj.style.display   = "none";
        if(p == 1){
            div_obj.style.display   = "block";
        }
    }

    // ���� üũ �� ÷�� ������ ���� ���� ��ũ��Ʈ ó��
    function checkDel(p){
        var div_obj     = document.getElementsByName("divFile");
        var tempObj     = document.getElementsByName("tempFileText");
        var viewCnt     = 0;

        for (var i = 0 ; i < div_obj.length ; i ++) {
            if ( div_obj[i].style.display != "none") {
                viewCnt++;
            }
        }

        if(p.checked) {
            if(viewCnt == 0) {
                div_obj[0].style.display = "block";
                document.getElementById("tempMessage").style.display = "none";
            }
            fileMax++;
        } else {
            if (parseInt(viewCnt) >= parseInt(fileMax)){
                if(viewCnt == 1){
                    div_obj[0].style.display = "none";
                    document.getElementById("tempMessage").style.display = "block";
                } else {
                    alert("���� ��Ҹ� ���� ÷������ ������ �������ּ��� \n���� �ʿ� ���� : " + (viewCnt-fileMax+1));
                    p.checked = true;
                    alert(fileMax);
                    return;
                }        
            }
                fileMax--;        
        }
    }

    // ���� üũ �� ÷�� ������ ���� ���� ��ũ��Ʈ ó��
   //function checkAdd(){
   //    var div_obj     = document.getElementsByName("divFile");
   //    var tempObj     = document.getElementsByName("tempFileText");
   //    var viewCnt     = 0;
   //
   //    for (var i = 0 ; i < div_obj.length ; i ++) {
   //        if ( i !=0 && (tempObj[i].value != "" || div_obj[i].style.display == "block")) {
   //            viewCnt++;
   //        }
   //    }
   //    
   //    if (parseInt(viewCnt) >= parseInt(fileMax)){
   //        alert("���� ��Ҹ� ���� ÷������ ������ �������ּ��� \n���� �ʿ� ���� : " + (viewCnt-fileMax+1));
   //        return false;
   //    }
   //}

    //����ã�� Ŭ�� �� ���� ���� �� �̺�Ʈ
    //function fileChange(p){
    //    var fileObj = document.getElementById("p_file"+p);
    //    var tempObj = document.getElementsByName("tempFileText")[p-1];
    //
    //    tempObj.value = fileObj.value;
    //}
  //-->
    </SCRIPT>
                  
                  <% 
                        if( i_realfileVector != null && i_realfileVector.size() > 0 ) { %>
                        �ػ����� üũ�� ���ּ���.
                        <%
                            for(int i = 0; i < i_realfileVector.size(); i++) {      //     ÷������ ������ ����
                            String v_realfile = (String)i_realfileVector.elementAt(i);
                            String v_savefile = (String)i_savefileVector.elementAt(i);
                            String v_fileseq = (String)i_fileseqVector.elementAt(i);
                            
                            if(v_realfile != null && !v_realfile.equals("")) {  %>
                                <div>
                                <img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6" /><a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a>
                                <input type = "checkbox"  name ="p_fileseq<%=i%>" value = "<%= v_fileseq%>" onclick="checkDel(this);"><br>
                                <input type = "hidden" name = "p_realfile<%=i%>"  value = <%=v_realfile%>>
                                <input type = "hidden" name = "p_savefile<%=i%>"  value ="<%=v_savefile%>">
                                </div>
                  <%        }
                          }
                        }
                  %>

                <%  for(int i_i = 1 ; i_i <= i_fileLimit ; i_i ++ ) {%>
                  <div id="divFile" name="divFile" style="padding:0 0 0 0;">
                    <input type="hidden" name="tempFileText" id="tempFileText<%=i_i%>" style="width:300px;" readonly/>
                    <input type="file" name="p_file<%=i_i%>" id="p_file<%=i_i%>" onchange="document.getElementById('tempFileText<%=i_i%>').value=this.value;" style="display: inline;"/>
                  <% if ( i_i == 1 ) { %>
                    <a href="javascript:addFile();"><img src="/images/portal/btn/file_add.gif" align="absmiddle"  border=0/></a>
                  <% } else { %>
                    <a href="javascript:delFile(<%=i_i %>);"><img src="/images/portal/btn/file_delete.gif"  border=0/></a>
                  <% } %>
                  </div>
                <%} %>
                  
 <input type = "hidden" name="p_upfilecnt"  value = "<%=i_fileCnt%>">
 
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