/* 레이어 메뉴관련 스크립트 모음 */
var IE = 1; // MS IE
var NS = 2; // Netscape Navigator, Opera..

var NV_ENV = new Object();
NV_ENV.BrowserType = getBrowserType();
NV_ENV.IE_Version = new Number(((window.navigator.appVersion.split('; '))[1].split(' '))[1]);
NV_ENV.CR = new Object();
NV_ENV.CR.ReverseBackground = '#225588';
NV_ENV.CR.ReverseText = 'white';
NV_ENV.CR.NormalText = '666666';
NV_ENV.CR.Border = '#C4CAD1';
NV_ENV.CR.BorderActive = '#225588';
NV_ENV.ImgPrefix = 'http://cafeimgs.naver.com/img';
NV_ENV.DefaultHeight = 20;
NV_ENV.ButtonWidth = 15;
NV_ENV.OptionsDivStyle = ''
  + ' display:none;'
  + ' z-index:10;'
  + ' position:absolute;'
  + ' border:1 solid '+ NV_ENV.CR.Border+';'
  + ' background-color:white;'
  + ' scrollbar-face-color:#D4D0C8;'
  + ' scrollbar-shadow-color:white;'
  + ' scrollbar-highlight-color:#F6F5F4;'
  + ' scrollbar-3dlight-color:white'
  + ' scrollbar-darkshadow-color:#86837E;'
  + ' scrollbar-track-color:#F6F5F4;'
  + ' scrollbar-arrow-color:#86837E;';
NV_ENV.OptionNobrStyle = ''
  + ' font-size:9pt;'
  + ' font-family:돋움;';
// Variables
var NV_VAR = new Object();
NV_VAR.DivDummy = document.createElement("DIV");
NV_VAR.SelectList = new Array();
NV_VAR.bEventAttached = false;

var NV_CreatedElements = new Object();

function unloadObjects()
{
  try {
    if (NV_VAR && NV_VAR.SelectList)
    {
      for (key in NV_VAR.SelectList)
      {
	if (NV_VAR.SelectList[key])
	{
	  try {
	   NV_VAR.SelectList[key].select.setAttribute('NV', 0);
	  } catch (e) {};
	  delete NV_VAR.SelectList[key];
	}
      }
    }
  } catch (e) {};
}

function getBrowserType()
{
	if (window.navigator.appName == "Microsoft Internet Explorer")
		return IE;
	else
		return NS;
}

if (document.all)
{
	attachEvent("onunload", unloadObjects);
}

function NV_create (srcHTML, ListMax, bAutoDetect)
{
  // property
  this.nvID = NV_VAR.SelectList.length;
  this.bOriginalSelect = (bAutoDetect && NV_ENV.IE_Version < 5.5);
  this.select = NV_createElement(srcHTML);
  this.selectedIndex = this.select.selectedIndex;
  this.options = this.select.options;
  this.width = parseInt(this.select.style.width);
  this.height = (this.select.style.height) ? parseInt(this.select.style.height) : NV_ENV.DefaultHeight;
  this.OptionHeight = this.height - 4;
  this.bListDown = (ListMax && '-'==ListMax.toString().substr(0, 1)) ? false : true;
  this.ListMax = (!isNaN(parseInt(ListMax))) ? Math.abs(ListMax) : 100;

  this.Table;
  this.TitleDiv;
  this.TitleTable;
  this.TitleWrapper;
  this.OptionsDiv;
  this.OptionsWrapper;
  this.OptionsTable;
  this.bFocused = false;
  this.bExpanded = false;
  this.bReverse = false;

  // private method
  this.isThisEventToBeCanceled = NV_isThisEventToBeCanceled;
  this.toggleTitle = NV_toggleTitle;
  this.syncSelectedIndex = NV_syncSelectedIndex;
  this.toggleOptions = NV_toggleOptions;
  this.turnOnOption = NV_turnOnOption;
  this.turnOffOption = NV_turnOffOption;
  this.handleMousewheel = NV_handleMousewheel;
  this.handleOverTitle = NV_handleOverTitle;
  this.handleOutTitle = NV_handleOutTitle;
  this.handleOverOption = NV_handleOverOption;
  this.createTable = NV_createTable;
  this.createTitleDiv = NV_createTitleDiv;
  this.createOptionsDiv = NV_createOptionsDiv;
  this.createOptionTr = NV_createOptionTr;
  this.adjustOptionsDiv = NV_adjustOptionsDiv;
  this.syncOptions = NV_syncOptions;
  this.pressOption = NV_pressOption;
  this.moveOption = NV_moveOption;
  this.releaseOption = NV_releaseOption;
  this.pressTitle = NV_pressTitle;
  this.releaseTitle = NV_releaseTitle;

  // public method
  this.display = NV_display;
  this.insertOption = NV_insertOption;
  this.deleteOption = NV_deleteOption;
  this.changeOption = NV_changeOption;

  // initiate
  this.createTable();
  this.select.setAttribute('NV', this);
  if (!this.bOriginalSelect)
    this.select.onpropertychange = NV_handlePropertychange;
  NV_VAR.SelectList[this.nvID] = this;
}
function NV_display ()
{
  document.write("<div id=NV_TempDiv></div>\n");
  document.all.NV_TempDiv.appendChild(this.Table);
  document.all.NV_TempDiv.removeNode();
}
function NV_write (srcHTML, ListMax, bAutoDetect)
{
	if (document.all)
	{
	    var oNV = new NV_create(srcHTML, ListMax, bAutoDetect);
		oNV.display();
	    return oNV;
	}
	else
	{
		document.write(srcHTML);
	}
}
function NV_insertOption (value, innerText, idx)
{
  var NewOption = document.createElement("OPTION");
  NV_CreatedElements[NV_CreatedElements.length] = NewOption;
  this.options.add(NewOption, idx);
  NewOption.innerText = innerText;
  NewOption.value = value;

  if (!this.bOriginalSelect)
    this.createOptionTr(idx);
  this.syncOptions();
  this.adjustOptionsDiv();
  this.syncSelectedIndex();
}
function NV_deleteOption (idx)
{
  this.options.remove(idx);
  if (!this.bOriginalSelect)
    this.OptionsTable.deleteRow(idx);
  this.syncOptions();
  this.adjustOptionsDiv();
  this.syncSelectedIndex();
}
function NV_changeOption (idx, value, innerText)
{
  this.options[idx].value = value;
  this.options[idx].innerText = innerText;
  this.syncOptions();
  this.syncSelectedIndex();
}

function NV_cancelEvent (event)
{
  event.cancelBubble = true;
  event.returnValue = false;
}
function NV_isThisEventToBeCanceled (event)
{
  if ('object' == typeof(event)) {
    switch (event.type) {
      case 'mousedown':
        if (!(event.button & 1)) return true;
        break;
      case 'mouseup':
        if (!(event.button & 1)) return true;
        if (NV_ENV.IE_Version >= 5.5 && event.srcElement != this.srcElementOfLastMousedown && this.srcElementOfLastMousedown != null) {
          this.srcElementOfLastMousedown = null;
          return true;
        }
        break;
      case 'mouseout':
        if (!(NV_ENV.IE_Version < 5.5 && event.srcElement == this.srcElementOfLastMousedown))
          return true;
        break;
      case 'mousemove':
        if (NV_ENV.IE_Version >= 5.5 && event.srcElement != this.srcElementOfLastMousedown && this.srcElementOfLastMousedown != null)
          return true;
        break;
    }
  }
  return false;
}
function NV_createElement (html)
{
  NV_VAR.DivDummy.insertAdjacentHTML('afterBegin', html);
  var oEl = NV_VAR.DivDummy.children(0);
  while (NV_VAR.DivDummy.children.length > 0) {
    NV_VAR.DivDummy.removeChild(NV_VAR.DivDummy.children(0));
  }
  return oEl;
}
function NV_blurExcept (except)
{
  NV_cancelEvent(window.event);

  except = ('number'==typeof(except)) ? except : -1;

  var bHasToDetachEvent = true;
  for (var i=0; i < NV_VAR.SelectList.length; i++) {
    if (-1==except && NV_VAR.SelectList[i].bFocused && NV_VAR.SelectList[i].bExpanded) {
      NV_VAR.SelectList[i].toggleOptions(false, true);
      NV_VAR.SelectList[i].toggleTitle(true);
      bHasToDetachEvent = false;
    }
    else if (i!=except) {
      if (NV_VAR.SelectList[i].bExpanded)
        NV_VAR.SelectList[i].toggleOptions(false, true);
      if (NV_VAR.SelectList[i].bReverse)
        NV_VAR.SelectList[i].toggleTitle(false);
      NV_VAR.SelectList[i].bFocused = false;
    }
  }

  if (NV_VAR.bEventAttached && bHasToDetachEvent) {
    document.detachEvent('onmousedown', NV_blurExcept);
    document.detachEvent('ondblclick', NV_blurExcept);
    NV_VAR.bEventAttached = false;
  }
}
function NV_syncSelectedIndex ()
{
  this.selectedIndex = this.select.selectedIndex;
  if (this.bOriginalSelect) return;

  if (this.TitleTable.cells(0).childNodes(0).innerText != this.options[this.selectedIndex].innerText)
    this.TitleTable.cells(0).childNodes(0).innerText = this.options[this.selectedIndex].innerText;

  if (this.bExpanded)
    this.toggleOptions(false);
}
function NV_toggleTitle (bReverse)
{
  this.bReverse = ('undefined'!=typeof(bReverse)) ? bReverse: (!this.bReverse);
  this.TitleTable.cells(0).style.backgroundColor = this.bReverse ? NV_ENV.CR.ReverseBackground : '';
  //this.TitleTable.cells(0).style.color = this.bReverse ? NV_ENV.CR.ReverseText : '';
  this.TitleTable.cells(0).style.color = this.bReverse ? NV_ENV.CR.ReverseText : NV_ENV.CR.NormalText;
}
function NV_toggleOptions (bExpanded, bStrict)
{
  if (!bStrict && !this.bFocused) {
    NV_blurExcept(this.nvID);
  }
  this.bExpanded = ('undefined'!=typeof(bExpanded)) ? bExpanded: (!this.bExpanded);
  if (this.bExpanded) {
    this.adjustOptionsDiv();
    this.OptionsDiv.style.display = 'block';
    if (!bStrict) {
      this.toggleTitle(false);
      this.handleOverOption(this.selectedIndex);
    }
    this.handleOutTitle();
  }
  else {
    this.OptionsDiv.style.display = 'none';
    if (!bStrict) {
      this.toggleTitle(true);
    }
  }
  if (!bStrict) {
    this.bFocused = true;

    if (!NV_VAR.bEventAttached) {
      document.attachEvent('onmousedown', NV_blurExcept);
      document.attachEvent('ondblclick', NV_blurExcept);
      NV_VAR.bEventAttached = true;
    }
  }
}
function NV_handlePropertychange ()
{
  if ('propertychange'==window.event.type && 'selectedIndex'==window.event.propertyName) {
    var oNVS = window.event.srcElement.NV;
    oNVS.syncSelectedIndex();

    if (null != oNVS.select.onchange)
      oNVS.select.onchange();
  }
}
function NV_handleMousewheel (event)
{
  var idx = this.selectedIndex;
  if ('mousewheel'==event.type && this.bFocused && this.bReverse) {
    for (var i=0; i < event.wheelDelta; i += 120)
      idx--;
    for (var i=0; i > event.wheelDelta; i -= 120)
      idx++;
  }
  idx = Math.max(idx, 0);
  idx = Math.min(idx, this.options.length - 1);
  this.select.selectedIndex = idx;
}
function NV_handleOverTitle ()
{
  if (this.bExpanded)
    return;

  this.TitleTable.style.borderColor = NV_ENV.CR.BorderActive;
  this.TitleTable.cells(1).style.display = 'none';
  this.TitleTable.cells(2).style.display = 'block';
}
function NV_handleOutTitle ()
{
  this.TitleTable.style.borderColor = NV_ENV.CR.Border;
  this.TitleTable.cells(2).style.display = 'none';
  this.TitleTable.cells(1).style.display = 'block';
}
function NV_handleOverOption (idx)
{
  for (var i=0; i < this.options.length; i++) {
    if (i==idx)
      this.turnOnOption(i);
    else
      this.turnOffOption(i);
  }
}
function NV_turnOnOption (idx)
{
  this.OptionsTable.cells(idx).style.color = NV_ENV.CR.ReverseText;
  this.OptionsTable.cells(idx).style.backgroundColor = NV_ENV.CR.ReverseBackground;
}
function NV_turnOffOption (idx)
{
  //this.OptionsTable.cells(idx).style.color = '';
  this.OptionsTable.cells(idx).style.color = NV_ENV.CR.NormalText;
  this.OptionsTable.cells(idx).style.backgroundColor = '';
}
function NV_adjustOptionsDiv ()
{
  if (this.bOriginalSelect) return;

  this.OptionsDiv.style.width = this.width;
  this.OptionsDiv.style.height = Math.min(this.options.length, this.ListMax) * this.OptionHeight + 2;
  this.OptionsWrapper.style.height = this.options.length * this.OptionHeight;
  this.OptionsDiv.style.overflowY = (this.options.length > this.ListMax) ? 'scroll' : '';

  var top = this.Table.offsetTop;
  var left = this.Table.offsetLeft;
  for (var El = this.Table.offsetParent; 'BODY'!=El.tagName && 'absolute'!=El.style.position && 'relative'!=El.style.position; El = El.offsetParent) {
    if ('TABLE' != El.tagName) {
      top += El.clientTop;
      left += El.clientLeft;
    }
    top += El.offsetTop;
    left += El.offsetLeft;
  }
  this.OptionsDiv.style.top = (this.bListDown) ? (top + this.height) : (top - parseInt(this.OptionsDiv.style.height));
  this.OptionsDiv.style.left = left;

  this.TitleWrapper.style.top = 0;
  this.TitleWrapper.style.left = 0;
}
function NV_syncOptions ()
{
  if (this.bOriginalSelect) return;

  for (var i=0; i < this.options.length; i++) {
    this.OptionsTable.cells(i).setAttribute('index', i);
    if (this.OptionsTable.cells(i).childNodes(0).innerText != this.options[i].innerText)
      this.OptionsTable.cells(i).childNodes(0).innerText = this.options[i].innerText;
  }
}
function NV_pressTitle (event)
{
  NV_cancelEvent(event);

  this.srcElementOfLastMousedown = event.srcElement;

  this.toggleOptions();
}
function NV_releaseTitle (event)
{
  NV_cancelEvent(event);

  if (this.isThisEventToBeCanceled(event)) return;

  this.srcElementOfLastMousedown = null;
}
function NV_pressOption (event)
{
  NV_cancelEvent(event);

  this.srcElementOfLastMousedown = event.srcElement;
}
function NV_moveOption (event)
{
  NV_cancelEvent(event);

  if (this.isThisEventToBeCanceled(event)) return;
  if (!(event.offsetX >= 0 && event.offsetX <= this.OptionsTable.offsetWidth)) return;

  this.handleOverOption(Math.floor(event.offsetY / this.OptionHeight));
}
function NV_releaseOption (event)
{
  NV_cancelEvent(event);

  if (this.isThisEventToBeCanceled(event)) return;

  this.srcElementOfLastMousedown = null;

  if (event.offsetX >= 0 && event.offsetX <= this.OptionsTable.offsetWidth) {
    this.toggleOptions(false);
    this.select.selectedIndex = Math.floor(event.offsetY / this.OptionHeight);
  }
}
function NV_createTable ()
{
  this.Table = NV_createElement(""
    + "<table border=0 cellpadding=0 cellspacing=0 style='table-layout:fixed; cursor:default'>"
    + "<tr><td></td></tr>"
    + "</table>"
  );
  if (!isNaN(this.width))
    this.Table.style.width = this.width;
  this.Table.style.height = this.height;
	
  if (!this.bOriginalSelect) {
    this.createTitleDiv();
    this.createOptionsDiv();
    this.Table.cells(0).appendChild(this.TitleDiv);
    this.Table.cells(0).appendChild(this.OptionsDiv);
  }
  else {
    this.Table.cells(0).appendChild(this.select);
  }
}
function NV_createTitleDiv ()
{
  this.TitleDiv = NV_createElement(""
    + "<div style='position:relative; top:0; left:0;'>"
    + "  <table border=0 cellpadding=0 cellspacing=1"
    + "    height="+this.height
    + "    bgcolor=white"
    + "    style='table-layout:fixed; border:1 solid "+NV_ENV.CR.Border+";'"
    + "    onmouseover='NV_VAR.SelectList["+this.nvID+"].adjustOptionsDiv()'"
    + "  >"
    + "  <tr>"
    + "    <td style='line-height:15px'><nobr style='text-oveflow:hidden;"+NV_ENV.OptionNobrStyle+"'></nobr></td>"
    + "    <td width="+NV_ENV.ButtonWidth+" align=center style='word-wrap:normal'></td>"
    + "    <td style='display:none' width="+NV_ENV.ButtonWidth+" align=center style='word-wrap:normal'></td>"
    + "    <td style='display:none'></td>"
    + "  </tr>"
    + "  </table>"
    + "</div>"
  );
  this.TitleTable = this.TitleDiv.childNodes(0);
  this.TitleTable.cells(0).childNodes(0).innerText = this.options[this.selectedIndex].innerText;
  this.TitleTable.cells(0).style.color = NV_ENV.CR.NormalText;
  this.TitleTable.cells(1).innerHTML = "<img src='"+NV_ENV.ImgPrefix+"/btn_down.gif' border=0 align=absmiddle>";
  this.TitleTable.cells(2).innerHTML = "<img src='"+NV_ENV.ImgPrefix+"/btn_down_s.gif' border=0 align=absmiddle>";
  this.TitleTable.cells(3).appendChild(this.select);
  this.TitleWrapper = document.createElement(""
    + "<img src='"+NV_ENV.ImgPrefix+"/img_blank.gif'"
    + "  style='position:absolute; top:0; left:0; z-index:2; width:100%; height:"+this.height+";'"
    + "  onmouseover='NV_VAR.SelectList["+this.nvID+"].handleOverTitle()'"
    + "  onmouseout='NV_VAR.SelectList["+this.nvID+"].handleOutTitle(); NV_VAR.SelectList["+this.nvID+"].releaseTitle(window.event);'"
    + "  onmousedown='NV_VAR.SelectList["+this.nvID+"].pressTitle(window.event)'"
    + "  ondblclick='NV_VAR.SelectList["+this.nvID+"].pressTitle(window.event); NV_VAR.SelectList["+this.nvID+"].releaseTitle(window.event);'"
    + "  onmouseup='NV_VAR.SelectList["+this.nvID+"].releaseTitle(window.event)'"
    + "  onmousewheel='NV_VAR.SelectList["+this.nvID+"].handleMousewheel(window.event)'"
    + "  ondragstart='NV_cancelEvent(window.event)'"
    + ">"
  );
  NV_CreatedElements[NV_CreatedElements.length] = this.TitleWrapper;
  this.TitleDiv.appendChild(this.TitleWrapper);
}
function NV_createOptionsDiv ()
{
  this.OptionsDiv = NV_createElement(""
    + "<div style='"+NV_ENV.OptionsDivStyle+"'"
    + "  onscroll='NV_VAR.SelectList["+this.nvID+"].moveOption(window.event)'"
    + "  onmousedown='NV_cancelEvent(window.event)'"
    + ">"
    + "  <table border=0 cellpadding=0 cellspacing=0 width=100% style='table-layout:fixed'>"
    + "  </table>"
    + "</div>"
  );
  this.OptionsTable = this.OptionsDiv.childNodes(0);
  for (var i=0; i < this.options.length; i++) {
    this.createOptionTr(i);
  }
  this.syncOptions();
  this.OptionsWrapper = document.createElement(""
    + "<img src='"+NV_ENV.ImgPrefix+"/img_blank.gif'"
    + "  style='position:absolute; top:0; left:0; width:100%;'"
    + "  onmousedown='NV_VAR.SelectList["+this.nvID+"].pressOption(window.event)'"
    + "  onmousemove='NV_VAR.SelectList["+this.nvID+"].moveOption(window.event)'"
    + "  onmouseup='NV_VAR.SelectList["+this.nvID+"].releaseOption(window.event)'"
    + "  onmouseout='NV_VAR.SelectList["+this.nvID+"].releaseOption(window.event)'"
    + "  ondragstart='NV_cancelEvent(window.event)'"
    + ">"
  );
  NV_CreatedElements[NV_CreatedElements.length] = this.OptionsWrapper;
  this.OptionsDiv.appendChild(this.OptionsWrapper);
}
function NV_createOptionTr (idx)
{
  idx = ('undefined'!=typeof(idx)) ? idx : this.options.length - 1;
  var OptionTr = this.OptionsTable.insertRow(-1);
  var OptionTd = document.createElement("<td style='line-height:15px' height="+this.OptionHeight+"></td>");
  NV_CreatedElements[NV_CreatedElements.length] = this.OptionsTd;
  OptionTd.appendChild(document.createElement("<nobr style='"+NV_ENV.OptionNobrStyle+"'></nobr>"));
  OptionTr.appendChild(OptionTd);
}