<%
    /**************************************************************************
     * �� ������ include�� ���, include�ϴ� ���Ͽ��� ���� �������� ����/�����ؾ� �Ѵ�.
     *Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
     *Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
     *Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ
     *
     **************************************************************************/
%> 

<%{ int i_fileCnt = i_realfileVector != null ? i_realfileVector.size() : 0 ; %>

            <%      
                    if( i_realfileVector != null ) { 
                        for(int i_i = 0; i_i < i_realfileVector.size(); i_i++) {      //     ÷������ ������ ����
            
                            String v_realfile = (String)i_realfileVector.elementAt(i_i);
                            String v_savefile = (String)i_savefileVector.elementAt(i_i);      

                            if(v_realfile != null && !v_realfile.equals("")) {  %>
                                &nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a><br>
                                <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
            <%              }   
                        }
                    }
            %>


 <input type = "hidden" name="p_upfilecnt"  value = "<%=i_fileCnt%>">
 
 <% } %>