<body bgcolor="#FFFFFF" text="#242424" leftmargin=0 topmargin=15 marginwidth=0 marginheight=0 bottommargin=0 rightmargin=0><center> 
<table width="632" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="85" background=<% 

/*------------------------------------------------------------------------------------------------------*
 * ���� ����� ���� ��� �̹����� ���� �ȴ�								*
 * 	 ��. ���� ���� �ÿ� "img/spool_top.gif" �̹��� ���						*
 *       ��. ���� ����� ���� ��� �̹����� ����							*
 *       	��. �ſ�ī�� 	- 	"img/card.gif"							*
 *		��. ISP		-	"img/card.gif"							*
 *		��. �������	-	"img/bank.gif"							*
 *		��. �������Ա�	-	"img/bank.gif"							*
 *		��. �ڵ���	- 	"img/hpp.gif"							*
 *		��. ��ȭ���� (ars��ȭ ����)	-	"img/phone.gif"					*
 *		��. ��ȭ���� (�޴���ȭ����)	-	"img/phone.gif"					*
 *		��. OK CASH BAG POINT		-	"img/okcash.gif"				*
 *		��. ��ȭ��ǰ��	-	"img/ticket.gif"						*
 *------------------------------------------------------------------------------------------------------*/
    					
    				if(resultCode.equals("01")){
					out.println("img/spool_top.gif");
				}
				else{
    					if(payMethod.equals("Card")){
    						out.println("img/card.gif");
    					}
    					else if(payMethod.equals("VCard")){ // ISP
						out.println("img/card.gif");
					}
    					else if(payMethod.equals("HPP")){ // �޴���
						out.println("img/hpp.gif");
					}
    					else if(payMethod.equals("Ars1588Bill")){ // 1588
						out.println("img/phone.gif");
					}
    					else if(payMethod.equals("PhoneBill")){ // ����
						out.println("img/phone.gif");
					}
    					else if(payMethod.equals("OCBPoint")){ // OKCASHBAG
						out.println("img/okcash.gif");
					}
    					else if(payMethod.equals("DirectBank")){  // ���������ü
						out.println("img/bank.gif");
					}
    					else if(payMethod.equals("VBank")){  // ������ �Ա� ����
						out.println("img/bank.gif");
					}
    					else if(payMethod.equals("Culture")){  // ��ȭ��ǰ�� ����
						out.println("img/ticket.gif");
					}
						else if(payMethod.equals("TEEN")){  // ƾĳ�� ����
						out.println("img/teen_top.gif");
					}
					else{
						out.println("img/card.gif");
					}// ��Ÿ ���Ҽ����� ���
				}
					
    				%> style="padding:0 0 0 64">
    				
<!-------------------------------------------------------------------------------------------------------
 *													*
 *  �Ʒ� �κ��� ��� ���������� �������� ����޼��� ��� �κ��Դϴ�.					*
 *  													*
 *	1. resultCode 	(�� �� �� ��) 									*
 *  	2. resultMsg	(��� �޼���)									*
 *  	3. payMethod	(�� �� �� ��)									*
 *  	4. tid		(�� �� �� ȣ)									*
 *  	5. moid  	(�� �� �� ȣ)									*
 -------------------------------------------------------------------------------------------------------->
 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="3%" valign="top"><img src="img/title_01.gif" width="8" height="27" vspace="5"></td>
          <td width="97%" height="40" class="pl_03"><font color="#FFFFFF"><b>�������</b></font></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td align="center" bgcolor="6095BC">
      <table width="620" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td bgcolor="#FFFFFF" style="padding:0 0 0 56">
		  <table width="510" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="7"><img src="img/life.gif" width="7" height="30"></td>
                <td background="img/center.gif"><img src="img/icon03.gif" width="12" height="10">
                
                <!-------------------------------------------------------------------------------------------------------
                 * 1. resultCode 											*	
                 *       ��. �� �� �� ��: "00" �� ��� ���� ����[�������Ա��� ��� - ������ �������Ա� ��û�� �Ϸ�]	*
                 *       ��. �� �� �� ��: "00"���� ���� ��� ���� ����  						*
                 --------------------------------------------------------------------------------------------------------> 
                  <b><% if(resultCode.equals("00") && payMethod.equals("VBank")){ out.println("������ �������Ա� ��û�� �Ϸ�Ǿ����ϴ�.");}
                  	   else if(resultCode.equals("00")){ out.println("������ ������û�� �����Ǿ����ϴ�.");}
                           else{ out.println("������ ������û�� ���еǾ����ϴ�.");} %> </b></td>
                <td width="8"><img src="img/right.gif" width="8" height="30"></td>
              </tr>
            </table>
            <br>
            <table width="510" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="407"  style="padding:0 0 0 9"><img src="img/icon.gif" width="10" height="11"> 
                  <strong><font color="433F37">��������</font></strong></td>
                <td width="103">&nbsp;</td>                
              </tr>
              <tr> 
                <td colspan="2"  style="padding:0 0 0 23">
		  <table width="470" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                    
                <!-------------------------------------------------------------------------------------------------------
                 * 2. m_payMethod 										*	
                 *       ��. ���� ����� ���� ��									*
                 *       	��. �ſ�ī�� 	- 	Card								*
                 *		��. ISP		-	VCard								*	
                 *		��. �������	-	DirectBank							*
                 *		��. �������Ա�	-	VBank								*
                 *		��. �ڵ���	- 	HPP								*
                 *		��. ��ȭ���� (ars��ȭ ����)	-	Ars1588Bill					*
                 *		��. ��ȭ���� (�޴���ȭ����)	-	PhoneBill					*
                 *		��. OK CASH BAG POINT		-	OCBPoint					*
                 *		��. ��ȭ��ǰ��	-	Culture								*
                 -------------------------------------------------------------------------------------------------------->
                      <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                      <td width="109" height="25">�� �� �� ��</td>
                      <td width="343"><%=payMethod%></td>
                    </tr>
                    <tr> 
                      <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    </tr>
                    <tr> 
                      <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                      <td width="109" height="26">�� �� �� ��</td>
                      <td width="343"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><%=resultCode%></td>
                            <td width="142" align="right">
                          
                <!-------------------------------------------------------------------------------------------------------
                 * 2. $inipay->m_resultCode ���� ���� "������ ����" �Ǵ� "���� ���� �ڼ��� ����" ��ư ���		*
                 *       ��. ���� �ڵ��� ���� "00"�� ��쿡�� "������ ����" ��ư ���					*
                 *       ��. ���� �ڵ��� ���� "00" ���� ���� ��쿡�� "���� ���� �ڼ��� ����" ��ư ���			*
                 -------------------------------------------------------------------------------------------------------->
		<!-- ���а�� �� ���� ��ư ��� -->
                            	<%
                            		if(resultCode.equals("00")){
                				out.println("<a href='javascript:show_receipt();'><img src='img/button_02.gif' width='94' height='24' border='0'></a>");
                			}
                			else{
                            			out.println("<a href='javascript:errhelp();'><img src='img/button_01.gif' width='142' height='24' border='0'></a>");
                            		}
                                                    	
                            	%>                    </td>
                          </tr>
                        </table></td>
                    </tr>
                
                <!-------------------------------------------------------------------------------------------------------
                 * 1. resultMsg 											*
                 *       ��. ��� ������ ���� �ش� ���нÿ��� "[�����ڵ�] ���� �޼���" ���·� ���� �ش�.                *
                 *		��> [9121]����Ȯ�ο���									*
                 -------------------------------------------------------------------------------------------------------->
                    <tr> 
                      <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    </tr>
                    <tr> 
                      <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                      <td width="109" height="25">�� �� �� ��</td>
                      <td width="343"><%=resultMsg%></td>
                    </tr>
                    <tr> 
                      <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    </tr>
                    
                <!-------------------------------------------------------------------------------------------------------
                 * 1. $inipay->m_tid											*
                 *       ��. �̴Ͻý��� �ο��� �ŷ� ��ȣ -��� �ŷ��� ������ �� �ִ� Ű�� �Ǵ� ��			*
                 -------------------------------------------------------------------------------------------------------->
                    <tr> 
                      <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                      <td width="109" height="25">�� �� �� ȣ</td>
                      <td width="343"><%=tid%></td>
                    </tr>
                    <tr> 
                      <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    </tr>
                    
                <!-------------------------------------------------------------------------------------------------------
                 * 1. $inipay->m_moid											*
                 *       ��. �������� �Ҵ��� �ֹ���ȣ 									*
                 -------------------------------------------------------------------------------------------------------->
                    <tr> 
                      <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                      <td width="109" height="25">�� �� �� ȣ</td>
                      <td width="343"><%=moid%></td>
                    </tr>
                    <tr> 
                      <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    </tr>


<%                    
                    

	/*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*	
	 *													*
	 *  1.  �ſ�ī�� , ISP ���� ��� ��� (OK CASH BAG POINT ���� ���� ���� )				*
	 -------------------------------------------------------------------------------------------------------*/

	if(payMethod.equals("Card") || payMethod.equals("VCard")){
%>
		  		<tr>
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�ſ�ī���ȣ</td>
                    		  <td width="343"><%=cardNumber%>****</td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
				<tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ¥</td>
                                  <td width="343"><%=pgAuthDate%></td>
                                </tr>
                                <tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>
                                <tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ��</td>
                                  <td width="343"><%=pgAuthTime%></td>
                                </tr>                	    
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�� �� �� ȣ</td>
                    		  <td width="343"><%=authCode%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�� �� �� ��</td>
                    		  <td width="343"><%=cardQuota%>����&nbsp;<b><font color="red"><%=interest%></font></b></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">ī �� �� ��</td>
                    		  <td width="343"><%=cardCode%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">ī��߱޻�</td>
                    		  <td width="343"><%=cardIssuerCode%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3">&nbsp;</td>
                    		</tr>
                    		<tr> 
                		  <td style="padding:0 0 0 9" colspan="3"><img src="img/icon.gif" width="10" height="11"> 
        	          	  <strong><font color="433F37">OK CASHBAG ���� �� ��볻��</font></strong></td>
                		</tr>
                		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">ī �� �� ȣ</td>
                    		  <td width="343"><%=ocbcardnumber%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">���� ���ι�ȣ</td>
                    		  <td width="343"><%=ocbSaveAuthCode%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">��� ���ι�ȣ</td>
                    		  <td width="343"><%=ocbUseAuthCode%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�� �� �� ��</td>
                    		  <td width="343"><%=ocbAuthDate%></td>
                    		</tr>
                		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">����Ʈ���ұݾ�</td>
                    		  <td width="343"><%=price2%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
<%
                    
          }
        
        /*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*	
	 *													*
	 *  2.  ������°��� ��� ��� 										*
	 -------------------------------------------------------------------------------------------------------*/
	 
          else if(payMethod.equals("DirectBank")){
%>          	
          			
          			<tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ¥</td>
                                  <td width="343"><%=pgAuthDate%></td>
                                </tr>
                                <tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>
                                <tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ��</td>
                                  <td width="343"><%=pgAuthTime%></td>
                                </tr>
                                <tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>

<%                            
          }
          
        /*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*	
	 *													*
	 *  3.  �������Ա� �Ա� ���� ��� ��� (���� ������ �ƴ� �Ա� ���� ���� ����)				*
	 -------------------------------------------------------------------------------------------------------*/
	 
          else if(payMethod.equals("VBank")){
 
%>         	
          	
          			<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�Աݰ��¹�ȣ</td>
                    		  <td width="343"><%=vacct%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�Ա� �����ڵ�</td>
                    		  <td width="343"><%=vcdbank%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">������ ��</td>
                    		  <td width="343"><%=nmvacct%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�۱��� ��</td>
                    		  <td width="343"><%=nminput%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�۱��� �ֹι�ȣ</td>
                    		  <td width="343"><%=perno%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">��ǰ �ֹ���ȣ</td>
                    		  <td width="343"><%=moid%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�Ա� ��������</td>
                    		  <td width="343"><%=dtinput%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
<%                    		
          }
          
        /*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*	
	 *													*
	 *  4.  �ڵ��� ���� 											*
	 -------------------------------------------------------------------------------------------------------*/
	 
          else if(payMethod.equals("HPP")){
  
%>        	
          			
          			<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�޴�����ȣ</td>
                    		  <td width="343"><%=nohpp%></td>
                    		</tr>
                    		<tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>
                    		<tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ¥</td>
                                  <td width="343"><%=pgAuthDate%></td>
                                </tr>
                                <tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>
                                <tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ��</td>
                                  <td width="343"><%=pgAuthTime%></td>
                                </tr>
				<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
<%                    		
          }
          
        /*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*	
	 *													*
	 *  4.  ��ȭ ���� 											*
	 -------------------------------------------------------------------------------------------------------*/
	 
         else if(payMethod.equals("Ars1588Bill") || payMethod.equals("PhoneBill")){

%>                    	
  	
                		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�� ȭ �� ȣ</td>
                    		  <td width="343"><%=noars%></td>
                    		</tr>
                    		<tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>
                		<tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ¥</td>
                                  <td width="343"><%=pgAuthDate%></td>
                                </tr>
                                <tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>
                                <tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ��</td>
                                  <td width="343"><%=pgAuthTime%></td>
                                </tr>
                		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>

<%                    	
         }
         
        /*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*	
	 *													*
	 *  4.  OK CASH BAG POINT ���� �� ���� 									*
	 -------------------------------------------------------------------------------------------------------*/
	 
         else if(payMethod.equals("OCBPoint")){
         	
%>

                		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">ī �� �� ȣ</td>
                    		  <td width="343"><%=ocbcardnumber%></td>
                    		</tr>
                    		<tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>
                		<tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ¥</td>
                                  <td width="343"><%=pgAuthDate%></td>
                                </tr>
                                <tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>
                                <tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">�� �� �� ��</td>
                                  <td width="343"><%=pgAuthTime%></td>
                                </tr>
                                <tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">���� ���ι�ȣ</td>
                    		  <td width="343"><%=ocbSaveAuthCode%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">��� ���ι�ȣ</td>
                    		  <td width="343"><%=ocbUseAuthCode%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">�� �� �� ��</td>
                    		  <td width="343"><%=ocbAuthDate%></td>
                    		</tr>
                		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		<tr> 
                    		  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                    		  <td width="109" height="25">����Ʈ���ұݾ�</td>
                    		  <td width="343"><%=price2%></td>
                    		</tr>
                    		<tr> 
                    		  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                    		</tr>
                    		
<%                    		
         }
         
        /*-------------------------------------------------------------------------------------------------------
	 *													*
	 *  �Ʒ� �κ��� ���� ���ܺ� ��� �޼��� ��� �κ��Դϴ�.    						*	
	 *													*
	 *  4.  ��ȭ ��ǰ��						                			*
	 -------------------------------------------------------------------------------------------------------*/
	 
         else if(payMethod.equals("Culture")){
         	
%>

                		<tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">���ķ��� ID</td>
                                  <td width="343"><%=cultureid%></td>
                                </tr>
                                <tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>

		<%                                
         }
         
		/*-------------------------------------------------------------------------------------------------------
	 	*  5.ƾĳ��
	 	-------------------------------------------------------------------------------------------------------*/
         else if(payMethod.equals("TEEN")){
		%>
                		<tr> 
                                  <td width="18" align="center"><img src="img/icon02.gif" width="7" height="7"></td>
                                  <td width="109" height="25">ƾĳ�� ��� �ܾ�</td>
                                  <td width="343"><%=RemainPrice%></td>
                                </tr>
                                <tr> 
                                  <td height="1" colspan="3" align="center"  background="img/line.gif"></td>
                                </tr>

		<%                                
         }
		%>


                  </table></td>
              </tr>
            </table>
            <br>
            
<!-------------------------------------------------------------------------------------------------------
 *													*
 *  ���� ������($inipay->m_resultCode == "00"�� ��� ) "�̿�ȳ�"  �����ֱ� �κ��Դϴ�.			*	    
 *  ���� ���ܺ��� �̿������ ���� ���ܿ� ���� ���� ������ ���� �ݴϴ�. 				*
 *  switch , case�� ���·� ���� ���ܺ��� ��� �ϰ� �ֽ��ϴ�.						*
 *  �Ʒ� ������ ��� �մϴ�.										*
 *													*
 *  1.	�ſ�ī�� 											*
 *  2.  ISP ���� 											*
 *  3.  �ڵ��� 												*
 *  4.  ��ȭ ���� (1588Bill)										*
 *  5.  ��ȭ ���� (PhoneBill)										*
 *  6.	OK CASH BAG POINT										*
 *  7.  ���������ü											*
 *  8.  ������ �Ա� ����										*
 *  9.  ��ȭ��ǰ�� ����											*	
 ------------------------------------------------------------------------------------------------------->
 
<%
            	
            	if(resultCode.equals("00")){
            		
            		        /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*	
				*													*
	 			*  1.  �ſ�ī�� 						                			*
	 			--------------------------------------------------------------------------------------------------------*/
	
				if(payMethod.equals("Card")){ 
%>
					    <table width="510" border="0' cellspacing='0' cellpadding='0'>
         					<tr> 
         					    <td height='25'  style='padding:0 0 0 9'><img src='img/icon.gif' width='10' height='11'> 
         					      <strong><font color='433F37'>�̿�ȳ�</font></strong></td>
         					  </tr>
         					  <tr> 
         					    <td  style='padding:0 0 0 23'> 
         					      <table width='470' border='0' cellspacing='0' cellpadding='0'>
         					        <tr>          					          
         					          <td height='25'>(1) �ſ�ī�� û������ <b>"�̴Ͻý�(inicis.com)"</b>���� ǥ��˴ϴ�.<br>
         					          (2) LGī�� �� BCī���� ��� <b>"�̴Ͻý�(�̿� ������)"</b>���� ǥ��ǰ�, �Ｚī���� ��� <b>"�̴Ͻý�(�̿���� URL)"</b>�� ǥ��˴ϴ�.</td>
         					        </tr>
         					        <tr> 
         					          <td height='1' colspan='2' align='center'  background='img/line.gif'></td>
         					        </tr>
         					        
         					      </table></td>
         					  </tr>
         				      </table>
<%         				      
				}
				
			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*	
				*													*
	 			*  2.  ISP 						                				*
	 			--------------------------------------------------------------------------------------------------------*/
	 			
				else if(payMethod.equals("VCard")){
%>				
					     <table width='510' border='0' cellspacing='0' cellpadding='0'>
         					<tr> 
         					    <td height='25'  style='padding:0 0 0 9'><img src='img/icon.gif' width='10' height='11'> 
         					      <strong><font color='433F37'>�̿�ȳ�</font></strong></td>
         					  </tr>
         					  <tr> 
         					    <td  style='padding:0 0 0 23'> 
         					      <table width='470' border='0' cellspacing='0' cellpadding='0'>
         					        <tr>          					          
         					          <td height='25'>(1) �ſ�ī�� û������ <b>"�̴Ͻý�(inicis.com)"</b>���� ǥ��˴ϴ�.<br>
         					          (2) LGī�� �� BCī���� ��� <b>"�̴Ͻý�(�̿� ������)"</b>���� ǥ��ǰ�, �Ｚī���� ��� <b>"�̴Ͻý�(�̿���� URL)"</b>�� ǥ��˴ϴ�.</td>
         					        </tr>
         					        <tr> 
         					          <td height='1' colspan='2' align='center'  background='img/line.gif'></td>
         					        </tr>
         					        
         					      </table></td>
         					  </tr>
         				      </table>
<%         				      
				}
					
			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*	
				*													*
	 			*  3. �ڵ��� 						                				*
	 			--------------------------------------------------------------------------------------------------------*/
	 			
				else if(payMethod.equals("HPP")){
%>				
					     <table width="510" border="0" cellspacing="0" cellpadding="0">
         					<tr> 
         					    <td height="25"  style="padding:0 0 0 9"><img src="img/icon.gif" width="10" height="11"> 
         					      <strong><font color="433F37">�̿�ȳ�</font></strong></td>
         					  </tr>
         					  <tr> 
         					    <td  style="padding:0 0 0 23"> 
         					      <table width="470" border="0" cellspacing="0" cellpadding="0">
         					        <tr>          					          
         					          <td height="25">(1) �ڵ��� û������ <b>"�Ҿװ���"</b> �Ǵ� <b>"�ܺ������̿��"</b>�� û���˴ϴ�.<br>
         					          (2) ������ �� �ѵ��ݾ��� Ȯ���Ͻð��� �� ��� �� �̵���Ż��� �����͸� �̿����ֽʽÿ�.
         					          </td>
         					        </tr>
         					        <tr> 
         					          <td height="1" colspan="2" align="center"  background="img/line.gif"></td>
         					        </tr>
         					        
         					      </table></td>
         					  </tr>
         				      </table>
<%         				      
				}
								
			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*	
				*													*
	 			*  4. ��ȭ ���� (ARS1588Bill)				                				*
	 			--------------------------------------------------------------------------------------------------------*/
	 			
				else if(payMethod.equals("Ars1588Bill")){ 
%>				
					     <table width="510" border="0" cellspacing="0" cellpadding="0">
         					<tr> 
         					    <td height="25"  style="padding:0 0 0 9"><img src="img/icon.gif" width="10" height="11"> 
         					      <strong><font color="433F37">�̿�ȳ�</font></strong></td>
         					  </tr>
         					  <tr> 
         					    <td  style="padding:0 0 0 23"> 
         					      <table width="470" border="0" cellspacing="0" cellpadding="0">
         					        <tr>          					          
         					          <td height="25">(1) ��ȭ û������ <b>"������ �̿��"</b>�� û���˴ϴ�.<br>
                                                          (2) �� �ѵ��ݾ��� ��� ������ �������� ��� ��ϵ� ��ȭ��ȣ ������ �ƴ� �ֹε�Ϲ�ȣ�� �������� å���Ǿ� �ֽ��ϴ�.<br>
                                                          (3) ��ȭ ������Ҵ� ������� �����մϴ�.
         					          </td>
         					        </tr>
         					        <tr> 
         					          <td height="1" colspan="2" align="center"  background="img/line.gif"></td>
         					        </tr>
         					        
         					      </table></td>
         					  </tr>
         				      </table>
<%         				      
				}
					
			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*	
				*													*
	 			*  5. ���� ���� (PhoneBill)				                				*
	 			--------------------------------------------------------------------------------------------------------*/
				
				else if(payMethod.equals("PhoneBill")){
%>				
					      <table width="510" border="0" cellspacing="0" cellpadding="0">
         					<tr> 
         					    <td height="25"  style="padding:0 0 0 9"><img src="img/icon.gif" width="10" height="11"> 
         					      <strong><font color="433F37">�̿�ȳ�</font></strong></td>
         					  </tr>
         					  <tr> 
         					    <td  style="padding:0 0 0 23"> 
         					      <table width="470" border="0" cellspacing="0" cellpadding="0">
         					        <tr>          					          
         					          <td height="25">(1) ��ȭ û������ <b>"���ͳ� ������ (����)�����̿��"</b>�� û���˴ϴ�.<br>
                                                          (2) �� �ѵ��ݾ��� ��� ������ �������� ��� ��ϵ� ��ȭ��ȣ ������ �ƴ� �ֹε�Ϲ�ȣ�� �������� å���Ǿ� �ֽ��ϴ�.<br>
                                                          (3) ��ȭ ������Ҵ� ������� �����մϴ�.
         					          </td>
         					        </tr>
         					        <tr> 
         					          <td height="1" colspan="2" align="center"  background="img/line.gif"></td>
         					        </tr>
         					        
         					      </table></td>
         					  </tr>
         				      </table>
<%
				}
				
			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*	
				*													*
	 			*  6. OK CASH BAG POINT					                				*
	 			--------------------------------------------------------------------------------------------------------*/
	 			
				else if(payMethod.equals("OCBPoint")){ 
%>				
					      <table width="510" border="0" cellspacing="0" cellpadding="0">
         					<tr> 
         					    <td height="25"  style="padding:0 0 0 9"><img src="img/icon.gif" width="10" height="11"> 
         					      <strong><font color="433F37">�̿�ȳ�</font></strong></td>
         					  </tr>
         					  <tr> 
         					    <td  style="padding:0 0 0 23"> 
         					      <table width="470" border="0" cellspacing="0" cellpadding="0">
         					        <tr>          					          
         					          <td height="25">(1) OK CASH BAG ����Ʈ ������Ҵ� ������� �����մϴ�.
         					          </td>
         					        </tr>
         					        <tr> 
         					          <td height="1" colspan="2" align="center"  background="img/line.gif"></td>
         					        </tr>
         					        
         					      </table></td>
         					  </tr>
         				      </table>
<%         				      
				}
					
			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*	
				*													*
	 			*  7. ���������ü					                				*
	 			--------------------------------------------------------------------------------------------------------*/
	 			
				else if(payMethod.equals("DirectBank")){  
%>				
					     <table width="510" border="0" cellspacing="0" cellpadding="0">
         					<tr> 
         					    <td height="25"  style="padding:0 0 0 9"><img src="img/icon.gif" width="10" height="11"> 
         					      <strong><font color="433F37">�̿�ȳ�</font></strong></td>
         					  </tr>
         					  <tr> 
         					    <td  style="padding:0 0 0 23"> 
         					      <table width="470" border="0" cellspacing="0" cellpadding="0">
         					        <tr>          					          
         					          <td height="25">(1) ������ ���忡�� <b>"�̴Ͻý�"</b>�� ǥ��˴ϴ�.<br>
         					          </td>
         					        </tr>
         					        <tr> 
         					          <td height="1" colspan="2" align="center"  background="img/line.gif"></td>
         					        </tr>
         					        
         					      </table></td>
         					  </tr>
         				      </table>
<%         				      
				}
					
			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*	
				*													*
	 			*  8. ������ �Ա� ����					                				*
	 			--------------------------------------------------------------------------------------------------------*/		
				
				else if(payMethod.equals("VBank")){  
%>
                                              <table width="510" border="0" cellspacing="0" cellpadding="0">
         					<tr> 
         					    <td height="25"  style="padding:0 0 0 9"><img src="img/icon.gif" width="10" height="11"> 
         					      <strong><font color="433F37">�̿�ȳ�</font></strong></td>
         					  </tr>
         					  <tr> 
         					    <td  style="padding:0 0 0 23"> 
         					      <table width="470" border="0" cellspacing="0" cellpadding="0">
         					        <tr>          					          
         					          (1) ��� ����� �Աݿ����� �Ϸ�� ���ϻ� ���� �ԱݿϷᰡ �̷���� ���� �ƴմϴ�.<br>
         					          (2) ��� �Աݰ��·� �ش� ��ǰ�ݾ��� �������Ա�(â���Ա�)�Ͻðų�, ���ͳ� ��ŷ ���� ���� �¶��� �۱��� �Ͻñ� �ٶ��ϴ�.<br>
                                                          (3) �ݵ�� �Աݱ��� ���� �Ա��Ͻñ� �ٶ��, ����Աݽ� �ݵ�� �ֹ��Ͻ� �ݾ׸� �Ա��Ͻñ� �ٶ��ϴ�.
                                                          </td>
         					        </tr>
         					        <tr> 
         					          <td height="1" colspan="2" align="center"  background="img/line.gif"></td>
         					        </tr>
         					        
         					      </table></td>
         					  </tr>
         				      </table>
<%         				      
				}
					
			       /*--------------------------------------------------------------------------------------------------------
	 			*													*
	 			* ���� ������ �̿�ȳ� �����ֱ� 			    						*	
				*													*
	 			*  9. ��ȭ��ǰ�� ����					                				*
	 			--------------------------------------------------------------------------------------------------------*/
	 			
				else if(payMethod.equals("Culture")){
%>                                         
                                             <table width="510" border="0" cellspacing="0" cellpadding="0">
         					<tr> 
         					    <td height="25"  style="padding:0 0 0 9"><img src="img/icon.gif" width="10" height="11"> 
         					      <strong><font color="433F37">�̿�ȳ�</font></strong></td>
         					  </tr>
         					  <tr> 
         					    <td  style="padding:0 0 0 23"> 
         					      <table width="470" border="0" cellspacing="0" cellpadding="0">
         					        <tr>          					          
         					          <td height="25">(1) ��ȭ��ǰ���� �¶��ο��� �̿��Ͻ� ��� �������ο����� ����Ͻ� �� �����ϴ�.<br>
         					                          (2) ����ĳ�� �ܾ��� �����ִ� ���, ������ ����ĳ�� �ܾ��� �ٽ� ����Ͻ÷��� ���ķ��� ID�� ����Ͻñ� �ٶ��ϴ�.
         					          </td>
         					        </tr>
         					        <tr> 
         					          <td height="1" colspan="2" align="center"  background="img/line.gif"></td>
         					        </tr>
         					        
         					      </table></td>
         					  </tr>
         				      </table>
<%         				      
				}
			
		}
		
%>		
            
            <!-- �̿�ȳ� �� -->
            
          </td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td><img src="img/bottom01.gif" width="632" height="13"></td>
  </tr>
  <tr> 
    <td width=10></td>
  </tr>
  
  <tr> 
    <td> <a href="javascript:window.close();">[â �ݱ�]</a> <a href="javascript:myclass();">[������û �������� �̵�]</a> 
    <% if (!resultCode.equals("00")) { %>
    	<a href="javascript:bill_retry();">[�ٽ� �����ϱ�]</a>
    <% } %>
    </td>
  </tr>
</table>
<form name="fbill" method="post" action="/inicis/INIsecurepayform.jsp">
	<input type="hidden" name="p_subjcd" value="<%=v_subjcd%>">
	<input type="hidden" name="p_term"   value="<%=v_term%>">
	<input type="hidden" name="p_process"   value="<%=v_process%>">
</form>
</center></body>
</html>

