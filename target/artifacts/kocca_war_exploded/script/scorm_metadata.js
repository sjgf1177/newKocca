var frm;
var Basic_Path			= "/Manager/Course/CoObject/";
var ListPage_Name		= "aco_Object_List.jsp";

function Search_OK(){		// �˻��ϱ� (����)
	frm = document.frm;
	if(frm.search_item.value==""){
		alert("�˻������� �Է��ϼ���.");
		return false;		
	}
	if(IsSpace(frm.search_value)){
		alert("�˻�� �Է��ϼ���.");
		return false;
	}
	frm.page.value= 1;
	frm.target = "";
	frm.action = Basic_Path + ListPage_Name
	frm.submit();
}
function All_List(){	// ��ü���(�˻�����) -- (����)
	frm = document.frm;
	frm.search_item.value	= "";
	frm.search_value.value 	= "";
	frm.page.value		= 1;
	frm.target = "";
	frm.action = Basic_Path + ListPage_Name;
	frm.submit();
}
function Move_Page(page){	 // ������ �̵� (����)
	frm = document.frm;
	frm.page.value = page;
	frm.target = "";
	frm.action = Basic_Path + ListPage_Name;
	frm.submit();
}
function Go_List(){	 // ����������� �̵� (����)
	frm = document.frm;
	frm.target = "";
	frm.action = Basic_Path + ListPage_Name;
	frm.submit();
}
function Change_Size(){	// ������ ������ ���� (����Ʈ �ڽ� ���� Onchange �̺�Ʈ���� ȣ��)
	frm = document.frm;
	frm.target = "";
	frm.action =  Basic_Path + ListPage_Name;
	frm.submit();
}

function Change_CBunryu(){
	frm = document.frm;
	frm.COURSE_CODE.value = "";
	frm.OBJECT_ID.value = "0";
	frm.target = "";
	frm.action = Basic_Path + ListPage_Name;
	frm.submit();
}
function Change_Course(){
	frm = document.frm;
	frm.OBJECT_ID.value = "0";
	frm.target = "";
	frm.action = Basic_Path + ListPage_Name;
	frm.submit();
}

function Object_Add(){
	frm = document.frm;

	if(frm.BUNRYU_CODE.value == "" || frm.BUNRYU_CODE.value == "0"){
		alert("ī�װ��� ���� �����ϼ���.");
		return false;
	}
	if(frm.COURSE_CODE.value == "" || frm.COURSE_CODE.value == "0"){
		alert("������ ���� �����ϼ���.");
		return false;
	}
	frm.mode.value = "Insert";
	frm.OBJECT_ID.value = "0";
	frm.target = "";
	frm.action = Basic_Path + "aco_Object_Reg.jsp";
	frm.submit();
}

function Object_Edit(flag, type, code){
	var action_url = "";
	if(flag == "1"){
		if(type == "1"){			
			action_url = "aco_Object_OType1_Mod.jsp";
		}else{
			action_url = "aco_Object_OType23_Mod.jsp";
		}
	}else{
		if(type == "1"){		
			action_url = "aco_Object_OType1_Mod.jsp";
		}else{
			action_url = "aco_Object_OType23_Mod.jsp";
		}
	}
	frm = document.frm;
	frm.mode.value = "Modify";
	frm.OBJECT_ID.value = code;
	frm.target = "";
	frm.action = Basic_Path + action_url;
	frm.submit();
}

function Del_Object(code){	
	if(confirm("�н��ڷḦ �����Ͻðڽ��ϱ�?")){
		frm = document.frm;
		frm.mode.value = "Delete";
		frm.OBJECT_ID.value = code;
		frm.target = "";
		frm.action = Basic_Path + "aco_Object_DelExe.jsp";
		frm.submit();
	}else{
		return;
	}
}

function SuppleData_Manage(code){
	frm = document.frm;
	frm.mode.value = "View";
	frm.OBJECT_ID.value = code;
	frm.target = "";
	frm.action = Basic_Path + "aco_Object_SuppleData_View.jsp";
	frm.submit();
}

function SuppleData_AddPop(code){
	window.open("", "SUPPLEDATA", "width=300,height=300,scrollbars=no,toolbars=no");

	frm = document.frm;
	frm.mode.value = "Insert";
	frm.SUPPLE_CODE.value = code;
	frm.SUPPLE_NO.value = "0";
	frm.target = "SUPPLEDATA";
	frm.action = Basic_Path + "aco_Object_SuppleData_Reg.jsp";
	frm.submit();
}

function SuppleData_EditPop(code, no){
	window.open("", "SUPPLEDATA", "width=300,height=300,scrollbars=no,toolbars=no");

	frm = document.frm;
	frm.mode.value = "Modify";
	frm.SUPPLE_CODE.value = code;
	frm.SUPPLE_NO.value = no;
	frm.target = "SUPPLEDATA";
	frm.action = Basic_Path + "aco_Object_SuppleData_Reg.jsp";
	frm.submit();
}

function SuppleData_Del(code, no){
	if(confirm("�н��ڷḦ �����Ͻðڽ��ϱ�?")){
		frm = document.frm;
		frm.mode.value = "Delete";
		frm.SUPPLE_CODE.value = code;
		frm.SUPPLE_NO.value = no;
		frm.target = "";
		frm.action = Basic_Path + "aco_Object_SuppleData_DelExe.jsp";
		frm.submit();
	}
	return;
}

function Save_SuppleData(){
	frm = document.frm;
	var msg	= "";
	if(IsSpace(frm.SUPPLE_DATANAME)){
		alert("�н��ڷ���� �Է��ϼ���.");
		return;
	}else if(CharacterStr_CHK(frm.SUPPLE_DATANAME,"\"'")){
		alert("�н��ڷ�� ����ǥ�� ����Ͻ� �� �����ϴ�.");
		return false;
	}
	if(frm.mode.value == "Modify" && frm.old_filename.value != "" && frm.old_fileopt[2].checked == true){
		msg	= "������ �����Ͻø� �����н��ڷ� ���� ��ü�� �Բ� �����˴ϴ�.\n\n�����Ͻðڽ��ϱ�?";
	}else{
		msg	= "�����Ͻðڽ��ϱ�?";
	}
	if(confirm(msg)){
		frm.target = "";
		frm.encoding = "multipart/form-data";
		frm.action = Basic_Path + "aco_Object_SuppleData_RegExe.jsp";
		frm.submit();
	}
	return;
}

function Meta_Add(oid, metalocation, scolocate){
	URL="/servlet/controller.contents.MetaDataServlet?p_process=insertSave&p_oid="+oid+"&p_metalocation="+metalocation+"&p_scolocate="+scolocate;
	window.open(URL,"","toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=950,height=600,left=0,top=0");
}

function Meta_Edit(bunryu_code, course_code, object_id){

	url = "/Manager/Course/MetaGenerator/ModifyFrame.jsp?bunryu_code="+bunryu_code+"&course_code="+course_code+"&object_id="+object_id;
	window.open(url,"","toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=950,height=600,left=0,top=0");
}

function Meta_View(bunryu_code, course_code, object_id){

	url = "/Manager/Course/MetaGenerator/MetadataView.jsp?bunryu_code="+bunryu_code+"&course_code="+course_code+"&object_id="+object_id;
	window.open(url,"","toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=950,height=600,left=0,top=0");
}

function Result_Message(msg, action_type){	// Background(���/����/����)���� ó�� ��� �޼��� ����� Hidden�� �Բ� ��� �������� �̵�
	alert(msg);
	if(action_type == "Fail"){
		history.back();
	}else{
		frm = document.frm;
		frm.target = "";
		frm.action = Basic_Path + ListPage_Name;
		frm.submit();
	}
}
function Result_Message2(msg, action_type, page_name){	// Background(���/����/����)���� ó�� ��� �޼��� ����� Hidden�� �Բ� ��� �������� �̵�
	alert(msg);
	if(action_type == "Fail"){
		history.back();
	}else{
		frm = opener.document.frm;
		frm.target = "";
		frm.action = Basic_Path + page_name;
		frm.submit();
		self.close();
	}
}
function Result_Message3(msg, action_type, page_name){	// Background(���/����/����)���� ó�� ��� �޼��� ����� Hidden�� �Բ� ��� �������� �̵�
	alert(msg);
	if(action_type == "Fail"){
		history.back();
	}else{
		frm = document.frm;
		frm.target = "";
		frm.action = Basic_Path + page_name;
		frm.submit();
	}
}