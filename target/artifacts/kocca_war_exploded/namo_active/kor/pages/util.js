//-- �׸�����
var cnt = 45;
//-- �׸�ǥ��
for(var i=1;i<cnt+1;i++){
	document.write("<img src='emoticon/imt" + i + ".gif' border='0' onclick='getimgname(this.src)' style='cursor:hand;'> ");
}
//-- ��Ƽ�꽺��� ������ �׸�����
function getimgname(iname)
{
	window.returnValue = iname;
	self.close();
}
