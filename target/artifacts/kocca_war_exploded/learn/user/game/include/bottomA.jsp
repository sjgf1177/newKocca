<%
//String tem_type_sub = box.getSession("tem_type_sub");
String v_tem_grcode_sub  = box.getSession("tem_grcode");
%>
    </td>
    </tr>
    </table>
    <!-- //CONTENTS -->
</td>
</tr>

<tr valign="top" height="137">
    <td>

 <!-- FOOTER -->

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="916">
	<table width="916"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top" >
		  <table width="908" border="0" cellspacing="0" cellpadding="0">
              <!--tr>
                <td  height="6" colspan="5"><img src="<%=tem_imgpath%><%=tem_foottopimg%>"></td>
              </tr>
              <tr>
                <td  height="6" colspan="5"></td>
              </tr-->
<%
if(v_tem_grcode_sub.equals("N000002") || v_tem_grcode_sub.equals("N000010")) {	//게임아카데미 & 교원연수
%>
              <tr>
                <td height="1" colspan="5" class="linecolor_footer"></td>
              </tr>
              <tr valign="top">
                <td height="35" colspan="5">
					<!----------------- 관련사이트 시작 ----------------->
					<%@ include file="/learn/user/game/include/relateSite.jsp"%>
					<!----------------- 관련사이트 ----------------->
                </td>
              </tr>
              <tr>
                <td height="1" colspan="5" class="linecolor_footer"></td>
              </tr>
<%
}
%>
              <tr>
                <td height="6" colspan="5"></td>
              </tr>
              <tr>
                <td colspan="5">
				<table width="1000" bgColor="#F7F9E1" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="213" height="20" bgcolor="FFFFFF"><img src="<%=tem_imgpath%><%=tem_footleftimg%>"></td>
                      <td width="280" valign="top" bgcolor="FFFFFF"><img src="<%=tem_imgpath%><%=tem_footcopyright%>"></td>
<%
if(v_tem_grcode_sub.equals("N000002") || v_tem_grcode_sub.equals("N000010")) {
%>
       				  <td width="415" bgcolor="FFFFFF"><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=tab1"><img src="/images/user/game/homepage/type1/footer_m1.gif" border="0"></a><a href="/servlet/controller.homepage.MemberJoinServlet?p_process=user"><img src="/images/user/game/homepage/type1/footer_m2.gif" border="0"></a><a href="/servlet/controller.homepage.MemberJoinServlet?p_process=personal"><img src="/images/user/game/homepage/type1/footer_m3.gif" border="0"></a></td>
<%
} else {
%>
		      		  <td width="415" bgcolor="FFFFFF"><img src="/images/user/game/homepage/type1/N000012_bottom_03.gif" border="0"></td>
<%
}
%>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td>&nbsp;</td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>


<!-- AceCounter Log Gathering Script V.70.2008090201 -->
<script language='javascript'>
if(typeof _GUL == 'undefined'){
var _JV="AMZ2008120803";//script Version
var _GUL = 'gtp2.acecounter.com';var _GPT='8080'; var _AIMG = new Image(); var _bn=navigator.appName; var _PR = location.protocol=="https:"?"https://"+_GUL:"http://"+_GUL+":"+_GPT;if( _bn.indexOf("Netscape") > -1 || _bn=="Mozilla"){ setTimeout("_AIMG.src = _PR+'/?cookie';",1); } else{ _AIMG.src = _PR+'/?cookie'; };
var _GCD = 'AM6A34601337121'; // gcode
var _UD='undefined';var _UN='unknown';var _mset=0;
function _IX(s,t){return s.indexOf(t)}
function _GV(b,a,c,d){ var f = b.split(c);for(var i=0;i<f.length; i++){ if( _IX(f[i],(a+d))==0) return f[i].substring(_IX(f[i],(a+d))+(a.length+d.length),f[i].length); }	return ''; }
function _XV(b,a,c,d,e){ var f = b.split(c);var g='';for(var i=0;i<f.length; i++){ if( _IX(f[i],(a+d))==0){ try{eval(e+"=f[i].substring(_IX(f[i],(a+d))+(a.length+d.length),f[i].length);");}catch(_e){}; continue;}else{ if(g) g+= '&'; g+= f[i];}; } return g;};
function _NOB(a){return (a!=_UD&&a>0)?new Object(a):new Object()}
function _NIM(){return new Image()}
function _IL(a){return a!=_UD?a.length:0}
function _VF(a,b){return a!=_UD&&(typeof a==b)?1:0}
function _LST(a,b){if(_IX(a,b)) a=a.substring(0,_IL(a));return a}
function _CST(a,b){if(_IX(a,b)>0) a=a.substring(_IX(a,b)+_IL(b),_IL(a));return a}
function _UL(a){a=_LST(a,'#');a=_CST(a,'://');return a}
function _AA(a){return new Array(a?a:0)}
_DC = document.cookie ;
function _AGC(nm) { var cn = nm + "="; var nl = cn.length; var cl = _DC.length; var i = 0; while ( i < cl ) { var j = i + nl; if ( _DC.substring( i, j ) == cn ){ var val = _DC.indexOf(";", j ); if ( val == -1 ) val = _DC.length; return unescape(_DC.substring(j, val)); }; i = _DC.indexOf(" ", i ) + 1; if ( i == 0 ) break; } return ''; }
function _ASC( nm, val, exp ){var expd = new Date(); if ( exp ){ expd.setTime( expd.getTime() + ( exp * 1000 )); document.cookie = nm+"="+ escape(val) + "; expires="+ expd.toGMTString() +"; path="; }else{ document.cookie = nm + "=" + escape(val);};}
function SetUID() {     var newid = ''; var d = new Date(); var t = Math.floor(d.getTime()/1000); newid = 'UID-' + t.toString(16).toUpperCase(); for ( var i = 0; i < 16; i++ ){ var n = Math.floor(Math.random() * 16).toString(16).toUpperCase(); newid += n; }       return newid; }
var _FCV = _AGC("ACEFCID"); if ( !_FCV ) { _FCV = SetUID(); _ASC( "ACEFCID", _FCV , 86400 * 30 * 12 ); _FCV=_AGC("ACEFCID");}
var _AIO = _NIM(); var _AIU = _NIM();  var _AIW = _NIM();  var _AIX = _NIM();  var _AIB = _NIM();  var __hdki_xit = _NIM();
var _gX='/?xuid='+_GCD+'&sv='+_JV,_gF='/?fuid='+_GCD+'&sv='+_JV,_gU='/?uid='+_GCD+'&sv='+_JV+"&FCV="+_FCV,_gE='/?euid='+_GCD+'&sv='+_JV,_gW='/?wuid='+_GCD+'&sv='+_JV,_gO='/?ouid='+_GCD+'&sv='+_JV,_gB='/?buid='+_GCD+'&sv='+_JV;
function _IDV(a){return (typeof a!=_UD)?1:0}

var _d=_rf=_fwd=_arg=_xrg=_av=_bv=_rl=_ak=_xrl=_cd=_cu=_bz='',_sv=11,_tz=20,_ja=_sc=_ul=_ua=_UA=_os=_vs=_UN,_je='n',_bR='blockedReferrer';
if(!_IDV(_CODE)) var _CODE = '' ;
_tz = Math.floor((new Date()).getTimezoneOffset()/60) + 29 ;if( _tz > 24 ) _tz = _tz - 24 ;
// Javascript Variables
if(!_IDV(_amt)) var _amt=0 ;if(!_IDV(_pk)) var _pk='' ;if(!_IDV(_pd)) var _pd='';if(!_IDV(_ct)) var _ct='';
if(!_IDV(_ll)) var _ll='';if(!_IDV(_ag)) var _ag=0;	if(!_IDV(_id)) var _id='' ;if(!_IDV(_mr)) var _mr = _UN;
if(!_IDV(_gd)) var _gd=_UN;if(!_IDV(_jn)) var _jn='';if(!_IDV(_jid)) var _jid='';if(!_IDV(_skey)) var _skey='';
if(!_IDV(_ud1)) var _ud1='';if(!_IDV(_ud2)) var _ud2='';if(!_IDV(_ud3)) var _ud3='';
if( !_ag ){ _ag = 0 ; }else{ _ag = parseInt(_ag); }
if( _ag < 0 || _ag > 150 ){ _ag = 0; }
if( _gd != 'man' && _gd != 'woman' ){ _gd =_UN;};if( _mr != 'married' && _mr != 'single' ){ _mr =_UN;};if( _jn != 'join' && _jn != 'withdraw' ){ _jn ='';};
if( _id != '' ){ _mset|=1 };
if( _jid != '' ){ _mset|=2 };
_je = (navigator.javaEnabled()==true)?'1':'0';_bn=navigator.appName;
if(_bn.substring(0,9)=="Microsoft") _bn="MSIE";
_bN=(_bn=="Netscape"),_bI=(_bn=="MSIE"),_bO=(_IX(navigator.userAgent,"Opera")>-1);if(_bO)_bI='';
_bz=navigator.appName; _pf=navigator.platform; _av=navigator.appVersion; _bv=parseFloat(_av) ;
if(_bI){_cu=navigator.cpuClass;}else{_cu=navigator.oscpu;};
if((_bn=="MSIE")&&(parseInt(_bv)==2)) _bv=3.01;_rf=document.referrer;var _prl='';var _frm=false;
function _WO(a,b,c){window.open(a,b,c)}
function ACEF_Tracking(a,b,c,d,e,f){ if(!_IDV(b)){var b = 'FLASH';}; if(!_IDV(e)){ var e = '0';};if(!_IDV(c)){ var c = '';};if(!_IDV(d)){ var d = '';}; var a_org=a; b = b.toUpperCase(); var b_org=b;	if(b_org=='FLASH_S'){ b='FLASH'; }; if( typeof CU_rl == 'undefined' ) var CU_rl = 'http://gtp2.acecounter.com:8080'; if(_IDV(_GCD)){ var _AF_rl = document.URL; if(a.indexOf('://') < 0  && b_org != 'FLASH_S' ){ var _AT_rl  = ''; if( _AF_rl.indexOf('?') > 0 ){ _AF_rl = _AF_rl.substring(0,_AF_rl.indexOf('?'));}; var spurl = _AF_rl.split('/') ;	for(var ti=0;ti < spurl.length ; ti ++ ){ if( ti == spurl.length-1 ){ break ;}; if( _AT_rl  == '' ){ _AT_rl  = spurl[ti]; }else{ _AT_rl  += '/'+spurl[ti];}; }; var _AU_arg = ''; if( a.indexOf('?') > 0 ){ _AU_arg = a.substring(a.indexOf('?'),a.length); a = a.substring(0,a.indexOf('?')); }; var spurlt = a.split('/') ; if( spurlt.length > 0 ){ a = spurlt[spurlt.length-1];}; a = _AT_rl +'/'+a+_AU_arg;	_AF_rl=document.URL;}; _AF_rl = _AF_rl.substring(_AF_rl.indexOf('//')+2,_AF_rl.length); if( typeof f == 'undefined' ){ var f = a }else{f='http://'+_AF_rl.substring(0,_AF_rl.indexOf('/')+1)+f}; var _AS_rl = CU_rl+'/?xuid='+_GCD+'&url='+escape(_AF_rl)+'&xlnk='+escape(f)+'&fdv='+b+'&idx='+e+'&'; var _AF_img = new Image(); _AF_img.src = _AS_rl; if( b_org == 'FLASH' && a_org != '' ){ if(c==''){ window.location.href = a_org; }else{ if(d==''){ window.open(a_org,c);}else{ window.open(a_org,c,d); };};	};} ; }
function _PT(){return location.protocol=="https:"?"https://"+_GUL:"http://"+_GUL+":"+_GPT}
function _EL(a,b,c){if(a.addEventListener){a.addEventListener(b,c,false)}else if(a.attachEvent){a.attachEvent("on"+b,c)} }
function _NA(a){return new Array(a?a:0)}
function _ER(a,b,c,d){_xrg=_PT()+_gW+"&url="+escape(_UL(document.URL))+"&err="+((typeof a=="string")?a:"Unknown")+"&ern="+c+"&bz="+_bz+"&bv="+_vs+"&RID="+Math.random()+"&";
if(_IX(_bn,"Netscape") > -1 || _bn == "Mozilla"){ setTimeout("_AIW.src=_xrg;",1); } else{ _AIW.src=_xrg; } }
function _BO(a,b,c){_xrg=_PT()+_gB+"&url="+escape(_UL(document.URL))+"&ref="+escape(_UL(document.referrer))+"&RID="+Math.random()+"&";_AIB.src=_xrg;}
function _OL(a,b,c){_xrg=_PT()+_gO+"&url="+escape(_UL(document.URL))+"&ref="+escape(_UL(document.referrer))+"&RID="+Math.random()+"&";
_AIO.src=_xrg;}
function _PL(a){if(!_IL(a))a=_UL(document.URL);
_arg = _PT()+_gU;
if( typeof _ERR !=_UD && _ERR == 'err'){ _arg = _PT()+_gE;};
_AIU.src = _arg+"&url="+escape(a)+"&ref="+escape(_rf)+"&cpu="+_cu+"&bz="+_bz+"&bv="+_vs+"&os="+_os+"&dim="+_d+"&cd="+_cd+"&je="+_je+"&jv="+_sv+"&tz="+_tz+"&ul="+_ul+"&ad_key="+escape(_ak)+"&skey="+escape(_skey)+"&age="+_ag+"&gender="+_gd+"&marry="+_mr+"&join="+_jn+"&mset="+_mset+"&udf1="+_ud1+"&udf2="+_ud2+"&udf3="+_ud3+"&amt="+_amt+"&frwd="+_fwd+"&pd="+escape(_pd)+"&ct="+escape(_ct)+"&ll="+escape(_ll)+"&RID="+Math.random()+"&";
setTimeout("",300);
}
_EL(window,"error",_ER); //window Error
if( typeof window.screen == 'object'){_sv=12;_d=screen.width+'*'+screen.height;_sc=_bI?screen.colorDepth:screen.pixelDepth;if(_sc==_UD)_sc=_UN;}
_ro=_NA();if(_ro.toSource||(_bI&&_ro.shift))_sv=13;
if( top && typeof top == 'object' &&_IL(top.frames)){eval("try{_rl=top.document.URL;}catch(_e){_rl='';};"); if( _rl != document.URL ) _frm = true;};
if(_frm){ eval("try{_prl = top.document.URL;}catch(_e){_prl=_bR;};"); if(_prl == '') eval("try{_prl=parent.document.URL;}catch(_e){_prl='';};");
if( _IX(_prl,'#') > 0 ) _prl=_prl.substring(0,_IX(_prl,'#'));
_prl=_LST(_prl,'#');
if( _IX(_rf,'#') > 0 ) _rf=_rf.substring(0,_IX(_rf,'#'));
_prl=_LST(_prl,'/');_rf=_LST(_rf,'/');
if( _rf == '' ) eval("try{_rf=parent.document.URL;}catch(_e){_rf=_bR;}");
if(_rf==_bR||_prl==_bR){ _rf='',_prl='';}; if( _rf == _prl ){ eval("try{_rf=top.document.referrer;}catch(_e){_rf='';}");
if( _rf == ''){ _rf = 'bookmark';};if( _IX(document.cookie,'ACEN_CK='+escape(_rf)) > -1 ){ _rf = _prl;}
else{
if(_IX(_prl,'?') > 0) _ak = _prl.substring(_IX(_prl,'?')+1,_prl.length);
if( _IX(_prl,'OVRAW=') > 0 ){ _ak = 'src=overture&kw='+_prl.substring(_prl.indexOf('OVRAW=')+6,_prl.indexOf('&',_prl.indexOf('OVRAW=')+6)); };
if( _IX(_prl.toLowerCase(),'OVRAW=') > 0 ){ _ak = 'src=overture&kw='+_prl.substring(_prl.indexOf('OVRAW=')+6,_prl.indexOf('&',_prl.indexOf('OVRAW=')+6)); };
if(_IX(_prl,'gclid=') > 0 ){ _ak='src=adwords'; }; if(_IX(_prl,'DWIT=') > 0 ){_ak='src=dnet_cb';};
if( _IX(_prl,"rcsite=") > 0 &&  _IX(_prl,"rctype=") > 0){ _prl += '&'; _ak = _prl.substring(_IX(_prl,'rcsite='),_prl.indexOf('&',_IX(_prl,'rcsite=')+7))+'-'+_prl.substring(_IX(_prl,'rctype=')+7,_prl.indexOf('&',_IX(_prl,'rctype=')+7))+'&'; };
if( _GV(_prl,'src','&','=') ) _ak += '&src='+_GV(_prl,'src','&','='); if( _GV(_prl,'kw','&','=') ) _ak += '&kw='+_GV(_prl,'kw','&','='); var _trl = _prl.split('?'); if(_trl.length>1){ _trl[1] = _XV(_trl[1],'FWDRL','&','=','_rf'); _rf = unescape(_rf); _ak = _XV(_ak,'FWDRL','&','=','_prl'); }; if( typeof FD_ref=='string' && FD_ref != '' ) _rf = FD_ref;
_fwd = _GV(_prl,'FWDIDX','&','=');
document.cookie='ACEN_CK='+escape(_rf)+';path=/;';
};
if(document.URL.indexOf('?')>0 && ( _IX(_ak,'rcsite=') < 0 && _IX(_ak,'src=') < 0 && _IX(_ak,'source=') < 0 ) ) _ak =document.URL.substring(document.URL.indexOf('?')+1,document.URL.length); };
}
else{
_rf=_LST(_rf,'#');_ak=_CST(document.URL,'?');
if( _IX(_ak,"rcsite=") > 0 &&  _IX(_ak,"rctype=") > 0){
    _ak += '&';
    _ak = _ak.substring(_IX(_ak,'rcsite='),_ak.indexOf('&',_IX(_ak,'rcsite=')+7))+'-'+_ak.substring(_IX(_ak,'rctype=')+7,_ak.indexOf('&',_IX(_ak,'rctype=')+7))+'&';
}
}
_rl=document.URL;
var _trl = _rl.split('?'); if(_trl.length>1){ _trl[1] = _XV(_trl[1],'FWDRL','&','=','_rf'); _rf = unescape(_rf); _fwd = _GV(_trl[1],'FWDIDX','&','='); _rl=_trl.join('?');
_ak = _XV(_ak,'FWDRL','&','=','_prl');
}; if( typeof FD_ref=='string' && FD_ref != '' ) _rf = FD_ref;
if( _rf.indexOf('googlesyndication.com') > 0 ){
var _rf_idx = _rf.indexOf('&url=');  if( _rf_idx > 0 ){ var _rf_t = unescape(_rf.substring(_rf_idx+5,_rf.indexOf('&',_rf_idx+5)));  if( _rf_t.length > 0 ){ _rf = _rf_t ;};  };  };
_rl = _UL(_rl); _rf = _UL(_rf);

if( typeof _rf_t != 'undefined' && _rf_t != '' ) _rf = _rf_t ;
if( typeof _ak_t != 'undefined' && _ak_t != '' ) _ak = _ak_t ;

if( typeof _rf==_UD||( _rf == '' )) _rf = 'bookmark' ;_cd=(_bI)?screen.colorDepth:screen.pixelDepth;
_UA = navigator.userAgent;_ua = navigator.userAgent.toLowerCase();
if (navigator.language){  _ul = navigator.language.toLowerCase();}else if(navigator.userLanguage){  _ul = navigator.userLanguage.toLowerCase();};

_st = _IX(_UA,'(') + 1;_end = _IX(_UA,')');_str = _UA.substring(_st, _end);_if = _str.split('; ');_cmp = _UN ;

if(_bI){ _cmp = navigator.appName; _str = _if[1].substring(5, _if[1].length); _vs = (parseFloat(_str)).toString();}
else if ( (_st = _IX(_ua,"opera")) > 0){ _cmp = "Opera" ;_vs = _ua.substring(_st+6, _ua.indexOf('.',_st+6)); }
else if ((_st = _IX(_ua,"firefox")) > 0){_cmp = "Firefox"; _vs = _ua.substring(_st+8, _ua.indexOf('.',_st+8)); }
else if ((_st = _IX(_ua,"netscape6")) > 0){ _cmp = "Netscape"; _vs = _ua.substring(_st+10, _ua.length);
if ((_st = _IX(_vs,"b")) > 0 ) { _str = _vs.substring(0,_IX(_vs,"b")); _vs = _str ;  };}
else if ((_st = _IX(_ua,"netscape/7")) > 0){  _cmp = "Netscape";  _vs = _ua.substring(_st+9, _ua.length);  if ((_st = _IX(_vs,"b")) > 0 ){ _str = _vs.substring(0,_IX(_vs,"b")); _vs = _str;};
}
else{
if (_IX(_ua,"gecko") > 0){ if(_IX(_ua,"safari")>0){ _cmp = "Safari";_ut = _ua.split('/');for( var ii=0;ii<_ut.length;ii++) if(_IX(_ut[ii],'safari')>0){ _vst = _ut[ii].split(' '); _vs = _vst[0];} }else{ _cmp = navigator.vendor;  } } else if (_IX(_ua,"nav") > 0){ _cmp = "Netscape Navigator";}else{ _cmp = navigator.appName;}; _av = _UA ;
}
if (_IX(_vs,'.')<0){  _vs = _vs + '.0'}
_bz = _cmp;

var _lxit=_NOB();
var _lwd=window.document;
_lxit.lnk=new Array(_lwd.links.length);

function _LX(k,w,i){
_xrg= _PT()+_gX+'&url='+escape(_rl)+'&xlnk='+escape(k)+'&xidx='+i+'&';
if(_IX(_bn,"Netscape") > -1 || _bn == "Mozilla"){
setTimeout("__hdki_xit.src=_xrg;",1);
}else{
__hdki_xit.src=_xrg;
};
return (w.lnk[i]&&w.lnk[i].ocmx)?w.lnk[i].ocmx():1;};
function _EX(){_lxit.lnk=new Array(_lwd.links.length);for(var i=0;i<_lwd.links.length;i++){if(_lwd.links[i].onmousedown){_lxit.lnk[i]=document.links[i];_lxit.lnk[i].ocmx=document.links[i].onmousedown;};eval("document.links[i].onmousedown=function(){return _LX(this,_lxit,"+i+");}");};};

_EL(window,"load",_EX); // ExitLink

if( _IX(_pf,_UD) >= 0 || _pf ==  '' ){ _os = _UN ;}else{ _os = _pf ; };
if( _IX(_os,'Win32') >= 0 ){if( _IX(_av,'98')>=0){ _os = 'Windows 98';}else if( _IX(_av,'95')>=0 ){ _os = 'Windows 95';}else if( _IX(_av,'Me')>=0 ){ _os = 'Windows Me';}else if( _IX(_av,'NT')>=0 ){ _os = 'Windows NT';}else{ _os = 'Windows';};if( _IX(_av,'NT 5.0')>=0){ _os = 'Windows 2000';};if( _IX(_av,'NT 5.1')>=0){_os = 'Windows XP';if( _IX(_av,'SV1') > 0 ){_os = 'Windows XP SP2';};};if( _IX(_av,'NT 5.2')>=0){_os ='Windows Server 2003';};if( _IX(_av,'NT 6.0')>=0){_os ='Windows Vista';};};
_pf_s = _pf.substring(0,4);if( _pf_s == 'Wind'){if( _pf_s == 'Win1'){_os = 'Windows 3.1';}else if( _pf_s == 'Mac6' ){ _os = 'Mac';}else if( _pf_s == 'MacO' ){ _os ='Mac';}else if( _pf_s == 'MacP' ){_os='Mac';}else if(_pf_s == 'Linu'){_os='Linux';}else if( _pf_s == 'WebT' ){ _os='WebTV';}else if(  _pf_s =='OSF1' ){ _os ='Compaq Open VMS';}else if(_pf_s == 'HP-U' ){ _os='HP Unix';}else if(  _pf_s == 'OS/2' ){ _os = 'OS/2' ;}else if( _pf_s == 'AIX4' ){ _os = 'AIX';}else if( _pf_s == 'Free' ){ _os = 'FreeBSD';}else if( _pf_s == 'SunO' ){ _os = 'SunO';}else if( _pf_s == 'Drea' ){ _os = 'Drea'; }else if( _pf_s == 'Plan' ){ _os = 'Plan'; }else{ _os = _UN; };};
if( _cu == 'x86' ){ _cu = 'Intel x86';}else if( _cu == 'PPC' ){ _cu = 'Power PC';}else if( _cu == '68k' ){ _cu = 'Motorola 680x';}else if( _cu == 'Alpha' ){ _cu = 'Compaq Alpa';}else if( _cu == 'Arm' ){ _cu = 'ARM';}else{ _cu = _UN;};if( _d == '' || typeof _d==_UD ){ _d = '0*0';}
_PL(_rl); // Site Logging
}
</script>
<!-- AceCounter Log Gathering Script End -->

</BODY>
</HTML>

