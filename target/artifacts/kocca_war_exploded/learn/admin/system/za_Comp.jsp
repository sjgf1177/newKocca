<%

    String group   = "";    // �׷��ڵ�
    String company = "";    // ȸ���ڵ�
    String gpm     = "";    // ������ڵ�
    String dept    = "";    // �μ��ڵ�
    String jikup   = "";    // �����ڵ�
    String jikun   = "";    // �����ڵ�

    group   = "01";
    company = box.getString("company");
    gpm     = box.getString("gpm");
    dept    = box.getString("dept");
    jikup   = box.getString("jikup");
    jikun   = box.getString("jikun");

%>

                    <table class="form_table" width="99%" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td>
                          <input type='hidden' name = 'group' value='<%=group%>'>
                          ȸ��
                          <%=CompAdminBean.getCompanySelect (group, company)%>
                          &nbsp;&nbsp;�����
                          <%=CompAdminBean.getGpmSelect (group, company, gpm)%>
                          &nbsp;&nbsp;�μ�
                          <%=CompAdminBean.getDeptSelect (group, company, gpm, dept)%>
                          &nbsp;&nbsp;����
                          <%=CompAdminBean.getJikupSelect (jikup) %>
                          &nbsp;&nbsp;����
                          <%=CompAdminBean.getJikunSelect (jikun) %>
                        </td>
                      </tr>
                    </table>

<SCRIPT LANGUAGE="JavaScript">
<!--

    function companyChange() {

         document.<%=v_form%>.action = "<%=v_action%>";
         document.<%=v_form%>.gpm.value = '';
         document.<%=v_form%>.p_process.value = "selectPre";
         document.<%=v_form%>.submit();
    }

    function gpmChange() {

         document.<%=v_form%>.action = "<%=v_action%>";
         document.<%=v_form%>.p_process.value = "selectPre";
         document.<%=v_form%>.submit();
    }


//-->
</SCRIPT>

