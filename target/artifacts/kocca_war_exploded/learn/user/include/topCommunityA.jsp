                                             <!-- ����â ���̺� -->
                              <table width="162" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="50" align="center" valign="top" background="../../images/community/info_bg.jpg" class="tbl_bc"><%=s_username%>�� 
                                    �ȳ��ϼ���. </td>
                                </tr>
                                <tr> 
                                  <td height="10">&nbsp;</td>
                                </tr>
                              </table>
               <!-- ����Ŀ�´�Ƽ -->
               <table width="162" border="0" cellspacing="0" cellpadding="0">
                <tr><td><img src="/images/community/my_text.gif"></td></tr>
                <tr>
                 <td><select name="p_static_cmuno" onchange="javascript:uf_moveMyCommunity();"  style="width:150">
                      <option >:���� ������ Ŀ�´�Ƽ: </option>
                      <%=(new com.credu.community.CommunityIndexBean()).selectMyCuminity(s_userid,box.getString("p_static_cmuno"), s_grtype)%>
                    </select>
					<script language="JavaScript" type="text/JavaScript">
					//�����͹´�Ƽ Ȩ���� �̵�
					function uf_moveMyCommunity() {

						document.form1.action = "/servlet/controller.community.CommunityIndexServlet?p_cmuno="+document.form1.p_static_cmuno.value+"&p_static_cmuno="+document.form1.p_static_cmuno.value;
						document.form1.p_process.value = "selectmyindex";

						document.form1.submit();
					}
					//�����������������̵�
					function uf_comSendMail(userid) {
					   open_window('msPopNotice', '/servlet/controller.community.CommunityPopUpServlet?p_process=sendmailPage&p_static_cmuno='+document.form1.p_static_cmuno.value+'&p_cmuno='+document.form1.p_static_cmuno.value+'&p_parent_userid='+userid, 100, 100, 810, 480, 'no', 'no', 'no', 'no', 'no');
					  
					}

					//Ŀ�´�Ƽ ���� �������� �̵�
					function help_community(){
						open_window('help', '/servlet/controller.community.CommunityHelpServlet?p_process=pop_guide', 200, 200, 700, 465, 'yes', 'yes', 'yes', 'yes', 'yes');
					}
					//-->
					</script>
                 </td>
                </tr>
                <tr><td height="5"><img src="/images/community/my_line.gif"></td></tr>
                <tr><td height="10"></td></tr>
               </table>
               <!-- ��ư���̺� -->
               <table width="162" border="0" cellspacing="0" cellpadding="0">
                <tr><td><a href="/servlet/controller.community.CommunityCreateServlet?p_process=insertPage"><img src="/images/community/ban_make.gif" border="0"></a></td></tr>
                <tr><td height="5"></td></tr>
                <tr><td><a href="/servlet/controller.community.CommunityQnAServlet?p_process=selectlist&p_faq_type=CMUQNA"><img src="/images/community/ban_qna.gif" border="0"></a></td></tr>
                <!--tr><td height="5"></td></tr>
                <tr><td><a href="javascript:help_community();"><img src="/images/community/ban_help.gif" border="0"></a></td></tr-->
                <tr><td height="5"></td></tr>
                <tr><td><a href="/servlet/controller.community.CommunityFrPoliceServlet?p_process=movePage"><img src="/images/community/ban_singo.gif" border="0"></a></td></tr>
               </table>

