<%@ page contentType = "text/html;charset=euc-kr" %>
<%
    /**************************************************************************
     * �� ������ include�� ���, include�ϴ� ���Ͽ��� ���� �������� ����/�����ؾ� �Ѵ�.
     *Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
     *Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
     *Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ
     *String i_boardStyle        = "";                                          // ���� ��Ÿ��
     *
     **************************************************************************/
%> 

<%{
    
%>

            <% {
                int i_fileCnt = i_realfileVector != null ? i_realfileVector.size() : 0 ; %>

            <%  if( i_realfileVector != null && i_realfileVector.size() > 0) { %>
            <%if( box.getSession("tem_grcode").equals("N000001")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            	<%if(i_realfileVector != null && !i_realfileVector.equals("") ){ %>
            		<tr>
						<td class="tit_table" width="150px">÷������</td>
						<td colspan="7" class="ct_tit_table_lright">
							 <%      for(int i_i = 0; i_i < i_realfileVector.size(); i_i++) {      //     ÷������ ������ ����
            
                        String v_realfile = (String)i_realfileVector.elementAt(i_i);
                        String v_savefile = (String)i_savefileVector.elementAt(i_i);      

                        if(v_realfile != null && !v_realfile.equals("")) {  %>
                        
	                    <img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6 va_t" />
	                    <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a>
	                    <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
	                    
	                    <%              }   
                        }  %>
						</td>
					  </tr>
					  <tr>
			          	<td height="1" colspan="8" bgcolor="CACACA"></td>
			          </tr>
			          <tr>
			          	<td height="4" colspan="8" bgcolor="F7F7F7"></td>
			          </tr>
					  <%} %>
					  </table>
            <%}else{ %>
            <table class="<%=i_boardStyle %> bo_tn">
            <colgroup><col width="65px" /><col width="625px" /></colgroup>
            <tr class="bgn">
                <th class="th">÷������</th>
                <td colspan="7" class="td pd_ln">
            <%      for(int i_i = 0; i_i < i_realfileVector.size(); i_i++) {      //     ÷������ ������ ����
            
                        String v_realfile = (String)i_realfileVector.elementAt(i_i);
                        String v_savefile = (String)i_savefileVector.elementAt(i_i);      

                        if(v_realfile != null && !v_realfile.equals("")) {  %>
                    <p>
                    <img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6 va_t" />
                    <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a>
                    <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
                    </p>
            <%              }   
                        }  %>
            
                </td>
            </tr>
            </table>
            <%} %>
            <input type = "hidden" name="p_upfilecnt"  value = "<%=i_fileCnt%>">
 <%        } } }%>
 