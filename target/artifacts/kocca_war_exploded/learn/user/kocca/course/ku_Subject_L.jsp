<%
//**********************************************************
//  1. ��      ��: SUBJECT LIST
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��      ��: ������ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.01.14
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","02");                       // �޴� ���̵� ����

    String  v_process     = box.getString("p_process");

    String v_tab_gubun  = box.getStringDefault("p_tab_gubun","apply_all");
    String v_userid     = box.getSession("userid");
    String v_name       = box.getSession("name");

    String  v_code       = "";
    String  v_codenm     = "";
    String  v_tab_bg     = "";
    String  v_tab_class  = "";

    String v_subj           = "";
    String v_scupperclass   = "";
    String v_scmiddleclass  = "";
    String v_isonoff        = "";
    String v_year           = "";
    String v_subjseq        = "";
    String v_subjnm         = "";
    String v_proposetype    = "";
    String v_usebook        = "";
    String v_isnew          = "";
    String v_ishit          = "";
    String v_isrecom        = "";
    String v_uclassnm       = "";
    String v_mclassnm       = "";
    String v_isordinary     = "";
    String v_isworkshop     = "";
    String v_isunit         = "";
    String v_subjgubun      = "";

    String v_imgbook        = "";
    String v_imgNew         = "";
    String v_imgHit         = "";
    String v_imgRecom       = "";
    String v_Bscupperclass  = "";
    String v_Bscmiddleclass = "";

    String v_preurl         = "";
    String v_hasPreviewObj  = "";
    String v_propstart      = "";
    String v_propend        = "";
    String v_edustart       = "";
    String v_eduperiod      = "";
    String v_tname          = "";
    String v_biyong         = "";
    String v_coursebiyong   = "";
    String v_course         = "";
    String v_courseseq      = "";
    String v_coursenm       = "";
    String v_classname      = "";
    String v_tmp_subj   = "";
    String v_iscourseYn = "";
    String v_issampleString = "";
    String v_sphere = "";
    int v_discount = 0;

    v_discount = DiscountBean.returnDiscount(box);

    String[] v_tabArr = {"apply_all","sometime","beginner","alway","prof","workshop","recognition"};
    String[] v_titleArr = {
            "��ü���������� ��� ������ ����Ʈ�� Ȯ���Ͻ� �� �ֽ��ϴ�.<br>������û�Ⱓ�� ���¸��� ������û�� �����մϴ�.<br>",
            "���ø��� ������ �Ⱓ�� �����ο��� ���Ѿ��� open�Ǹ� �ڽ������� ��մϴ�.<br>",
            "�Թ������� �Ŵ� �����Ǵ� �Թ����� �����Դϴ�.<strong>(1�� 2���� ��û����)</strong><br>������û�Ⱓ�� ���¸��� ������û�� �����մϴ�.<br>",
            "���������� �Ŵ� �����Ǵ� ��ø��� �����Դϴ�.<strong>(1�� 1���� ��û����)</strong><br>������û�Ⱓ�� ���¸��� ������û�� �����մϴ�.<br>",
            "�������� ������ <strong>���ǽ��ƿ�</strong> ���� ö���� ���������� �̷������ �����������Դϴ�.<br> ������û�Ⱓ�� ���¸��� ������û�� �����մϴ�.<br>",
            "���帣�� �ǹ�, ����߽��� ����������� ����Ǵ¿�ũ������Դϴ�.<br>������û�Ⱓ�� ���¸��� ������û�� �����մϴ�.<br>��ȭ�������� ��ȭ, �������� ������ ���� �� �ִ� ������ް����Դϴ�.<br>������ް����� ���� �����Ǿ� ��û�Ͻ� �� ���ι޾� ���������մϴ�.<br>",
            "�̼��� ������ ������������ �������� �� �ִ� �������������Դϴ�.<br>������û�Ⱓ�� ���¸��� ������û�� �����մϴ�.<br>"};
    String[] v_tab_width = {"91","81","81","95","94","99"};
    String v_tab_img    = "";;

    int j = 0;
    int i = 0;
    int l = 0;
    int     v_subjcnt   = 0;


    ArrayList list1 = null;
    ArrayList list2 = null;

    list1 = (ArrayList)request.getAttribute("UpperClassList");      // ����, ���� ���� ����Ʈ
    list2 = (ArrayList)request.getAttribute("SubjectList");         // ���� ����Ʈ
%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--

    // �����˻� ����ó��
    function search_enter(e)  {
        if (e.keyCode =='13'){  subjSearch();  }
    }

    // �����˻�
    function subjSearch()
    {
        if (document.form1.p_lsearchtext.value=="")
        {
            alert("�˻�� �Է����ּ���");
            return;
        }
        document.form1.action = "/servlet/controller.propose.MainSubjSearchServlet";   //
        document.form1.p_process.value = "SubjSearch";
        document.form1.submit();
    }

    // ���� ���뺸��
    function whenSubjInfo(subj,subjnm,isonoff,upperclass,upperclassnm){
        document.form1.p_subj.value = subj;
        document.form1.p_subjnm.value = subjnm;
        document.form1.p_upperclass.value = upperclass;
        document.form1.p_upperclassnm.value = upperclassnm;
        document.form1.p_process.value = 'SubjectPreviewPage';
        document.form1.p_rprocess.value = 'SubjectList';
        document.form1.action='/servlet/controller.propose.KProposeCourseServlet';
        document.form1.target = "_self";
        document.form1.submit();
    }

    // �󼼹�ư Ŭ��
    function whenSubjSeqInfo(subj,year,subjseq,isonoff,subjnm) {
        var url = "/servlet/controller.propose.KProposeCourseServlet?p_process=SeqPreviewPage&p_subj="+subj+"&p_year="+year+"&p_subjseq="+subjseq+"&p_isonoff="+isonoff;
        //alert(url);
         var new_Open = window.open(url,"subjSeqInfoPopup",'scrollbars=yes,width=747,height=600,resizable=no');
         document.form1.target = "subjSeqInfoPopup";
    }

    // �� �з� ����
    function JobSelect(tabgubun)
    {
        document.form1.p_tab_gubun.value = tabgubun;
        document.form1.p_process.value = 'SubjectList';
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.propose.KProposeCourseServlet';

        document.form1.submit();
    }

    // ������
    function whenPreShow(url, subj) {
        // �α�
        prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
        open_window("openShow",prelog_url,"0","0","1010","717","no","no","no","no","yes");

        open_window("openShow",url,"100","100","1010","717","no","no","no","no","yes");
    }


    // ������
    function studyOpen(url,subj) {
        // �α�
        prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
        open_window("openShow",prelog_url,"0","0","10","10","","","",true,true);

        open_window('openApp',url,0,0,0,0,false,false,true,true,true);
    }

    //������û
    function whenSubjPropose(subj,year,subjseq, subjnm, billYn, course, courseseq, coursenm, gubun) {

        var msg = "";
        var iscourseYn = "N";

        if(course != '000000')
        {
            msg = coursenm;
            iscourseYn = "Y";
        }
        else
        {
            msg = subjnm;
        }
        if(!confirm(msg+" ������ ������û�Ͻðڽ��ϱ�?")){
            return;
        }

        if(billYn == "Y")
        {
            document.form1.p_process.value = "SubjectEduBill";
        }
        else
        {
            document.form1.p_process.value = "SubjectEduPropose";
        }

        document.form1.target = "_self";
        document.form1.p_subj.value = subj;
        document.form1.p_year.value = year;
        document.form1.p_billYn.value = billYn;
        document.form1.p_iscourseYn.value = iscourseYn;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_course.value = course;
        document.form1.p_courseseq.value = courseseq;
        document.form1.p_gubun.value = gubun;
        document.form1.action = "/servlet/controller.propose.KProposeCourseServlet";
        document.form1.submit();
    }

    //���ǰ��ǽ�
    function goPersonHistory(){
      document.form1.target = "_self";
      document.form1.p_process.value = "EducationSubjectPage";
      document.form1.action="/servlet/controller.study.KMyClassServlet";
      document.form1.submit();
    }

    function whenSubjPropose2(subj,year,subjseq) {

       if(!confirm("���ɰ������� ��� �Ͻðڽ��ϱ�?")){
         return;
       }

       document.form1.target = "_self";
       document.form1.p_subj.value = subj;
       document.form1.p_year.value = year;
       document.form1.uesrid.value = "<%=v_userid%>";
       document.form1.p_subjseq.value = subjseq;
       document.form1.p_process.value = "InterestInsert";
       document.form1.action = "/servlet/controller.study.InterestServlet";
       document.form1.submit();
    }
//-->
</SCRIPT>

<form name="form1" method="post" enctype = "multipart/form-data">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_tab_gubun" value="<%=v_tab_gubun%>">

    <input type="hidden" name="p_year">
    <input type="hidden" name="p_subjseq">
    <input type="hidden" name="p_proposestart">
    <input type="hidden" name="p_proposeend">
    <input type="hidden" name="p_proposeyn">
    <input type="hidden" name="p_proposetype">
    <input type="hidden" name="p_purl">
    <input type="hidden" name="p_billYn">
    <input type="hidden" name="p_course">
    <input type="hidden" name="p_courseseq">
    <input type="hidden" name="p_iscourseYn">
    <input type="hidden" name="p_discount">

    <input type='hidden' name='p_subj'>
    <input type='hidden' name='p_subjnm'>
    <input type='hidden' name='p_upperclass' value=''>
    <input type='hidden' name='p_upperclassnm' >
    <input type='hidden' name='p_actionurl' value='/servlet/controller.propose.KProposeCourseServlet'>
    <input type='hidden' name='p_rprocess' >

    <input type='hidden' name='p_tabnum' >
    <input type='hidden' name='p_gubun'>

    <table width="680" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td  class="location" > HOME > ������û &gt; ������û</td>
      </tr>
    </table>
    <table width="680" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="/images/user/kocca/apply/<%=tem_subimgpath%>/tit_definite.gif"></td>
      </tr>
      <tr>
        <td height="20"></td>
      </tr>
    </table>
    <table width="680" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3">
        <table width="680" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="117"><img src="/images/user/kocca/apply/i_apply_top.gif" height="42"></td>
              <td width="5"><img src="/images/user/kocca/apply/tab_apply_fir.gif"></td>
<% for(i = 0; i < 7; i++)
{
    if(v_tabArr[i].equals(v_tab_gubun))
    {
        v_tab_img = "tab_" + v_tabArr[i] + "_on.gif";
        j = i;
    }
    else
    {
        v_tab_img = "tab_" + v_tabArr[i] + ".gif";
    }
    %>
    <td width="<%=v_tab_img%>"><a href="javascript:JobSelect('<%=v_tabArr[i]%>')" onMouseOver="MM_swapImage('Image5<%=i+1%>','','/images/user/kocca/apply/<%="tab_" + v_tabArr[i]%>_on.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="/images/user/kocca/apply/<%=v_tab_img%>" name="Image5<%=i+1%>" border="0" id="Image5<%=i+1%>"></a></td>
<%
}
%>

              <td width="5"><img src="/images/user/kocca/apply/tab_tail.gif"></td>
              <td width="10">&nbsp;</td>
            </tr>
          </table>
          </td>
      </tr>
      <tr>
        <td colspan="3"><img src="/images/user/kocca/apply/i_apply_top01.gif" width="680" height="24"></td>
      </tr>
      <tr>
        <td width="22" valign="top"><img src="/images/user/kocca/apply/i_apply_left.gif" width="22" height="75"></td>
        <td width="631" valign="top"><table width="631" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="3"><img src="/images/user/kocca/apply/sst_<%=v_tabArr[j]%>.gif"></td>
            </tr>
            <tr>
              <td height="19" colspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td width="62"><img src="/images/user/kocca/apply/ico_apply.gif"></td>
              <td width="20" valign="top"><img src="/images/user/kocca/apply/vline.gif" width="1" height="49"></td>
              <td><%=v_titleArr[j]%>
                <!--strong><font color="#A45614"><%=v_name%></strong> ���� ��������
                <%=v_discount %> %�Դϴ�</font--></td>
            </tr>
          </table></td>
        <td width="27" valign="top"><img src="/images/user/kocca/apply/i_apply_right.gif" width="27" height="75"></td>
      </tr>
      <tr>
        <td height="28" colspan="3" valign="top">&nbsp;</td>
      </tr>
    </table>
    <!--�Խ��Ǹ�� -->
    <table width="680" border="2" cellspacing="0"
     cellpadding="3"   style="border-collapse:collapse;" bordercolor="#DFDFE0"  frame="hsides">
      <tr  class="lcolor">
        <td  colspan="11" class="linecolor_app"></td>
      </tr>
      <tr>
        <td width="16" class="tbl_otit">No</td>
        <td width="125" class="tbl_otit2" colspan="2">��������</td>
        <td width="88" class="tbl_otit">���¸�</td>
        <td width="49"class="tbl_otit2" >��米��</td>
        <td width="84" class="tbl_otit">������û�Ⱓ</td>
        <td width="58" class="tbl_otit2">������</td>
        <td width="27" class="tbl_otit">�Ⱓ</td>
        <td width="50"class="tbl_otit2" >���ð���</td>
        <td width="39" class="tbl_otit">������</td>
        <td width="60" class="tbl_otit2">��û</td>
      </tr>
      <tr>
        <td height="5" colspan="11" ></td>
      </tr>
    <%
    //���� ����Ʈ
    int     v_upclass_seq = 0;
    int     v_propcnt   = 0;
    int     v_iedustart = 0;
    String  v_today     = "";
    String  v_billYn    = "";
    String  v_statusString = "";

    i = 0;

    for(i = 0; i < list2.size(); i++)
    {
        DataBox dbox = (DataBox)list2.get(i);

        v_subj          = dbox.getString("d_subj");
        v_subjseq       = dbox.getString("d_subjseq");
        v_scupperclass  = dbox.getString("d_scupperclass");
        v_scmiddleclass = dbox.getString("d_scmiddleclass");
        v_subjnm        = dbox.getString("d_subjnm");
        v_usebook       = dbox.getString("d_usebook");
        v_isnew         = dbox.getString("d_isnew");
        v_ishit         = dbox.getString("d_ishit");
        v_isrecom       = dbox.getString("d_isrecom");
        v_uclassnm      = dbox.getString("d_uclassnm");
        v_mclassnm      = dbox.getString("d_mclassnm");
        v_year          = dbox.getString("d_scyear");
        v_isordinary    = dbox.getString("d_isordinary");
        v_isworkshop    = dbox.getString("d_isworkshop");
        v_isunit        = dbox.getString("d_isunit");
        v_sphere		= dbox.getString("d_sphere");

        v_propstart     = dbox.getString("d_propstart");
        v_propend       = dbox.getString("d_propend");
        v_edustart      = dbox.getString("d_edustart");
        v_eduperiod     = dbox.getString("d_eduperiod");
        v_tname         = dbox.getString("d_name");

        v_biyong        = dbox.getString("d_biyong");
        v_coursebiyong  = dbox.getString("d_scbiyong");

        v_course        = dbox.getString("d_course");
        v_courseseq     = dbox.getString("d_courseseq");
        v_coursenm      = dbox.getString("d_coursenm");
        v_iscourseYn    = dbox.getString("d_isbelongcourse");
        v_subjcnt       = dbox.getInt("d_subjcnt");
// ����Ʈ ���� ���� 12.01
	int k = 4;
	if(v_subjcnt >= k){
		v_subjcnt = k-1;
	}

        v_propcnt       = dbox.getInt("d_procnt");
        v_today         = FormatDate.getDate("yyyyMMddhh");

        //v_preurl        = EduEtc1Bean.make_previewURL(v_subj);
        v_preurl        = dbox.getString("d_preurl");
        v_hasPreviewObj = EduEtc1Bean.hasPreviewObj(v_subj);

        if (v_usebook.equals("Y")) v_imgbook = "&nbsp;<img src='/images/user/button/btn_book.gif' align='absmiddle'>";
        else                       v_imgbook = "";
        if(v_isnew.equals("Y"))    v_imgNew = "&nbsp;<img src='/images/user/button/btn_snew.gif' align='absmiddle'>";
        else                       v_imgNew = "";
        if(v_ishit.equals("Y"))    v_imgHit = "&nbsp;<img src='/images/user/button/btn_shit.gif' align='absmiddle'>";
        else                       v_imgHit = "";
        if(v_isrecom.equals("Y"))  v_imgRecom = "&nbsp;<img src='/images/user/button/btn_srecom.gif' align='absmiddle'>";
        else                       v_imgRecom = "";

        if(v_isordinary.equals("Y"))
        {	if (v_sphere.equals("4")) {
        		v_subjgubun = "�Թ�����";
        	} else {
        		v_subjgubun = "��������";
        	}

        }
        else
        {
            v_subjgubun = "���ð���";
        }

        if(v_isworkshop.equals("Y"))
        {
            v_subjgubun = "��ũ�����";
        }

        if(v_isunit.equals("Y"))
        {
            v_subjgubun = "������������";
        }

        //  �ڽ� ������ ��� ��� ���.
        if(v_iscourseYn.equals("Y"))
        {
            v_classname = v_coursenm;
            v_biyong = v_coursebiyong;


            /*DataBox dbox2 = KProposeCourseBean.getBill(v_course, v_subjseq, v_year);
            if(dbox2 != null)
            {
                v_biyong        = dbox2.getString("d_biyong");
            }*/
        }
        if(v_biyong.equals("") || v_biyong.equals("0"))
        {
            v_billYn = "N";
        }
        else
        {
            v_billYn = "Y";
        }

        if(v_edustart.equals("")){v_iedustart = 0;}
        else{v_iedustart = Integer.parseInt(v_edustart);}
/*
        if(v_iedustart >= Integer.parseInt(v_today)){
            v_statusString = "<a href=\"javascript:whenSubjPropose('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_subjnm+"','" + v_billYn + "','"+v_course+"','"+v_courseseq+"','" + v_coursenm + "')\" onfocus='this.blur()'><img src='/images/user/kocca/button/b_apply.gif' border=0></a>";

            //out.println("v_ispropose"+v_ispropose);
            if(v_propcnt > 0){
                v_statusString = "<a href='javascript:goPersonHistory()'><img src='/images/user/kocca/button/b_aplly_ing.gif' border='0'></a>";
            }
        } else{
            //v_statusString = "<a href=\"javascript:whenSubjPropose2('"+v_subj+"','"+v_year+"','"+v_subjseq+"')\" onfocus='this.blur()'><img src='/images/user/kocca/button/b_apply.gif' border='0'></a>";
            v_statusString = "<a href=\"javascript:whenSubjPropose('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_subjnm+"','" + v_billYn + "','"+v_course+"','"+v_courseseq+"','" + v_coursenm + "')\" onfocus='this.blur()'><img src='/images/user/kocca/button/b_apply.gif' border=0></a>";
        }
*/

        //��¥ ó��
        if(v_propstart.equals("")){v_propstart = "����";}
        else{v_propstart     = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");}

        if(v_propend.equals("")){v_propend = "����";}
        else{v_propend = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");}

        if(v_edustart.equals("")){v_edustart = "����";}
        else{v_edustart     = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");}
/*
        if (v_hasPreviewObj.equals("Y"))
        {
            v_issampleString = "<a href=\"javascript:studyOpen('/servlet/controller.contents.EduStart?p_subj=" + v_subj + " &p_year=2000&p_subjseq=0001&p_ispreview=Y','" + v_subj + "')\" onfocus=\"this.blur()\"><img src=\"/images/user/kocca/button/b_samplecourse.gif\" border=\"0\"></a>";
        } else
        {
            if(!v_preurl.equals(""))
            {
                v_issampleString = "<a href=\"javascript:whenPreShow('" + v_preurl + "','" + v_subj +"')\" focus=\"this.blur()\"><img src=\"/images/user/kocca/button/b_samplecourse.gif\" border=\"0\"></a>";
            }
        }
*/
            if(!v_preurl.equals(""))
            {
                v_issampleString = "<a href=\"javascript:whenPreShow('" + v_preurl + "','" + v_subj +"')\" focus=\"this.blur()\"><img src=\"/images/user/kocca/button/b_samplecourse.gif\" border=\"0\"></a>";
            }else {
                v_issampleString = "-";
            }

%>
      <tr>
        <td bgcolor="#FFF5EC" class="tbl_grc"><%= i+1%></td>
<% if(v_iscourseYn.equals("Y"))
    {
        if(l == v_subjcnt) v_tmp_subj = "";
        if(!v_tmp_subj.equals(v_course) && !v_tmp_subj.equals("000000"))
        {
             l = 1;
            %>

            <td class="tbl_grc" rowspan="<%=v_subjcnt%>"><%=v_coursenm%><br><%=v_subjseq%>��</td>
            <td height="26" class="tbl_grc"><%=v_subjgubun%></td>

            <td height="26" class="tbl_bleft"><%=v_subjnm%></td>
            <td class="tbl_grc"><%=v_tname%></td>
            <td class="tbl_grc"><%=v_propstart%>~<br><%=v_propend%><br></td>
            <td class="tbl_grc"><%=v_edustart%></td>
            <td class="tbl_grc"><%=v_eduperiod%></td>
            <td class="tbl_grc"><%=v_issampleString%></td>
            <td class="tbl_grc" rowspan="<%=v_subjcnt%>"><%=v_biyong%></td>
            <td class="tbl_grc" rowspan="<%=v_subjcnt%>">
<%
        if(v_iedustart >= Integer.parseInt(v_today)){
            v_statusString = "<a href=\"javascript:whenSubjPropose('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_subjnm+"','" + v_billYn + "','"+v_course+"','"+v_courseseq+"','" + v_coursenm + "','P')\" onfocus='this.blur()'><img src='/images/user/kocca/button/b_apply.gif' border=0></a>";
            if(v_propcnt > 0){
                v_statusString = "<a href='javascript:goPersonHistory()'><img src='/images/user/kocca/button/b_aplly_ing.gif' border='0'></a>";
            }
        } else{
            v_statusString = "<a href=\"javascript:whenSubjPropose('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_subjnm+"','" + v_billYn + "','"+v_course+"','"+v_courseseq+"','" + v_coursenm + "','P')\" onfocus='this.blur()'><img src='/images/user/kocca/button/b_apply.gif' border=0></a>";
        }
        out.println(v_statusString);
%>
            </td>
    <%
        }else{
            l++;
        %>
            <td class="tbl_grc"><%=v_subjgubun%></td>
            <td height="26" class="tbl_bleft"><%=v_subjnm%></td>
            <td class="tbl_grc"><%=v_tname%></td>
            <td class="tbl_grc"><%=v_propstart%>~<br><%=v_propend%><br></td>
            <td class="tbl_grc"><%=v_edustart%></td>
            <td class="tbl_grc"><%=v_eduperiod%></td>
            <td class="tbl_grc"><%=v_issampleString%></td>

<%      }
        v_tmp_subj = v_course;
    } else { %>

            <td class="tbl_grc" colspan="2"><%=v_subjgubun%></td>
            <td height="26" class="tbl_bleft"><%=v_subjnm%></td>
            <td class="tbl_grc"><%=v_tname%></td>
            <td class="tbl_grc"><%=v_propstart%>~<br><%=v_propend%><br></td>
            <td class="tbl_grc"><%=v_edustart%></td>
            <td class="tbl_grc"><%=v_eduperiod%></td>
            <td class="tbl_grc"><%=v_issampleString%></td>
            <td class="tbl_grc"><%=v_biyong%></td>
            <td class="tbl_grc" >
<%
        if(v_iedustart >= Integer.parseInt(v_today)){
            v_statusString = "<a href=\"javascript:whenSubjPropose('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_subjnm+"','" + v_billYn + "','"+v_course+"','"+v_courseseq+"','" + v_coursenm + "','N')\" onfocus='this.blur()'><img src='/images/user/kocca/button/b_apply.gif' border=0></a>";
            if(v_propcnt > 0){
                v_statusString = "<a href='javascript:goPersonHistory()'><img src='/images/user/kocca/button/b_aplly_ing.gif' border='0'></a>";
            }
        } else {
            v_statusString = "<a href=\"javascript:whenSubjPropose('"+v_subj+"','"+v_year+"','"+v_subjseq+"','"+v_subjnm+"','" + v_billYn + "','"+v_course+"','"+v_courseseq+"','" + v_coursenm + "','N')\" onfocus='this.blur()'><img src='/images/user/kocca/button/b_apply.gif' border=0></a>";
        }
        out.println(v_statusString);
%>
		</td>
<% } %>



      </tr>
<% }
        if(i == 0) {%>
      <tr>
        <td height="5" colspan="11" height="100" align="center">��û���� ������ �����ϴ�.</td>
      </tr>
<% } %>
      <tr>
        <td height="5" colspan="11"></td>
      </tr>
    </table>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->