
	//���� ������ ���ش�.
	function f_is_trim(str) 
	{
		var strValue = new String(str)
		return strValue.replace(/(^ +)|( +$)/g,'')
	}


	//�ΰ��� üũ�� �Ѵ�.
	function f_nul_chk(obj,lbl)
	{
		if(f_is_trim(obj.value) == '' )
		{
			alert(lbl + ' �Է� �ϼ���.');
			obj.focus(); 
			return true;   
		}
		return false; 
	}


	//hidden�� �ΰ�üũ�� �Ѵ�.
	function f_nul_hidchk(obj,lbl)
	{
		if(f_is_trim(obj.value) == '' )
		{
			alert(lbl + ' �Է� �ϼ���.');
			return true;   
		}
		return false; 
	}


	//�ߺ�Ȯ�� üũ�� �Ѵ�.
	function f_double_chk(obj,lbl)
	{
		if(f_is_trim(obj.value) == '' )
		{
			alert(lbl + ' �ߺ�Ȯ���� �ϼ���.');
			return true;   
		}
		return false; 
	}


	//select �ΰ�üũ�� �Ѵ�.
	function f_list_chk(obj,lbl)
	{
		if(f_is_trim(obj.value) == '' || f_is_trim(obj.value) == '----' || f_is_trim(obj.value) == 'ALL')
		{
			alert(lbl + ' ���� �ϼ���.');
			obj.focus(); 
			return true;   
		}
		return false; 
	}


	//select �ΰ�üũ�� �Ѵ�.
	function f_list_nochk(obj,lbl)
	{
		if(f_is_trim(obj.value) == '')
		{
			alert(lbl + ' ���� �ϼ���.');
			return true;   
		}
		return false; 
	}


	function f_len_chk(obj, lbl, num)
	{
		if(f_is_trim(obj.value).length < num)
		{
			alert(lbl + ' '  + num + '���� �̻� �Է��Ͻʽÿ�.');
			obj.focus(); 
			return true;   
		}
		return false; 
	}


	function f_limit_chk(obj, lbl, num)
	{
		if(f_is_trim(obj.value).length > num)
		{
			alert(lbl + ' '  + num + '�� ���� �Է��Ͻʽÿ�.');
			obj.focus(); 
			return true;   
		}
		return false; 
	}


	//������ �ѱ۹��� ����Ʈ ���� üũ
	function f_byte_chk(obj, nByte, lbl)
	{
		
		var objVal =  obj.value;

		with(Math) 
		{

			var nLength = objVal.length;

			var nCnt = 0;
			var nHan, nTemp;

			
			// �ѱ� ���ڼ� ���(����)
			nHan  = nByte / 3;
			nHan = Math.floor(nHan);
			nTemp = nHan;

			if((nByte % 3) > 0) nTemp = nTemp++;

			for (i = 0; i < nLength; i++)
			{
				sTemp = escape(objVal.substring(i, i+1));

				if(sTemp.substring(1,2) == "u" ) nCnt += 2;
				else nCnt += 1;
			}

			if  (nCnt > nByte) 
			{
				alert(lbl + ' �ѱ� ' + nHan + ' ��, ���� ' + nByte + ' �� �̳��� �Է��Ͻʽÿ�. ');
				obj.focus(); 
				return true;   
			} 
			return false;
		}
	}


	//���ڸ� üũ�� �Ѵ�.
	function f_is_int(obj, lbl)
	{
		var str1 = obj.value;
		var nLen = obj.value.length; 
		
		for(var i = 0; i <  nLen; i++)
		{
			if(str1.charAt(i) < '0' || str1.charAt(i) > '9')
			{
				alert( lbl + ' ���ڸ� �Է��� �� �ֽ��ϴ�.' );
				obj.focus();
				return true;
			}
		}
		return false;
	}


	//double ���ڸ� üũ�� �Ѵ�.
	function f_is_num(obj, lbl)
	{
		var str1 = obj.value;
		var nLen = obj.value.length; 
		var cLen = 0;

		for(var i = 0; i <  nLen; i++)
		{
			if((str1.charAt(i) < '0' || str1.charAt(i) > '9') && str1.charAt(i) != '.')
			{
				alert( lbl + ' ���ڿ� �Ҽ����� �Է��� �� �ֽ��ϴ�.' );
				obj.focus();
				return true;
			}
			else if(str1.charAt(i) == '.')
			{
				cLen ++;
				if(cLen > 1)
				{
					alert( lbl + ' ���� ������ �߸� �Ǿ����ϴ�. ' );
					obj.focus();
					return true;
				}
			}
		}
		return false;
	}


	//������ ����
	function f_is_engch(obj, lbl)
	{
		var str1 = obj.value;
		var nLen = obj.value.length; 
		
		for(var i = 0; i <  nLen; i++)
		{
			if (str1.charAt(i) <'a' || str1.charAt(i) > 'z')
			{
				alert( lbl + ' ���ҹ��ڸ� �Է� �����մϴ� ');
				obj.focus();
				return true;
			}
		}
		return false;
	}


	//������ ���ڸ� ����
	function f_is_hanch(obj, lbl)
	{
		var str1 = obj.value;
		var nLen = obj.value.length; 
		
		for(var i = 0; i <  nLen; i++)
		{
			if ((str1.charAt(i) < '0' || str1.charAt(i) > '9') && (str1.charAt(i) <'a' || str1.charAt(i) > 'z'))
			{
				alert( lbl + ' �����ڿ� ���ڸ� �Է� �����մϴ� ');
				obj.focus();
				return true;
			}
		}
		return false;
	}


	//������ ���ڸ� ����
	function f_is_hanch2(obj, lbl)
	{
		var str1 = obj.value;
		var nLen = obj.value.length; 
		
		for(var i = 0; i <  nLen; i++)
		{
			if ((str1.charAt(i) < '0' || str1.charAt(i) > '9') && (str1.charAt(i) <'a' || str1.charAt(i) > 'z')
			&& !(str1.charAt(i) =='!' || str1.charAt(i) =='@' || str1.charAt(i)=='$' || str1.charAt(i)=='%' || str1.charAt(i)=='^' || str1.charAt(i)=='&' || str1.charAt(i)=='*'))
			{
				alert( lbl + ' �����ڿ� ���ڸ� �Է� �����մϴ� \n��, Ư����ȣ�� !,@,$,%,^,&,*�� ����� �� �ֽ��ϴ�. ');
				obj.focus();
				return true;
			}
		}
		return false;
	}
	

	//������ ���� ȥ������ ��� ����
	function f_is_mixingch(obj, lbl)
	{
		var str1 = obj.value;
		var nLen = obj.value.length; 
		
		var varDigit = 0;
        var varAlpha = 0;

		for(var i = 0; i <  nLen; i++)
		{
			if (str1.charAt(i) >= '0' && str1.charAt(i) <= '9')
        		varDigit = 1;
			else if (str1.charAt(i) >= 'a' && str1.charAt(i) <= 'z')
       			varAlpha = 1;
			else if ((str1.charAt(i) < '0' || str1.charAt(i) > '9') && (str1.charAt(i) <'a' || str1.charAt(i) > 'z'))
			{
				alert( lbl + ' ���ҹ��ڿ� ���ڸ� �Է� �����մϴ�');
				obj.focus();
				return true;
			}
		}

		if((varDigit + varAlpha) < 2)
		{
			alert( lbl + ' ���ڿ� �����ҹ��� �������� ����ؾ� �մϴ�.');
			obj.focus();
			return true;
		}
		return false;
	}


	//��������, ����, Ư������ ȥ������ ��� ����
	function f_is_specialch(obj, lbl)
	{
		var str1 = obj.value;
		var nLen = obj.value.length; 
		
		var varDigit = 0;
        var varAlpha = 0;
		var varSpecial = 0;
		
		for(var i = 0; i <  nLen; i++)
		{
			if (str1.charAt(i) >= '0' && str1.charAt(i) <= '9')
        		varDigit = 1;
			else if (str1.charAt(i) >= 'a' && str1.charAt(i) <= 'z')
       			varAlpha = 1;
			else if (str1.charAt(i) =='!' || str1.charAt(i)=='@' || str1.charAt(i)=='$' || str1.charAt(i)=='%' || str1.charAt(i)=='^' || str1.charAt(i)=='&' || str1.charAt(i)=='*')
				varSpecial = 1;
			else if ((str1.charAt(i) < '0' || str1.charAt(i) > '9') && (str1.charAt(i) <'a' || str1.charAt(i) > 'z'))
			{
				alert( lbl + ' ���ҹ��ڿ� ���ڸ� �Է� �����մϴ�\n��, Ư����ȣ�� !,@,$,%,^,&,*�� ����� �� �ֽ��ϴ�.');
				obj.focus();
				return true;
			}
		}

		if((varDigit + varAlpha) < 2)
		{
			alert( lbl + ' ���ڿ� �����ҹ��� �������� ����ؾ� �մϴ�.\n��, Ư����ȣ�� !,@,$,%,^,&,*�� ����� �� �ֽ��ϴ�.');
			obj.focus();
			return true;
		}
		else if(varSpecial < 1)
		{
			alert(lbl + "�� Ư�����ڴ� !,@,$,%,^,&,* �� ��� �����մϴ�.");
			obj.focus();
			return true;
		}

		return false;
	}
	

	//��������, ����, Ư������ ȥ������ ��밡�� (����)
	function f_is_specialchSel(obj, lbl)
	{
		var str1 = obj.value;
		var nLen = obj.value.length; 
		
		var varDigit = 0;
        var varAlpha = 0;
		var varSpecial = 0;
		
		for(var i = 0; i <  nLen; i++)
		{
			if (str1.charAt(i) >= '0' && str1.charAt(i) <= '9')
        		varDigit = 1;
			else if (str1.charAt(i) >= 'a' && str1.charAt(i) <= 'z')
       			varAlpha = 1;
			else if (str1.charAt(i) =='!' || str1.charAt(i)=='@' || str1.charAt(i)=='$' || str1.charAt(i)=='%' || str1.charAt(i)=='^' || str1.charAt(i)=='&' || str1.charAt(i)=='*')
				varSpecial = 1;
			else if ((str1.charAt(i) < '0' || str1.charAt(i) > '9') && (str1.charAt(i) <'a' || str1.charAt(i) > 'z'))
			{
				alert( lbl + ' ���ҹ��ڿ� ���� �� \nƯ����ȣ�� !,@,$,%,^,&,*�� ����� �� �ֽ��ϴ�.');
				obj.focus();
				return true;
			}
		}

		return false;
	}
	

	//��������, ����, Ư������ ȥ������ ��밡�� (����)
	function f_is_specialchSel4google(obj, lbl)
	{
		var str1 = obj.value;
		var nLen = obj.value.length; 
		
		var varDigit = 0;
        var varAlpha = 0;
		var varSpecial = 0;
		
		for(var i = 0; i <  nLen; i++)
		{
			if (str1.charAt(i) >= '0' && str1.charAt(i) <= '9')
        		varDigit = 1;
			else if (str1.charAt(i) >= 'a' && str1.charAt(i) <= 'z')
       			varAlpha = 1;
			else if (str1.charAt(i) =='!' || str1.charAt(i)=='@' || str1.charAt(i)=='$' || str1.charAt(i)=='%' || str1.charAt(i)=='^' || str1.charAt(i)=='&' || str1.charAt(i)=='*')
				varSpecial = 1;
			else if ((str1.charAt(i) < '0' || str1.charAt(i) > '9') && (str1.charAt(i) <'a' || str1.charAt(i) > 'z'))
			{
				//alert( lbl + ' ���ҹ��ڿ� ���� �� \nƯ����ȣ�� !,@,$,%,^,&,*�� ����� �� �ֽ��ϴ�.');
				//obj.focus();
				//return true;
			}
		}
		
		return varDigit+varAlpha+varSpecial;
		/*
		
		if (varDigit+varAlpha+varSpecial>2){
			return 3;
		}
		else if (varDigit+varAlpha+varSpecial>1){
			return 2;
		}		

		return true;
		*/
	}	
	
	
    //��й�ȣ üũ
    function CreateRatePasswdReq()
    {
    	var frm00	=	document.frmJoin;
    	
    	var obj = document.frmJoin.p_pwd.value;
    	var nLen = obj.length; 

	    var min_passwd_len = 6;
	    var passwdKey = "Passwd";
	    var emailKey = "Email";
	    var nameKey = "Name";
	    var useridKey = "Userid";	    

	//alert("!");
	    
	    
    	if (obj.length < min_passwd_len) {
      		if (obj.length > 0) {
	    		document.getElementById("pwdReate").src = "/images/user/member/pwsafety01.gif";
	    		document.getElementById("pwdReate").alt = "�ʹ� ª��";
			} else {
		    	document.getElementById("pwdReate").src = "/images/user/member/pwsafety00.gif";
		    	document.getElementById("pwdReate").alt = "�з����� ����";
			}
		} else {
			passwd 	= frm00.p_pwd.value;
			passwd  = escape(passwd);

			name	= escape(frm00.p_name.value);
			email	= escape(frm00.p_email1.value);
			userid	= escape(frm00.p_userid.value);			
				
			var params = passwdKey + "=" + passwd + "&" +
			emailKey + "=" + email + "&" +
			nameKey + "=" + name + "&" +
			useridKey + "=" + userid + "&";
			
			//alert(params);
			var parts = params.split("&");
			var r_num	=	f_is_specialchSel4google(frm00.p_pwd," ");
			
			if (passwd==name || passwd==email || passwd==userid){
	    		document.getElementById("pwdReate").src = "/images/user/member/pwsafety02.gif";
	    		document.getElementById("pwdReate").alt = "�������� ����";
    		}else if (r_num>=3){
	    		document.getElementById("pwdReate").src = "/images/user/member/pwsafety05.gif";
	    		document.getElementById("pwdReate").alt = "������";
	    		//alert("������");    
    		}else if (r_num==2){
	    		document.getElementById("pwdReate").src = "/images/user/member/pwsafety04.gif";
	    		document.getElementById("pwdReate").alt = "������";
	    		//alert("������");    	    		
			}else{
	    		document.getElementById("pwdReate").src = "/images/user/member/pwsafety03.gif";
	    		document.getElementById("pwdReate").alt = "��ȿ��";			
			}
		}	    
    }		

	
	//���̵�� ��й�ȣ üũ
	function f_is_idcheck(id, pwd, nlen, lbl1, lbl2)
	{
		var p = id.value.length;
       	var j = pwd.value.length;	
    	if ( p > nlen && j > nlen)
		{
			for (var i1=0 ; i1 < (p-2) ; i1++) 
			{		
				for (var i=0 ; i < (j-2) ; i++)
				{
					if (id.value.substring(i1,i1+3) == pwd.value.substring(i,i+3)){
						alert(lbl1 + "�� " + nlen + "���̻� ������ " + lbl2 + "�� ����Ͻ� �� �����ϴ�.");
						pwd.focus();
						return true;				
					}			
				}
			}
		}
       	return false;
	}

	//���鹮�ڸ� üũ�� �Ѵ�.
	function f_is_inval(obj, lbl)
	{
		var invalid = " "; // ��ĭ�� �����ϱ� ���� " " �ȿ� ������ �־����ϴ�. 		
		if(obj.value.indexOf(invalid) > -1)
		{
			alert( lbl + '��ĭ�� �Է� �Ͻ� �� �����ϴ�.');
			obj.focus();
			return true;
		}
		return false;
	}


	//üũ�ڽ��� ��Ƽ ������ �� �ǵ���
	function f_no_multi(obj, ind)
	{
		if(typeof(obj.length) != "undefined")
		{
			for(i = 0, k = obj.length; i < k; i++)
			{
				if(ind != i)
				{
					eval("obj[" +  i + "].checked" +  " = 0");
				}
			}
		}
	}


	//�ش� select ��ü Clear
	function objClear(objcls)
	{
		if (objcls.type == "select-one")
		{
			var lens = objcls.length
			for(var k = 0; k< lens; k++) objcls.options[0] = null;
		}
		else objcls.value = "";
		return;
	}


	//�ش� select ��ü disabled = true
	function objDisabled(obj)
	{
		obj.disabled = true;
		return;
	}


	//�ش� select ��ü disabled = false
	function objEnabled(obj)
	{
		obj.disabled = false;
		return;
	}


	//���콺 Ŀ��
	function f_mouse_on(obj)
	{
		obj.style.cursor='hand'
	}


	//���콺 Ŀ���� out
	function f_mouse_out(obj)
	{
		obj.style.cursor='default'
	}


	// �ֹε�Ϲ�ȣ üũ
	function f_peop_no_chk(s) 
	{
		if( s.charAt(6) == 1 || s.charAt(6) == 2 )
		{
			if( s.charAt(12) == 
				(( 11 - ((s.charAt(0)*2+s.charAt(1)*3+s.charAt(2)*4
							+s.charAt(3)*5+s.charAt(4)*6+s.charAt(5)*7
							+s.charAt(6)*8+s.charAt(7)*9+s.charAt(8)*2
							+s.charAt(9)*3+s.charAt(10)*4+s.charAt(11)*5)
							% 11)))%10)
				return true; 
		} 
		return false; 
	}


	//����ڵ�� ��ȣ�� üũ�� �Ѵ�.
	function f_co_no_chk(obj1, obj2, obj3, lbl)
	{
		var strNumb = obj1.value + obj2. value + obj3.value;
		if(strNumb.length != 10)
		{
			alert(lbl + '�� �߸��Ǿ����ϴ�.');
			obj1.focus();
			return true;
		}

		sumMod        =        0;
		sumMod        +=        parseInt(strNumb.substring(0,1));
		sumMod        +=        parseInt(strNumb.substring(1,2)) * 3 % 10;
		sumMod        +=        parseInt(strNumb.substring(2,3)) * 7 % 10;

		sumMod        +=        parseInt(strNumb.substring(3,4)) * 1 % 10;
		sumMod        +=        parseInt(strNumb.substring(4,5)) * 3 % 10;

		sumMod        +=        parseInt(strNumb.substring(5,6)) * 7 % 10;
		sumMod        +=        parseInt(strNumb.substring(6,7)) * 1 % 10;
		sumMod        +=        parseInt(strNumb.substring(7,8)) * 3 % 10;
		sumMod        +=        Math.floor(parseInt(strNumb.substring(8,9)) * 5 / 10);
		sumMod        +=        parseInt(strNumb.substring(8,9)) * 5 % 10;
		sumMod        +=        parseInt(strNumb.substring(9,10));

		if (sumMod % 10  !=  0)
		{
			alert(lbl + '�� �߸��Ǿ����ϴ�.');
			obj1.focus();
			return true;
		}
		return false;
	}


	//�̸����� üũ�� �Ѵ�.
	function f_is_email(obj,lbl) 
	{
		var str = obj.value;
		if(!str.match(/^(\S+)@(\S+)\.(\S+)/g))
		{
			alert( lbl + ' ������ �߸��Ǿ����ϴ�. Ȯ���� �ϼ���.');
			obj.focus();
			return true;
		}
		return false;	
	}


	//��ȭ��ȣ üũ�� �Ѵ�.
	function f_is_tel(obj, lbl)
	{
		var str = obj.value;
		if(obj.value == "") return false;
		
		if(!str.match(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}$/g))
		{
			alert(lbl + " ������ �ٸ��ϴ�.");
			obj.focus();
			return true;
		}
		return false;
	}

	//��ȭ��ȣ üũ�� �Ѵ�.
	function f_is_tel2(obj, lbl)
	{
		var str = obj;

		if(!str.match(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}$/g))
		{
			alert(lbl + " ������ �ٸ��ϴ�.");
			return true;
		}
		return false;
	}
	

	//�ڵ�����ȣ�� üũ�� �Ѵ�.
	function f_is_mob(obj, lbl)
	{
		var str = obj.value;
		if(obj.value == "") return false;
		
		if(!str.match(/^(010|011|016|017|018|019)-[0-9]{3,4}-[0-9]{3,4}$/g))
		{
			alert(lbl + " ������ �ٸ��ϴ�.");
			obj.focus();
			return true;
		}
		return false;
	}

	//�ڵ�����ȣ�� üũ�� �Ѵ�.
	function f_is_mob2(obj, lbl)
	{
		var str = obj;

		if(!str.match(/^(010|011|016|017|018|019)-[0-9]{3,4}-[0-9]{3,4}$/g))
		{
			alert(lbl + " ������ �ٸ��ϴ�.");
			return true;
		}
		return false;
	}

	//���ڸ� üũ�� �Ѵ�.
	function useFormatDate(oldString, newSeperator)
	{
		var rExp = new RegExp("[.|/|\\\\|-]", "gi");
		var newString=oldString.replace(rExp, newSeperator);

		rExp = new RegExp("/+", "gi");
		newString = newString.replace(rExp, newSeperator);

		rExp = new RegExp("\\s", "gi");
		newString = newString.replace(rExp, "");
		return newString;
	}


	//������� �����ָ� ���ڸ� üũ�� �Ѵ�.
	function IsDate(strDate) 
	{
		var errNum = 0;
		
		strDate = useFormatDate(strDate, '-');

		var arrDate = strDate.split('-');

		if (arrDate.length < 3)  return false;
		else 
		{

			var y = arrDate[0];
			var m = arrDate[1];
			var d = arrDate[2];

			if (d.length == 1)  d = '0' + d
			if (m.length == 1) m = '0' + m
			if (y.length == 2) 
			{
				if (y > 49)  y = '19' + y
				else  y = '20' + y
				
			} 

			if (d.length != 2 || m.length != 2 || y.length != 4)  return false;
			

			//check the values
			if (isNaN(d) || d<0 || d.indexOf(',')!=-1 || d.indexOf('.')!=-1 || d.indexOf('-')!=-1) errNum = 1;
			
			if (isNaN(m) || m<0 || m.indexOf(',')!=-1 || m.indexOf('.')!=-1 || m.indexOf('-')!=-1) errNum = 1;
			
			if (isNaN(y) || y<0 || y.indexOf(',')!=-1 || y.indexOf('.')!=-1 || y.indexOf('-')!=-1) errNum = 1;
			
			if (m<1 || m>12) errNum = 1;
			
			if (d<1 || d>31) errNum = 1;
				
			if (y<1900 || y>2079) errNum = 1;
			
			//check months with 30 days
			if (m==4 || m==6 || m==9 || m==11)
			{
				if (d==31) errNum=1;
			}
			// february, leap year
			if (m==2)
			{
				// feb
				var feb=parseInt(y/4)
				if (isNaN(feb)) errNum=1;
				if (d>29) errNum=1;
				if (d==29 && ((y/4)!=parseInt(y/4))) errNum=1;
				
			}
			if (errNum != 0) return false;
			
		}
		return true;
	}


	//������ ��¥�� üũ�� �Ѵ�.
	function f_is_date(obj, lbl)
	{
		var nLen = obj.value.length;
		var nowDate = new Date();
		var nowYear = nowDate.getYear();
		var nowMonth = nowDate.getMonth() + 1;
		if(nowMonth < 10) nowMonth = '0' + nowMonth;

		var nowDate = nowDate.getMonth();
		var result;
		
		var sYear = "";
		var sMonth = "";
		var sDay = "";

		//����üũ�� �Ѵ�.
		if(f_is_int(obj, lbl)) return false;

		switch (nLen)
		{
			case 4://����
				sMonth = obj.value.substring(0, 2);
				sDay = obj.value.substring(2, 4);
				strDate = nowYear + '-' + sMonth + '-' + sDay;
				result = IsDate(strDate);
				break;
			case 6://���
				sYear = obj.value.substring(0, 4);
				sMonth = obj.value.substring(4, 6);
				strDate = sYear + '-' + sMonth + '-' + nowMonth;
				result = IsDate(strDate);
				break;
			case 8://�����
				sYear = obj.value.substring(0, 4);
				sMonth = obj.value.substring(4, 6);
				sDay = obj.value.substring(6, 8);
				strDate = sYear + '-' + sMonth + '-' + sDay;
				result = IsDate(strDate);
				break;
			default:
				result = false;
				break;
		}
		
		if(!result)
		{
			alert(lbl + ' ��¥ ������ �߸��Ǿ����ϴ�.');
			obj.focus();
			return true;
		}
		else return false;
	}


	//�÷��� ������ �Ѵ�.
	function f_is_flash(src, w, h) 
	{
		html = '';
		html += '<object type="application/x-shockwave-flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" id="param" width="'+w+'" height="'+h+'">';
		html += '<param name="movie" value="'+src+'">';
		html += '<param name="quality" value="high">';
		html += '<param name="bgcolor" value="#ffffff">';
		html += '<param name="wmode" value="transparent">';
		html += '<param name="menu" value="false">';
		html += '<param name="swliveconnect" value="true">';
		html += '<embed src="'+src+'" quality=high bgcolor="#ffffff" menu="false" width="'+w+'" height="'+h+'" swliveconnect="true" id="param" name="param" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"><\/embed>';
		html += '<\/object>';
		document.write(html);
	}


	//table ���÷��� ����
	function setDisplay(obj, gubun)
	{
		//���� ���̺�
		if(typeof(obj.length) == 'undefined')
		{
			document.getElementsByName(obj)[i].style.display = gubun;
		}
		else
		{
			for(i = 0, j = document.getElementsByName(obj).length; i < j; i++)
			{
				document.getElementsByName(obj)[i].style.display = gubun;
			}
		}
		
	}
 
 
 //���� ���ε� ���˻�
	function f_is_file(obj, lbl)
	{
		
		var objFile = obj.value;
		var result = false;
		if(objFile == '') return false;
		
		objFile = objFile.substring(objFile.lastIndexOf(".") + 1);
		objFile = objFile.toUpperCase();
		
		fileAllowed = new Array();
		fileAllowed = ["JPG", "GIF", "BMP", "PDF", "PNG", "TIF", "AI", "XLS", "XLSX", "DOC", "DOCX", "PPT", "PPTX", "GUL", "HWP", "TXT"];
		
		for(i = 0; i < fileAllowed.length; i++)
		{
			if(objFile == fileAllowed[i])
			{
				result = true;
				break;
			}
		}

		if(!result)
		{
			alert(lbl + objFile + ' ���� ���ε尡 �Ұ��� �մϴ�.\n ������ ���� Ȯ���ڴ� jpg/gif/bmp/pdf/png/tif/ai/xls/xlsx/doc/docx/ppt/pptx/gul/hwp/txt �Դϴ�.');
			obj.focus();
			return true;
		}
		else return false;
	
	}

 
 //HTML Form TextField�� ���� HTML Form Select�� �߰��ϴ� �Լ�
	function addTextToOptions(data, select)
	{
	    select.options[select.options.length] = new Option(data, data);  
	    return false;
	    
	}
	
 
 //�޷�â �˾� (����Ʈ�ڽ�)
	function openCalendar(wname,fname,e)
	{
		var opn=window.open(wname,fname,"width=195, height=260, left="+e.screenX+", top="+e.screenY+", resizable=no, toolbar=no, scrollbars=no");
		opn.focus();
		
	}

 
 //���ú��� ��  ����  ��¥  ��������
	function getDateAdd(m_year, m_month, m_day) {
	
		var vn_day1 = new Date(); // ����ð� ��������
		var now = new Date(vn_day1.getYear() + m_year, vn_day1.getMonth() + m_month, vn_day1.getDate() + m_day);
	    var year = now.getYear(); // �⵵ ��������
	    var month = (now.getMonth()+1); // �� �������� (+1)
	    if(month < 10){
	       month = '0'+month;
	    }
	    var date = now.getDate(); // ��¥ ��������
	    if(date < 10){
	       date = '0'+date;
	    }
	    var day = year+'-'+month+'-'+date;
	    return day;
	
	}
	
 
 //����  ��¥  ��������
	function getNowDate() {
		var now = new Date(); // ����ð� ��������
	    var year = now.getYear(); // �⵵ ��������
	    var month = now.getMonth()+1; // �� �������� (+1)
	    if(month < 10){
	       month = '0'+month;
	    }
	    var date = now.getDate(); // ��¥ ��������
	    if(date < 10){
	       date = '0'+date;
	    }
	    var day = year+'-'+month+'-'+date;
	    return day;
	
	}
	
 
 //�ֹε�Ϲ�ȣ ��Ŀ�� �̵�
	function nextFocus(sFormName,sNow,sNext)
	{
		var sForm = 'document.'+ sFormName +'.'
		var oNow = eval(sForm + sNow);
	
		if (typeof oNow == 'object')
		{
			if ( oNow.value.length == oNow.maxLength)
			{
				var oNext = eval(sForm + sNext);
	
				if ((typeof oNext) == 'object')
					oNext.focus();
			}
		}
	}
	
	
 
 //������ �ڸ��� üũ
	function f_fix_chk(obj, lbl, num)
	{
		if(f_is_trim(obj.value).length != num)
		{
			alert(lbl + ' '  + num + '�ڸ� ���ڷ� �Է��Ͻʽÿ�.');
			obj.focus(); 
			return true;   
		}
		return false; 
	}
	
 	
 // ��Ű�� setting
	function setCookie(name, value, expiredays){ 
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
 	
 // ��Ű�� get	
	function getCookie(name){
		var nameOfCookie = name + "=";
		var x = 0;
		while (x <= document.cookie.length){
			var y = (x+nameOfCookie.length);
			if (document.cookie.substring( x, y ) == nameOfCookie){
				if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1)
					endOfCookie = document.cookie.length;
				return unescape(document.cookie.substring( y, endOfCookie ));
			}
			x = document.cookie.indexOf( " ", x ) + 1;
			if (x == 0)
				break;
		} 
		return "";
	}	
