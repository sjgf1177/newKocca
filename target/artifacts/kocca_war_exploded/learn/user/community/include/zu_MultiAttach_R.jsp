<%
    /**************************************************************************
     * �� ������ include�� ���, include�ϴ� ���Ͽ��� ���� �������� ����/�����ؾ� �Ѵ�.
     *Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
     *Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
     *Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ
     *
     **************************************************************************/
%> 
<script type='text/javascript' src='/script/portal/prototype-1.6.0.2.js'></script>
<script language="JavaScript">

	function multiAttachInit(){
	    
	    var url     = "/servlet/controller.community.CommunityMultiAttachServlet";
	    var pars  = "p_process=selectList"
	              + "&p_cmuno=" + encodeURIComponent("<%=v_cmuno%>")
	              + "&p_menuno=" + encodeURIComponent("<%=v_menuno%>")
	              + "&p_brdno=" + encodeURIComponent("<%=v_brdno%>");
	
	    new Ajax.Updater({success: 'multiAttach_div'}, url, {method : 'post', parameters : pars, onFailure: reportError});    
	}

	function reportError(e) {
	    alert(e);
	}

</script>
            <tr>
                <th class="bgn">÷������</th>
                <td class="bgn" colspan="5">
                    <div id="multiAttach_div"></div>
                </td>
            </tr>

<script language="JavaScript">
    multiAttachInit();
</script>

 
                    