<%
//**********************************************************
//  1. ��      ��: �������� ����Ʈ ��ȸȭ��
//  2. ���α׷���: za_Grseq_L.jsp
//  3. ��      ��: �������� ����Ʈ ��ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 11
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_grseq     = box.getString("s_grseq");            //��������
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    //DEFINED in relation to select END

    String  v_grseq = box.getString("p_mgrseq");
    String  v_subj = box.getString("p_subj");
    String  v_subjnm = box.getString("p_subjnm");
    
    ArrayList  list = (ArrayList)request.getAttribute("GrseqDetailList");
    
    
    String  v_propstart = "";
    String  v_propend   = "";
    String  v_edustart  = "";
    String  v_eduend    = "";
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

//�������� ����Ʈ ȭ������
function goSubjectListPage() {
  
  document.form1.p_process.value  = 'listPage';
  document.form1.p_action.value = "go";
  document.form1.submit();
}


//�������� �߰�(ȭ�� ���÷���)
function whenAddSeq() {
    document.all.addseq.style.display='';
}

//�������� �߰� (����)
function whenSeqSave() {
    var deny_pattern = /[^(0-9)]/;

    if(deny_pattern.test(document.form1.p_seqcnt.value)) {
        alert("���ڸ� �Է��� �� �ֽ��ϴ�.");
        document.form1.p_seqcnt.focus();
        return;
    }

    if (confirm(document.form1.p_seqcnt.value + "���� ���������� �߰��Ͻðڽ��ϱ�?")) {
        document.form1.p_process.value = "addSubjSeq";
        document.form1.submit();
    }
}

// �������� �߰� ���(ȭ�� ���÷���)
function whenSeqCancel() {
    document.all.addseq.style.display='none';
}

//�������� ����ó��
function delSubj(subj,year,subjseq,stoldcnt,propcnt){
/*
    if (stoldcnt>0) {
        alert("�̼�ó����� �� �ٽ� �õ��ϼ���.");
        return;
    }
*/
    if (propcnt==0) {
        if(confirm("�������� ������ �����Ͻðڽ��ϱ�?"))  {
            setHiddenVals("delSubj",'<%=ss_gyear%>','<%=v_grseq%>',subj,year,subjseq);
            document.form1.submit();            
        }
    } else {
        alert('��û �Ǵ� �н��ڰ� �־� ������ �� �����ϴ�.');
        return;
    }
    

}


// ���簪 ����
function setHiddenVals(process, gyear,grseq,subjcourse,year,seq){
    document.form1.p_action.value = "go";
    document.form1.p_process.value= process;
    document.form1.p_mgyear.value=gyear;
    document.form1.p_mgrseq.value=grseq;
    document.form1.p_msubjcourse.value=subjcourse;
    document.form1.p_myear.value=year;
    document.form1.p_mseq.value=seq;
}

// ���� ������ �˾�
function whenSubjseq(grcode,gyear,grseq,subj,year,subjseq,isonoff){
    var url=document.form1.action+'?p_process=updateSubjseqPage&s_grcode='+grcode+'&s_gyear='+gyear+'&s_grseq='+grseq+'&p_subj='+subj+'&p_year='+year+'&p_subjseq='+subjseq+'&s_upperclass=<%=ss_upperclass%>&s_middleclass=<%=ss_middleclass%>&s_subjcourse=<%=ss_subjcourse%>&p_isonoff='+isonoff;
    window.open(url,'insert','resizable=yes,scrollbars=yes,status=yes,width=800,height=600');
}

//���� ����
function whenOrder(column) {
    if (document.form1.p_orderType.value == " asc") {
        document.form1.p_orderType.value = " desc";
    } else {
        document.form1.p_orderType.value = " asc";
    }

    document.form1.p_orderColumn.value = column;
    document.form1.submit();
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/c_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>
        
        
        
        <!----------------- form ���� ----------------->
        <table width=970 border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td bgcolor="#C6C6C6" align="center"> 
              <table  width=100% border="0" cellspacing="0" cellpadding="0" class="table_02_1">
                <tr> 
                  <td height="7"></td>
                </tr>
                <tr> 
                  <td align="center" valign="middle"> 


                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <form name="form1" method="post" action="/servlet/controller.course.GrseqServlet">
        <input type="hidden" name="p_process" value="listDetailPage">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="p_subj"  value="<%=v_subj%>">
        <input type="hidden" name="p_subjnm"  value="<%=v_subjnm%>">
        
        <input type="hidden" name="s_grcode"        value="<%=ss_grcode%>">     <!--in relation to select-->
        <input type="hidden" name="s_gyear"         value="<%=ss_gyear%>">      <!--in relation to select-->
        <input type="hidden" name="s_grseq"         value="<%=ss_grseq%>">      <!--in relation to select-->
        <input type="hidden" name="s_upperclass"    value="<%=ss_upperclass%>"> <!--in relation to select-->
        <input type="hidden" name="s_middleclass"   value="<%=ss_middleclass%>"><!--in relation to select-->
        <input type="hidden" name="s_subjcourse"    value="<%=ss_subjcourse%>"> <!--in relation to select-->
        <input type="hidden" name="s_subjseq"       value="<%=ss_subjseq%>">    <!--in relation to select-->
    
        <input type="hidden" name="p_mgyear" value="">
        <input type="hidden" name="p_mgrseq" value="<%=v_grseq%>">
        <input type="hidden" name="p_msubjcourse" value="">
        <input type="hidden" name="p_myear" value="">
        <input type="hidden" name="p_mseq" value="">
        
        <input type="hidden" name="p_orderColumn">
        <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
        
                      <tr> 
                        <td align=left>
                          &nbsp;���� : <%=v_subjnm%> &nbsp;&nbsp;<%=ss_gyear%>�⵵
            </td>
                        <td></td>
                      </tr>
                    
                    </table>

                  </td>
                </tr>
                <tr> 
                  <td height="7" ></td>
                </tr>
              </table>



            </td>
          </tr>
        </table>
        <!----------------- form �� ----------------->
        <br>
        <!----------------- ���������߰� ��ư ���� ----------------->
        <table width="970" border="0" cellpadding="0" cellspacing="0">
          <tr>
          <td width="612" height="20" align="right">&nbsp; </td>
            
          <td width="286" height="20" align="right" > 
          <table width="100%" id="addseq" style="display:none;">
          <tr>
                <td>* �߰��� ���� 
                  <input type='text' name='p_seqcnt' class='input' maxlength='2' size='4' value='1'>�� </td>
          <td><a href='javascript:whenSeqSave();'><img src="/images/admin/button/btn_save.gif" align="absmiddle" border=0></a> </td> 
          <td><a href='javascript:whenSeqCancel();'><img src="/images/admin/button/btn_cancel.gif" align="absmiddle" border=0></a></td></tr>
          </table>
          </td>
              
          <td width="72" height="20" align="right"> <a href="javascript:whenAddSeq();"><img src="/images/admin/button/btn_chasuadd.gif" align="absmiddle" border="0"></a> 
          </td>
          </tr>
          <tr> 
            <td height="3"></td>
          </tr>
        </table>
        
      <!----------------- ���������߰� ��ư �� ----------------->
      <!----------------- �������� ���� ���� ----------------->
      <table width="970" class="table_out" cellspacing="1" cellpadding="5">
        <tr> 
          <td colspan="16" class="table_top_line"></td>
        </tr>
        <tr> 
          <td class="table_title"><a href="javascript:whenOrder('subjseqgr')" class="e">����</a></td>
          <td class="table_title"><a href="javascript:whenOrder('studentlimit')" class="e">����</a></td>
          <td class="table_title"><a href="javascript:whenOrder('propstart')" class="e">��û ������</a></td>
          <td class="table_title"><a href="javascript:whenOrder('propend')" class="e">��û ������</a></td>
          <td class="table_title"><a href="javascript:whenOrder('edustart')" class="e">����������</a></td>
          <td class="table_title"><a href="javascript:whenOrder('eduend')" class="e">����������</a></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><a href="javascript:whenOrder('proposecnt')" class="e">��û</a></td>
          <td class="table_title"><a href="javascript:whenOrder('proposecnt')" class="e">���</a></td>
          <td class="table_title"><a href="javascript:whenOrder('studentcnt')" class="e">����</a></td>
          <td class="table_title"><a href="javascript:whenOrder('stoldcnt')" class="e">����<br></a></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>����</b></td>
        </tr>
        <%   
        for (int i=0; i<list.size(); i++) {
            DataBox dbox = (DataBox)list.get(i); 
            
            v_propstart = StringManager.chkNull(dbox.getString("d_propstart"));
            v_propend   = StringManager.chkNull(dbox.getString("d_propend"));
            v_edustart  = StringManager.chkNull(dbox.getString("d_edustart"));
            v_eduend    = StringManager.chkNull(dbox.getString("d_eduend"));
            
%>
        <tr height=25> 
          <td class="table_02_1" align="center"> <%=StringManager.cutZero(dbox.getString("d_subjseqgr"))%></td>
          <td class="table_02_1" align="center"><%=dbox.getInt("d_studentlimit")%></td>
          <td class="table_02_1" align="center"><%= FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd") %></td>
          <td class="table_02_1" align="center"><%= FormatDate.getFormatDate(v_propend,"yyyy/MM/dd") %></td>
          <td class="table_02_1" align="center"><%= FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd") %></td>
          <td class="table_02_1" align="center"><%= FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd") %></td>
          <td class="table_02_1" align="center">
          <%int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));
          
            if(!v_edustart.equals("")&&v_edustart.length() == 10){
                if (v_today >= Integer.parseInt(v_edustart) && v_today <= Integer.parseInt(v_eduend)) {
                    //���������ϰ� ���������� �����̸� - ������
                    out.print("������");
                } else if (v_today < Integer.parseInt(v_edustart)) {
                    //���� ������ �����̸� - ������
                    out.print("������");
                } else if (v_today > Integer.parseInt(v_eduend)) {
                    //���������� ���ĸ� - �Ϸ�
                    out.print("�Ϸ�");
                }
            }

          %>
          </td>
          <td class="table_02_1" align="center"><%=dbox.getInt("d_proposecnt")%></td>
          <td class="table_02_1" align="center"><%=dbox.getInt("d_cancelcnt")%></td>
          <td class="table_02_1" align="center"><%=dbox.getInt("d_studentcnt")%></td>
          <td class="table_02_1" align="center"><%=dbox.getInt("d_stoldcnt")%></td>

          <td class="table_03_1" align="center"><a href="javascript:whenSubjseq('<%=ss_grcode%>','<%=ss_gyear%>','<%=v_grseq%>','<%=v_subj%>','<%=ss_gyear%>','<%=dbox.getString("d_subjseq")%>','<%=dbox.getString("isonoff")%>')"><img src="/images/admin/button/b_modify.gif" border=0></a></td>
          <td class="table_03_1" align="center"><a href="javascript:delSubj('<%=v_subj%>','<%=dbox.getString("d_year")%>','<%=dbox.getString("d_subjseq")%>','<%=dbox.getInt("d_stoldcnt")%>',<%=dbox.getInt("d_proposecnt")%>)"> 
            <img src="/images/admin/button/b_delete.gif" border="0"></a></td>
        </tr>
        <%  } %>
      </table>
      <!----------------- �������� ���� �� ----------------->
      <br>
      <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
      <table  border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="center">&nbsp;</td>
          <td align="center"><a href="javascript:goSubjectListPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ����, ����, ����Ʈ ��ư �� ----------------->
      </td>
  </tr>
    <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     
</table>
  </form>    
</body>
</html>
