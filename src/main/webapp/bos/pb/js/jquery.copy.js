jQuery.copy=function(t)
{
	if(typeof t=='undefined')
	{
		t='';
	}
	if (window.clipboardData)
	{
		window.clipboardData.setData('Text',t);
	}
	else
	{
		var f='flashcopier';
		if(!document.getElementById(f))
		{
			var dd=document.createElement('div');
			dd.id=f;
			document.body.appendChild(dd);
		}
		document.getElementById(f).innerHTML='';
		var i='<embed src="copy.swf" FlashVars="clipboard='+encodeURIComponent(t)+'" width="0" height="0" type="application/x-shockwave-flash"></embed>';
		document.getElementById(f).innerHTML=i;
	}
}