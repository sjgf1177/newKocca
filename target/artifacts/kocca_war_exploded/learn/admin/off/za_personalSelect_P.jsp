<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%!
    private final String NULL = "";
    private String chkAcceptResult(ArrayList<DataBox> acceptResultList, String p_acceptResult) {
//      if(p_acceptResult.length() == 2 && (p_acceptResult.charAt(0) == 'N' || p_acceptResult.charAt(1) == 'Y' || p_acceptResult.charAt(1) == 'N')) {
//      if(p_acceptResult.length() == 2 && (p_acceptResult.charAt(0) == 'N' || p_acceptResult.charAt(1) == 'N')) {
            return SelectBoxBean.getSelectedString(acceptResultList, "p_acceptResult", p_acceptResult, NULL);
//      }
//      else
//          return SelectBoxBean.getSelectBoxString(acceptResultList, "p_acceptResult", p_acceptResult, NULL);
    }
%>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    DataBox dbox = (DataBox)request.getAttribute("resultbox");
    List<DataBox> schoolList = (List<DataBox>) dbox.getObject("schoolList");
    List<DataBox> licenseList = (List<DataBox>) dbox.getObject("licenseList");
    List<DataBox> careerList = (List<DataBox>) dbox.getObject("careerList");

    //DEFINED in relation to select END
    //��û�̷� ���
    ArrayList list      = null;
    ArrayList<DataBox> acceptResultList = null;

    list = (ArrayList)request.getAttribute("resultList");
    acceptResultList = (ArrayList<DataBox>) request.getAttribute("acceptResultList");
    //��û�̷� ���     ��

    String needinput = dbox.get("d_needinput", "10000010000");
    String[]hp = new String[3];
    int index = 0;
    StringTokenizer st = new StringTokenizer(dbox.get("d_handphone"), "-");
    while(st.hasMoreTokens()) {
        hp[index++] = st.nextToken();
    }

    if (box == null) box = RequestManager.getBox(request);
    int i = 0;
    char[]token = needinput.toCharArray();//"11111111111111".toCharArray();//
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=euc-kr">
<TITLE>���������� ���</TITLE>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
    <style type="text/css">
        table tbody td {font:12px '����',dotum,AppleGothic,sans-serif;line-height:20px
        }
    </style>
</head>
<body onload="window.print();">
    <table border="1" cellpadding="0" cellspacing="0" width="98%" style="margin-left:5px;margin-right:5px;margin-top:5px">
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding:10 10 10 10;">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="font-size:20.0pt;font-family:'����ü';font-weight:bold;line-height:160%;text-align:center;">��&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;��</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                        <tr>
                                            <td width="120px">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border:1 solid #cdcdcd">
                                                    <tr>
                                                        <td align="center"><img src="<%=dbox.getString("d_img_path")%>" alt="����"  width="118" height="154"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="10px"></td>
                                            <td>
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border:1 solid #cdcdcd">
                                                    <tr>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td >
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="60px" align="center" style="line-height:25px;border-bottom:1 solid #cdcdcd;border-right:1 solid #cdcdcd">����</td>
                                                                                <td width="80px" align="center" style="border-bottom:1 solid #cdcdcd;border-right:1 solid #cdcdcd"><%= dbox.get("d_name") %></td>
                                                                                <td width="80px" align="center" style="border-bottom:1 solid #cdcdcd;border-right:1 solid #cdcdcd">�޴���</td>
                                                                                <td align="left" style="border-bottom:1 solid #cdcdcd;padding-left:5px"><%= hp[0] == null ? "" : hp[0] %>-<%= hp[1] == null ? "" : hp[1] %>-<%= hp[2] == null ? "" : hp[2] %></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="60px"  align="center" style="line-height:25px;border-bottom:1 solid #cdcdcd;border-right:1 solid #cdcdcd">�ֹι�ȣ</td>
                                                                                <td width="100px" align="center" style="border-bottom:1 solid #cdcdcd;border-right:1 solid #cdcdcd">
                                                                                    <%if(!dbox.getString("d_resno").equals("")){ %>
                                                                                    <%= dbox.getString("d_resno").substring(0,6) %>-<%= dbox.getString("d_resno").substring(6,13) %>
                                                                                    <%}else{ %>
                                                                                    &nbsp;
                                                                                    <%} %>
                                                                                </td>
                                                                                <td width="60px"  align="center" style="border-bottom:1 solid #cdcdcd;border-right:1 solid #cdcdcd">E-Mail</td>
                                                                                <td style="border-bottom:1 solid #cdcdcd;padding-left:5px"><%= dbox.get("d_email") %></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="60px" align="center" style="border-bottom:1 solid #cdcdcd;border-right:1 solid #cdcdcd">�����</td>
                                                                                <td style="border-bottom:1 solid #cdcdcd;padding-left:5px"><%= dbox.getString("d_comptext") %></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="60px"  align="center" style="line-height:25px;border-right:1 solid #cdcdcd">���ּ�</td>
                                                                                <td style="padding-left:5px"><%=dbox.getString("d_addr")%> </td>
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
                            <tr>
                                <td height="15px"></td>
                            </tr>
                            <tr>
                                <td><b>1. ��»���</b></td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;padding-right:15px">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border:1 solid #cdcdcd;text-align:center;">
                                        <tr>
                                            <td width="120px" style="border-right:1 solid #cdcdcd">����</td>
                                            <td width="60px" style="border-right:1 solid #cdcdcd">����</td>
                                            <td style="border-right:1 solid #cdcdcd">ȸ���</td>
                                            <td width="120px" style="border-right:1 solid #cdcdcd">����/����</td>
                                            <td width="80px" style="border-right:1 solid #cdcdcd">�����Ⱓ</td>
                                            <td width="60px">��������</td>
                                        </tr>
                                        <%   String style="style='border-right:1 solid #cdcdcd'";
                                            for(DataBox careerListbox : careerList) { %>
                                            <tr id="workinfo<%= careerListbox.get("d_seq") %>">
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd"><%= careerListbox.get("d_jikup") %></td>
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd"><%= careerListbox.get("d_jikjong") %></td>
                                                <td align="left" style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd;padding-left:5px"><%= careerListbox.get("d_officename") %></td>
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd"><%= careerListbox.get("d_position") %></td>
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd"><%= careerListbox.get("d_workstart") %><br><%= careerListbox.getStringDefault("d_workend","����") %></td>
                                                <td style="border-top:1 solid #cdcdcd"><%= careerListbox.get("d_workstatus") %></td>
                                            </tr>
                                        <%  } %>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="15px"></td>
                            </tr>
                            <tr>
                                <td><b>2. ��������</b></td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;padding-right:15px">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border:1 solid #cdcdcd;text-align:center;">
                                        <tr>
                                            <td style="border-right:1 solid #cdcdcd" >�б���</td>
                                            <td style="border-right:1 solid #cdcdcd" width="70px">��������</td>
                                            <td style="border-right:1 solid #cdcdcd" width="140px">���бⰣ</td>
                                            <td style="border-right:1 solid #cdcdcd" width="120px">�а�/����</td>
                                            <td width="60px">������</td>
                                        </tr>
                                        <%  for(DataBox schoolListBox : schoolList) { %>
                                            <tr id="study<%= schoolListBox.get("d_seq") %>">
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd;padding-left:5px" align="left"><%= schoolListBox.get("d_schoolname") %></td>
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd"><%= schoolListBox.get("d_statusnm") %></td>
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd"><%= schoolListBox.get("d_sstart") %>~<%= schoolListBox.get("d_send") %></td>
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd"><%= schoolListBox.get("d_major") %></td>
                                                <td style="border-top:1 solid #cdcdcd"><%= schoolListBox.get("d_place") %></td>
                                            </tr>
                                        <%  } %>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="15px"></td>
                            </tr>
                            <tr>
                                <td><b>3. �ڰ���</b></td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;padding-right:15px">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border:1 solid #cdcdcd;text-align:center;">
                                        <tr>
                                            <td style="border-right:1 solid #cdcdcd;">�ڰ�����</td>
                                            <td style="border-right:1 solid #cdcdcd">�����</td>
                                            <td>����ó</td>
                                        </tr>
                                        <%  for(DataBox licenseListBox : licenseList) { %>
                                            <tr id="license<%= licenseListBox.get("d_seq") %>">
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd"><%= licenseListBox.get("d_licensename") %></td>
                                                <td style="border-right:1 solid #cdcdcd;border-top:1 solid #cdcdcd"><%= licenseListBox.get("d_getdate") %></td>
                                                <td style="border-top:1 solid #cdcdcd"><%= licenseListBox.get("d_publish") %></td>
                                            </tr>
                                        <%  } %>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="15px"></td>
                            </tr>
                            <tr>
                                <td><b>4. �ڱ�Ұ���(��»���)</b></td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;padding-right:15px">
                                    <%= dbox.get("d_intro").replace("\n","<BR>") %>
                                </td>
                            </tr>
                            <tr>
                                <td height="15px"></td>
                            </tr>
                            <tr>
                                <td><b>5. ��������</b></td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;padding-right:15px">
                                    <%= dbox.get("d_motive").replace("\n","<BR>") %>
                                </td>
                            </tr>

                            <tr>
                                <td height="15px"></td>
                            </tr>

                            <tr>
                                <td><b>6. ��û�̷�</b></td>
                            </tr>
                            <tr>
                                <td style="padding-left:15px;padding-right:15px">

                                  <style>
                                   table.register { border-collapse:collapse; width:100%; }
                                   table.register td { text-align:center; paddig:6px 0px 6px 0px; font-family:"gulim","sans-serif"; font-size:12px; color:#323232; border:1px solid #cdcdcd; }
                                  </style>
                                  <table class="register" cellpadding="0" cellspacing="0">
                                    <colgroup>
                                        <col width="30">
                                        <col width="55">
                                        <col width="*">
                                        <col width="55">
                                        <col width="55">
                                        <col width="110">
                                        <col width="90">
                                    </colgroup>
                                    <tr>
                                        <td>NO</td>
                                        <td>��������</td>
                                        <td>������</td>
                                        <td>��������</td>
                                        <td>���λ���</td>
                                        <td>��û�� </td>
                                        <td>�������� </td>
                                    </tr>


                            <%  if(list!= null){
                                DataBox data = null;
                                String acceptResult = null;
                                String v_paymethod = null;
                                String v_cancel_btn = null;
                                String v_tid = null;
                                String v_resultcode = null;
                                for (int j=0; j<list.size(); j++) {
                                    data  = (DataBox)list.get(j);
                            %>
                                    <tr >
                                        <td><%=String.valueOf(j+1)%></td>
                                        <td><%=data.get("d_year") %></td>
                                        <td><%=data.get("d_subjnm") %></td>
                                        <td><%=data.get("d_subjseq") %></td>
                                        <% if(data.get("d_chkstatus").length() == 2 && data.get("d_chkstatus").charAt(1) == 'Y') { %>
                                            <td>
                                        <% } else { %>
                                            <td>
                                        <% } %>
                                            <%=chkAcceptResult(acceptResultList, data.get("d_chkstatus")) %>
                                        </td>
                                        <td><%=data.getDate("d_appdate") %> <%= data.getHour("d_appdate") %>:<%= data.getMinute("d_appdate") %></td>
                                        <td><%=data.get("d_resultcode") %></td>
                                    </tr>
                            <%  } %>

                                    <% if (list.size()==0) {%>
                                        <tr><td colspan=7>�˻��� ����� �����ϴ�.</td></tr>
                                    <% } %>
                            <%} %>
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
