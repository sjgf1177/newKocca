function changeFileDir(box) {
        var fileName = box.value;
        var arr = fileName.split("\\");
        fileName = arr[arr.length-1];
        document.QNAFORM.hidAttach.value = fileName;
}    

//���� ÷���ϱ� ó��
function doAttachFile(id) {
	var form = document.QNAFORM;
	
	if (form.attach.value == "") {
		alert("\"ã�ƺ���\" ��ư�� ������ ÷���� ������ �����Ͽ� �ֽʽÿ�.");
		return;
	}
	
	if (form.attach_list.length-1 >= 3) {
		alert("÷�� ������ 3�� ������ �����մϴ�.");
		return;
	}
    
     for (var i = 1; i < form.attach_list.length; i++) {
            if(form.attach_list.options[i].text == form.hidAttach.value){
                alert("���� �̸��� ������ �ι� ÷���� �� �����ϴ�.");
                return;
            }
    }  


	if(id != "-1") form.ansId.value = id;	
	
	form.target = "ZEROFRAME";	
	form.action = "/portal/include/user/ks_file_attach.jsp";	
	show_waiting();
	form.submit();
}



//÷������ ���� ó��
function doDeleteFile(id, tp) {
	var form = document.QNAFORM;
	var flist = "";
	
	if (form.attach_list.selectedIndex <= 0) {
		alert("������ ÷�� ������ �����Ͽ� �ֽʽÿ�.");
		return;
	}
	
	for (var i = 1; i < form.attach_list.length; i++) {
		if (form.attach_list.selectedIndex != i) {
			flist += form.attach_list[i].value + ";";
		}
		else {
			form.deleteFile.value = form.attach_list[i].value;
			form.deleteIdx.value = i;
		}
	}
	

	if(id != "-1") form.ansId.value = id;			

	form.type.value = tp;
	form.target = "ZEROFRAME";	
	form.action = "/portal/include/user/ks_file_delete.jsp";	
		
	show_waiting();
	form.submit();
}


//����÷��/���� �� waiting�̹���
function show_waiting()
{
	var _x = document.body.clientWidth/2 + document.body.scrollLeft - 60;
	var _y = document.body.clientHeight/2 + document.body.scrollTop - 74;
	waiting.style.posLeft=_x;
	waiting.style.posTop=_y;
	waiting.style.visibility='visible';	
}

//�̹��� �����
function hide_waiting(){
	waiting.style.visibility='hidden';
}


/********* �Խ��ǿ����� ÷������ ó�� ****************/
//���� ÷�� ó��
function doBulletinAttachFile(frm) {
	var form = frm;
	
	if (form.attach.value == "") {
		alert("\"ã�ƺ���\" ��ư�� ������ ÷���� ������ �����Ͽ� �ֽʽÿ�.");
		return;
	}
	
	if (form.attach_list.length-1 >= 3) {
		alert("÷�� ������ 3�� ������ �����մϴ�.");
		return;
	}
    
     for (var i = 1; i < form.attach_list.length; i++) {
            if(form.attach_list.options[i].text == form.hidAttach.value){
                alert("���� �̸��� ������ �ι� ÷���� �� �����ϴ�.");
                return;
            }
    }  
	
	form.target = "ZEROFRAME";	
	form.action = "/portal/include/bulletin_file_attach.jsp";	
	show_waiting();
	form.submit();
}


//÷������ ����ó��
function doBulletinDeleteFile(frm) {
	var form = frm;
	var flist = "";
	
	if (form.attach_list.selectedIndex <= 0) {
		alert("������ ÷�� ������ �����Ͽ� �ֽʽÿ�.");
		return;
	}
	
	for (var i = 1; i < form.attach_list.length; i++) {
		if (form.attach_list.selectedIndex != i) {
			flist += form.attach_list[i].value + ";";
		}
		else {
			form.deleteFile.value = form.attach_list[i].value;
			form.deleteIdx.value = i;
		}
	}
	
	form.target = "ZEROFRAME";	
	form.action = "/portal/include/bulletin_file_delete.jsp";	
		
	show_waiting();
	form.submit();
}


function BulletinChangeFileDir(box, frm) {
        var fileName = box.value;
        var arr = fileName.split("\\");
        fileName = arr[arr.length-1];
        frm.hidAttach.value = fileName;
}    