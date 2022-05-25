
Function Show_cal(sYear,sMonth,sDay)
  document.all.minical.innerHTML=""
  datToday=date()

  intThisYear =  cint("0"&sYear) '년도넘겨받기
  intThisMonth=  cint("0"&sMonth) '월 넘겨받기
  intThisDay  =  cint("0"&sDay)

  if intThisYear  =0 then intThisYear=Year(datToday)    '만약 년도와 월값을 넘겨받지 않았다면 현재 년도를 년도 변수에
  if intThisMonth  =0 then intThisMonth=Month(datToday)  ' 현재 월을 월 변수에
  if intThisDay  =0 then intThisDay=day(datToday)    '오늘 날짜
  
  intThisYear = (intThisYear mod 100)
  
  if ( intThisYear < 50 ) then
      intThisYear = 2000 + intThisYear 
  else
      intThisYear = 1900 + intThisYear
  end if 
  
  if intThisMonth=1 then
    intPrevYear=intThisYear-1
    intPrevMonth=12
    intNextYear=intThisYear
    intNextMonth=2
  elseif intThisMonth=12 then
    intPrevYear=intThisYear
    intPrevMonth=11
    intNextYear=intThisYear + 1
    intNextMonth=1
  else
    intPrevYear=intThisYear
    intPrevMonth=intThisMonth -1
    intNextYear=intThisYear
    intNextMonth=intThisMonth+1
  end if

  NowThisYear=Year(datToDay) ' 현재연도값
  NowThisMonth=Month(datToday) '현재 월값
  NowThisDay=Day(datToday) '오늘 날짜 값
  
  datFirstDay=DateSerial(intThisYear, intThisMonth, 1) '넘겨받은 날짜의 월초기값 파악
  intFirstWeekday=Weekday(datFirstDay, vbSunday) '넘겨받은 날짜의 주초기값 파악
  intSecondWeekday=intFirstWeekday
  intThirdWeekday=intFirstWeekday
  
  if intThisMonth=4 or intThisMonth=6 or intThisMonth=9 or intThisMonth=11 then  '월말 값 계산
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
    Case 1  varThisWeekday="일"
    Case 2  varThisWeekday="월"
    Case 3  varThisWeekday="화"
    Case 4  varThisWeekday="수"
    Case 5  varThisWeekday="목"
    Case 6  varThisWeekday="금"
    Case 7  varThisWeekday="토"
  End Select

  intPrintDay=1 '출력 초기일 값은 1부터
  secondPrintDay=1
  thirdPrintDay=1

  Stop_Flag=0

  Cal_HTML=Cal_HTML& "<table bgcolor=#636563 border=0 cellpadding=1 cellspacing=1  onmouseover='doOver()' onmouseout='doOut()' onclick='doClick()' style='font-size : 12;font-family:굴림;'>"
  Cal_HTML=Cal_HTML& "<tr align=center>"
  Cal_HTML=Cal_HTML& "<td align=left  title='이전해' style='cursor:hand;' OnClick='vbscript:call Show_cal("&(intPrevYear-1)&","&intThisMonth&","&intThisDay&")'>◁</td>"
  Cal_HTML=Cal_HTML& "<td align=left  title='이전달' style='cursor:hand;' OnClick='vbscript:call Show_cal("&intPrevYear&","&intPrevMonth&","&intThisDay&")'>◀</td>"
  Cal_HTML=Cal_HTML& "<td colspan=3><font color=white size=2><b>"
  Cal_HTML=Cal_HTML& intThisYear&"."&intThisMonth
  Cal_HTML=Cal_HTML& "</font></b></td>"
  Cal_HTML=Cal_HTML& "<td align=right title='다음달' style='cursor:hand;' OnClick='vbscript:call Show_cal("&intNextYear&","&intNextMonth&","&intThisDay&")'>▶</td>"
  Cal_HTML=Cal_HTML& "<td align=right title='다음해' style='cursor:hand;' OnClick='vbscript:call Show_cal("&(intNextYear+1)&","&intThisMonth&","&intThisDay&")'>▷</td>"
  Cal_HTML=Cal_HTML& "</tr>"
  Cal_HTML=Cal_HTML& "<tr align=center bgcolor=#D3D3D6 style='color:white; font-weight:bold'>"
  Cal_HTML=Cal_HTML& "<td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>"
  Cal_HTML=Cal_HTML& "</tr>"

  FOR intLoopWeek=1 to 6   '주단위 루프 시작, 최대 6주

    Cal_HTML=Cal_HTML& "<tr align=right valign=top bgcolor=white >"
    for intLoopDay=1 to 7 '요일단위 루프 시작, 일요일부터

      if intThirdWeekDay > 1 then '첫주시작일이 1보다 크면
        Cal_HTML=Cal_HTML& "<td>&nbsp;</td>"
        intThirdWeekDay=intThirdWeekDay-1
      else
        if thirdPrintDay > intLastDay then '입력날짜가 월말보다 크다면
          Cal_HTML=Cal_HTML& "<td>&nbsp;</td>"
        else '입력날짜가 현재월에 해당되면

          '입력날짜를 string으로 변환한다.월,일이 10보다 작을경우 임의로 "0"을 월,일에 붙여준다.        
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

          Cal_HTML=Cal_HTML& "<td title='"&Cal_Temp&"' style='cursor: hand;border: 1px solid white;width:18; height:18;"
          'Cal_HTML=Cal_HTML& "<td title='"&intThisYear&"-"&intThisMonth&"-"&thirdPrintDay&"' style='cursor: hand;border: 1px solid white;width:18; height:18;"
          if intThisYear-NowThisYear=0 and intThisMonth-NowThisMonth=0 and thirdPrintDay-intThisDay=0 then '오늘 날짜이면은 글씨폰트를 다르게
            Cal_HTML=Cal_HTML& "background-color:#C9EAFF;"
          end if
          if  intLoopDay=1 then '일요일이면 빨간 색으로
            Cal_HTML=Cal_HTML& "color:red;"
          else ' 그외의 경우
            Cal_HTML=Cal_HTML& "color:black;"
          end if
          Cal_HTML=Cal_HTML& "'>"&thirdPrintDay
        end if
        thirdPrintDay=thirdPrintDay+1 '날짜값을 1 증가

        if thirdPrintDay > intLastDay then  Stop_Flag=1   '만약 날짜값이 월말값보다 크면 루프문 탈출

      end if
      Cal_HTML=Cal_HTML& "</td>"
    next
    Cal_HTML=Cal_HTML& "</tr>"
    if Stop_Flag=1 then  EXIT FOR
  NEXT
  Cal_HTML=Cal_HTML& "</table>"
  Cal_HTML=Cal_HTML& ""
  Cal_HTML=Cal_HTML& ""
  document.all.minical.innerHTML=Cal_HTML
END Function

Function Add_cal(syear, smonth, sday)
  sdate = CDate(syear&smonth&sday)

  sdate1 = DateAdd("m", 3, sdate)
  document.all.p_edate2.value = sdate1
End Function