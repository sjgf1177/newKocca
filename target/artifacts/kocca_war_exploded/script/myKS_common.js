/* common start */
function MM_openBrWindow(theURL,winName,features) { //v2.0
	 	obj = window.open(theURL,winName,features);
	 	obj.focus();
	 	
	  
}

 //Trim �Լ�
	//===================================
	function trim(arg,func) {
	//===================================
		var trimvalue = "";
		arglen = arg.length;
		if (arglen < 1) return trimvalue;
		if (func == "left" || func== "both") {
			i = 0;
			pos = -1;
			while (i < arglen) {
				if (arg.charCodeAt(i) != 32 && !isNaN(arg.charCodeAt(i))) {
					pos = i;
					break;
				}
				i++;
			}
		}
		if (func == "right" || func== "both") {
			var lastpos = -1;
			i = arglen;
			while (i >= 0) {
				if (arg.charCodeAt(i) != 32 && !isNaN(arg.charCodeAt(i))) {
					lastpos = i;
					break;
				}
				i--;
			}
		}
		if (func == "left") {
				trimvalue = arg.substring(pos,arglen-1);
		}
		if (func == "right") {
			trimvalue = arg.substring(0,lastpos+1);
		}
		if (func == "both") {
			trimvalue = arg.substring(pos,lastpos + 1);
		}
		return trimvalue;
	}
	//////////////////////////////////////////////////////////////////

function logout(){
	fm = document.LOGOUT;
	fm.action = '/learn/mm/UMemberLogoutCud.jsp';
	fm.submit();
}

function goSearchMain(gp){
	var fm = document.GOSEARCH;
	
	fm.action = "/search/search_main";
	fm.group.value = gp;
	fm.submit();	
}

function doSubmit() {
	var form = document.MYFORM;
    	form.submit();    
}

/* common end */
//���� �����亯 ��ȸ
function viewMainKnowledge(docId){	
	var form = document.MYFORM;
	
	form.backJsp.value = "/learn/user/study/my_list.jsp";		
	form.action = "/portal/user/knowledge/km_view.jsp?imgTitle=km";		
	form.qnaId.value = docId;	
	form.submit();	
}

//���� ���Ͽ� ��ȸ
function viewMainKnowhow(docId){	
	var form = document.MYFORM;
	
	form.backJsp.value = "/learn/user/study/my_knowhow_list.jsp";		
	form.action = "/portal/user/knowhow/knowhow_view.jsp?imgTitle=knowhow";		
	form.qnaId.value = docId;	
	form.submit();	
}

//���� ��ũ�� ��ȸ
function viewKnowledgeScrap(docId){	
	var form = document.MYFORM;
	
	form.backJsp.value = "/learn/user/study/my_scrap_list.jsp";		
	form.action = "/portal/user/knowledge/km_view.jsp?imgTitle=scrap";	
	form.qnaId.value = docId;	
	form.submit();	
}

//��ũ���� ���Ͽ� ����
function viewKnowhowScrap(docId){	
	var form = document.MYFORM;
	
	form.backJsp.value = "/learn/user/study/my_scrap_list.jsp";		
	form.action = "/portal/user/knowhow/knowhow_view.jsp?imgTitle=scrap";		
	form.qnaId.value = docId;	
	form.submit();	
}


/* myKS_list.jsp start */
//������ȸ
function viewKnowledge(docId, title){	
	var form = document.MYFORM;
	if(title == "km")	form.action = "/portal/user/knowledge/km_view.jsp?imgTitle=km";		
	else if(title == "scrap") form.action = "/portal/user/knowledge/km_view.jsp?imgTitle=scrap";
	else if(title == "service") form.action = "/portal/user/knowledge/km_view.jsp?imgTitle=service";
	form.qnaId.value = docId;	
	form.submit();	
}

//���Ͽ� ��ȸ
function viewKnowhow(docId){	
	var form = document.MYFORM;
	
	//form.backJsp.value = "/learn/user/study/my_knowhow_list.jsp";		
	form.action = "/portal/user/knowhow/knowhow_view.jsp?imgTitle=knowhow";		
	form.qnaId.value = docId;	
	form.submit();	
}

//�ش� ������ ��Ϻ���
function page_view(page){
	var form = document.MYFORM;
	
	form.page.value = page;
	form.submit();	
}

//���� �������
function showQuestion(){
	var form = document.MYFORM;
	
	form.searchWord.value = "";
	form.type.value = 0;
	form.page.value = 1;
	form.submit();	
}

//���� �亯���
function showAnswer(){
	var form = document.MYFORM;
	
	form.searchWord.value = "";
	form.type.value = 1;
	form.page.value = 1;
	form.submit();	
}

/* myKS_list.jsp end */
//ī�װ� ���
function showCateList(){
	MM_openBrWindow('/learn/user/study/my_cate_list.jsp','','width=404,height=327');
}

//��ũ�� ���� �߰��ϱ�
function myFolderAdd(){
	var form = document.MYFORM;	
	
	if(form.newFolder.value.length < 1){
		alert("�������� �Է��� �ּ���.");
		form.newFolder.focus()
		return;	
	}
	
	form.submit();
}

//��ũ�� ���� �����ϱ�
function myFolderMod(tot, seq){
	
	var folder = document.getElementsByName("folderName" +seq);
	
	if(folder[0].value.length < 1) {
		alert("������ �̸��� �Է��ϼ���");
		folder[0].focus();
		return;
	}
	
	var form = document.MYFORM;
	form.action = "/learn/user/study/my_folder_update.jsp";			
	form.loopSeq.value = seq;		
	form.submit();
}

//��ũ�� ���� ����
function myFolderDel(tot, seq, count){
	if(false == confirm("������ �����Ͻø� �������� ��ũ���� ���ĵ� �����˴ϴ�. �����Ͻðڽ��ϱ�?"))
		return;
		
	var form = document.MYFORM;
	form.action = "/learn/user/study/my_folder_delete.jsp";		
	form.loopSeq.value = seq;		
	form.submit();
}

function selectCate(chFm, formName) {
	var obj =document.getElementsByName(formName);
	var option;
	
	if(obj[0].checked == true){
		option = false;
		chFm.checked = false;
	}else{
		option = true;
		chFm.checked = true;
	}
	
	for(var i=0; i < obj.length; i++) {
		obj[i].checked = option;
	}
}

//��ũ�� ���� ��ü����
function selectAll(chFm, formName) {
	var obj =document.getElementsByName(formName);
	var option;
	
	if(document.MYFORM.scrapId == null) {
		alert("��ũ���� ������ �����ϴ�.");
		return;
	}

	if(obj[0].checked == true){
		option = false;
		chFm.checked = false;
	}else{
		option = true;
		chFm.checked = true;
	}
	
	for(var i=0; i < obj.length; i++) {
		obj[i].checked = option;
	}
}

//��ũ�� ����
function scrapDelete(){		
	var form = document.MYFORM;
	
	var obj =document.getElementsByName("scrapId");
	var checkedValue = "";
	for(var i=0; i < obj.length; i++) {
		if(obj[i].checked){
			checkedValue += "scrapId=";
			checkedValue += obj[i].value;
			checkedValue += "&";
		}
	}
	if(checkedValue.length < 1){
		alert("������ ������ ������ �ּ���.");
		return;
	}
	
	if(false == confirm("�����Ͻðڽ��ϱ�?"))
		return;
	
	form.action = "/learn/user/study/my_scrap_delete.jsp";			
	form.submit();
}

//��ũ���ϱ�
function scrapAdd(){
	var form = document.MYFORM;
		
	if(form.folderId.value == ""){
		alert("��ũ���� ������ ������ �ּ���.");
		return;
	}
	
	form.action = "/learn/user/study/my_knowledge_insert.jsp";			
	form.submit();
}

//���� ��ũ�� ��������
function goMyScrap(menu){
	var url = "/learn/user/study/my_folder_list.jsp?menu="+menu;
	MM_openBrWindow(url,'GO_FOLDER','status=yes, resizable=no,scrollbars=no,width=357,height=375');	
}

//���� ī�װ� �����ϱ�
function serviceCateAdd(){
	var form = document.MYFORM;
	
	var obj =document.getElementsByName("serviceCate");
	var checkedValue = "";
	for(var i=0; i < obj.length; i++) {
		if(obj[i].checked){
			checkedValue += "serviceCate=";
			checkedValue += obj[i].value;
			checkedValue += "&";
		}
	}	
	form.action = "/learn/user/study/my_service_insert.jsp";			
	form.submit();
}


//����� ��������
function viewUser(userId) {
		var url = "/portal/include/user_view.jsp?USER_ID=" + userId;
						
		MM_openBrWindow(url,'USER_INFO','status=yes, resizable=no,scrollbars=no,width=360,height=315');
}

//��� �� �˻��ϱ�
function searchList(){
	fm = document.MYFORM;
	
	var sWord = trim(fm.searchWord.value,"both");
	if(sWord.length < 1){
		alert("�˻��� �ܾ �Է��ϼ���.");
		fm.searchWord.value ="";
		fm.searchWord.focus();
		return false;
	}
	fm.searchWord.value = sWord;
	fm.submit();
}


/* km_myview.jsp start */
//�亯�ޱ�
function writeAnswer(){
	fm = document.QNAFORM;
	fm.action = "/portal/user/knowledge/km_re_write.jsp";
	fm.ansSeq.value = "";		
	fm.target = "_self";
	fm.submit();
}

//������ϰ���
function viewKmList(){		
	document.QNAFORM.action = document.QNAFORM.backJsp.value;		
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}

//�ڸ�Ʈ ����
function writeComment(seq){	
	var fm = document.QNAFORM;
		
	var comment = eval("fm.comment"+seq +".value");
	if(trim(comment, "both") == "") {
		alert("�ڸ�Ʈ�� �Է��ϼ���.");
		return false;
	}
	/*if(fm.comment.value.length < 1){
		alert("�ڸ�Ʈ�� �Է��ϼ���.");
		fm.comment.focus();
		return false;
	}*/
	fm.ansSeq.value = seq;		
	fm.action = "/portal/user/knowledge/km_comment_insert.jsp";		
	fm.target = "_self";
	fm.submit();	
}


//�ڸ�Ʈ ����
function commentDelete(delId){
	if(false == confirm("�����Ͻðڽ��ϱ�?"))
		return;
			
	document.QNAFORM.commentId.value = delId;
	document.QNAFORM.action = "/portal/user/knowledge/km_comment_delete.jsp";		
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}

//�亯 ����
function deleteAnswer(seq){
	if(false == confirm("�亯 �� �ش� �ڸ�Ʈ�� �����˴ϴ�. ���� �����Ͻðڽ��ϱ�?"))
		return;
	
	document.QNAFORM.ansSeq.value = seq;	
	document.QNAFORM.action = "/portal/user/knowledge/km_re_write_delete.jsp";		
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();
}

//�亯����
function updateAnswer(seq){
	document.QNAFORM.ansSeq.value = seq;		
	document.QNAFORM.action = "/portal/user/knowledge/km_re_write.jsp";		
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();
}

 
//�ҷ��������� �Ű��ϱ�
function reportKnowledge(id){
	fm = document.QNAFORM;
	if(false == confirm("�ҷ��������� �Ű��Ͻðڽ��ϱ�?"))
		return;
	
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowledge/km_report_insert.jsp";		
	fm.target = "ZEROFRAME";
	fm.submit();
}

//��õ�ϱ�
function recommendHitKnowledge(id){
	fm = document.QNAFORM;
	
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowledge/km_recommend_hit_insert.jsp";		
	fm.target = "_self";
	fm.submit();
}

//���� ��ũ�� ���� ����
function viewMyFolder(id, menu){	
	var url = "/learn/user/study/my_knowledge_scrap.jsp?qnaId="+id+"&menu="+menu;
	
	MM_openBrWindow(url,'MY_FOLDER','width=350,height=215');
}

//�����ϱ� �� �˾�
function sendEmail(id, menu, homeExeSrcFile){
	fm = document.QNAFORM;
	
	fm.qnaId.value = id;	
	var url = "/portal/user/knowledge/km_write_email.jsp?&menu="+menu+"&homeExeSrcFile="+homeExeSrcFile+"&qnaId="+id;
	MM_openBrWindow(url,'SEND_EMAIL','width=775,height=565');
}

//���� �����ϱ�
function sendKnowhowEmail(id, menu, homeExeSrcFile){
	fm = document.KNOWFORM;
	
	fm.qnaId.value = id;
	//fm.backJsp.value = "/portal/user/knowhow/knowhow_view.jsp";
	var url = "/portal/user/knowledge/km_write_email.jsp?&menu="+menu+"&homeExeSrcFile="+homeExeSrcFile;
	MM_openBrWindow(url,'SEND_EMAIL','width=775,height=565');
}

//����� ã��(�����ϱ� �޴� ��)
function searchUser(menu)
{
	fm = document.QNAFORM;
	var name = "";

	if(fm.searchName.value.length < 1){
			alert("���Ǿ �Է��ϼ���.");
			fm.searchName.focus();
			return;
	}

	fm.searchName.value = trim(fm.searchName.value,"both");
	name = fm.searchName.value;
	
	var url = "/portal/user/knowledge/km_search_user.jsp?keyword="+name+"&menu="+menu;
						
	MM_openBrWindow(url,'SEND_USER','status=yes, resizable=no,scrollbars=no,width=750,height=492');
}

//���� ���� ó��
function send(){
	fm = document.QNAFORM;

	if(fm.sendUserId.value.length < 1){
		alert("�޴� ����� �����ϼ���.");
		return;
	}
	
	if(fm.title.value.length < 1){
		alert("������ �Է��ϼ���.");
		fm.title.focus();
		return;
	}
	if(document.all.use_editor[0].checked) {        
            fm.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    }else {
            fm.content.value = document.all.txtDetail.value;
    }
	fm.domainname.value = "http://" + document.domain;
		
	fm.action = "/portal/user/knowledge/km_send_email.jsp";
	fm.submit();
}

//���� ����
function editKm(id){	
	fm = document.QNAFORM;
	
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowledge/km_write.jsp";
	fm.submit();
}

//���� ����
function delKm(id){	

	if(false == confirm("�����Ͻðڽ��ϱ�?"))
		return;	
	fm = document.QNAFORM;
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowledge/km_write_delete.jsp";
	fm.submit();
}

//�亯 ä���ϱ�
function doAdopt(){
	var fm = document.QNAFORM;
	var adopt = getCheckedRadio("adopt");
	if(adopt == null) {
		alert("ä���� �亯�� ������ �ּ���.");
		return;
	}
	fm.action = "/portal/user/knowledge/km_re_adopt_insert.jsp";
	fm.submit();
}


//���õ� ���� ��ư ��ü ��������
function getCheckedRadio(name) {
	var radioList =	document.getElementsByName(name);
	for(var	i=0; i < radioList.length; i++)	{
		if(radioList[i].checked) {
			return radioList[i].value;
		}
	}
	return null;
}
/* km_view.jsp end */


/* knowhow_view.jsp start */
//���Ͽ� �ڸ�Ʈ ����
function writeKnowhowComment(){		
	var fm = document.KNOWFORM;

	var comment = eval("fm.comment.value");
	if(trim(comment, "both") == "") {
		alert("�ڸ�Ʈ�� �Է��ϼ���.");
		return false;
	}
	fm.action = "/portal/user/knowhow/knowhow_comment_insert.jsp";		
	fm.submit();	
}

//���Ͽ� �ڸ�Ʈ ����
function knowhowCommentDelete(delId){
	if(false == confirm("�����Ͻðڽ��ϱ�?"))
		return;
			
	document.KNOWFORM.commentId.value = delId;
	document.KNOWFORM.action = "/portal/user/knowhow/knowhow_comment_delete.jsp";		
	document.KNOWFORM.submit();	
}

//���Ͽ� ����
function modiKnowhow(id){
	var fm = document.KNOWFORM;
	
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowhow/knowhow_write.jsp";	
	fm.submit();	
}

//���Ͽ� ����
function delKnowhow(id){
	if(false == confirm("���� �����Ͻðڽ��ϱ�?"))
		return;
	fm = document.KNOWFORM;
	
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowhow/knowhow_write_delete.jsp";
	fm.submit();
}

//���Ͽ� ����Ʈ ����
function viewKnowhowList(){		
	//document.KNOWFORM.action = "/portal/user/knowhow/knowhow_list.jsp";		
	document.KNOWFORM.action = document.KNOWFORM.backJsp.value;		
	document.KNOWFORM.submit();	
}

/* knowhow_view.jsp end */

//���Ͽ� ���
function knowhowReg(id) {
	var flist;
	form = document.QNAFORM;
	
	
	if(form.title.value.length < 1){
		alert("������ �Է��ϼ���.");
		form.title.focus();
		return;
	}
	
	if(form.catePath.value.length < 1){
		alert("ī�װ��� �����ϼ���.");
		form.catePath.focus();
		return;
	}

	form = document.QNAFORM;
	if(document.all.use_editor[0].checked) {        
            form.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    }else {
            form.content.value = document.all.txtDetail.value;
    }
	
	for (var i = 0; i < form.attach_list.length; i++) {
		flist += form.attach_list[i].value + ";";
	}
	
	form.attachParam.value = flist;
	
	if(id != "-1") {
		form.qnaId.value = id;			
		form.action = "/portal/user/knowhow/knowhow_write_update.jsp";		
	}else{
		form.action = "/portal/user/knowhow/knowhow_write_insert.jsp";
	}
	form.encoding = "application/x-www-form-urlencoded";
	form.target = "_self";	
	form.submit();    
} 


/* km_write.jsp start */
//�������/����
function qnaWrite(id) {
	fm = document.QNAFORM;
	if(fm.title.value.length < 1){
		alert("������ �Է��ϼ���.");
		fm.title.focus();
		return;
	}
	
	if(fm.catePath.value.length < 1){
		alert("ī�װ��� �����ϼ���.");
		fm.catePath.focus();
		return;
	}
	
	/* ������ ��� */
	if(id != "-1"){	
		fm.qnaId.value = id;
		fm.action = "/portal/user/knowledge/km_write_update.jsp";
	}
	
	if(document.all.use_editor[0].checked) {        
            fm.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    }else {
            fm.content.value = document.all.txtDetail.value;
    }
	fm.target = "_self";
    	fm.submit();    
}

function imgUpload(writeno) {
        window.open('/portal/include/imgUpload.jsp?qnaId='+writeno,'img','width=400, height=360, resizable=no, scrolling=auto');
}

function PlayClick()	{
        window.open('/portal/include/movie.jsp','help','width=400, height=335, resizable=no, scrollbars=no');
}
/* km_write.jsp end */

/* km_re_write.jsp start */  
//�亯 ���
function answerWrite(ans_id){

	form = document.QNAFORM;
	if(document.all.use_editor[0].checked) {        
            form.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    }else {
            form.content.value = document.all.txtDetail.value;
    }

	var flist;
		
	/*if(form.answer.value.length <= 0){
		alert("�亯�� �ۼ� �ϼ���.");
		form.answer.focus();
		return;
	}*/
	
	for (var i = 0; i < form.attach_list.length; i++) {
		flist += form.attach_list[i].value + ";";
	}
	
	if(ans_id != "-1") {
		form.ansId.value = ans_id;			
		form.action = "/portal/user/knowledge/km_re_write_update.jsp";		
	}else{
		form.action = "/portal/user/knowledge/km_re_write_insert.jsp";	
	}
	form.attachParam.value = flist;
	form.encoding = "application/x-www-form-urlencoded";
	form.attachCount.value = form.attach_list.length-1;	
	form.target = "_self";
	
	
	document.QNAFORM.submit();
}
/* km_re_write.jsp end */



function categoryOpen(menu, write) { 	
	MM_openBrWindow('/portal/include/user/popup_category.jsp?menu='+menu+'&write='+write, 'CATEGORY', 'width=350,height=510');	
}


//��õ���� ī�װ����� ����
function showCategoryList(cateId) {	
	document.MYFORM.cateId.value = cateId;
	document.MYFORM.searchWord.value = "";
	document.MYFORM.submit();    
}
