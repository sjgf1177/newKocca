<%
/**
 * @@�� �� : ClubSearch.jsp - Ŀ�´�Ƽ�˻�
 * @@�� �� : Ŀ�´�Ƽ �˻� (ī�װ���, Ŀ�´�Ƽ�� �� Ŀ�´�Ƽ �˻���� �˻�) - �˻���� ����Ʈ ��� 
 * @@Copyright: Copyright (c) 2003
 * @@Company:(��)��������Ʈ 
 * @@�ۼ���: �̻��
 **/
%>

<%@ page contentType="text/html; charset=euc-kr" %>						
                        
                        
<script language="JavaScript" src="<%= Path.JsURL %>cafe_lib.js"></script>   
<FORM name="frmClubSearch" method="post" action="/community/home/clubhome/ClubSearch.dsh">
<INPUT type="hidden" name="sNum" value="">
                        <TABLE cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr height="36">
								<td bgcolor="F5F5E7" style="BORDER-TOP:#EDEDED 1px solid;BORDER-BOTTOM:#EDEDED 1px SOLID">
								<form>
								<TABLE cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td width="152"><IMG src="/images/common/search_community.gif" border="0"></td>
										<td style="padding-left:6">
										<select style="font-size:9pt;color:666666">
										<option>��ī�װ�</option>
										</select>
										<select style="font-size:9pt;color:666666">
										<option>��ī�װ�</option>
										</select>
										</td>
										<td style="padding-left:6"><input type="text" style="width:188" class="input"></td>
										<td style="padding-left:6"><A HREF="#"><IMG src="/images/common/bt_p_search.gif" border="0"></A></td>
									</tr>
								</TABLE>
								</form>
                                </td>
							</tr>
						</TABLE>
<%@ include file="/community/home/include/DBConnection.jsp" %>

<%
	Category cate = new Category("01");
%>


                  <!--�˻�â input ���� ���� -->
                  <table cellpadding=0 cellspacing=0 border=0>
                    <form>
                      <tr> 
                        <td height=28 align=right><img src="/img/main/search_commu.gif" border=0 align=absmiddle></td>
                        <td style="padding-left:5px">
							<%=cate.getCodeCombo(conn,"frmClubSearch",90)%>
						</td>
                        <td align="left"  style="padding-left:5px">
                            <input type=text class="ece9e7" name="CName" size=25 maxlength=100 style="width:300;ime-mode:active;">
                        </td>
                        <td  style="padding-left:5px"><a href="JavaScript:frmClubSearch.submit();">
                        <img src="/img/main/search_icon.gif" alt="Ŀ�´�Ƽ �˻�" border=0 align=absmiddle></a></td>
                      </tr>
                    </form>
                  </table>
				  </form>
				  <!--�˻�â input ���� �� -->

<%@ include file="/community/home/include/DBtail.jsp" %>

