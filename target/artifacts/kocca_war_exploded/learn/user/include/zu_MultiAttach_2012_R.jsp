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
	
	String sFileExt ="";
	String imgExt ="";
    String v_tabseqche = box.getStringDefault("p_tabseq", "0000");
%>
			<ul class="fileload">
            <%{
                int i_fileCnt = i_realfileVector != null ? i_realfileVector.size() : 0 ; 
           		if( i_realfileVector != null && i_realfileVector.size() > 0) { 
            		if(i_realfileVector != null && !i_realfileVector.equals("") ){
            			if(!v_tabseqche.equals("2262")){
							for(int i_i = 0; i_i < i_realfileVector.size(); i_i++) {      //     ÷������ ������ ����
		                        String v_realfile = (String)i_realfileVector.elementAt(i_i);
	    	                    String v_savefile = (String)i_savefileVector.elementAt(i_i);      
	
	        	                if(v_realfile != null && !v_realfile.equals("")) { 
	            	            	sFileExt = 	v_savefile.substring(v_savefile.lastIndexOf(".")+1);
	
	            	            	if (sFileExt.equals("hwp")) {
	                        			imgExt = "<img src='/images/2012/common/icon/icon_hwp.gif' id='exticon' align='absmiddle' alt='�ѱ۹���'>";
	                        		} else if (sFileExt.equals("doc")) {
		                        		imgExt = "<img src='/images/2012/common/icon/icon_doc.gif' id='exticon' align='absmiddle' alt='���幮��'>";
	    	                    	} else if (sFileExt.equals("ppt")) {
	        	                		imgExt = "<img src='/images/2012/common/icon/icon_ppt.gif' id='exticon' align='absmiddle' alt='���������̼�'>";
	            	            	} else if (sFileExt.equals("xls")) {
	                	        		imgExt = "<img src='/images/2012/common/icon/icon_xls.gif' id='exticon' align='absmiddle' alt='����'>";
	                    	    	} else {
	                        			imgExt = "<img src='/images/2012/common/icon/icon_idk.gif' id='exticon' align='absmiddle' alt='�� �� ���� ��������'>";
	                        		}%>
					<li><%=imgExt%><a href='http://edu.kocca.or.kr/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a></li>
	                <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
		                    	<%}
							}
            			}else{
            				for(int i_i = 1; i_i < i_realfileVector.size(); i_i++) {      //     ÷������ ������ ����
		                        String v_realfile = (String)i_realfileVector.elementAt(i_i);
	    	                    String v_savefile = (String)i_savefileVector.elementAt(i_i);      
	
	        	                if(v_realfile != null && !v_realfile.equals("")) { 
	            	            	sFileExt = 	v_savefile.substring(v_savefile.lastIndexOf(".")+1);
	
	            	            	if (sFileExt.equals("hwp")) {
	                        			imgExt = "<img src='/images/2012/common/icon/icon_hwp.gif' id='exticon' align='absmiddle' alt='�ѱ۹���'>";
	                        		} else if (sFileExt.equals("doc")) {
		                        		imgExt = "<img src='/images/2012/common/icon/icon_doc.gif' id='exticon' align='absmiddle' alt='���幮��'>";
	    	                    	} else if (sFileExt.equals("ppt")) {
	        	                		imgExt = "<img src='/images/2012/common/icon/icon_ppt.gif' id='exticon' align='absmiddle' alt='���������̼�'>";
	            	            	} else if (sFileExt.equals("xls")) {
	                	        		imgExt = "<img src='/images/2012/common/icon/icon_xls.gif' id='exticon' align='absmiddle' alt='����'>";
	                    	    	} else {
	                        			imgExt = "<img src='/images/2012/common/icon/icon_idk.gif' id='exticon' align='absmiddle' alt='�� �� ���� ��������'>";
	                        		}%>
					<li><%=imgExt%><a href='http://edu.kocca.or.kr/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a></li>
	                <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
		                    	<%}
							}
            			}
					}   
				}
			}
		}%>
 		</ul> 
 