function imgover(imgs) {
	imgs.src = imgs.src.replace("off.gif", "on.gif");
}
function imgout(imgs) {
	imgs.src = imgs.src.replace("on.gif", "off.gif");
}

// png ���� ���� ó�� 
function setPng24(obj) {
    obj.width=obj.height=1;
    obj.className=obj.className.replace(/\bpng24\b/i,'');
    obj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');"
    obj.src='';
    return '';
}

// onkeypress="javascript:fnKeyPressEnter(event, '�Լ���');"
function fnKeyPressEnter(event, fcName) {
    var e = event || window.event;
    var code = e.charCode || e.keyCode;
    if (code == 13) {
    	window[fcName]();
        code = 0
        return false;
    }
}