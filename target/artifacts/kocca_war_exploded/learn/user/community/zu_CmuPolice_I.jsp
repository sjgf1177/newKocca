<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../../css/user_style_community2.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table width="900" cellspacing="3" cellpadding="3">
  <tr>
    <td> 
	  <table width="890" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="right"><a href="index_c.htm" onFocus="blur()"><img src="../../images/community/sm_home.gif" border="0"></a></td>
        </tr>
      </table>
      <!-- 맨바깥 테두리선 테이블 -->
	  <table width="890" border="1" cellspacing="0" 
                         cellpadding="5"   style="border-collapse:collapse;" bordercolor="#B7BEC1">
        <tr>
          <td valign="top">
		  <!-- 전체 백그라운드 넣는 테이블-->
		    <table width="876" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <%if(s_grtype.equals("KOCCA")){%>
					<td valign="top" background="/images/community/back_total.jpg">
				<%}else if(s_grtype.equals("KGDI")){%>
					<td valign="top" background="/images/user/game/community/back_total.jpg"><%}%>
				<!-- top table -->
				  <table width="860" border="0" cellspacing="0" cellpadding="0">
					  <tr> 
						<td><img src="/images/community/footer_top.gif"></td>
					  </tr>
					  <tr> 
						<td height="28" align="center" bgcolor="F0F2F0">
							<%if(s_grtype.equals("KOCCA")){%><img src="/images/user/kocca/community/footer_copy.gif">
							<%}else if(s_grtype.equals("KGDI")){%><img src="/images/user/game/community/footer_copy.gif"><%}%>
						</td>
					  </tr>
					</table>
				  <!-- center table start -->
                  <table width="876" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td valign="top" style="padding-left:5px">
					    <table width="860" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <!-- left -->
                            <td width="174"  valign="top" background="../../images/community/bg_left.gif" style="padding-left:5px">
                              <!-- 정보창 테이블 -->
                              <table width="162" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="50" align="center" valign="top" background="../../images/community/info_bg.jpg" class="tbl_bc">박정현님 
                                    안녕하세요. </td>
                                </tr>
                                <tr> 
                                  <td height="10">&nbsp;</td>
                                </tr>
                              </table>
                              <!-- 나의커뮤니티 -->
                              <table width="162" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="../../images/community/my_text.gif"></td>
                                </tr>
                                <tr> 
                                  <td><select name="menu1" onChange="MM_jumpMenu('parent',this,0)">
                                      <option selected>:내가 가입한 커뮤니티: </option>
                                      <option>전체 관리자 </option>
                                    </select></td>
                                </tr>
                                <tr> 
                                  <td height="5"><img src="../../images/community/my_line.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="10"></td>
                                </tr>
                              </table>
                              <!-- 버튼테이블 -->
                              <table width="162" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><a href="make_comm.htm"><img src="../../images/community/ban_make.gif" border="0"></a></td>
                                </tr>
                                <tr> 
                                  <td height="5"></td>
                                </tr>
                                <tr> 
                                  <td><a href="qna_list.htm"><img src="../../images/community/ban_qna.gif" border="0"></a></td>
                                </tr>
                                <tr> 
                                  <td height="5"></td>
                                </tr>
                                <tr> 
                                  <td><a href="#"><img src="../../images/community/ban_help.gif" border="0"></a></td>
                                </tr>
                                <tr> 
                                  <td height="5"></td>
                                </tr>
                                <tr> 
                                  <td><a href="comm_shingo.htm"><img src="../../images/community/ban_singo.gif" border="0"></a></td>
                                </tr>
                              </table>
							</td>
                            <!-- center -->
                            <td width="686" rowspan="2" valign="top" background="../../images/community/bg_center.gif" > 
                              <table width="686" border="0" cellspacing="0" cellpadding="0" >
                                <tr> 
                                  <td><img src="../../images/community/center_top.gif"></td>
                                </tr>
                              </table>
                              <table width="686" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td align="center" valign="top"> 
                                    <!-- 커뮤니티main center start-->
                                    <!-- 전체타이틀 -->
                                    <table width="652" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="1" bgcolor="CCCCCC"></td>
                                      </tr>
                                      <tr> 
                                        <td><table width="407" border="0" cellspacing="0" cellpadding="0">
                                            <tr> 
                                              <td width="407" valign="bottom" class="title">커뮤니티<img src="../../images/community/title_vline.gif" align="absbottom"><strong>불건전 
                                                커뮤니티신고 </strong></td>
                                            </tr>
                                          </table>
										</td>
                                      </tr>
                                      <tr> 
                                        <td height="1" bgcolor="CCCCCC"></td>
                                      </tr>
                                      <tr> 
                                        <td height="10"></td>
                                      </tr>
                                    </table>
                                    <!--Q&A쓰기 -->
                                    <table width="652" border="2" cellspacing="0" 
            cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed" frame="hsides">
                                      <tr  class="lcolor"> 
                                        <td height="3" colspan="2" class="line_color_com"></td>
                                      </tr>
                                      <tr> 
                                        <td width="130" class="tbl_ctit1">보내는 
                                          이 </td>
                                        <td width="502" class="tbl_comleft">작성자(dkdur@autoeversystems.com)</td>
                                      </tr>
                                      <tr> 
                                        <td class="tbl_ctit2" >커뮤니티 명</td>
                                        <td class="tbl_comleft" ><input name="textfield2" type="text" class="input2" size="50">
                                          <img src="../../images/user/button/btn_search.gif" align="absmiddle"> 
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td colspan="2"  class="tbl_ctit1" >내용</td>
                                      </tr>
                                      <tr> 
                                        <td colspan="2" valign="top" class="comm_contents" > 
                                          <textarea name="textarea" cols="70" rows="5"></textarea> 
                                        </td>
                                      </tr>
                                    </table>
                                    <!-- 버튼 -->
                                    <table width="652" border="0" cellspacing="0" cellpadding="0">
                                      <tr> 
                                        <td height="5" align="right"></td>
                                      </tr>
                                      <tr> 
                                        <td align="right"><a href="make_comm2.htm"><img src="../../images/user/button/btn_shingo.gif" border="0"></a> 
                                          <a href="index_c.htm"><img src="../../images/user/button/btn_cancel.gif" width="45" height="21" border="0"></a> 
                                        </td>
                                      </tr>
                                    </table>
								  </td>
                                </tr>
                                <tr>
                                  <td height="10" align="center" valign="top"></td>
                                </tr>
                              </table>
							</td>
                          </tr>
                          <tr>
                            <td height="100" valign="bottom" background="../../images/community/bg_left2.gif" style="padding-left:5px">&nbsp; 
                            </td>
                          </tr>
                        </table>
						<!-- footer table -->
                        <table width="860" border="0" cellspacing="0" cellpadding="0">
						  <tr> 
							<td><img src="/images/community/footer_top.gif"></td>
						  </tr>
						  <tr> 
							<td height="28" align="center" bgcolor="F0F2F0">
								<%if(s_grtype.equals("KOCCA")){%><img src="/images/user/kocca/community/footer_copy.gif">
								<%}else if(s_grtype.equals("KGDI")){%><img src="/images/user/game/community/footer_copy.gif"><%}%>
							</td>
						  </tr>
						</table>
					  </td>
                    </tr>
                  </table>
				</td>
              </tr>
            </table>
		  </td>
        </tr>
     </table>
	</td>
  </tr>
</table>




</body>
</html>
