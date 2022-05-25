// string�� ���� trim �Լ� - ������ ������ ���� string�� ��ȯ
//Trim �Լ�	
function trim(arg,func) {
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

//��Ϻ���
function showList(cateId, cateName) { 	
	var fm = document.QNAFORM;
	fm.action = "/portal/user/knowledge/km_list.jsp";
	fm.target = "_self";
	fm.cateId.value = cateId;
	fm.submit();
}

function goSearchMain(gp){
	var fm = document.GOSEARCH;
	
	fm.action = "/search/search_main";
	fm.group.value = gp;
	fm.submit();	
}

//�α����� ��Ϻ���
function searchPopuCategory(cateId){
	var fm = document.QNAFORM;
	fm.action = "/portal/user/knowledge/km_popular_list.jsp";
	fm.target = "_self";
	fm.cateId.value = cateId;
	
	fm.submit();
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
	 	obj = window.open(theURL,winName,features);
	 	obj.focus();
}

function doSubmit() {	
	document.QNAFORM.submit();    
}

//ī�װ��� ��Ϻ���
function showCateList(cateId) {	
	document.QNAFORM.cateId.value = cateId;
	document.QNAFORM.searchWord.value = "";
	document.QNAFORM.submit();    
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

function logout(){
	fm = document.LOGOUT;
	fm.action = '/learn/mm/UMemberLogoutCud.jsp';
	fm.submit();
}


/* km_list.jsp start */
//�ش� ������ ��Ϻ���
function page_view(page){
	document.QNAFORM.page.value = page;
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}
	 

//�亯 ����ϱ�
function writeAnswer(){
	fm = document.QNAFORM;
	fm.action = "/portal/user/knowledge/km_re_write.jsp";
	fm.ansSeq.value = "";		
	fm.target = "_self";
	fm.submit();
}

//���ذ� ������� ����
function showUnSolvedList(){
	document.QNAFORM.type.value = 0;
	document.QNAFORM.page.value = 1;
	document.QNAFORM.searchWord.value = "";
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}

//�ذ�� ������� ����
function showSolvedList(){
	document.QNAFORM.type.value = 1;
	document.QNAFORM.page.value = 1;
	document.QNAFORM.searchWord.value = "";
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}

//������ȸ
function viewContent(docId){
	document.QNAFORM.action = "/portal/user/knowledge/km_view.jsp";	
	document.QNAFORM.qnaId.value = docId;	
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}
/* km_list.jsp end */


/* km_popular_list.jsp start */
//�α����� ��Ϻ���
function showPopularList(){
	document.QNAFORM.ptype.value = 0;
	document.QNAFORM.page.value = 1;
	document.QNAFORM.searchWord.value = "";
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}

//�ִ���ȸ ��Ϻ���
function showHitList(){
	document.QNAFORM.ptype.value = 1;
	document.QNAFORM.page.value = 1;
	document.QNAFORM.searchWord.value = "";
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}

//�ִ���õ ��Ϻ���
function showRecommendList(){
	document.QNAFORM.ptype.value = 2;
	document.QNAFORM.page.value = 1;
	document.QNAFORM.searchWord.value = "";
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}

//�ִٴ亯 ��Ϻ���
function showReplyList(){
	document.QNAFORM.ptype.value = 3;
	document.QNAFORM.page.value = 1;
	document.QNAFORM.searchWord.value = "";
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();	
}
/* km_popular_list.jsp end */


/* km_view.jsp start */
//�ֽ����� ��Ϻ���
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

//�亯 ����
function updateAnswer(seq){
	document.QNAFORM.ansSeq.value = seq;		
	document.QNAFORM.action = "/portal/user/knowledge/km_re_write.jsp";		
	document.QNAFORM.target = "_self";
	document.QNAFORM.submit();
}


//�ҷ��������� �Ű�
function reportKnowledge(id){
	fm = document.QNAFORM;
	if(false == confirm("�ҷ��������� �Ű��Ͻðڽ��ϱ�?"))
		return;
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowledge/km_report_insert.jsp";		
	fm.target = "ZEROFRAME";
	fm.submit();
}

//��õ
function recommendHitKnowledge(id){
	fm = document.QNAFORM;
	
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowledge/km_recommend_hit_insert.jsp";		
	fm.target = "_self";
	fm.submit();
}

//��ũ���ϱ�
function viewMyFolder(id, menu){	
	var url = "/learn/user/study/my_knowledge_scrap.jsp?qnaId="+id+"&menu="+menu;
	
	MM_openBrWindow(url,'MY_FOLDER','width=350,height=215');
}

//���� �����ϱ� �˾�â
function sendEmail(id, menu, imgTitle){
	fm = document.QNAFORM;
	
	fm.qnaId.value = id;
	var url = "/portal/user/knowledge/km_write_email.jsp?menu="+menu+"&imgTitle="+imgTitle+"&qnaId="+id;
	MM_openBrWindow(url,'SEND_EMAIL','width=775,height=565');
}

//�����ϱ� �޴��� �˻�/������
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

//��������
function editKm(id){	
	fm = document.QNAFORM;
	
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowledge/km_write.jsp";
	fm.submit();
}

//��������
function delKm(id){	

	if(false == confirm("�����Ͻðڽ��ϱ�?"))
		return;
	fm = document.QNAFORM;
	fm.qnaId.value = id;
	fm.action = "/portal/user/knowledge/km_write_delete.jsp";
	fm.submit();
}

/* km_view.jsp end */


/* km_write.jsp start */
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

//���� ���
function qnaWrite(id, myPoint) {
	fm = document.QNAFORM;
	var radioPoint = getCheckedRadio("point");
	if(Number(myPoint) < Number(radioPoint)) {
		alert("�ڽ��� ����Ʈ���� ū ������ �Ž� �� �����ϴ�.");
		return;
	}

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
//�亯���
function answerWrite(ans_id){

	form = document.QNAFORM;
	if(document.all.use_editor[0].checked) {        
            form.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    }else {
            form.content.value = document.all.txtDetail.value;
    }

	var flist;
	
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
	
	
	doSubmit();
}
/* km_re_write.jsp end */

function searchAction(logCheck, logType){  				
	var fm = document.SEARCHFORM;
	var coll = fm.coll.value;	
	
	if(logType == "out"){
		alert("�ܺλ���ڴ� ���հ˻��� �̿��ϽǼ� �����ϴ�.");		
		return;
	}
	
	if(logCheck == 0){
		alert("�α����� ���� �ϼž� ���հ˻��� �̿��ϽǼ� �ֽ��ϴ�.");
		document.LOGINFORM.id.focus();
		return;
	}
	if(fm.query.value.length < 1){
		alert("�˻�� �Է� �ϼ���.");
		fm.query.focus();
		return;
	}	
	if(coll == "HELPER" || coll=="KM" || coll == "E=LEARNING") fm.disNum.value = 10;
	else fm.disNum.value = 3;
	fm.action = get_collection_url(coll, "");				        	        
	fm.target = "_self";	
	
	fm.submit();	        	
	return;	
}

function get_collection_url(coll){
		var actionUrl="";
		
		
		if(coll == "PORTAL")		actionUrl = "/search/PortalSearch";
		else if(coll == "CONTENT")	actionUrl = "/search/ContentSearch";
		else if(coll == "TOT_CAFE")	actionUrl = "/search/TotCafeSearch";						
		else if(coll == "HELPER")	actionUrl = "/search/HelperSearch";
		else if(coll == "KM")		actionUrl = "/search/KmSearch";
		else if(coll == "E-LEARNING")	actionUrl = "/search/ELearningSearch";
		else if(coll == "KNOWLEDGE")	actionUrl = "/search/KnowledgeSearch";
		
		return actionUrl;		
}


function searchMaster(){
	fm = document.QNAFORM;
	
	fm.action = "./km_master_list.jsp";
	fm.submit();
}

//����� ��������
function viewUser(userId) {
		var url = "/portal/include/user_view.jsp?USER_ID=" + userId;
						
		MM_openBrWindow(url,'USER_INFO','status=yes, resizable=no,scrollbars=no,width=360,height=315');
}

//����� �̸��˻�
function searchUser()
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
	
	var url = "/portal/user/knowledge/km_search_user.jsp?keyword="+name;
						
	MM_openBrWindow(url,'SEND_USER','status=yes, resizable=no,scrollbars=no,width=750,height=492');
}

function fileDownload(name){
	location.target = "ZEROFRAME";
	
	location.href = "../include/download.jsp?delFile=no&fileName="+name;
}

function searchList(){
	fm = document.QNAFORM;
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