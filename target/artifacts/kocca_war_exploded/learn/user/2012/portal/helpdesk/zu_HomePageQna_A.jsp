
<%	
    DataBox Ansbox        = (DataBox)request.getAttribute("selectAns");
    
	String v_anstitle      = "";
	String v_anscontents   = "";
	String v_ansinuserid   = "";
	String v_ansindate     = "";
	String v_ansname       = "";
	String v_anscategorynm = "";
	
	
	if(Ansbox != null) {
	    v_ansinuserid          = Ansbox.getString("d_inuserid");
	    v_ansname              = Ansbox.getString("d_name");
	    v_ansindate            = Ansbox.getString("d_indate");
	    v_anstitle             = Ansbox.getString("d_title");
	    v_anscontents          = Ansbox.getString("d_contents");
	    v_anscategorynm        = Ansbox.getString("d_categorynm");
	    
	}

%>
	<div class="viewanswer" id="skip02">
			<table class="answer" cellpadding="0" cellspacing="0">
				<colgroup><col width="70"><col width="*"></colgroup>
				<tr>
					<th>
						<h2>Answer</h2>
						<h6><%= FormatDate.getFormatDate(v_ansindate, "yyyy.MM.dd") %></h6>
					</th>
					<td>
						<b><%= v_anstitle %></b><br>
						<br>
						<%=v_anscontents%>
					</td>
					<td></td>
				</tr>
			</table>
		
        	
            <!-- ����÷�� ���� -->
            <%
                i_realfileVector    = (Vector)Ansbox.getObject("d_realfile");        // ���� ���ϸ�
                i_savefileVector    = (Vector)Ansbox.getObject("d_savefile");        // ���� ���ϸ�
                i_boardStyle        = "board_view";                                // ���� ��Ÿ��
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_2012_R.jsp" %>
            <!-- ����÷�� ����-->
		
		 </div>