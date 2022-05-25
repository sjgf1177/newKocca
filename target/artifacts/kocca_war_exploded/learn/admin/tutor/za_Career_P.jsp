<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    DataBox careerprint=(DataBox)request.getAttribute("careerprint");
    ArrayList careerlist=(ArrayList)request.getAttribute("careerlist");

    String ss_onoffline = box.getString("p_onoffline");
    if(ss_onoffline.equals(""))
        ss_onoffline="on";

    Date today = new Date();
    Calendar nowCalendar = Calendar.getInstance();
    nowCalendar.setTime(today);// ���÷� ����.
    String year=Integer.toString(nowCalendar.get(Calendar.YEAR));
    String month=Integer.toString(nowCalendar.get(Calendar.MONTH)+1);
    String day=Integer.toString(nowCalendar.get(Calendar.DATE));

    String title="";
    String title1="";
    String title2="";
    if(ss_onoffline.equals("on"))
    {
        title="Ʃ �� �� �� �� �� ��";
        title1="Ʃ&nbsp; ��&nbsp; ��&nbsp; ��";
        title2="���� ���� �̷��� ������";
    }
    else
    {
        title="�� �� �� �� �� �� ��";
        title1="��&nbsp; ��&nbsp; ��&nbsp; ��";
        title2="���� ���� �����Ͽ����� ������";
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<title>���ǰ������</title>
<STYLE type="text/css">
<!--
P.HStyle0, LI.HStyle0, DIV.HStyle0
	{style-name:"������"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle0, LI.HStyle0, DIV.HStyle0
	{style-name:"������"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle1, LI.HStyle1, DIV.HStyle1
	{style-name:"����"; margin-left:15.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle2, LI.HStyle2, DIV.HStyle2
	{style-name:"���� 1"; margin-left:10.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle3, LI.HStyle3, DIV.HStyle3
	{style-name:"���� 2"; margin-left:20.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle4, LI.HStyle4, DIV.HStyle4
	{style-name:"���� 3"; margin-left:30.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle5, LI.HStyle5, DIV.HStyle5
	{style-name:"���� 4"; margin-left:40.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle6, LI.HStyle6, DIV.HStyle6
	{style-name:"���� 5"; margin-left:50.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle7, LI.HStyle7, DIV.HStyle7
	{style-name:"���� 6"; margin-left:60.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle8, LI.HStyle8, DIV.HStyle8
	{style-name:"���� 7"; margin-left:70.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle9, LI.HStyle9, DIV.HStyle9
	{style-name:"�� ��ȣ"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle10, LI.HStyle10, DIV.HStyle10
	{style-name:"�Ӹ���"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:150%; font-size:9.0pt; font-family:"����"; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle11, LI.HStyle11, DIV.HStyle11
	{style-name:"����"; margin-left:13.1pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:"����"; letter-spacing:0.5pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle12, LI.HStyle12, DIV.HStyle12
	{style-name:"����"; margin-left:13.1pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:"����"; letter-spacing:0.5pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle13, LI.HStyle13, DIV.HStyle13
	{style-name:"�޸�"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:9.0pt; font-family:"����"; letter-spacing:0.5pt; font-weight:normal; font-style:normal; color:#000000;}

#Layer1 {
	position:relative;
    left:450px;
	top:-85px;
	width:105px;
	z-index:-1;
}
-->
</STYLE>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function(){
        var r=ScriptEngineMinorVersion();
        if(r==6) //ie8������ ���� ��� �ǳ� 6������ ������ ��µǾ� ������ ������
            $(".a1a").remove();
    });
    function ScriptEngineMinorVersion(){
        if( navigator.appName.indexOf("Microsoft") > -1 ){         // ���ͳ� �ͽ��÷η����� Ȯ��
           if( navigator.appVersion.indexOf("MSIE 6") > -1)       // �ͽ��÷η��̸� ���� 6���� Ȯ��
               return 6
           else if(navigator.appVersion.indexOf("MSIE 7") > -1)  // �ͽ� �÷η��̸� ���� 7���� Ȯ��
               return 7
            else if(navigator.appVersion.indexOf("MSIE 8") > -1)  // �ͽ� �÷η��̸� ���� 7���� Ȯ��
               return 8
       }else                                                      // �ͽ��÷η��� �ƴ� ���
          return 0;
     }
</script>
</head>
<body onload="this.print();self.close();">

<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;'><SPAN STYLE='font-size:20.0pt;font-family:"����ü";font-weight:bold;text-decoration:underline;line-height:160%;'><%=title%></SPAN></P>
<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><BR></SPAN></P>
<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;'>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<TR>
	<TD rowspan="2" width="106" height="57" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>��&nbsp;&nbsp;&nbsp; ��</SPAN></P>
	</TD>
	<TD width="72" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>�ѱ�</SPAN></P>
	</TD>
	<TD width="113" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=careerprint.getString("d_name")%></SPAN></P>
	</TD>
	<TD rowspan="2" colspan="2" width="132" height="57" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>�ֹε�Ϲ�ȣ</SPAN></P>
	</TD>
	<TD rowspan="2" width="212" height="57" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%= !careerprint.getString("d_resno").equals("") ? careerprint.getString("d_resno").substring(0,6)+"-"+careerprint.getString("d_resno").substring(6):"" %></SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="72" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD width="113" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'></SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="106" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>��&nbsp;&nbsp;&nbsp; ��</SPAN></P>
	</TD>
	<TD colspan="5" width="529" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:left;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=careerprint.getString("d_add1")%>&nbsp;<%=careerprint.getString("d_add2")%></SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="106" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>��&nbsp;&nbsp;&nbsp; ��</SPAN></P>
	</TD>
	<TD colspan="3" width="212" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=careerprint.getString("d_comp")%></SPAN></P>
	</TD>
	<TD width="106" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>��&nbsp; ��</SPAN></P>
	</TD>
	<TD width="212" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=careerprint.getString("d_jiknm")%></SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="106" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>�� �� ó</SPAN></P>
	</TD>
	<TD colspan="3" width="212" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=careerprint.getString("d_handphone")%></SPAN></P>
	</TD>
	<TD width="106" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>E-mail</SPAN></P>
	</TD>
	<TD width="212" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=careerprint.getString("d_email")%></SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="106" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>�����о�</SPAN></P>
	</TD>
	<TD colspan="3" width="212" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=careerprint.getString("d_professional")%></SPAN></P>
	</TD>
	<TD width="106" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>���κо�</SPAN></P>
	</TD>
	<TD width="212" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=careerprint.getString("d_major")%></SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="6" width="635" height="29" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=title1%></SPAN></P>
	</TD>
</TR>
<TR>
	<TD colspan="6" width="97%" valign="top" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'>
        <TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;' width="100%">
            <TR>
                <TD width="34" height="36" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
                    <P CLASS=HStyle0 STYLE='text-align:center;line-height:120%;'><SPAN STYLE='font-family:"����";'>����</SPAN></P>
                </TD>
                <TD width="42" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
                    <P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;line-height:120%;'><SPAN STYLE='font-family:"����";'>����</SPAN></P>
                </TD>
                <TD width="120" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
                    <P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;line-height:120%;'><SPAN STYLE='font-family:"����";'>��������</SPAN></P>
                </TD>
                <TD height="36" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
                    <P CLASS=HStyle0 STYLE='text-align:center;line-height:120%;'><SPAN STYLE='font-family:"����";'>������</SPAN></P>
                </TD>
                <TD width="220" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
                    <P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-family:"����";'>���¸�</SPAN></P>
                </TD>
                <TD width="55" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
                    <P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;line-height:100%;'><SPAN STYLE='font-family:"����";'>���ǽð�</SPAN></P>
                </TD>
            </TR>
            <% if(careerlist.size()>0){
                for(int i=0;i<careerlist.size();i++)
                {
                    DataBox tmp=(DataBox)careerlist.get(i);
                    String dt="";
                    if(!tmp.getString("d_min_dt").equals("") && !tmp.getString("d_max_dt").equals(""))
                        dt=tmp.getString("d_min_dt").substring(4,6)+"."+tmp.getString("d_min_dt").substring(6,8)+ "~"+tmp.getString("d_max_dt").substring(4,6)+"."+tmp.getString("d_max_dt").substring(6,8);

                    out.print("<tr>");
                    out.print("<td valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
                    out.print("<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-family:����;'>"+(i+1)+"</SPAN></P>");
                    out.print("</td>");

                    out.print("<td valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
                    out.print("<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;'><SPAN STYLE='font-family:����;'>"+tmp.getString("d_year")+"</SPAN></P>");
                    out.print("</td>");

                    out.print("<td valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
                    out.print("<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;'><SPAN STYLE='font-family:����;'>"+dt+"</SPAN></P>");
                    out.print("</td>");

                    out.print("<td align='left' valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
                    out.print("<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-family:����;'>"+tmp.getString("d_sub_title")+"</SPAN></P>");
                    out.print("</td>");

                    out.print("<td align='left' valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
                    out.print("<P CLASS=HStyle0><SPAN STYLE='font-family:����;'>"+tmp.getString("d_sub_content")+"</SPAN></P>");
                    out.print("</td>");

                    out.print("<td valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
                    out.print("<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-family:����;'>"+tmp.getString("d_time1")+"</SPAN></P>");
                    out.print("</td>");

                    out.print("</tr>");
                }
            } %>
        </TABLE>
    </td>
</tr>
</table>
<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;line-height:130%;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:130%;'><BR></SPAN></P>
<P CLASS=HStyle0><BR></P>
<P CLASS=HStyle0><BR></P>
<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=title2%></SPAN></P>
<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;'><SPAN STYLE='font-family:"����ü";'><BR></SPAN></P>
<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><%=year%>.&nbsp; <%=month%>. <%=day%></SPAN></P>
<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><BR></SPAN></P>
<P CLASS=HStyle0 STYLE='margin-bottom:4.0pt;text-align:center;'><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><BR></SPAN></P>
</body>
</html>