<%
//**********************************************************
//  1. ��      ��: PERSONAL SELECT LIST
//  2. ���α׷���: za_PersonalSelect_R.jsp
//  3. ��      ��: �����̷� ����ȸ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: lyh
//  7. ���� �̷�:
//      7.1. �׸� �߰�
//           ����: 2015-03-12
//           ����: �����׷��, �����׷��ڵ�, ����Ͽ� ���̵� �߰�
//           indent �� �ҽ� ������ ���ϰ���.
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.credu.common.GetCodenm" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.FormatDate" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>
<%@ page import="com.credu.library.StringManager" %>
<%@ page import="com.credu.study.StudyStatusData" %>
<%@ page import="com.credu.system.CodeConfigBean" %>
<%@ page import="com.credu.system.MemberData" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    String IMAGE_PATH = "/member/";

    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if ( box == null ) {
        box = RequestManager.getBox(request);
    }

    DataBox addInfobox = (DataBox)request.getAttribute("addInfo");
    List<DataBox> schoolList = (List<DataBox>) addInfobox.getObject("schoolList");
    List<DataBox> licenseList = (List<DataBox>) addInfobox.getObject("licenseList");
    List<DataBox> careerList = (List<DataBox>) addInfobox.getObject("careerList");
    List<DataBox> yeunsunoList = (List<DataBox>) request.getAttribute("YeunsunoList"); //������ȣ

    NumberFormat s_fmt = NumberFormat.getInstance();                //��ȭ���� ,ǥ��
    int v_totgetpoint = box.getInt("p_getpoint");
    int v_totusepoint = box.getInt("p_usepoint");
    int v_totwaitpoint = box.getInt("p_waitpoint");
    int v_availablepoint = v_totgetpoint - v_totusepoint - v_totwaitpoint;
    String v_availablepoint_text = s_fmt.format(v_availablepoint);

    ArrayList selectHavePointList = null;
    ArrayList selectStoldPointList = null;
    ArrayList list3 = null;

    selectHavePointList = (ArrayList)request.getAttribute("selectHavePointList");       //��������Ʈ
    selectStoldPointList = (ArrayList)request.getAttribute("selectStoldPointList"); //��������Ʈ
    list3 = (ArrayList)request.getAttribute("selectUsePointList");      //�������Ʈ

    String s_gadmin = box.getSession("gadmin");
    String v_process = box.getString("p_process");
    String v_selTab = box.getString("p_selTab");
    String v_search = box.getString("p_search");
    String v_searchtext = box.getString("p_searchtext");
    String v_userid = "";               // ID
    // String v_resno = "";               // �ֹι�ȣ
    // String v_pwd = "";               // ��ȣȭ��й�ȣ
    String v_eng_name = "";               // �����̸�
    String v_name = "";               // �̸�
    String v_membergubunnm = "";               // ȸ������
    String v_registgubunnm = "";               // ���԰��
    String v_email = "";               // email
    String v_birthday = "";               // ����
    String v_authority = "";               // ����
    String v_post1 = "";               // ����1
    String v_post2 = "";               // ����2
    String v_addr = "";               // �ּ�
    String v_addr2 = "";               // �ּ�2
    String v_hometel = "";               // ����ȭ��ȣ
    String v_handphone = "";               // �޴���ȭ��ȣ
    String v_comptel = "";               // ������ȭ��ȣ
    String v_comp_post1 = "";               // ���� �����ȣ1
    String v_comp_post2 = "";               // ���� �����ȣ2
    String v_comptext = "";               // �����
    String v_comp_addr1 = "";               // �����ּ�
    String v_comp_addr2 = "";               // �����ּ�2
    String v_jikup = "";               // �����ڵ�
    String v_degree = "";               // �з��ڵ�
    String v_tel_line = "";               // ������ȣ
    String v_comp = "";               // ȸ��ID
    String v_interest = "";               // ���ɻ���
    String v_recomid = "";               // ��õ��ID
    String v_ismailing = "";               // ���ϼ��Ź���ڵ�
    String v_isopening = "";               // ��ȭ��������
    String v_islettering = "";               // �������ͼ���

    String v_indate = "";               // ������
    String v_ldate = "";               // ����������
    String v_lglast = "";               // �����α��νð�
    String v_lgip = "";               // �α���IP
    String v_pwd_date = "";               // �н���������
    String v_old_pwd = "";               // �� �н�����
    String v_ent_date = "";               // �Ի���
    String v_grp_ent_date = "";               // �׷��Ի���
    String v_sex = "";               // ����
    String v_photo = "";               // �������� ����
    String v_photo_view = "";               // �������� ǥ��
    String v_state = "";               //������
    String v_validation = "";               //�Ǹ���������
    String v_registerroutenm = "";
    String vv_grcodenm = "";
    String v_workfieldcd = "";               //����о�

    //2009.10.29 ������ȣ, �޴���ȭ
    String[] arrDcd = {"02", "031", "032", "033", "041", "042", "043", "051", "052", "053", "054", "055", "061", "062", "063", "064", "070", "080"};
    String[] arrScd = {"010", "011", "016", "017", "018", "019"};

    //2009.10.29 �Խ��� ����
    String v_type = "";               // �Խ��Ǳ���

    String v_imgColor1 = "black";         //��û���� �̹�����
    String v_imgColor2 = "black";         //�������� �̹�����
    String v_imgColor3 = "black";         //������� �̹�����
    String v_imgColor4 = "black";         //�����̼���Ȳ �̹�����
    String v_imgColor5 = "black";         //�������� ��û���� �̹�����
    String v_imgColor6 = "black";         //�������� ������� �̹�����


    int v_lgcnt = 0;                   // �α���Ƚ��
    MemberData data = null;
    //DEFINED class&variable END

    data = (MemberData)request.getAttribute("PersonalSelect");
    v_userid = data.getUserid();         // ID
    //v_resno = data.getResno();          // �ֹι�ȣ

    /*(
    if (data.getResno2().equals("")) {
        v_resno = data.getResno1();                                 // �ֹι�ȣ1(���ڸ�)
    } else {
        v_resno = data.getResno1() +'-' + data.getResno2();          // �ֹι�ȣ1(���ڸ�) + �ֹι�ȣ1(���ڸ�)
    }

    if(!(v_resno == null || v_resno.equals(""))){
        // v_resno = v_resno.substring(0, 6) + "-" + v_resno.substring(6);
        if (v_resno.length()>6) {
            v_resno = v_resno.substring(0, 6) + "-*******";
        }
    }
    */

    // v_pwd = data.getPwd();            // ��ȣȭ��й�ȣ
    v_name = data.getName();           // �̸�
    v_eng_name = data.getEng_name();       //�����̸�
    v_membergubunnm = data.getMembergubunnm();  // ȸ������
    v_registgubunnm = data.getRegistgubunnm();  // ���԰��
    v_email = data.getEmail();          // email
    v_authority = data.getAuthority();      // ����
    v_post1 = data.getPost1();          // ����1
    v_post2 = data.getPost2();          // ����2
    v_addr = data.getAddr();           // �ּ�
    v_addr2 = data.getAddr2();          // �ּ�2
    v_hometel = data.getHometel();        // ����ȭ��ȣ
    v_handphone = data.getHandphone();      // �޴���ȭ��ȣ
    v_ismailing = data.getIsmailing();      // ���ϼ��Ź��
    v_indate = data.getIndate();         // ������
    v_lglast = data.getLglast();         // �����α��νð�
    v_lgip = data.getLgip();           // �α���IP
    v_lgcnt = data.getLgcnt();          // �α���Ƚ��
    v_comptext = data.getComptext();       // ȸ���
    v_comptel = data.getComptel();        // ȸ����ȭ��ȣ
    v_comp_post1 = data.getComp_post1();     // ȸ�� �����ȣ1
    v_comp_post2 = data.getComp_post2();     // ȸ�� �����ȣ2
    v_comp_addr1 = data.getComp_addr1();     // ȸ�� �ּ�1
    v_comp_addr2 = data.getComp_addr2();     // ȸ�� �ּ�2
    v_ismailing = data.getIsmailing();      // �̸��ϼ��ſ���
    v_isopening = data.getIsopening();      // ����ó��������
    v_islettering = data.getIslettering();    // �������ͼ��ſ���
    v_jikup = data.getJikup();          // ����
    v_degree = data.getDegree();         // �з�
    v_state = data.getState();          // ������
    v_validation = data.getValidation();     // �Ǹ���������
    v_indate = data.getIndate();         // �Ǹ���������
    v_ldate = data.getLdate();      // �Ǹ���������
    v_registerroutenm = data.getRegisterroutenm();
    vv_grcodenm = data.getGrcodenm();

    v_workfieldcd = data.getWorkfieldcd(); //����о�

    //2009.10.29 ��ȭ��ȣ ó��, �Է¶��� �Ѱ����� ������ ����
    String v_hometel1 = "";
    String v_hometel2 = "";
    String v_hometel3 = "";
    String v_handphone1 = "";
    String v_handphone2 = "";
    String v_handphone3 = "";
    String v_comptel1 = "";
    String v_comptel2 = "";
    String v_comptel3 = "";

    String[] arrHometel = v_hometel.split("-");
    String[] arrHandphone = v_handphone.split("-");
    String[] arrComptel = v_comptel.split("-");

    //����ȭ��ȣ ó��
    v_hometel = v_hometel.replace("-","");
    if (v_hometel.length() != 0) {
        if (arrHometel.length == 3) {
            v_hometel1  = arrHometel[0];
            v_hometel2  = arrHometel[1];
            v_hometel3  = arrHometel[2];
        } else if ("02".equals(v_hometel.substring(0,2))) {
            if (v_hometel.length() >= 2) v_hometel1 = v_hometel.substring(0,2);
            if (v_hometel.length() >= 6) {
                v_hometel2  = v_hometel.substring(2,6);
            } else if (v_hometel.length() > 2 && v_hometel.length() <= 6) {
                v_hometel2  = v_hometel.substring(2,v_hometel.length());
            }
            if (v_hometel.length() > 6) v_hometel3  = v_hometel.substring(6);
        } else {
            if (v_hometel.length() >= 3) v_hometel1 = v_hometel.substring(0,3);
            if (v_hometel.length() >= 7) {
                v_hometel2  = v_hometel.substring(3,7);
            } else if (v_hometel.length() > 3 && v_hometel.length() <= 7) {
                v_hometel2  = v_hometel.substring(3,v_hometel.length());
            }
            if (v_hometel.length() > 7) v_hometel3  = v_hometel.substring(7);
        }
    }

    //�޴���ȭ��ȣ ó��
    v_handphone     = v_handphone.replace("-","");
    if (v_handphone.length() != 0) {
        if (arrHandphone.length == 3) {
            v_handphone1    = arrHandphone[0];
            v_handphone2    = arrHandphone[1];
            v_handphone3    = arrHandphone[2];
        } else {
            if (v_handphone.length() >= 3) v_handphone1 = v_handphone.substring(0,3);
            if (v_handphone.length() >= 7) {
                v_handphone2    = v_handphone.substring(3,7);
            } else if (v_handphone.length() > 3 && v_handphone.length() <= 7) {
                v_handphone2    = v_handphone.substring(3,v_handphone.length());
            }
            if (v_handphone.length() > 7) v_handphone3  = v_handphone.substring(7);
        }
    }

    //ȸ����ȭ��ȣ ó��
    v_comptel   = v_comptel.replace("-","");
    if (v_comptel.length() != 0) {
        if (arrComptel.length == 3) {
            v_comptel1  = arrComptel[0];
            v_comptel2  = arrComptel[1];
            v_comptel3  = arrComptel[2];
        } else if ("02".equals(v_comptel.substring(0,2))) {
            if (v_comptel.length() >= 2) v_comptel1 = v_comptel.substring(0,2);
            if (v_comptel.length() >= 6) {
                v_comptel2  = v_comptel.substring(2,6);
            } else if (v_comptel.length() > 2 && v_comptel.length() <= 6) {
                v_comptel2  = v_comptel.substring(2,v_comptel.length());
            }
            if (v_comptel.length() > 6) v_comptel3  = v_comptel.substring(6);
        } else {
            if (v_comptel.length() >= 3) v_comptel1 = v_comptel.substring(0,3);
            if (v_comptel.length() >= 7) {
                v_comptel2  = v_comptel.substring(3,7);
            } else if (v_comptel.length() > 3 && v_comptel.length() <= 7) {
                v_comptel2  = v_comptel.substring(3,v_comptel.length());
            }
            if (v_comptel.length() > 7) v_comptel3  = v_comptel.substring(7);
        }
    }


    if(v_selTab.equals("propose") || v_selTab.equals("")){
        v_imgColor1 = "blue";
    } else if(v_selTab.equals("education")){
        v_imgColor2 = "blue";
    } else if(v_selTab.equals("graduation")){
        v_imgColor3 = "blue";
    } else if(v_selTab.equals("scorecomplete")){
        v_imgColor4 = "blue";
    }else if(v_selTab.equals("offpropose")){
        v_imgColor5 = "blue";
    }else if(v_selTab.equals("offgraduation")){
        v_imgColor6 = "blue";
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<style>
    
    .tdBorder {border:1px solid;}
</style>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language="JavaScript">
    function select_tab(sel){
        document.form1.p_selTab.value = sel;
        document.form1.p_process.value = "PersonalSelect";
        document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
        document.form1.submit();
    }
function whenSimpleSave(type, p_membergubun) {
    var title = "";
    var sqlNum = "";
    var checkSqlNum = "";
    var elseSqlNum = "";
    var subj="",year="",subjseq="";

    switch (type) {
        case 1 : title = "ȸ������"; sqlNum="member.membergubun.update"; break;
        case 2 : title = "ȸ������"; sqlNum="member.state.update"; break;
        case 3 : title = "���������ȣ"; sqlNum="member.yeunsu.insert"; checkSqlNum="member.yeunsu.exist"; elseSqlNum="member.yeunsu.update";
            subj=$("#pp_subj").val().toUpperCase();year=$("#pp_year").val();subjseq=$("#pp_subjseq").val();
            break;
    }

    if(type==3)
    {
        if(subj=="" || year=="" || subjseq=="")
        {
            alert("�����ڵ�,�⵵,����� �ݵ�� �Է� �ϼž� �մϴ�.");
            return;
        }

        if(subj.length>7)
        {
            alert("�����ڵ��� ���̴� 7�ڸ� ���� �Դϴ�.Ȯ�����ּ���");
            return;
        }

        if(year.length!=4 || subjseq.length!=4)
        {
            alert("�⵵,������ ���̴� 4�ڸ� �Դϴ�.Ȯ�����ּ���");
            return;
        }
    }
    if(!confirm(title+"��(��) ����(����,����)�Ͻðڽ��ϱ�?")) {
        return;
    }
    $.post("/servlet/controller.common.AjaxServlet"
            , {   sqlNum:sqlNum,rerurnFunction:"resultSimpleSave", checkSqlNum:checkSqlNum, elseSqlNum:elseSqlNum
                , p_userid:'<%=v_userid%>'
                , p_membergubun : p_membergubun
                , p_yeunsuno : $("#p_yeunsuno").val()
                , p_yeonsunm : $("#p_yeonsunm").val()
                , p_subjcode : subj
                , p_subjseq : subjseq
                , p_year : year
                , p_grcode : '<%= box.getString("s_grcode") %>'
            }
            , function(data) {
                $("#ajaxDiv").html(data);
            });
}
function resultSimpleSave(data) {
    if (data.result=='true') { alert("����(����)�߽��ϴ�.");whenReCall();}
    else alert("����(����)�� �����Ͽ����ϴ�.\n"+data.result);
}
//Tab ���ý� ����
function showTab(clickTab)
{
    g_showTab(clickTab, 4);
}

function g_showTab(tabNo, count)
{

    var clickTabNo = new Number(tabNo);
    var tabCount   = new Number(count);

    if( clickTabNo == 0 || tabCount == 0 ) return;

    for(i=1; i<=tabCount; i++)
    {
        div = document.all["tab_"+i];

        if(!div) return;

        if( clickTabNo == i ) {
            // Ȱ��ȭ�� tab Ŭ���� return
            if(div.style.display == "") return;
            div.style.display = ""
        }
        else {
            // ���õ��� �ʴ� �ǵ��� ������ ����.
            if(div.style.display != "none") {
                div.style.display = "none";
            }
        }
    }
}

    function yeunsunoDelete(subj,year,subjseq,userid)
    {
        if(!confirm("���� ���� �Ͻðڽ��ϱ�?")) return;

        //window.self.name = "PersonalSelect";
        document.form1.pp_userid.value     = userid;
        document.form1.p_subj.value    = subj;
        document.form1.p_year.value    = year;
        document.form1.p_subjseq.value = subjseq;

//        document.form1.target = "winSelectView";
//        document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
        document.form1.p_process.value = "YeunsunoDelete";
        document.form1.submit();
        //document.form1.target = window.self.name;
    }

    function whenSearch() {
        document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
        document.form1.p_process.value = "PersonalSearchPage";
        document.form1.submit();
    }

    function whenReCall()
    {
       document.form1.p_process.value = "PersonalSelect";
       document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
       document.form1.submit();

    }
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id="ajaxDiv"></div>
    <form name = "form1" method = "post">
    <input type="hidden" name="p_postgubun" value="<%=v_process%>">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_search" value="<%=v_search%>">
    <input type="hidden" name="p_searchtext" value="<%=v_searchtext%>">
    <input type="hidden" name="p_selTab">
    <input type="hidden" name="p_seq"       value = "">
    <input type="hidden" name="p_types"     value = "">
    <input type="hidden" name="pp_type"     value = "">
    <input type="hidden" name="p_upfilecnt" value = "">
    <input type="hidden" name="p_subj">
    <input type="hidden" name="p_year">
    <input type="hidden" name="p_subjseq">
    <input type="hidden" name="pp_userid">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">

    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
       <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/study/s_title04.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right" height="20" >
            <a href="javascript:whenSearch()" border=0 ><img src="/images/admin/button/btn_anotherpeople.gif" border="0"></a>
            </td>
        </tr>
      </table>

      <!----------------- �����̷� ����ȸ ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="4" border="0">
        <tr>
          <td colspan="4" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="15%" class="table_title tdBorder"><b>ȸ������</b></td>
          <td class="table_02_2 tdBorder" ><%=v_membergubunnm%></td>
          <td class="table_title tdBorder" width="15%"><b>�����׷�</b></td>
          <td class="table_02_2 tdBorder" width="35%"><%= data.getGrcodenm() %> / <%= data.getGrcode() %></td>
        </tr>
        <tr>
          <td width="15%" class="table_title tdBorder"><b>ID</b></td>
          <td class="table_02_2 tdBorder" ><%= v_userid %></td>
          <td class="table_title tdBorder" width="15%"><b>Mobile ID</b></td>
          <td class="table_02_2 tdBorder" width="35%"><%= data.getMobileUserId() %></td>
        </tr>
        <tr>
          <td width="15%" class="table_title tdBorder"><b>����(�ѱ�)</b></td>
          <td class="table_02_2 tdBorder" ><%=v_name%></td>
          <td class="table_title tdBorder" width="15%"><b>����(����)</b></td>
          <td class="table_02_2 tdBorder" width="35%">
            <%=v_eng_name%>
          </td>
        </tr>
        <tr>
          <td width="15%" class="table_title tdBorder"><b>�̸���</b></td>
          <td class="table_02_2 tdBorder" colspan="3"><%=v_email%></td>
        </tr>
        <tr>
          <td class="table_title tdBorder"><b>�����ȣ(����)</b></td>
          <td class="table_02_2 tdBorder" colspan="3">
            <%=v_post1%> - <%=v_post2%>
          </td>
        </tr>
        <tr>
          <td class="table_title tdBorder"><b>�ּ�(����)</b></td>
          <td class="table_02_2 tdBorder" colspan='3'>
            <%=v_addr%>&nbsp;&nbsp;
          </td>
        </tr>
        <tr>
          <td width="15%" class="table_title tdBorder"><b>�����ȣ(ȸ��)</b></td>
          <td class="table_02_2 tdBorder" colspan="3">
            <%=v_comp_post1%> - <%=v_comp_post2%>
          </td>
        </tr>
        <tr>
          <td class="table_title tdBorder"><b>�ּ�(ȸ��)</b></td>
          <td class="table_02_2 tdBorder" colspan='3'>
            <%=v_comp_addr1%>&nbsp;&nbsp; <%=v_comp_addr2%>
          </td>
        </tr>

        <tr>
          <td width="15%" class="table_title tdBorder"><b>��ȭ��ȣ(����)</b></td>
          <td class="table_02_2 tdBorder" >
              <%= v_hometel1 %> - <%=v_hometel2%> - <%=v_hometel3%>
          </td>
          <td class="table_title tdBorder" width="15%"><b>�޴���ȭ</b></td>
          <td class="table_02_2 tdBorder" width="35%">
            <%= v_handphone1 %> - <%=v_handphone2%> - <%=v_handphone3%>
          </td>
        </tr>
        <tr>
          <td width="15%" class="table_title tdBorder"><b>��ȭ��ȣ(ȸ��)</b></td>
          <td class="table_02_2 tdBorder" >
                <%= v_comptel1 %> - <%=v_comptel2%> - <%=v_comptel3%>
          </td>
          <td class="table_title tdBorder" width="15%"><b>ȸ���</b></td>
          <td class="table_02_2 tdBorder" width="35%"><%=v_comptext%></td>
        </tr>
        <tr>
          <!--<td width="15%" class="table_title tdBorder"><b>�����з�</b></td>
          <td class="table_02_2 tdBorder" >
            <%= CodeConfigBean.getCodeGubunSelect("0069","",1,"p_degree",v_degree,"",3)%>
          </td>
          <td class="table_title tdBorder" width="15%"><b>����/����������</b></td>
          <td class="table_02_2 tdBorder" width="35%">
              <%= data.getJobnm()   %> &nbsp;/&nbsp; <%= data.getJob_culturenm() %>
              <%=CodeConfigBean.getCodeGubunSelect ("0104","", 1,"p_jikup", v_jikup,"",3) %>
          </td>-->
          <td width="15%" class="table_title tdBorder"><b>����</b></td>
          <td class="table_02_2 tdBorder" >
<!--            <%=CodeConfigBean.getCodeGubunSelect ("0104","", 1,"p_jikup", v_jikup,"",3) %>-->
            <%=CodeConfigBean.getCodeName("0104",v_jikup) %>
          </td>
          <td class="table_title tdBorder" width="15%"><b>����о�</b></td>
          <td class="table_02_2 tdBorder" width="35%">
<!--              <%=CodeConfigBean.getCodeGubunSelect ("0103","", 1,"p_workfieldcd",  v_workfieldcd, "",3) %>-->
              <%=CodeConfigBean.getCodeName("0103",v_workfieldcd) %>
          </td>
        </tr>
        <tr>
          <td width="15%" class="table_title tdBorder"><b>���ϼ��ſ���</b></td>
          <td class="table_02_2 tdBorder" >
                <input name="p_ismailing" type=radio   value="Y" <%=(v_ismailing.equals("Y"))?"checked":""%>> ����
                <input name="p_ismailing" type=radio   value="N" <%=(v_ismailing.equals("N"))?"checked":""%>> ���Űź�
          </td>
          <td class="table_title tdBorder" width="15%"><b>�������ͼ��ſ���</b></td>
          <td class="table_02_2 tdBorder" width="35%">
                <input name="p_islettering" type=radio   value="Y" <%=(v_islettering.equals("Y"))?"checked":""%>> ����
                <input name="p_islettering" type=radio   value="N" <%=(v_islettering.equals("N"))?"checked":""%>> ���Űź�
          </td>
        </tr>
        <tr>
          <td width="15%" class="table_title tdBorder"><b>����ó��������</b></td>
          <td class="table_02_2 tdBorder" >
                <input name="p_isopening" type=radio   value="Y" <%=(v_isopening.equals("Y"))?"checked":""%>> ����
                <input name="p_isopening" type=radio   value="N" <%=(v_isopening.equals("N"))?"checked":""%>> �����
          </td>
          <td class="table_title tdBorder" width="15%"><b>ȸ������</b></td>
          <td class="table_02_2 tdBorder" width="35%">
                <%=(v_state.equals("Y"))?"����":"Ż��" %>
<!--                <SELECT NAME="p_state">-->
<!--                    <option value="Y" <%=(v_state.equals("Y"))?"selected":""%>>����</option>-->
<!--                    <option value="N" <%=(v_state.equals("N"))?"selected":""%>>Ż��</option>-->
<!--                </SELECT>-->
          </td>
        </tr>
        <tr>
          <td width="15%" class="table_title tdBorder"><b>���԰��</b></td>
          <td class="table_02_2 tdBorder" ><%=vv_grcodenm %> (<%=v_registerroutenm%>)</td>
          <td class="table_title tdBorder" width="15%"><b>�Ǹ���������</b></td>
          <td class="table_02_2 tdBorder" width="35%"><%=v_validation%></td>
        </tr>
        <tr>
          <td class="table_title tdBorder">���ʰ�����</td>
          <td class="table_02_2 tdBorder"><%=FormatDate.getFormatDate(v_indate,"yyyy/MM/dd hh:mm:ss")%></td>
          <td class="table_title tdBorder">����������</td>
          <td class="table_02_2 tdBorder"><%=FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd hh:mm:ss")%></td>
        </tr>
        <tr>
          <td align="center" colspan="5" height="25" bgcolor="#F7F7F7">
     <!----------------- ���κ� ��㳻������Ʈ ���� ----------------->
            <br>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="110">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_blue_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_blue_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_blue_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_blue_img5.gif" align="center" height="16" valign="middle">
                      <b><font color="#FFFFFF">��㳻��</font></b>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_blue_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td><a href="javascript:insertCounsel()" class="btn_gr"><span>���</span></a></td>
              </tr>
            </table>
<SCRIPT LANGUAGE="JavaScript">
<!--
// �����
function insertCounsel() {
//        window.self.name = "PersonalSelect";
        document.form1.p_subjyearsubjseq.value= '';
        open_window("openCounsel","","50","50","800","650", false,false,true,true,true);
        document.form1.target = "openCounsel";
        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
        document.form1.p_process.value = 'CounselInsertPage';
        document.form1.submit();

//        document.form1.target = window.self.name;
}

// // �����2
function insertCounsel2(subj, year, subjseq) {
//        window.self.name = "PersonalSelect";
        document.form1.p_subjyearsubjseq.value= subj+"/"+year +"/"+subjseq;
        open_window("openCounsel","","50","50","800","650", false,false,true,true,true);
        document.form1.target = "openCounsel";
        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
        document.form1.p_process.value = 'CounselInsertPage';
        document.form1.submit();

//        document.form1.target = window.self.name;
}


//��㳻������
function viewCounsel(no) {
//     window.self.name = "PersonalSelect";
     document.form1.p_no.value= no;
     open_window("openCounsel","","50","50","800","650", false,false,true,true,true);
     document.form1.target = "openCounsel";
     document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
     document.form1.p_process.value = 'CounselUpdatePage';
     document.form1.submit();

//     document.form1.target = window.self.name;
}



// ��㳻������
function viewCounsel(no) {
//    window.self.name = "PersonalSelect";
    document.form1.p_no.value= no;
    open_window("openCounsel","","50","50","800","650", false,false,true,true,true);
    document.form1.target = "openCounsel";
    document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
    document.form1.p_process.value = 'CounselUpdatePage';
    document.form1.submit();

//    document.form1.target = window.self.name;
}

//Q&A��ȭ�� �������� �̵�
function viewHomeqna(seq, upfilecnt, userid, types, type) {
//    window.self.name = "PersonalSelect";
    open_window("openHomeqna","","50","50","800","650", false,false,true,"yes","yes");
    document.form1.target = "openHomeqna";
    document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
    document.form1.p_process.value = 'ViewHomeqna';

    document.form1.p_seq.value = seq;
    document.form1.p_userid.value   = userid;
    document.form1.p_types.value    = types;
    document.form1.pp_type.value    = type;
    document.form1.p_upfilecnt.value = upfilecnt;

    document.form1.submit();

//    document.form1.target = window.self.name;
}

//�������� ��ȭ�� �������� �̵�
function viewQna(seq,subj,year,subjseq) {
//    window.self.name = "PersonalSelect";
    open_window("openQna","","50","50","800","650", false,false,true,"yes","yes");
    document.form1.target = "openQna";
    document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
    document.form1.p_process.value = 'ViewQna';

    document.form1.p_seq.value     = seq;
    document.form1.p_subj.value    = subj;
    document.form1.p_year.value    = year;
    document.form1.p_subjseq.value = subjseq;

    document.form1.submit();

//    document.form1.target = window.self.name;
}

//�з� ����
function selectMcode() {
        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
        document.form1.p_process.value = 'PersonalSelect';
        document.form1.submit();
}

//���ڵ�з� ����
function selectType() {
        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
        document.form1.p_process.value = 'PersonalSelect';
        document.form1.submit();
}


//������ �̵�
function go(index) {
document.form1.p_action.value = "go";
  document.form1.p_pageno.value = index;
  document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
  document.form1.p_process.value = "PersonalSelect";
  document.form1.submit();
}
//������ �̵�
function goPage(pageNum) {
    document.form1.p_action.value = "go";
   document.form1.p_pageno.value = pageNum;
   document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
   document.form1.p_process.value = "PersonalSelect";
   document.form1.submit();
}

//-->
</SCRIPT>

<%
    int vc_no = 0;
    String vc_userid = "";
    String vc_cuserid = "";
    String vc_name = "";
    String vc_title = "";
    String vc_ftext = "";
    String vc_ctext = "";
    String vc_mcode = "";
    String vc_mcodenm = "";
    String vc_etime = "";
    String vc_subj = "";
    String vc_year = "";
    String vc_subjseq = "";
    String vc_status = "";
    String vc_sdate = "";
    String vc_ldate = "";
    String vc_gubun = "";
    String vc_status_view = "";
    String vc_sdate_view = "";
    String vc_ldate_view = "";
    String vc_gubun_view = "";

    //2009.10.30 �߰�
    String vc_type = "";
    String vc_typenm = "";
    int vc_tabseq    = 0;
    String vc_types = "";
    int vc_upfilecnt = 0;


    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    int v_pageno = box.getInt("p_pageno");
    if (v_pageno == 0)  v_pageno = 1;
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));

    int j = 0;

    String p_mcode = box.getString("s_mcode");
    String p_type = box.getString("s_type");

    String sScriptString = "";
%>

<input type="hidden" name="p_userid"          value="<%=v_searchtext%>">
<input type="hidden" name="p_no"              value="">
<input type="hidden" name="s_grcode"          value="<%= box.getString("s_grcode") %>">
<input type="hidden" name="p_subjyearsubjseq" value="">
<input type="hidden" name="p_pageno"          value="<%=v_pageno%>">
<input type="hidden" name="p_action"          value="">


            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#636563">
                  <table width="100%" border="0" cellspacing="1" cellpadding="0">
                    <tr>
                      <td bgcolor="#FFFFFF" valign="top">
                      <br>
                      <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940" >
                        <tr>
                          <td colspan="9" class="table_top_line"></td>
                        </tr>
                        <tr>
                          <td class="table_title tdBorder" width="5%"><b>NO</b></td>
                          <td class="table_title tdBorder"style="padding-left:32px;;" width="10%"><b>
                          <%-- <kocca_select:select name="s_type" sqlNum="counseltype"  param=" " onChange="selectType('go');" attr="�з�" selectedValue="<%= p_type %>" isLoad="true" all="none" type="3" styleclass="table_title tdBorder"/> --%>
						  <kocca:selectBox name="s_type" id="oGrcode" optionTitle="-- ��ü --" type="sqlID" sqlID="code.list.counseltype" isLoad="true" />                          
                          </b></td> 
                          <td class="table_title tdBorder" width="47%"><b>����</b></td>
                          <!--td class="table_title tdBorder" width="10%"><b>�ۼ���</b></td-->
                          <td class="table_title tdBorder" width="12%"><b>�����</b></td>
                          <td class="table_title tdBorder" width="8%"><b>�亯����</b></td>
                          <!--td class="table_title tdBorder" width="8%"><b>����</b></td-->
                        </tr>
                      </table>
                      <div style='width:960px;height:230px;overflow:auto;visibility:visible;border:1'>
                      <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940" >
<%


    ArrayList list1 = (ArrayList)request.getAttribute("counselList");

    for (j=0; j<list1.size();j++) {
        DataBox dbox1   = (DataBox)list1.get(j);
        vc_no = dbox1.getInt("d_no");
        vc_userid = dbox1.getString("d_userid");
        vc_name = dbox1.getString("d_name");
        vc_cuserid = dbox1.getString("d_cuserid");
        vc_title = dbox1.getString("d_title");
        vc_ftext = dbox1.getString("d_ftext");
        vc_ctext = dbox1.getString("d_ctext");
        vc_mcode = dbox1.getString("d_mcode");
        vc_mcodenm = dbox1.getString("d_mcodenm");
        vc_etime = dbox1.getString("d_etime");
        vc_subj = dbox1.getString("d_subj");
        vc_year = dbox1.getString("d_year");
        vc_subjseq = dbox1.getString("d_subjseq");
        vc_sdate = dbox1.getString("d_sdate");
        vc_status = dbox1.getString("d_status");
        vc_ldate = dbox1.getString("d_ldate");
        vc_gubun = dbox1.getString("d_gubun");
        vc_type = dbox1.getString("d_type");
        vc_tabseq = dbox1.getInt("d_tabseq");
        vc_types = dbox1.getString("d_types");
        vc_upfilecnt = dbox1.getInt("d_upfilecnt");


        v_totalpage = dbox1.getInt("d_totalpage");
        v_rowcount = dbox1.getInt("d_rowcount");
        v_dispnum = dbox1.getInt("d_dispnum");

        //vc_type  PQ : Ȩ������, BU : ���׽Ű�, CU : ��ڿ���, OO : 1vs1���, MM : 1vs1���, OFF : �������, SUBJ : ����������
        if (vc_type.equals("PQ")) {
            vc_typenm = "Ȩ������ Q&A";
        } else if (vc_type.equals("BU") || vc_type.equals("CU") || vc_type.equals("OO") || vc_type.equals("MM")) {
            vc_typenm = "1vs1���";
        } else if (vc_type.equals("OFF")) {
            vc_typenm = "�������";
        } else if (vc_type.equals("SUBJ")) {
            vc_typenm = "����������";
        } else {
            vc_typenm = "";
        }

        //vc_status  1 : ��ó��, 2 : ó����, 3 : �Ϸ�
        if (vc_status.equals("1")) {
            vc_status_view = "������";
        } else if (vc_status.equals("2")) {
            vc_status_view = "�亯�غ���";
        } else if (vc_status.equals("3")) {
            vc_status_view = "�亯�Ϸ�";
        } else {
            vc_status_view = "";
        }

        // vc_gubun   in : ���� , out : �߽�
        if (vc_gubun.equals("in")) {
            vc_gubun_view = "����";
        } else if (vc_gubun.equals("out")) {
            vc_gubun_view = "�߽�";
        }

        vc_sdate_view = FormatDate.getFormatDate(vc_sdate,"yyyy/MM/dd");
        vc_ldate_view = FormatDate.getFormatDate(vc_ldate,"yyyy/MM/dd");

        //�󼼺��� ��ũ �����
        if ("OFF".equals(vc_type)) {
            sScriptString = "viewCounsel('" + vc_no + "');";
        } else if ("PQ".equals(vc_type) || "BU".equals(vc_type) || "CU".equals(vc_type) || "OO".equals(vc_type) || "MM".equals(vc_type)) {
            sScriptString = "viewHomeqna('" + vc_no + "', '" + vc_upfilecnt + "', '" + vc_userid + "', '" + vc_types + "', '" + vc_type + "');";
        } else if ("SUBJ".equals(vc_type)) {
            sScriptString = "viewQna('" + vc_no + "', '" + vc_subj + "', '" + vc_year + "', '" + vc_subjseq + "');";
        }
%>
                        <tr>
                          <td class="table_01 tdBorder"   width="5%"><%=v_dispnum%></td>
                          <td class="table_02_1 tdBorder" width="10%"><%=vc_typenm%></td>
                          <td class="table_02_2 tdBorder" width="47%"><a href="javascript:<%= sScriptString %>"><%=vc_title%></a></td>
                          <!--td class="table_02_1" width="10%"><%//=vc_name%></td-->
                          <td class="table_02_1 tdBorder" width="12%"><%=vc_sdate_view%></td>
                          <td class="table_02_1 tdBorder" width="8%"><%=vc_status_view%></td>
                          <!--td class="table_02_1" width="8%"><%//=vc_gubun_view%></td-->
                        </tr>
<%
    }

    if (j==0){
%>

                        <tr>
                          <td class="table_01" colspan="7">��ϵ� ������ �����ϴ�.</td>
                        </tr>
<%
    }
%>
                      </table>
                      <!--table><tr><td height="5"></td></tr></table>
                       <br>
                       <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
                         <tr>
                           <td align="right" valign="absmiddle">
                             <%//= PageUtil.printPageList(v_totalpage, v_pageno, row) %>
                           </td>
                         </tr>
                       </table-->
                      </div>

                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- ���κ� ��㳻������Ʈ �� ----------------->
                        <br>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="110" height="23" align="center" valign="middle">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_<%=v_imgColor1%>_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_<%=v_imgColor1%>_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_<%=v_imgColor1%>_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_<%=v_imgColor1%>_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:select_tab('propose')"><b><font color="#FFFFFF">��û����</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_<%=v_imgColor1%>_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_<%=v_imgColor2%>_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_<%=v_imgColor2%>_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_<%=v_imgColor2%>_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_<%=v_imgColor2%>_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:select_tab('education')"><b><font color="#FFFFFF">��������</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_<%=v_imgColor2%>_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_<%=v_imgColor3%>_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_<%=v_imgColor3%>_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_<%=v_imgColor3%>_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_<%=v_imgColor3%>_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:select_tab('graduation')"><b><font color="#FFFFFF">�������</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_<%=v_imgColor3%>_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td background="/images/admin/study/study_<%=v_imgColor5%>_img1.gif" rowspan="3" width="5" height="23"></td>
                          <td background="/images/admin/study/study_<%=v_imgColor5%>_img3.gif" height="5"></td>
                          <td rowspan="3" background="/images/admin/study/study_<%=v_imgColor5%>_img2.gif" width="5" height="23"></td>
                        </tr>
                        <tr>
                          <td background="/images/admin/study/study_<%=v_imgColor5%>_img5.gif" align="center" height="16" valign="middle">
                          <a href="javascript:select_tab('offpropose')"><b><font color="#FFFFFF">(��)��û����</font></b></a>
                          </td>
                        </tr>
                        <tr>
                          <td background="/images/admin/study/study_<%=v_imgColor5%>_img4.gif" height="2"></td>
                        </tr>
                     </table>
                </td>
                <td width="2"></td>
                <td width="110">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td background="/images/admin/study/study_<%=v_imgColor6%>_img1.gif" rowspan="3" width="5" height="23"></td>
                          <td background="/images/admin/study/study_<%=v_imgColor6%>_img3.gif" height="5"></td>
                          <td rowspan="3" background="/images/admin/study/study_<%=v_imgColor6%>_img2.gif" width="5" height="23"></td>
                        </tr>
                        <tr>
                          <td background="/images/admin/study/study_<%=v_imgColor6%>_img5.gif" align="center" height="16" valign="middle">
                          <a href="javascript:select_tab('offgraduation')"><b><font color="#FFFFFF">(��)�������</font></b></a>
                          </td>
                        </tr>
                        <tr>
                          <td background="/images/admin/study/study_<%=v_imgColor6%>_img4.gif" height="2"></td>
                        </tr>
                     </table>
                </td>
                <td>&nbsp;</td>
              </tr>
            </table>


            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#636563">
                  <table width="100%" border="0" cellspacing="1" cellpadding="0">
                    <tr>
                      <td bgcolor="#FFFFFF" valign="top">

<%  if(v_selTab.equals("propose") || v_selTab.equals("")){      %>      <!---- ��û���� ---->
<%@ include file="/learn/admin/study/za_PersonalPropose_L.jsp"    %>
<%  }else if(v_selTab.equals("education")){      %>                     <!---- �������� ---->
<%@ include file="/learn/admin/study/za_PersonalEducation_L.jsp"  %>
<%  }else if(v_selTab.equals("graduation")){      %>                    <!---- ������� ---->
<%@ include file="/learn/admin/study/za_PersonalGraduation_L.jsp" %>
<%  }else if(v_selTab.equals("scorecomplete")){   %>                    <!---- �����̼���Ȳ ---->
<%@ include file="/learn/admin/study/za_PersonalScoreComplete_L.jsp" %>
<%  }else if(v_selTab.equals("offpropose")){   %>                    <!---- �������� ��û���� ---->
<%@ include file="/learn/admin/study/za_PersonalOffPropose_L.jsp" %>
<%  }else if(v_selTab.equals("offgraduation")){   %>                    <!---- �������� ������� ---->
<%@ include file="/learn/admin/study/za_PersonalOffGraduation_L.jsp" %>
<%  }   %>
                      </td>
                    </tr>
                    <tr style="display:none;">
                      <td bgcolor="#FFFFFF" valign="top">
    <br>
            <h2><img src="/images/portal/myclass/h2_tit6.gif" alt="��������Ʈ" class="fl_l" /><p class="category">���� ����Ʈ : <strong><%= v_availablepoint_text %></strong> Point</p></h2>
            <div id="tab_1">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="110" height="23" align="center" valign="middle">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_blue_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_blue_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_blue_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_blue_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:showTab(1)"><b><font color="#FFFFFF">��������Ʈ</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_blue_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_black_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_black_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_black_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:showTab(2)"><b><font color="#FFFFFF">��������Ʈ</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_black_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_black_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_black_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:showTab(3)"><b><font color="#FFFFFF">�������Ʈ</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                </td>
                <td>&nbsp;</td>
              </tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#636563">
                  <table width="100%" border="0" cellspacing="1" cellpadding="0">
                    <tr>
                      <td bgcolor="#FFFFFF" valign="top">
                      <br>
                      <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940" >
                        <tr>
                          <td colspan="9" class="table_top_line"></td>
                        </tr>
            <tr>
                <td class="table_title tdBorder">���泯��</td>
                <td class="table_title tdBorder">��������Ʈ</td>
                <td class="table_title tdBorder">�������Ʈ</td>
                <td class="table_title tdBorder">��������Ʈ</td>
            </tr>
            <tbody>
<%
    for(int i = 0; i < selectHavePointList.size(); i++) {

        DataBox dbox1 = (DataBox)selectHavePointList.get(i);

        String v_tid            =  dbox1.getString("d_tid");
        String v_getdate        =  dbox1.getString("d_getdate");
        String v_getpoint =  s_fmt.format(dbox1.getInt("d_getpoint"));
        String v_usepoint =  s_fmt.format(dbox1.getInt("d_usepoint"));
        String v_usepoint_text  =  dbox1.getString("d_usepoint");
        String v_lefrpoint =  s_fmt.format(dbox1.getInt("d_lefrpoint"));
        String v_expiredate =  dbox1.getString("d_expiredate");

        v_getdate      = FormatDate.getFormatDate(v_getdate,"yyyy.MM.dd");
%>
            <tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="table_01"><%= v_getdate %></td>
                <td class="table_01"><%= v_getpoint %></td>
                <td class="table_01"><%= "0".equals(v_usepoint) ? v_usepoint_text : v_usepoint %></td>
                <td class="table_01"><strong><%= v_lefrpoint %></strong></td>
            </tr>
<%
    }
%>
<%  if(selectHavePointList.size() == 0 ){%>
            <tr>
                <td height="3" colspan="4" align="center">����Ʈ ������ �����ϴ�.</td>
            </tr>
<%  }%>
            </tbody>
            </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

            </div>
            <div id="tab_2" STYLE="display:none">

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="110" height="23" align="center" valign="middle">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_black_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_black_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_black_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:showTab(1)"><b><font color="#FFFFFF">��������Ʈ</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_blue_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_blue_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_blue_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_blue_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:showTab(2)"><b><font color="#FFFFFF">��������Ʈ</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_blue_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_black_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_black_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_black_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:showTab(3)"><b><font color="#FFFFFF">�������Ʈ</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                </td>
                <td>&nbsp;</td>
              </tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#636563">
                  <table width="100%" border="0" cellspacing="1" cellpadding="0">
                    <tr>
                      <td bgcolor="#FFFFFF" valign="top">
                      <br>
                      <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940" >
                        <tr>
                          <td colspan="9" class="table_top_line"></td>
                        </tr>
            <tr>
                <td class="table_title tdBorder">��������</td>
                <td class="table_title tdBorder">��������Ʈ</td>
                <td class="table_title tdBorder">��������</td>
                <td class="table_title tdBorder">������</td>
                <td class="table_title tdBorder"><p>�����ݾ�</td>
            </tr>
            <tbody>
<%
    for(int i = 0; i < selectStoldPointList.size(); i++) {
        DataBox dbox2 = (DataBox)selectStoldPointList.get(i);

        String v_tid            =  dbox2.getString("d_tid");
        String v_getdate        =  dbox2.getString("d_getdate");
        String v_title          =  dbox2.getString("d_title");
        String v_getpoint =  s_fmt.format(dbox2.getInt("d_getpoint"));
        String v_subjprice      =  s_fmt.format(dbox2.getInt("d_subjprice"));
        String v_price          =  s_fmt.format(dbox2.getInt("d_price"));

        v_getdate      = FormatDate.getFormatDate(v_getdate,"yyyy.MM.dd");
%>
            <tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="table_01"><%= v_getdate %></td>
                <td class="table_01"><%= v_getpoint %></td>
                <td class="table_01"><%= v_title %></td>
                <td class="table_01"><%= v_subjprice %></td>
                <td class="table_01"><strong><%= v_price %></strong></td>
            </tr>
<%
    }
%>
<%  if(selectHavePointList.size() == 0 ){%>
            <tr>
                <td height="20" colspan="5" align="center">����Ʈ ������ �����ϴ�.</td>
            </tr>
<%  }%>
            </tbody>
            </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

            </div>
            <div id="tab_3" STYLE="display:none">

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="110" height="23" align="center" valign="middle">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_black_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_black_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_black_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:showTab(1)"><b><font color="#FFFFFF">��������Ʈ</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_black_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_black_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_black_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:showTab(2)"><b><font color="#FFFFFF">��������Ʈ</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_black_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td background="/images/admin/study/study_blue_img1.gif" rowspan="3" width="5" height="23"></td>
                      <td background="/images/admin/study/study_blue_img3.gif" height="5"></td>
                      <td rowspan="3" background="/images/admin/study/study_blue_img2.gif" width="5" height="23"></td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_blue_img5.gif" align="center" height="16" valign="middle">
                      <a href="javascript:showTab(3)"><b><font color="#FFFFFF">�������Ʈ</font></b></a>
                      </td>
                    </tr>
                    <tr>
                      <td background="/images/admin/study/study_blue_img4.gif" height="2"></td>
                    </tr>
                  </table>
                </td>
                <td width="2"></td>
                <td width="110">
                </td>
                <td>&nbsp;</td>
              </tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#636563">
                  <table width="100%" border="0" cellspacing="1" cellpadding="0">
                    <tr>
                      <td bgcolor="#FFFFFF" valign="top">
                      <br>
                      <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940" >
                        <tr>
                          <td colspan="9" class="table_top_line"></td>
                        </tr>
            <tr>
                <td class="table_title tdBorder">�������</td>
                <td class="table_title tdBorder">������</td>
                <td class="table_title tdBorder">�������Ʈ</td>
                <td class="table_title tdBorder">������</td>
                <td class="table_title tdBorder"><p>�����ݾ�</td>
            </tr>
            <tbody>
<%
    for(int i = 0; i < list3.size(); i++) {

        DataBox dbox3 = (DataBox)list3.get(i);

        String v_tid            =  dbox3.getString("d_tid");
        String v_usedate        =  dbox3.getString("d_usedate");
        String v_title          =  dbox3.getString("d_title");
        String v_usepoint =  s_fmt.format(dbox3.getInt("d_usepoint"));
        String v_subjprice      =  s_fmt.format(dbox3.getInt("d_subjprice"));
        String v_price          =  s_fmt.format(dbox3.getInt("d_price"));

        v_usedate      = FormatDate.getFormatDate(v_usedate,"yyyy.MM.dd");
%>
            <tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="table_01"><%= v_usedate %></td>
                <td class="table_01"><%= v_title %></td>
                <td class="table_01"><%= v_usepoint %></td>
                <td class="table_01"><%= v_subjprice %></td>
                <td class="table_01"><strong><%= v_price %></strong></td>
            </tr>
<%
    }
%>
<%  if(selectHavePointList.size() == 0 ){%>
            <tr>
                <td height="20" colspan="5" align="center">����Ʈ ������ �����ϴ�.</td>
            </tr>
<%  }%>
            </tbody>
            </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

            </div>

            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_army.gif" alt="��������" class="fl_l" /></h3>
            <table class="write">
            <tr>
                <td class="intxt end">
                    <span>
                    <%  if ("".equals(addInfobox.get("d_militarystatus"))) { %>
                    <input type="radio" name="p_militarystatus" value="" checked/>�ش����&nbsp;&nbsp;
                    <%  } else { %>
                        <kocca_select:select sqlNum="0001.v2" name="p_militarystatus" styleClass="mg_l10" param="0093" param2='<%= addInfobox.get("d_militarystatus") %>' onChange="selectMilitary" selectedValue='<%= addInfobox.get("d_militarystatus") %>' isLoad="true" type="2.2"/></span>
                    <%  }   if("00000000000000000001".equals(addInfobox.get("d_militarystatus")))   { %>
                    <span class="mg_l20">
                        �����Ⱓ <%= addInfobox.get("d_militarystart") %> ~ <%= addInfobox.get("d_militaryend") %>
                    </span>
                    <%  } else if ("00000000000000000003".equals(addInfobox.get("d_militarystatus"))) { %>
                    <span class="mg_l15">�������� : <%= addInfobox.get("d_militarymemo") %></span>
                    <%  } %>
                </td>
            </tr>
            </table>

<%  if(schoolList!=null && schoolList.size() >0) { %>
            <h3 class="pop_tit mg_b9">��������<img src="/images/portal/common/stit_applystep.gif" alt="��û����" class="fl_l" /></h3>
            <table class="ac_list">
            <colgroup><col width="114px" /><col width="101px" /><col width="107px" /><col /><col width="101px" /></colgroup>
            <thead>
            <tr>
                <th>�б���</th>
                <th>��������</th>
                <th>����(����)��</th>
                <th>�а�/����</th>
                <th>������</th>
            </tr>
            </thead>
            <tbody>
<%  for(DataBox schoolListBox : schoolList) { %>
            <tr>
                <td><%= schoolListBox.get("d_schoolname") %></td>
                <td><%= schoolListBox.get("d_status") %></td>
                <td><%= schoolListBox.get("d_send") %></td>
                <td><%= schoolListBox.get("d_major") %></td>
                <td><%= schoolListBox.get("d_place") %></td>
            </tr>
<%  } %>
            </tbody>
            </table>
<%  } %>


            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_trainnum.gif" alt="���������ȣ" class="fl_l" /><p class="btn"><a href="javascript:whenSimpleSave(3,'')" class="btn_gr"><span>���</span></a></p> </h3>
            <table class="write" id="trainTable">
            <colgroup><col width="10%" /><col width="31%" /><col width="13%" /><col width="20%" /><col width="11%" /><col width="16%" /></colgroup>
            <tr>
                <th>�ڵ��Է�</th>
                <td>
                    �����ڵ� <input type="text" style="width:65px;" name="pp_subj" id="pp_subj" maxlength="7">
                    �⵵ <input type="text" style="width:30px;" name="pp_year" id="pp_year" maxlength="4">
                    ���� <input type="text" style="width:30px;" name="pp_subjseq" id="pp_subjseq" maxlength="4">
                </td>
                <th>���������ȣ</th>
                <td><input type="text" style="width:162px;" name="p_yeunsuno" id="p_yeunsuno"></td>
                <th>�Ҽӱ���û</th>
                <td class="end"><input type="text" name="p_yeonsunm" id="p_yeonsunm" style="width:100px;"></td>
            </tr>
            </table>
<%  if(yeunsunoList!=null && yeunsunoList.size() >0) { %>
            <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="95%"  style="margin-left:25px">
            <thead>
            <tr>
                <th class="table_title tdBorder">������</th>
                <th class="table_title tdBorder" width="250px">������ȣ</th>
                <th class="table_title tdBorder" width="160px">��米��û��</th>
                <th class="table_title tdBorder" width="70px">��������</th>
                <th class="table_title tdBorder" width="70px">��������</th>
                <th class="table_title tdBorder" width="60px">����</th>
            </tr>
            </thead>
<%  for(DataBox yList : yeunsunoList) { %>
            <tr>
                <td class="table_01" style="text-align:left;"><%= yList.get("d_subjnm") %></td>
                <td class="table_01"><%= yList.get("d_YEUNSUNO") %></td>
                <td class="table_01"><%= yList.get("d_YEONSUNM") %></td>
                <td class="table_01"><% if(yList.get("d_EDUSTART") !=null && !yList.get("d_EDUSTART").equals("")) out.print(yList.get("d_EDUSTART").substring(0,4)+"/"+ yList.get("d_EDUSTART").substring(4,6)+"/"+yList.get("d_EDUSTART").substring(6,8)); %></td>
                <td class="table_01"><% if(yList.get("d_EDUEND") !=null && !yList.get("d_EDUEND").equals("")) out.print(yList.get("d_EDUEND").substring(0,4)+"/"+ yList.get("d_EDUEND").substring(4,6)+"/"+yList.get("d_EDUEND").substring(6,8)); %></td>
                <td class="table_01"><img src="/images/admin/portal/stat_0.gif" alt="����" style="CURSOR:POINTER" onclick="yeunsunoDelete('<%=yList.get("d_subj")%>','<%=yList.get("d_year")%>','<%=yList.get("d_subjseq")%>','<%=yList.get("d_userid")%>')"></td>
            </tr>
<%  } %>
            </tbody>
            </table>
<%  } %>


<%  if(licenseList!=null && licenseList.size() >0) { %>
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_certificate.gif" alt="�ڰ���" class="fl_l" /></h3>
            <table class="ac_list">
            <colgroup><col width="221px" /><col width="175px" /><col /></colgroup>
            <thead>
            <tr>
                <th>�ڰ�����</th>
                <th>�����</th>
                <th>����ó</th>
            </tr>
            </thead>
            <tbody>
<%  for(DataBox licenseListBox : licenseList) { %>
            <tr>
                <td><%= licenseListBox.get("d_licensename") %></td>
                <td><%= licenseListBox.getDate("d_getdate", "-") %></td>
                <td><%= licenseListBox.get("d_publish") %></td>
            </tr>
<%  } %>
            </tbody>
            </table>
<%  } %>

<%  if(careerList!=null && careerList.size() >0) { %>
            <h3 class="pop_tit mg_b9"><img src="/images/portal/common/stit_certificate.gif" alt="�ڰ���" class="fl_l" /></h3>
            <table class="ac_list">
            <colgroup><col width="67px" /><col width="108px" /><col width="135px" /><col /><col width="150px" /><col width="80px" /></colgroup>
            <thead>
            <tr>
                <th>����</th>
                <th>����</th>
                <th>ȸ���</th>
                <th>����/����</th>
                <th>�����Ⱓ</th>
                <th>�������� </th>
            </tr>
            </thead>
            <tbody id="careerListbox">
<%  for(DataBox careerListbox : careerList) { %>
            <tr>
                <td><%= careerListbox.get("d_jikup") %></td>
                <td><%= careerListbox.get("d_jikjong") %></td>
                <td><%= careerListbox.get("d_officename") %></td>
                <td><%= careerListbox.get("d_position") %></td>
                <td><%= careerListbox.get("d_workstart") %>~<%= careerListbox.get("d_workend") %></td>
                <td><%= careerListbox.get("d_workstatus") %></td>
            </tr>
<%  } %>
            </tbody>
            </table>
<%  } %>

            <h3 class="pop_tit"><img src="/images/portal/common/stit_resume.gif" alt="�ڱ�Ұ���" /></h3>
            <table class="write">
            <colgroup><col width="18%" /><col /></colgroup>
            <tr>
                <th>���μҰ�</th>
                <td>
                        <div style='width:750px;height:60px;overflow:auto;visibility:visible;border:1'>
                            <%= addInfobox.getHtmlString("d_intro") %>
                        </div>
                <!-- <textarea class="inbox" style="width:97%; height:30px;" readonly><%= addInfobox.get("d_intro") %></textarea> -->
                </td>
            </tr>
            <tr>
                <th>��������</th>
                <td>
                        <div style='width:750px;height:60px;overflow:auto;visibility:visible;border:1'>
                            <%= addInfobox.getHtmlString("d_motive") %>
                        </div>
                <!--<textarea class="inbox" style="width:97%; height:30px;" readonly><%= addInfobox.get("d_motive") %></textarea> -->
                </td>
            </tr>
            <tr>
                <th>���İ�ȹ</th>
                <td>
                        <div style='width:750px;height:60px;overflow:auto;visibility:visible;border:1'>
                            <%= addInfobox.getHtmlString("d_vision") %>
                        </div>
                <!--<textarea class="inbox" style="width:97%; height:30px;" readonly><%= addInfobox.get("d_vision") %></textarea> -->
                </td>
            </tr>
            <tr>
                <th>��Ÿ</th>
                <td>
                        <div style='width:750px;height:60px;overflow:auto;visibility:visible;border:1'>
                            <%= addInfobox.getHtmlString("d_etc") %>
                        </div>
                <!--<textarea class="inbox" style="width:97%; height:30px;" readonly><%= addInfobox.get("d_etc") %></textarea> -->
                </td>
            </tr>
            </table>



                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
      <!----------------- �����̷� ����ȸ �� ----------------->
          </td>
        </tr>
      </table>

        <br>
      </td>
  </tr>
</table>
</form>

<SCRIPT LANGUAGE="JavaScript">
<!--
    //�������� �������� �з�,���� select box�� selected �ǵ���
   // document.form1.p_degree.value = "<%=v_degree%>";

//-->
</SCRIPT>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>

