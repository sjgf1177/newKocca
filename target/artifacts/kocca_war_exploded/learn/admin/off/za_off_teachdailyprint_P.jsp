<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    ArrayList resultData=(ArrayList)request.getAttribute("resultData");
    DataBox box1=(DataBox)resultData.get(0);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META NAME="Generator" CONTENT="Haansoft HWP 7.5.11.600">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=euc-kr">
<TITLE>�Ʒ��������</TITLE>
<STYLE>
<!--
P.HStyle0, LI.HStyle0, DIV.HStyle0
	{style-name:"������"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle1, LI.HStyle1, DIV.HStyle1
	{style-name:"����"; margin-left:15.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle2, LI.HStyle2, DIV.HStyle2
	{style-name:"���� 1"; margin-left:10.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle3, LI.HStyle3, DIV.HStyle3
	{style-name:"���� 2"; margin-left:20.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle4, LI.HStyle4, DIV.HStyle4
	{style-name:"���� 3"; margin-left:30.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle5, LI.HStyle5, DIV.HStyle5
	{style-name:"���� 4"; margin-left:40.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle6, LI.HStyle6, DIV.HStyle6
	{style-name:"���� 5"; margin-left:50.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle7, LI.HStyle7, DIV.HStyle7
	{style-name:"���� 6"; margin-left:60.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle8, LI.HStyle8, DIV.HStyle8
	{style-name:"���� 7"; margin-left:70.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle9, LI.HStyle9, DIV.HStyle9
	{style-name:"�� ��ȣ"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle10, LI.HStyle10, DIV.HStyle10
	{style-name:"�Ӹ���"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:150%; font-size:9.0pt; font-family:'����'; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle11, LI.HStyle11, DIV.HStyle11
	{style-name:"����"; margin-left:13.1pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:'����'; letter-spacing:0.5pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle12, LI.HStyle12, DIV.HStyle12
	{style-name:"����"; margin-left:13.1pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:'����'; letter-spacing:0.5pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle13, LI.HStyle13, DIV.HStyle13
	{style-name:"�޸�"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:9.0pt; font-family:'����'; letter-spacing:0.5pt; font-weight:normal; font-style:normal; color:#000000;}
-->
</STYLE>
</HEAD>

<BODY onload="window.print()">

<P CLASS=HStyle0 STYLE='text-align:center;'>
<TABLE border="0" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<TR>
	<TD width="300" height="41" valign="middle" style='border-left:none;border-right:none;border-top:none;border-bottom:double #000000 1.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:20.0pt;font-family:"����ü";font-weight:bold;line-height:160%;'>��&nbsp;&nbsp; ��&nbsp;&nbsp; ��&nbsp;&nbsp; ��</SPAN></P>
	</TD>
</TR>
</TABLE></P>

<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'><BR></SPAN></P>

<P CLASS=HStyle0 STYLE='text-align:center;' >
<TABLE border="0" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;' width="100%">
<TR>
	<TD rowspan="2"  height="100" valign="middle" style='border-left:none;border-right:solid #000000 1.1pt;border-top:none;border-bottom:none;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <SPAN class='HStyle0' STYLE='font-size:12.0pt;font-family:"����ü";line-height:200%;'>�Ʒð����� : <%=box1.getString("d_subjnm") %></SPAN>
                </td>
            </tr>
            <tr>
                <td>
                    <SPAN class='HStyle0' STYLE='font-size:12.0pt;font-family:"����ü";line-height:200%;'>�ƷñⰣ&nbsp;&nbsp; : <%=box1.getString("d_min_dt").substring(0,4) +"."+box1.getString("d_min_dt").substring(4,6)+"."+box1.getString("d_min_dt").substring(6,8)%> ~
                        <%=box1.getString("d_max_dt").substring(0,4)+"."+box1.getString("d_max_dt").substring(4,6)+"."+box1.getString("d_max_dt").substring(6,8)%></SPAN>
                </td>
            </tr>
            <tr>
                <td>
                    <SPAN class='HStyle0' STYLE='font-size:6.0pt;font-family:"����ü";line-height:200%;'>&nbsp;</SPAN>
                </td>
            </tr>
            <tr>
                <td>
                    <SPAN class='HStyle0' STYLE='font-size:12.0pt;font-family:"����ü";line-height:200%;'><%=box1.getString("d_weekday")%></SPAN>
                </td>
            </tr>
        </table>
	</TD>
	<TD  width="83" height="27" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	    <P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��&nbsp; ��</SPAN></P>
	</TD>
	<TD width="83" height="27" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	    <P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��&nbsp; ��</SPAN></P>
	</TD>
</TR>
<TR>
	<TD  width="83" height="72" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	    <P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
	<TD  width="83" height="72" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	    <P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
 </TABLE>

<TABLE border="0" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;' width="100%">    
<TR>
    <TD height="31"></TD>
</TR>
 </TABLE>

<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;' width="100%">
<TR>
	<TD  width="48" height="39" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD  width="80" height="39" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'><%=box1.getString("d_total")%></SPAN></P>
	</TD>
	<TD  width="48" height="39" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>�⼮</SPAN></P>
	</TD>
	<TD  width="80" height="39" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'><%=box1.getString("d_total")%></SPAN></P>
	</TD>
	<TD  width="48" height="39" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>�Ἦ</SPAN></P>
	</TD>
	<TD  width="80" height="39" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>0</SPAN></P>
	</TD>
	<TD  width="48" height="39" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD  width="80" height="39" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>0</SPAN></P>
	</TD>
	<TD  width="48" height="39" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD  width="83" height="39" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>0</SPAN></P>
	</TD>
</TR>
 </TABLE>

<TABLE border="0" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;' width="100%">
<TR>
	<TD  colspan="5" height="20" ></TD>
</TR>
<TR>
	<TD  colspan="5" height="35" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 1.1pt;border-top:solid #000000 1.1pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��&nbsp;&nbsp;&nbsp; ��&nbsp;&nbsp;&nbsp; ��&nbsp;&nbsp;&nbsp; ��</SPAN></P>
	</TD>
</TR>
<TR>
	<TD  width="40" height="35" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>�� ��</SPAN></P>
	</TD>
	<TD  width="140" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��������</SPAN></P>
	</TD>
	<TD  width="79" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��米��</SPAN></P>
	</TD>
	<TD  height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��������</SPAN></P>
	</TD>
	<TD  width="67" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>���</SPAN></P>
	</TD>
</TR>
<%
    for(int i=0;i<7;i++)
    {
        if (resultData.size() > i )  {            
            DataBox box2=(DataBox)resultData.get(i);
%>
<TR>
	<TD  height="35" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'><%=(i+1)%></SPAN></P>
	</TD>
	<TD height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:left;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'><%=box2.getString("d_sub_title")%></SPAN></P>
	</TD>
	<TD height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'><%=box2.getString("d_name")%></SPAN></P>
	</TD>
	<TD height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:left;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'><%=box2.getString("d_sub_content")%></SPAN></P>
	</TD>
	<TD  height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
 <%  } else { %>
<TR>
	<TD  height="35" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'><%=(i+1)%></SPAN></P>
	</TD>
	<TD  height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'></SPAN></P>
	</TD>
	<TD  height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'></SPAN></P>
	</TD>
	<TD height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'></SPAN></P>
	</TD>
	<TD  height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
 <%     }
    }
 %>
 </TABLE>

<TABLE border="0" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;' width="100%">
<TR>
	<TD rowspan="2" width="87" height="70" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>�����ð�</SPAN></P>
	</TD>
	<TD  width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>�ϰ�</SPAN></P>
	</TD>
	<TD  width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD  width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
	<TD  width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD  width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
	<TD  width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>�ǽ�</SPAN></P>
	</TD>
	<TD  width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
	<TD  width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��Ÿ</SPAN></P>
	</TD>
	<TD  width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
	<TD  width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��</SPAN></P>
	</TD>
	<TD width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>�ǽ�</SPAN></P>
	</TD>
	<TD width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��Ÿ</SPAN></P>
	</TD>
	<TD width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
	<TD width="51" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>��</SPAN></P>
	</TD>
	<TD width="50" height="35" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD  width="87" height="84" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>���û���</SPAN></P>
	</TD>
	<TD colspan="11" width="556" height="84" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
<TR>
	<TD  width="87" height="122" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>Ư�����</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-family:"����ü";'>&lt;�Ἦ�� ��� ����&gt;</SPAN></P>
	</TD>
	<TD colspan="11" width="556" height="122" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 0.4pt;border-bottom:solid #000000 1.1pt;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'>&nbsp;</SPAN></P>
	</TD>
</TR>
</TABLE></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:12.0pt;font-family:"����ü";line-height:160%;'><BR></SPAN></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:6.0pt;font-family:"����ü";line-height:160%;'><BR></SPAN></P>
<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:20.0pt;font-family:"����ü";font-weight:bold;line-height:160%;'>�ѱ������������</SPAN></P>
</BODY>
</HTML>
