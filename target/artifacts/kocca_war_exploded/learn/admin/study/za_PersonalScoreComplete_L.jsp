<%
//**********************************************************
//  1. ��      ��: PERSONAL SELECT LIST
//  2. ���α׷��� : za_PersonalScoreComplete_L.jsp
//  3. ��      ��: ���� �����̼���Ȳ ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 31
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%
    //DEFINED class&variable START
    String v_jikwiname	        = "";
    String v_duty_yn          = "";
    int    v_required_cnt     = 0;
    int    v_required_score   = 0;
    int    v_choice_score     = 0;
    int    v_total_score      = 0;

    int     i            = 0;
    ArrayList list2      = null;
    //DEFINED class&variable END
    list2 = (ArrayList)request.getAttribute("PersonalScoreCompleteList");
%>
 <br>
                        <table class="box_table_out" cellspacing="1" cellpadding="5">
                          <tr>
                            <td colspan="6" class="table_top_line"></td>
                          </tr>
                          <tr>
                            <td class="table_title">����</td>
                            <td class="table_title">�ǹ��������Ῡ��</td>
                            <td class="table_title">�ʼ��������ᰳ��</td>
                            <td class="table_title">�ʼ�</td>
                            <td class="table_title">����</td>
                            <td class="table_title">��</td>
                          </tr>
<%
        for(i = 0; i < list2.size(); i++) {
            DataBox dbox = (DataBox)list2.get(i);

            v_jikwiname      = dbox.getString("d_jikwinm");
            v_duty_yn        = dbox.getString("d_duty_yn");
            v_required_cnt   = dbox.getInt("d_required_cnt");
            v_required_score = dbox.getInt("d_required_score");
            v_choice_score   = dbox.getInt("d_choice_score");
            v_total_score    = v_required_score + v_choice_score;
%>
                          <tr>
                            <td class="table_02_1"><%=v_jikwiname%></td>
                            <td class="table_02_1"><%=v_duty_yn%></td>
                            <td class="table_02_1"><%=v_required_cnt%></td>
                            <td class="table_02_1"><%=v_required_score%></td>
                            <td class="table_02_1"><%=v_choice_score%></td>
                            <td class="table_02_1"><%=v_total_score%></td>
                          </tr>
<%
        }

        if(i == 0){ %>
              <tr>
                <td class="table_02_1" colspan="6">��ϵ� ������ �����ϴ�</td>
              </tr>
<%
		}
%>
                        </table>

                        <table>
                          <tr>
                            <td height="5"></td>
                          </tr>
                        </table>