
Function Show_cal(sYear,sMonth,sDay)
  document.all.minical.innerHTML=""
  datToday=date()

  intThisYear =  cint("0"&sYear) '�⵵�Ѱܹޱ�
  intThisMonth=  cint("0"&sMonth) '�� �Ѱܹޱ�
  intThisDay  =  cint("0"&sDay)

  if intThisYear  =0 then intThisYear=Year(datToday)    '���� �⵵�� ������ �Ѱܹ��� �ʾҴٸ� ���� �⵵�� �⵵ ������
  if intThisMonth  =0 then intThisMonth=Month(datToday)  ' ���� ���� �� ������
  if intThisDay  =0 then intThisDay=day(datToday)    '���� ��¥
  
  intThisYear = (intThisYear mod 100)
  
  if ( intThisYear < 50 ) then
      intThisYear = 2000 + intThisYear 
  else
      intThisYear = 1900 + intThisYear
  end if 
  
  if intThisMonth=1 then
    intPrevYear=intThisYear-1
    intPrevMonth=12
    intNextYear=intThisYear+1
    intNextMonth=2
  elseif intThisMonth=12 then
    intPrevYear=intThisYear-1
    intPrevMonth=11
    intNextYear=intThisYear + 1
    intNextMonth=1
  else
    intPrevYear=intThisYear-1
    intPrevMonth=intThisMonth -1
    intNextYear=intThisYear
    intNextMonth=intThisMonth+1
  end if

  NowThisYear=Year(datToDay) ' ���翬����
  NowThisMonth=Month(datToday) '���� ����
  NowThisDay=Day(datToday) '���� ��¥ ��
  
  datFirstDay=DateSerial(intThisYear, intThisMonth, 1) '�Ѱܹ��� ��¥�� ���ʱⰪ �ľ�
  intFirstWeekday=Weekday(datFirstDay, vbSunday) '�Ѱܹ��� ��¥�� ���ʱⰪ �ľ�
  intSecondWeekday=intFirstWeekday
  intThirdWeekday=intFirstWeekday
  
  if intThisMonth=4 or intThisMonth=6 or intThisMonth=9 or intThisMonth=11 then  '���� �� ���
    intLastDay=30
  elseif intThisMonth=2 and not (intThisYear mod 4) = 0 then
    intLastDay=28
  elseif intThisMonth=2 and (intThisYear mod 4) = 0 then
    if (intThisYear mod 100) = 0 then
      if (intThisYear mod 400) = 0 then
        intLastDay=29
      else
        intLastDay=28
      end if
    else
      intLastDay=29
    end if
  else
    intLastDay=31
  end If
  
  If intLastDay < intThisDay Then
    intThisDay = intLastDay
  End If
  
  If intThisMonth = Month(datToday) and Day(datToday) = intLastDay Then
    intThisDay = intLastDay
  End If

  datThisDay=CDate(intThisYear&"-"&intThisMonth&"-"&intThisDay)
  intThisWeekday=Weekday(datThisDay)

  Select Case intThisWeekday
    Case 1  varThisWeekday="��"
    Case 2  varThisWeekday="��"
    Case 3  varThisWeekday="ȭ"
    Case 4  varThisWeekday="��"
    Case 5  varThisWeekday="��"
    Case 6  varThisWeekday="��"
    Case 7  varThisWeekday="��"
  End Select

  intPrintDay=1 '��� �ʱ��� ���� 1����
  secondPrintDay=1
  thirdPrintDay=1

  Stop_Flag=0

  Cal_HTML = Cal_HTML & "<div id='calendar'  onmouseover='doOver()' onmouseout='doOut()'>                                                                                               " & vbCrLf
  Cal_HTML = Cal_HTML & " <p>                                                                                                                                                           " & vbCrLf
  Cal_HTML = Cal_HTML & "     <img src='/images/portal/btn/btn_cal_pre.gif' OnClick='vbscript:call Show_cal("&(intPrevYear)&","&intThisMonth&","&intThisDay&")' style='cursor:pointer'/>" & vbCrLf
  Cal_HTML = Cal_HTML & "     <span class='ft_bold'>" & intThisYear & "��</span>                                                                                                        " & vbCrLf
  Cal_HTML = Cal_HTML & "     <img src='/images/portal/btn/btn_cal_nxt.gif' OnClick='vbscript:call Show_cal("&(intNextYear)&","&intThisMonth&","&intThisDay&")' style='cursor:pointer'/>" & vbCrLf
  Cal_HTML = Cal_HTML & "     <img src='/images/portal/btn/btn_cal_pre.gif' OnClick='vbscript:call Show_cal("&intThisYear&","&intPrevMonth&","&intThisDay&")' style='cursor:pointer'/>  " & vbCrLf
  Cal_HTML = Cal_HTML & "     <span class='mg_l7 ft_bold'>" & intThisMonth & "��</span>                                                                                                 " & vbCrLf
  Cal_HTML = Cal_HTML & "     <img src='/images/portal/btn/btn_cal_nxt.gif' OnClick='vbscript:call Show_cal("&intThisYear&","&intNextMonth&","&intThisDay&")' style='cursor:pointer'/>  " & vbCrLf
  Cal_HTML = Cal_HTML & " </p>                                                                                                                                                          " & vbCrLf
  Cal_HTML = Cal_HTML & " <table onclick='doClick()'>                                                                                                                                   " & vbCrLf
  Cal_HTML = Cal_HTML & "     <colgroup><col width='1px'><col width='20px'><col width='20px'><col width='20px'><col width='20px'><col width='20px'><col width=' '></colgroup>           " & vbCrLf
  Cal_HTML = Cal_HTML & "     <thead>                                                                                                                                                   " & vbCrLf
  Cal_HTML = Cal_HTML & "     <tr>                                                                                                                                                      " & vbCrLf
  Cal_HTML = Cal_HTML & "         <th class='blank'><img src='/images/portal/board/board_cal_left.gif' /></th>                                                                          " & vbCrLf
  Cal_HTML = Cal_HTML & "         <th>��</th>                                                                                                                                           " & vbCrLf
  Cal_HTML = Cal_HTML & "         <th>��</th>                                                                                                                                           " & vbCrLf
  Cal_HTML = Cal_HTML & "         <th>ȭ</th>                                                                                                                                           " & vbCrLf
  Cal_HTML = Cal_HTML & "         <th>��</th>                                                                                                                                           " & vbCrLf
  Cal_HTML = Cal_HTML & "         <th>��</th>                                                                                                                                           " & vbCrLf
  Cal_HTML = Cal_HTML & "         <th>��</th>                                                                                                                                           " & vbCrLf
  Cal_HTML = Cal_HTML & "         <th>��</th>                                                                                                                                           " & vbCrLf
  Cal_HTML = Cal_HTML & "         <th class='blank'><img src='/images/portal/board/board_cal_right.gif' /></th>                                                                         " & vbCrLf
  Cal_HTML = Cal_HTML & "     </tr>                                                                                                                                                     " & vbCrLf
  Cal_HTML = Cal_HTML & "     </thead>                                                                                                                                                  " & vbCrLf
  Cal_HTML = Cal_HTML & "     <tbody>                                                                                                                                                   " & vbCrLf

  
  sClassName = ""
  
  FOR intLoopWeek=1 to 6   '�ִ��� ���� ����, �ִ� 6��
    
    If intLoopWeek = 1 Then
        sClassName = " class='fir'" 
    Else 
        sClassName = ""
    End if  
    
    Cal_HTML=Cal_HTML& "<tr" & sClassName & ">"
    Cal_Html = Cal_HTML & "     <td class='blank'></td>"
    for intLoopDay=1 to 7 '���ϴ��� ���� ����, �Ͽ��Ϻ���
      
      if intThirdWeekDay > 1 then 'ù�ֽ������� 1���� ũ��
        Cal_HTML=Cal_HTML& "<td>&nbsp;</td>"
        intThirdWeekDay=intThirdWeekDay-1
      else
        if thirdPrintDay > intLastDay then '�Է³�¥�� �������� ũ�ٸ�
          Cal_HTML=Cal_HTML& "<td>&nbsp;</td>"
        else '�Է³�¥�� ������� �ش�Ǹ�

          '�Է³�¥�� string���� ��ȯ�Ѵ�.��,���� 10���� ������� ���Ƿ� "0"�� ��,�Ͽ� �ٿ��ش�.        
          If intThisMonth < 10 then
            strThisMonth = "0" & cstr(intThisMonth)
          Else
            strThisMonth = cstr(intThisMonth)
          End if
          If thirdPrintDay < 10 then
            strthirdPrintDay = "0" & cstr(thirdPrintDay)
          Else  
            strthirdPrintDay = cstr(thirdPrintDay)
          End if
          Cal_Temp = (intThisYear&"-"&strThisMonth&"-"&strthirdPrintDay) 

          Cal_HTML=Cal_HTML& "<td title='"&Cal_Temp&"' style='cursor:pointer;"
          'Cal_HTML=Cal_HTML& "<td title='"&intThisYear&"-"&intThisMonth&"-"&thirdPrintDay&"' style='cursor: hand;border: 1px solid white;width:18; height:18;"
          if intThisYear-NowThisYear=0 and intThisMonth-NowThisMonth=0 and thirdPrintDay-intThisDay=0 then '���� ��¥�̸��� �۾���Ʈ�� �ٸ���
            Cal_HTML=Cal_HTML& "display:block; padding:3px 0; color:#fff; background:url(/images/portal/board/board_cal_onbg.gif) no-repeat left top;"
          end if
          if  intLoopDay=1 then '�Ͽ����̸� ���� ������
            Cal_HTML=Cal_HTML& "color:red;"
          else ' �׿��� ���
            Cal_HTML=Cal_HTML& ""
          end if
          Cal_HTML=Cal_HTML& "'>"&thirdPrintDay
        end if
        thirdPrintDay=thirdPrintDay+1 '��¥���� 1 ����

        if thirdPrintDay > intLastDay then  Stop_Flag=1   '���� ��¥���� ���������� ũ�� ������ Ż��

      end if
      Cal_HTML=Cal_HTML& "</td>"
    next
    Cal_HTML=Cal_HTML& "<td class='blank'></td>"
    Cal_HTML=Cal_HTML& "</tr>"  & vbCrLf
    if Stop_Flag=1 then  EXIT FOR
  NEXT
  Cal_HTML=Cal_HTML& "</table>"  & vbCrLf
  Cal_HTML=Cal_HTML& "</div>"  & vbCrLf
  Cal_HTML=Cal_HTML& ""
  document.all.minical.innerHTML=Cal_HTML
  
END Function

Function Add_cal(syear, smonth, sday)

  sdate = CDate(syear&smonth&sday)

  sdate1 = DateAdd("m", 3, sdate)
  document.all.p_edate2.value = sdate1
End Function