<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    ArrayList resultList=(ArrayList)request.getAttribute("resultList");
    DataBox box1=(DataBox)resultList.get(0);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<TITLE>�Ʒýǽ� ������ ���</TITLE>
<STYLE>
<!--
P.HStyle0, LI.HStyle0, DIV.HStyle0
	{style-name:"������"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle1, LI.HStyle1, DIV.HStyle1
	{style-name:"����"; margin-left:15.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle2, LI.HStyle2, DIV.HStyle2
	{style-name:"���� 1"; margin-left:10.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle3, LI.HStyle3, DIV.HStyle3
	{style-name:"���� 2"; margin-left:20.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle4, LI.HStyle4, DIV.HStyle4
	{style-name:"���� 3"; margin-left:30.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle5, LI.HStyle5, DIV.HStyle5
	{style-name:"���� 4"; margin-left:40.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle6, LI.HStyle6, DIV.HStyle6
	{style-name:"���� 5"; margin-left:50.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle7, LI.HStyle7, DIV.HStyle7
	{style-name:"���� 6"; margin-left:60.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle8, LI.HStyle8, DIV.HStyle8
	{style-name:"���� 7"; margin-left:70.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle9, LI.HStyle9, DIV.HStyle9
	{style-name:"�� ��ȣ"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:10.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle10, LI.HStyle10, DIV.HStyle10
	{style-name:"�Ӹ���"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:150%; font-size:9.0pt; font-family:����; letter-spacing:0.0pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle11, LI.HStyle11, DIV.HStyle11
	{style-name:"����"; margin-left:13.1pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:����; letter-spacing:0.5pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle12, LI.HStyle12, DIV.HStyle12
	{style-name:"����"; margin-left:13.1pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:-13.1pt; line-height:130%; font-size:9.0pt; font-family:����; letter-spacing:0.5pt; font-weight:normal; font-style:normal; color:#000000;}
P.HStyle13, LI.HStyle13, DIV.HStyle13
	{style-name:"�޸�"; margin-left:0.0pt; margin-right:0.0pt; margin-top:0.0pt; margin-bottom:0.0pt; text-align:justify; text-indent:0.0pt; line-height:160%; font-size:9.0pt; font-family:����; letter-spacing:0.5pt; font-weight:normal; font-style:normal; color:#000000;}
-->
</STYLE>
</HEAD>

<BODY onload="this.print();">

<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:20.0pt;font-family:"����ü";font-weight:bold;line-height:160%;'>�Ʒýǽ� ������ ���</SPAN></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>1. �Ʒñ���� : �ѱ������������</SPAN></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>2. �Ʒð����� : <%=box1.getString("d_subjnm")%> </SPAN></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>3. �ƷñⰣ&nbsp;&nbsp; : <%=box1.getString("d_start_dt")%> ~ <%=box1.getString("d_end_dt")%> (<%=box1.getString("d_days")%>�ϰ�/<%=box1.getString("d_sub_time")%>�ð�)</SPAN></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>4. �Ʒ�����&nbsp;&nbsp; : ��Ź</SPAN></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>5. �Ʒýǽ� �Ű��� ���</SPAN></P>
<P CLASS=HStyle0 STYLE='text-align:center;'>
<TABLE border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none;'>
<TR>
	<TD width="36" height="42" valign="middle" style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>����</SPAN></P>
	</TD>
	<TD width="51" height="42" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>�� ��</SPAN></P>
	</TD>
	<TD height="42" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>�ֹε��</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>��&nbsp;&nbsp;&nbsp; ȣ</SPAN></P>
	</TD>
	<TD width="68" height="42" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>�ƷñⰣ</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:10.0pt;font-family:"����ü";letter-spacing:0.4pt;line-height:160%;'>(��/�ð�)</SPAN></P>
	</TD>
	<TD width="61" height="42" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";letter-spacing:0.8pt;line-height:160%;'>�� ��</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:10.0pt;font-family:"����ü";letter-spacing:0.8pt;line-height:160%;'>�̼��ð�</SPAN></P>
	</TD>
	<TD width="53" height="42" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>�̼���</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>(%)</SPAN></P>
	</TD>
	<TD width="145" height="42" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>�Ҽ� ȸ�� ��</SPAN></P>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>�μ� / ����</SPAN></P>
	</TD>
	<TD width="112" height="42" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>����ó</SPAN></P>
	</TD>
	<TD width="35" height="42" valign="middle" style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:solid #000000 1.1pt;border-bottom:double #000000 1.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>
	<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:"����ü";line-height:160%;'>���</SPAN></P>
	</TD>
</TR>
    <% if(resultList.size()>0) {
        for(int i=0;i<resultList.size();i++)
        {
            DataBox tmp=(DataBox)resultList.get(i);
            out.print("<tr>");
            out.print("<TD height='42' valign='middle' style='border-left:solid #000000 1.1pt;border-right:solid #000000 0.4pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:11.0pt;font-family:'����ü';line-height:130%;'>"+(i+1)+"</SPAN></P>");
            out.print("</td>");
            out.print("<TD valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:11.0pt;font-family:'����ü';line-height:130%;'>"+tmp.getString("d_name")+"</SPAN></P>");
            out.print("</td>");
            out.print("<TD valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:11.0pt;font-family:'����ü';line-height:130%;'>"+tmp.getString("d_resno")+"</SPAN></P>");
            out.print("</td>");
            out.print("<TD valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:'����ü';line-height:160%;'>"+tmp.getString("d_days")+"��<br>"+ tmp.getString("d_sub_time")+"�ð�</SPAN></P>");
            out.print("</td>");
            out.print("<TD valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:'����ü';line-height:160%;'>"+tmp.getString("d_sub_time")+"�ð�</SPAN></P>");
            out.print("</td>");
            out.print("<TD valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:'����ü';line-height:160%;'>100</SPAN></P>");
            out.print("</td>");
            out.print("<TD  valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:11.0pt;font-family:'����ü';line-height:130%;'>"+tmp.getString("d_comptext")+"</SPAN></P>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:11.0pt;font-family:'����ü';line-height:130%;'>"+tmp.getString("d_deptnam")+"</SPAN></P>");
            out.print("</td>");
            out.print("<TD valign='middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 0.4pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;line-height:130%;'><SPAN STYLE='font-size:10.0pt;font-family:'����ü';line-height:130%;'>"+tmp.getString("d_handphone")+"</SPAN></P>");
            out.print("</td>");
            out.print("<TD valign'middle' style='border-left:solid #000000 0.4pt;border-right:solid #000000 1.1pt;border-top:double #000000 1.4pt;border-bottom:solid #000000 0.4pt;padding:1.4pt 1.4pt 1.4pt 1.4pt'>");
            out.print("<P CLASS=HStyle0 STYLE='text-align:center;'><SPAN STYLE='font-size:11.0pt;font-family:'����ü';line-height:160%;'>&nbsp;</SPAN></P>");
            out.print("</td>");
            out.print("</tr>");
        }
    }
%>
</TABLE></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>&nbsp;&nbsp;�������ο� : <%=resultList.size()%>��</SPAN></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>&nbsp;&nbsp;���� �����ο� : 0��</SPAN></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'><BR></SPAN></P>
<P CLASS=HStyle0><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;'>6. ÷&nbsp; �� : �⼮�� �� �Ʒ����� �� 1��.&nbsp; ��.</SPAN></P>
<P CLASS=HStyle0 style="text-align:center;"><SPAN STYLE='font-size:13.0pt;font-family:"����ü";line-height:160%;text-align:center;'><img src="/images/admin/button/broadcast.bmp" alt="����" border="0"></SPAN></P>
</BODY>
</HTML>
