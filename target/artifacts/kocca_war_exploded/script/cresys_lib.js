
// �޷� ��ũ��Ʈ ����
var target;

function MiniCal(jucke) {
  target = jucke
  var minical = document.getElementById("minical");
//  x = (document.layers) ? loc.pageX : event.clientX;
//  y = event.y*1 + document.body.scrollTop*1;//(document.layers) ? loc.pageY : event.clientY;
//minical.style.pixelTop  = y-0;
//minical.style.pixelLeft  = x-0;
  var p = GetAbsPosition(jucke);
  minical.style.pixelTop  = p.y;
  minical.style.pixelLeft  = p.x;

  minical.style.display = (minical.style.display == "block") ? "none" : "block";
  Show_cal(0,0,0)
}

function MiniCalById(targetId) {
	  var jucke = document.getElementById(targetId);
	  var minical = document.getElementById("minical");
	  target = jucke
	//  x = (document.layers) ? loc.pageX : event.clientX;
	//  y = event.y*1 + document.body.scrollTop*1;//(document.layers) ? loc.pageY : event.clientY;
	//minical.style.pixelTop  = y-0;
	//minical.style.pixelLeft  = x-0;
	  var p = GetAbsPosition(jucke);
	  minical.style.pixelTop  = p.y;
	  minical.style.pixelLeft  = p.x;

	  minical.style.display = (minical.style.display == "block") ? "none" : "block";
	  Show_cal(0,0,0);
	}

function GetAbsPosition(object) {
	var position = new Object;
	position.x = 0;
	position.y = 0;

	if( object ) {
		position.x = object.offsetLeft;
		position.y = object.offsetTop;
	
		if( object.offsetParent ) {
			var parentpos = GetAbsPosition(object.offsetParent);
			position.x += parentpos.x;
			position.y += parentpos.y;
		}
	}

	position.cx = object.offsetWidth;
	position.cy = object.offsetHeight;

	return position;
}
var stime
function doOver() {
  var el = window.event.srcElement;
  cal_Day = el.title;

  if (cal_Day.length > 7) {
    el.style.borderTopColor = el.style.borderLeftColor = "buttonhighlight";
    el.style.borderRightColor = el.style.borderBottomColor = "buttonshadow";
  }
  window.clearTimeout(stime);
}

function doClick() {
  cal_Day = window.event.srcElement.title;
  window.event.srcElement.style.borderColor = "red";
  if (cal_Day.length > 7) {
    target.value=cal_Day
  }
}

function doOut() {
  var el = window.event.fromElement;
  cal_Day = el.title;

  if (cal_Day.length > 7) {
    el.style.borderColor = "white";
  }
  stime=window.setTimeout("minical.style.display='none';", 10);
}

// �޷� ��ũ��Ʈ ��

function SendMail(urlstr) {
  var popWnd = urlstr ;
  window.open(popWnd, "sendmail", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=auto,resizable=no,copyhistory=yes,width=900,height=600");
}

function userinfo(url){
  window.open(url, "userinfo", "toolbar=no,status=no,menubar=no,scrollbars=no,resizable=yes,width=562,height=285,top=0,left=0");
}

function imageOn(i)
{
  eval('document.img'+i+'.src=images['+i+'][1].src');
}

function imageOff(i)
{
  eval('document.img'+i+'.src=images['+i+'][0].src');
}
/*
function logout()
{
  if (confirm("������ �����Ͻðڽ��ϱ�?"))
  {
    top.location="logout.jsp";
  }
}*/

function num_max_chk(data, data1)
{
  for (var i = 0 ;i < data.value.length ;i++ )
  {
    if ((data.value.substring(i,i+1) < "0" || data.value.substring(i,i+1) > "9" ))
    {
      alert("���ڸ� �Է°����մϴ�.");
      data.focus();
      return;
    }
  }

  if (parseInt(data.value,10) > parseInt(data1,10))
  {
    alert(data1+" ���� �������� �Է��Ͻʽÿ�.");
    data.focus();
    return;
  }
}

function quotation_chk()
{
  var data;
  var sum_str = "";

  for ( var k = 0 ; k < document.forms.length ; k++ )
  {
    for ( var j = 0 ; j < document.forms[k].elements.length ;j++)
    {
      if ( document.forms[k].elements[j].type == "text" || document.forms[k].elements[j].type == "textarea" )
      {
        data = document.forms[k].elements[j].value;
        sum_str = "";
      
        for ( var i = 0 ; i < data.length ;i++)
        {
          if ( data.substring(i,i+1) == "'" )
          {
            sum_str = sum_str + "��";
          }
          else if ( data.substring(i,i+1) == "\"" )
          {
            sum_str = sum_str + "��";
          }
          else
          {
            sum_str = sum_str + data.substring(i,i+1);
          }
        }  
        document.forms[k].elements[j].value = sum_str;
      }
    }
  }
}


function numeric_chk(data)
{
  for (var i = 0 ;i < data.value.length ;i++ )
  {
    if ((data.value.substring(i,i+1) < "0" || data.value.substring(i,i+1) > "9" ))
    {
      alert("���ڸ� �Է°����մϴ�.");
      data.value = "";
      data.focus();
      return false;
    }
  }
  return true;
}

function numeric_chk_noalert(value)
{
  for (var i = 0 ;i < value.length ;i++ )
  {
    if ((value.substring(i,i+1) < "0" || value.substring(i,i+1) > "9" )) {
      return false;
    }
  }
  return true;
}

function number_chk(data)
{
  if (isNaN(data.value))
  {
    alert("���ڸ� �Է°����մϴ�.");
    data.value = "0.0";
    data.focus();
    return false;
  }
  return true;
}

function number_chk_noalert(value)
{
  if (isNaN(value)) {
    return false;
  }
  return true;
}


/**
 * �Է°��� ����ڰ� ������ ���� �������� üũ
 * �ڼ��� format ������ �ڹٽ�ũ��Ʈ�� 'regular expression'�� ����
 */
function isValidFormat(input,format) {
    if (input.value.search(format) != -1) {
        return true; //�ùٸ� ���� ����
    }
    return false;
}

/**
 * �Է°��� �̸��� �������� üũ
 * ex) if (!isValidEmail(form.email)) {
 *         alert("�ùٸ� �̸��� �ּҰ� �ƴմϴ�.");
 *     }
 */
function isValidEmail(input) {
    var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    if (blankCheck(input.value)) return true;
    return isValidFormat(input,format);
}

/**
 * �Է°��� ��ȭ��ȣ ����(����-����-����)���� üũ
 */
function isValidPhone(input) {
    var format = /^(\d+)-(\d+)-(\d+)$/;
    if (blankCheck(input.value)) return true;
    return isValidFormat(input,format);
}

/**
 * ���õ� ������ư�� �ִ��� üũ
 */
function hasCheckedRadio(input) {
    if (input.length > 1) {
        for (var inx = 0; inx < input.length; inx++) {
            if (input[inx].checked) return true;
        }
    } 
    else {
        if (input.checked) return true;
    }
    return false;
}

/**
 * ���õ� üũ�ڽ��� �ִ��� üũ
 */
function hasCheckedBox(input) {
    return hasCheckedRadio(input);
}

function Insa_OnClick(urlstr)
{
  var popWnd = urlstr ;
  var popmnu = window.open(popWnd, "popmnu", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=yes,width=500,height=350");
}

function Excel(urlstr)
{
   excel_popup = window.open("/excel/" + urlstr + ".csv", "popup1","toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,copyhistory=yes, width=800, height=530");
}

function PullWin(urlstr)
{
  var popWnd = urlstr ;
  var popup = window.open(popWnd, "popup", "toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,copyhistory=yes");
}

function select_YYYYMMDD_LeapYear(year)
{
  var flag = new Boolean(false);
  
  if (((year % 4 == 0) && !(year % 100 == 0))||(year % 400 ==0)) return (true);
  /*
  if ((parseInt(year,10) % 4) == 0)      // 4�⸶�� �����̰�
  {
    flag = true;
    if ((parseInt(year,10) % 100) == 0)    // ���� 100�⸶�� ������ �ƴϰ�,
    {
      flag = false;
      if ((parseInt(year,10) % 400) == 0)  // ���� 400�⸶�� �����̴�
      {
        flag = true;
      }
    }
  }
  */
  return (false);
}

function select_YYYYMMDD_Change(syear,smon,sday)
{
  myform = document.form1;    // FORM �̸�����(script�̵���)
  myform_s = "document.form1.";
  var end_day = new Array();
  end_day[0] = 31;
  end_day[1] = 28;
  end_day[2] = 31;
  end_day[3] = 30;
  end_day[4] = 31;
  end_day[5] = 30;
  end_day[6] = 31;
  end_day[7] = 31;
  end_day[8] = 30;
  end_day[9] = 31;
  end_day[10] = 30;
  end_day[11] = 31;
  var year = parseInt(this.eval(myform_s + syear + ".value"),10);
  var mon = parseInt(this.eval(myform_s + smon + ".value"),10) - 1;

  if (select_YYYYMMDD_LeapYear(year))  // true�̸� �����̹Ƿ� 2������ 28���̵ȴ�
  {
    end_day[1] = 29;
  }
  else
  {
    end_day[1] = 28;
  }

  var s_sday = myform_s + sday + ".options.length = end_day[mon]";
  this.eval(s_sday);

  for (var i=0; i<end_day[mon]; i++)
  {
    this.eval(myform_s + sday + ".options[i].value = i + 1");
    this.eval(myform_s + sday + ".options[i].text = i + 1");
  }
  if (this.eval(myform_s + sday + ".options.selectedIndex") == -1)
  {
    this.eval(myform_s + sday + ".options.selectedIndex = end_day[mon] - 1");
  }
}

function select_YYYYMMDD(syear,year,smon,mon,sday,day)
{  // s�� ���� ���� html input name
  var select_check;
  var today = new Date();
  var now_year = today.getYear();
  
  if (now_year < 100)      // 2000�� �������� ���ڸ� 2000�����Ĵ� 4�ڸ��� ���´�..document����
  {
    now_year = 1900 + now_year;
  }
  
  document.write("<select name=" + syear + " onChange=select_YYYYMMDD_Change('" + syear + "','" + smon + "','" + sday + "')>");
  for (var loop_year=now_year-1; loop_year<=now_year+10; loop_year++)
  {
    if (loop_year == year)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_year + select_check + ">" + loop_year + "</option>");
  }
  document.write("</select>/ ");
  
  document.write("<select name=" + smon + " onChange=select_YYYYMMDD_Change('" + syear + "','" + smon + "','" + sday + "')>");
  
  for (var loop_month=1; loop_month<=12; loop_month++)
  {
    if (loop_month == mon)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_month + select_check + ">" + loop_month + "</option>");
  }
  document.write("</select>/ ");
  
  document.write("<select name=" + sday + " onChange=select_YYYYMMDD_Change('" + syear + "','" + smon + "','" + sday + "')>");
  for (var loop_day=1; loop_day<=31; loop_day++)
  {
    if (loop_day == day)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_day + select_check + ">" + loop_day + "</option>");
  }
  document.write("</select>");
}

function select_YYYYMMDD2(syear,year,smon,mon,sday,day,shh,hh,smm,mm)
{  // s�� ���� ���� html input name �ð�,�б���������
  var select_check;
  var today = new Date();
  var now_year = today.getYear();
  
  if (now_year < 100)                // 2000�� �������� ���ڸ� 2000�����Ĵ� 4�ڸ��� ���´�..document����
  {
    now_year = 1900 + now_year;
  }
  
  document.write("<select name=" + syear + ">");
  for (var loop_year=now_year-1; loop_year<=now_year+10; loop_year++)
  {
    if (loop_year == year)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_year + select_check + ">" + loop_year + "</option>");
  }
  document.write("</select>/ ");
  
  document.write("<select name=" + smon + " onChange=select_YYYYMMDD_Change('" + syear + "','" + smon + "','" + sday + "')>");
  
  for (var loop_month=1; loop_month<=12; loop_month++)
  {
    if (loop_month == mon)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_month + select_check + ">" + loop_month + "</option>");
  }
  document.write("</select>/ ");
  
  document.write("<select name=" + sday + ">");
  for (var loop_day=1; loop_day<=31; loop_day++)
  {
    if (loop_day == day)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_day + select_check + ">" + loop_day + "</option>");
  }
  document.write("</select>&nbsp;&nbsp;");
  
  //�ð�
  document.write("<select name=" + shh + ">");
  for (var loop_hh=0; loop_hh<=23; loop_hh++)
  {
    if (loop_hh == hh)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_hh + select_check + ">" + loop_hh + "</option>");
  }
  document.write("</select>:");
  //��
  document.write("<select name=" + smm + ">");
  for (var loop_mm=0; loop_mm<=59; loop_mm++)
  {
    if (loop_mm == mm)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_mm + select_check + ">" + loop_mm + "</option>");
  }
  document.write("</select>");

}


function select_YYYYMMDD3(syear,year,smon,mon,sday,day)
{  // s�� ���� ���� html input name
  var select_check;
  var today = new Date();
  var now_year = today.getYear();
  
  if (now_year < 100)                // 2000�� �������� ���ڸ� 2000�����Ĵ� 4�ڸ��� ���´�..document����
  {
    now_year = 1900 + now_year;
  }
  
  document.write("<select name=" + syear + ">");
  for (var loop_year=1950; loop_year<=now_year+10; loop_year++)
  {
    if (loop_year == year)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_year + select_check + ">" + loop_year + "</option>");
  }
  document.write("</select>/ ");
  
  document.write("<select name=" + smon + " onChange=select_YYYYMMDD_Change('" + syear + "','" + smon + "','" + sday + "')>");
  
  for (var loop_month=1; loop_month<=12; loop_month++)
  {
    if (loop_month == mon)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_month + select_check + ">" + loop_month + "</option>");
  }
  document.write("</select>/ ");
  
  document.write("<select name=" + sday + ">");
  for (var loop_day=1; loop_day<=31; loop_day++)
  {
    if (loop_day == day)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    document.write("<option value=" + loop_day + select_check + ">" + loop_day + "</option>");
  }
  document.write("</select>");
}


function select_hhmm(shh,hh,smm,mm){
    var select_check;
    //�ð�
  document.write("<select name=" + shh + ">");
  for (var loop_hh=0; loop_hh<=23; loop_hh++)
  {
    if (loop_hh == hh)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    
    if ( loop_hh < 10 )
    {
      loop_hh = "0" + loop_hh;
    }
    document.write("<option value=" + loop_hh + select_check + ">" + loop_hh + "</option>");
  }
  document.write("</select>:");
  //��
  document.write("<select name=" + smm + ">");
  for (var loop_mm=0; loop_mm<=59; loop_mm++)
  {
    if (loop_mm == mm)
    {
      select_check=" SELECTED ";
    }
    else
    {
      select_check=" ";
    }
    if ( loop_mm < 10 )
    {
      loop_mm = "0" + loop_mm;
    }    
    document.write("<option value=" + loop_mm + select_check + ">" + loop_mm + "</option>");
  }
  document.write("</select>");
}

// 2001-06-22���� ����(20010622)�������� �Լ�.
function make_date(str){
    var yyyy = str.substring(0,4);
    var mm   = str.substring(5,7);
    var dd   = str.substring(8,10);
    
    var date_val = yyyy+mm+dd;
    return date_val;
}

/*
function make_date2(data1, data2, data3){
	var zero_val = "00";
	var date_val = "";
	date_val = data1 + zero_val.substring(0,2-data2.length) + data2;
	date_val = date_val + zero_val.substring(0,2-data3.length) + data3;

	return date_val;
}
*/
function blankCheck( msg )
{
	var mleng = msg.length;
	chk=0;
	
	for (i=0; i<mleng; i++)
	{
		if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
	}
	if ( chk == 0 ) return (true);
	
	return (false);
}

function blankFind( msg )
{
	var mleng = msg.length;
	chk=0;
	
	for (i=0; i<mleng; i++)
	{
		if ( msg.substring(i,i+1)==' ' || msg.substring(i,i+1)=='\n' || msg.substring(i,i+1)=='\r') return (false);
	}
	
	return (true);
}

function realsize( value ) 
{
	var len = 0;
	if ( value == null ) return 0;
	for(var i=0;i<value.length;i++){
	   var c = escape(value.charAt(i));
	   if ( c.length == 1 ) len ++;
	   else if ( c.indexOf("%u") != -1 ) len += 2;
	   else if ( c.indexOf("%") != -1 ) len += c.length/3;
	}
	return len;
}

function compnumChk( code )
{
	var sum = 0;
	var getlist =new Array(10);
	var chkvalue =new Array("1","3","7","1","3","7","1","3","5");
	
	for (var i=0; i<10; i++) { 
		getlist[i] = code.substring(i,i+1);
	}
	
	for (var i=0; i<9; i++) { 
		sum += getlist[i]*chkvalue[i];
	}
	sum = sum +parseInt((getlist[8]*5)/10) ;
	sidliy = sum%10;
	sidchk = 0;
	
	if ( sidliy != 0 ) { 
		sidchk = 10 - sidliy; 
	} 
	else { 
		sidchk = 0; 
	}
	
	if ( sidchk != getlist[9] ) {
		return (false);
	}
	
	return (true);
}

function useridCheck( userid )
{
  //id ���� check
	var check = "y";
	var newid = userid;

	for(i=0; i<newid.length; i++){
		if (newid.charAt(i) == " "){
			check = "n";
		}
		else if (((newid.charAt(i) < "A") || (newid.charAt(i) > "Z"))
		 		 && ((newid.charAt(i) < "a") || (newid.charAt(i) > "z"))
		     && ((newid.charAt(i) < "0") || (newid.charAt(i) > "9"))){  

			check = "n";
		}
	}
	
	if (check =="n") {
		return (false);
	}
	
	return (true);
}

function passwordCheck( passwd )
{
  //��й�ȣ ����,���� ȥ�� check
	var cpasschk=0;
	var npasschk=0;
	var check = "y";
	var newpasswd = passwd;

	for(i=0; i<newpasswd.length; i++) 
	{
		if (newpasswd.charAt(i) == " ") {
			check = "n";
		}
		else if (((newpasswd.charAt(i) < "A") || (newpasswd.charAt(i) > "Z"))
				 && ((newpasswd.charAt(i) < "a") || (newpasswd.charAt(i) > "z"))
		     && ((newpasswd.charAt(i) < "0") || (newpasswd.charAt(i) > "9"))){  

			check = "n";
		}
		if ( "A" <= newpasswd.charAt(i) && newpasswd.charAt(i) <= "Z" ) cpasschk++;
		if ( "a" <= newpasswd.charAt(i) && newpasswd.charAt(i) <= "z" ) cpasschk++;
		if ( "0" <= newpasswd.charAt(i) && newpasswd.charAt(i) <= "9" ) npasschk++;
	}
	
	if (check == "n" || cpasschk == 0 || npasschk == 0) {
		return (false);
	}
	
	return (true);
  //check end	  	
}

//�Է������� ���ڸ� �Է�
function currency(obj) {

    if ( !(event.keyCode >= 48 && event.keyCode <= 57) && !(event.keyCode >= 96 && event.keyCode <= 105) && event.keyCode != 8 && event.keyCode != 9) {
  	    event.returnValue = false
    }
}


// ��ü ����
function allcheck(theform)
{
    for( i=0; i<theform.elements.length; i++) {
        ele = theform.elements[i];
            ele.checked = true;
    }
    return;
}

// ��ü����
function discheck(theform)
{
    for( i=0; i<theform.elements.length; i++) {
        ele = theform.elements[i];
            ele.checked = false;
    }
    return;
}

// ������ �˾�
function open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable) {
    toolbar_str   = ((true2yes(toolbar)   == 'yes') ? 'yes' : 'no') ;
    menubar_str   = ((true2yes(menubar)   == 'yes') ? 'yes' : 'no') ;
    statusbar_str = ((true2yes(statusbar) == 'yes') ? 'yes' : 'no') ;
    scrollbar_str = ((true2yes(scrollbar) == 'yes') ? 'yes' : 'no') ;
    resizable_str = ((true2yes(resizable) == 'yes') ? 'yes' : 'no') ;

    //alert('left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str);

    window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str).focus();
}
function true2yes(param) {
	if(param == "true" || param == "Y" || param == "y" || param == "YES" || param == "TRUE") return "yes";
	else return param;
}

// null,�ڸ��� üũ ( �ʵ��,�޼���,���� ) /*�Ϸ�
function checkLength ( theField, s, Length)
{
    if (theField.value == "" || theField.value == null )
    {
        theField.value="";  //��â�� NULL�� ����
        alert( s + "�� �Է��Ͻʽÿ�.");
        return(false);
    }

    if (theField.value.length < Length)
    {
        theField.value="";  //��â�� NULL�� ����
        alert( Length+"���� �̻� �̾�� �մϴ�.");
        return(false);
    }

    return(true);
}

// null �� üũ /*�Ϸ�
function isNull ( theField, s )
{
    if (theField.value == "" || theField.value == null )
    {
        theField.value="";  //��â�� NULL�� ����
        //theField.focus();
        //theField.select();
        alert( s + "��(��) �Է��Ͻʽÿ�.");
        return false;
    }

    return true;
}
function checkNotNull ( value, s ) {
    if (value == "" || value == null ) {
        alert( s + "��(��) �Է��Ͻʽÿ�.");
        return true;
    }
    return false;
}

// ����� ��� ��ȣ üũ
function rnocheck(input) 
{
    var inputStr;
    var i = 0;
    var j = 0;
    var sum =0;
    var weight = new Array(1,3,7,1,3,7,1,3);
    inputStr= input.toString();

    for (i=0;i<inputStr.length-2;i++) {
        sum = sum + parseInt(inputStr.charAt(i)) * weight[i];
    }

    j = parseInt(inputStr.charAt(8)) * 5;

    sum = sum + ((j - (j % 10)) / 10) + ( j % 10 );
    sum = sum % 10;
    if (sum!=0) 
        sum = 10 - sum;
    if (sum != inputStr.charAt(9) )
        return false;
     else
        return true;
}

function enterKey_Event(func_name, e){
	  if(e.keyCode == 13){
	    eval(func_name);
	  }
}

//���Ϲ��� ��ü (�������ڿ�, ��ü��� ����, ��ü�� ����)
function ReplaceChar(str, tarCh, repCh) {
   var nowCh  = "";
   var sumStr = "";
   var len    = str.length;

   for (i=0; i<len; i++) {
      if (str.charAt(i) == tarCh) {
         nowCh = repCh;
      }
      else {
         nowCh = str.charAt(i);
      }
      sumStr = sumStr + nowCh;
   }
   return sumStr;
}

function getDate(str) {
	$("#"+str).val(make_date($("#"+str+"1").val())+''+make_date($("#"+str+"2").val()));
}
function setDate(tagid, value) {
	$("#"+tagid).val(value);
	$("#"+tagid+"1").val(value.substr(0, 4)+"-"+value.substr(4, 2)+"-"+value.substr(6, 2))
	$("#"+tagid+"2").val(value.substr(8,2));
}


function numberFormatComma(number) {
    tmp = number.split('.');
    var str = new Array();
    var v = tmp[0].replace(/,/gi,'');
    for(var i=0; i<=v.length; i++) {
        str[str.length] = v.charAt(v.length-i);
        if(i%3==0 && i!=0 && i!=v.length) {
            str[str.length] = '.';
        }
    }
    str = str.reverse().join('').replace(/\./gi,',');
    return (tmp.length==2) ? str + '.' + tmp[1] : str;
}

/**
 * ���ڿ� ���� ��ȯ
 * @param obj
 * @return
 */
function getObjectLength(obj, maxLength) {
	var p, len=0, tempVal = $("#"+obj).val()+'';  // �ѱ۹��ڿ� üũ�� ����
	for(p=0; p< tempVal.length; p++)	{
		(tempVal.charCodeAt(p)  > 255) ? len+=2 : len++;  // �ѱ�üũ
	}
	if(maxLength) {
		$("#"+obj+"_length").html(len + "/" + maxLength+ " Bytes");
		if(len >maxLength) {
			alert(maxLength+" Bytes�� �ʰ��Ͽ����ϴ�.");
		}
	}
	else $("#"+obj+"_length").html(len + " Bytes");
	return len;
}


/*
* ���ڼ� ����
* inputObjId : input text or textarea ....  
* maxLen     : �ִ밪
* cntObjId   : ���� ����, byte ǥ�� obj( ex> div, span..._
*/
function fnTypingCheck(inputObjId, maxLen, cntObjId){
    var sContent       = document.getElementById(inputObjId);
    var txtCnt;
    //cntObjId �� �����Ǿ������� ���
    if(cntObjId !=null && cntObjId != "") txtCnt = document.getElementById(cntObjId);
    
    var tempStr = ""
    var str_cnt = 0;
    

    for(i=0; i < sContent.value.length ; i++)
      {
          tempStr = sContent.value.charAt(i);
          if(escape(tempStr).length > 4) str_cnt += 2;
          else str_cnt += 1 ;
      }

    if (str_cnt > maxLen){
          alert(maxLen+" Bytes�� �ʰ��Ͽ����ϴ�.");
          str_cnt = 0;        
          tempStr2 = "";
          for(i = 0; i < maxLen; i++) 
          {
              tempStr = sContent.value.charAt(i);  
              if(escape(tempStr).length > 4) str_cnt += 2;
              else str_cnt += 1 ;
              if (str_cnt > maxLen)
              {
                  if(escape(tempStr).length > 4) str_cnt -= 2;
                  else str_cnt -= 1 ; 
                  break;              
              }
              else tempStr2 += tempStr;
          }       
          sContent.value = tempStr2;
    }

    if(cntObjId !=null && cntObjId != "") txtCnt.innerHTML = maxLen - str_cnt + " Bytes";
}

// ���� �ڵ����� 2010-04-26 �߰�
function change_subjseq() {
	 var rowPT = document.form1.s_subjseq.length;
	 var valuePT = "0001";

	 if( document.form1.s_subjcode.options[0].selected == false ) {
		 for( var i = 0; i< rowPT; i++ ) {
			if( document.form1.s_subjseq.options[i].value == valuePT ) {
				document.form1.s_subjseq.options[i].selected = true;
				break;
			}
		 }
	 }
}


    /**
     * ���� ���������� ��ũ�ѵ� ���� ��ġ ��ǥ�� ���Ѵ�.
     * ������ var tempX = getNowScrool().X, tempY = getNowScrool().Y
     */
    var getNowScroll = function(){
        var position = document.documentElement;
        var body = document.body;
        var now = {};
        now.X = document.all ?(!position.scrollLeft ? body.scrollLeft : position.scrollLeft) : (window.pageXOffset ? window.pageXOffset:window.scrollX);
        now.Y = document.all ?(!position.scrollTop ? body.scrollTop : position.scrollTop) : (window.pageYOffset ? window.pageYOffset:window.scrollY);

        return now;
    }

    /**
     * 2�� �̻� ���ӵ� ������ �ϳ��� �������� ó���Ѵ�.
     */
    function replaceBlank(str) {
        if( str.indexOf("  ") > -1) {
            return replaceBlank( str.replace(/  /gi, " ") );
        } else {
            return str;
        }
    }

    /**
     * ���ڿ��� �յ� ������ �����Ѵ�.
     */
    String.prototype.trim = function() {
        return this.replace(/(^\s*)|(\s*$)/gi, "");
    }