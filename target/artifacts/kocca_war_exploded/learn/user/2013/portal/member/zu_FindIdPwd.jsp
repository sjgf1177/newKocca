<%
//**********************************************************
//  1. ��      ��: �н����� ã��
//  2. ���α׷��� : zu_FindIdPwd.jsp
//  3. ��      ��: �н����� ã��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    box.put("submenu","3");

    String s_userid  = box.getSession("userid");

    //===================================================================
    // ��������(�޴�������) ���� �׸�
    //===================================================================
    String sUserid = box.getString("sUserid");
    String sJuminid1 = box.getString("sJuminid1");
    String sJuminid2 = box.getString("sJuminid2");
    String sName = box.getString("sName");
    String sEncData = box.getString("sEncData");
    String sMessage = box.getString("sMessage");
    String sIsOk = box.getString("sIsOk");

    box.setSession("sUserid", sUserid);
    box.setSession("sJuminid1", sJuminid1);
    box.setSession("sJuminid2", sJuminid2);
    box.setSession("sName", sName);

    box.put("title_str", "���̵�/�н�����ã��-�̿�ȳ�, �н�����");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<style type="text/css">
.defaultWordText { font-weight:bold; }
.defaultWordTextActive { color: #a1a1a1; font-weight:bold; }
</style>

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--

$(function() {
    $(".defaultWordText").focus(function(srcc) {
        if ($(this).val() == $(this)[0].title) {
            $(this).removeClass("defaultWordTextActive");
            $(this).val("");
        }
    });
        
    $(".defaultWordText").blur(function() {
        if ($(this).val() == "") {
            $(this).addClass("defaultWordTextActive");
            $(this).val($(this)[0].title);
        }
    });
        
    $(".defaultWordText").blur();

    $("input:radio[name=checkType]").bind("click", function(){
        if ($(this).val() == 1 ) {
            $("#oCertiType1").show();
            $("#oCertiMsg1").show();
            $("#oCertiType2").hide();
            $("#oCertiMsg2").hide();

        } else {
            $("#oCertiType1").hide();
            $("#oCertiMsg1").hide();
            $("#oCertiType2").show();
            $("#oCertiMsg2").show();
        }
    });
});


/**
 * ID ã��
 */
function fnFindId() {
    if ( $("#oFindIdUserName").val() == "" || $("#oFindIdUserName").val() == $("#oFindIdUserName")[0].title ) {
        alert("�̸��� �Է��ϼ���.");
        $("#oFindIdUserName").focus();
        return;
    } else if( $("#oFindIdCertiName").val() == ""  || $("#oFindIdCertiName").val() == $("#oFindIdCertiName")[0].title ) {
        alert("�޴�����ȣ Ȥ�� �̸��� �ּҸ� �Է��ϼ���.");
        $("#oFindIdCertiName").focus();
        return;
    } else {

        var param = $("#oFindIdPwdForm").serialize();

        $.ajaxSetup({cache:false});
        $.ajax({
                type : "post"
            ,   url : "/learn/user/2013/portal/member/zu_FindIdAjax.jsp"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {
                    if ( data.result == "success" ) {
                        $("#oFindIdResultMsg").empty().show().append("�Է��Ͻ� ������ ã�� ���̵� �Դϴ�.<br/>�������� ��ȣ�� ���� ���̵��� �Ϻδ� *�� ǥ��˴ϴ�.");
                        $("#oFindIdResultList").empty().show();
                        $.each( data.userList, function(){
                            $("#oFindIdResultList").append(this.d_userid + "<br/>");
                        });
                    } else {
                        $("#oFindIdResultMsg").empty().show().append("�Է��Ͻ� ������ ���̵� ã�� �� �����ϴ�.");
                        $("#oFindIdResultList").empty().hide();
                    }
                }
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                }
            ,   error :  function(arg1, arg2) {
                    // alert("error : " + arg1);
                    alert("�ý��� ������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����Ͻñ� �ٶ��ϴ�.");
                }
        });
    }
}

/**
 * �н����� ã��
 */
function fnFindPassword() {

    if( $("#oFindPwdUserId").val() == ""  || $("#oFindPwdUserId").val() == $("#oFindPwdUserId")[0].title ) {
        alert("���̵� �Է��ϼ���.");
        $("#oFindPwdUserId").focus();
        return;
    } else if ( $("#oFindPwdUserName").val() == "" || $("#oFindPwdUserName").val() == $("#oFindPwdUserName")[0].title ) {
        alert("�̸��� �Է��ϼ���.");
        $("#oFindPwdUserName").focus();
        return;
    } else if( $("input:radio[name=checkType]:checked").val() == 1 && ( $("#oFindPwdUserMobile").val() == ""  || $("#oFindPwdUserMobile").val() == $("#oFindPwdUserMobile")[0].title )) {
        alert("�޴��� ��ȣ�� �Է��ϼ���.");
        $("#oFindPwdUserMobile").focus();
        return;
    } else if( $("input:radio[name=checkType]:checked").val() == 2 && ( $("#oFindPwdUserEmail").val() == ""  || $("#oFindPwdUserEmail").val() == $("#oFindPwdUserEmail")[0].title )) {
        alert("�̸��� �ּҸ� �Է��ϼ���.");
        $("#oFindPwdUserEmail").focus();
        return;
    } else {

        var param = $("#oFindIdPwdForm").serialize();

        $.ajaxSetup({cache:false});
        $.ajax({
                type : "post"
            ,   url : "/learn/user/2013/portal/member/zu_FindPasswordAjax.jsp"
            ,   dataType : "json"
            ,   data : param
            ,   success : function (data) {
                    if ( data.result == "success" ) {
                        if ( $("input:radio[name=checkType]:checked").val() == 1 ) {
                            alert("�Է��Ͻ� �޴��� ��ȣ�� �ӽ� ��й�ȣ�� �����Ͽ����ϴ�.");
                        } else {
                            alert("�Է��Ͻ� �̸��� �ּҷ� �ӽ� ��й�ȣ�� �߼��Ͽ����ϴ�.");
                        }
                    } else {
                        alert("�Է��Ͻ� �������� ��ȸ�� ������ �����ϴ�.");
                    }
                }
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                }
            ,   error :  function(arg1, arg2) {
                    // alert("error : " + arg1);
                    alert("�ý��� ������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����Ͻñ� �ٶ��ϴ�.");
                }
        });
    }

}


// ������������
function indexList() {
    document.form1.p_process.value = "";
    document.form1.action = "/servlet/controller.homepage.MainServlet";
    document.form1.submit();
}

//�ڵ��̵�
function moveFocus(num,fromform,toform)
    {
        var str = fromform.value.length;
        if(str == num)
       toform.focus();
    }

// ���ڸ� ���� �����.
function onlyNumber()
{
    if(((event.keyCode<48)||(event.keyCode>57)))
    event.returnValue=false;
}

   // SMS ����
    function whenSMS() {

      ff =document.form1;

      ff.p_msubjnm.value=ff.s_subjcourse.options[ff.s_subjcourse.selectedIndex].text;
      ff.p_mseqgrnm.value=ff.s_subjseq.options[ff.s_subjseq.selectedIndex].text;
      ff.p_msubj.value=ff.s_subjcourse.value;
      ff.p_myear.value=ff.s_gyear.value;
      ff.p_msubjseq.value=ff.s_subjseq.value;
      ff.p_touch.value = "09";

      window.self.name = "StudentMemberList";
      open_window("openSMS","","100","100","450","443");
      document.form1.target = "openSMS";
      document.form1.action='/servlet/controller.study.StudentStatusAdminServlet';
      document.form1.p_process.value = 'SendSMS';
      document.form1.submit();
    }
//-->
</script>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">

<!-- form ���� -->
    <form id="oFindIdPwdForm" name="form1" method="post" onsubmit="return false;">
    <!--
    <input type="hidden" name="p_process">
    <input type="hidden" name="gubun" value="1">
    //-->

            <div id="mainMenu">
            <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>�̿�ȳ�</li>
                <li>
                    ���̵�/�н����� ã�� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin" >ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd" class="active">���̵�/�н����� ã��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                    </ul>
                </li>

                <!-- 2015-01-16 ���� ����
                <li>Ȩ</li>
                <li>�н�����</li>
                <li>
                    �̿�ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome" class="active">�̿�ȳ�</a></li>
                    </ul>
                </li>
                <li>
                    ���̵�/�н����� ã�� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd" class="active">���̵�/�н����� ã��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                    </ul>
                </li>
                //-->
            </ul>
            <!-- ������ο� -->
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd"><strong><u>���̵�/�н����� ã��</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                </ul>
            <!-- 2015-01-16 ���� ����
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap">����Ʈ��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin">ȸ������</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd"><strong><u>���̵�/�н����� ã��</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">�� ���� ����</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=PersonalNew">��������ó����ħ</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=UserAgree">�̿���</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&amp;p_code=FOOTER_EMAIL">�̸��Ϲ��ܼ����ź�</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=webReport">Ȩ������ �����ǰ�</a></li>
                </ul>
            //-->
            </div>
        </div>
        <!-- //#mainMenu -->


        <!-- ������ ���� ���� -->
        <div id="contents">

            <h2 class="subTit">���̵�/�н����� ã��<!-- <img src="/images/2013/support/idpw_title.gif" alt="���̵�/�н����� ã��" />//--></h2>

            <div id="subCont">
                <div class="searhIdpw">
                    <div class="boxLeft">
                        <p class="tit1"><img src="/images/2013/support/idsearch_title.gif" alt="���̵� ã��" /></p>
                        <p class="tit2">���Խ� �Է��� ����� �޴�����ȣ Ȥ�� �̸��� �ּҷ� ���̵� ã�� �� �ֽ��ϴ�.</p>
                        <ul>
                            <li>�� ������ ��ϵ� �޴��� ��ȣ/�̸��Ϸ� ã��</li>
                        </ul>
                        <dl id="oFindIdArea" style="height:164px;">
                            <dt><label for="oFindIdUserName" style="display:none;">����(�ѱ�)</label></dt>
                            <dd style="padding-left:8px;"><input type="text" name="p_findid_name" id="oFindIdUserName" class="inputText defaultWordText" title="�̸��� �Է��ϼ���." style="width:320px; height:24px;" /></dd>
                            <dt><label for="oFindIdCertiName" style="display:none;">�޴�����ȣ Ȥ�� �̸��� �ּ�</label></dt>
                            <dd style="padding-left:8px;"><input type="text" name="p_findid_certi" id="oFindIdCertiName" class="inputText defaultWordText" title="�޴�����ȣ Ȥ�� �̸��� �ּҸ� �Է��ϼ���." style="width:320px; height:24px;" /></dd>

                            <dt id="oFindIdResultMsg" style="display:none;"></dt>
                            <dt id="oFindIdResultList" style="display:none; width:35%; text-align:center; color:#4b88f7; font-size:15px; font-weight:bold; padding-top:40px;"></dt>
                        </dl>

                        <a href="javascript:fnFindId();" class="btn_check"><img src="/images/2013/common/btn_check.gif" alt="Ȯ��" /></a>
                    </div>
                    <!-- //boxLeft -->

                    <div class="boxRight">
                        <p class="tit1"><img src="/images/2013/support/pw_title.gif" alt="��й�ȣ ã��" /></p>
                        <p class="tit2">ȸ������ �� ����� ������ �Ʒ��� �Է��� �ּ���.<br/>&nbsp;</p>
                        <ul>
                            <li><input type="radio" name="checkType" id="oFindPwdMobile" value="1" checked /><label for="oFindPwdMobile">�޴������� ã��</label> </li>
                            <li><input type="radio" name="checkType" id="oFindPwdEmail" value="2"/><label for="oFindPwdEmail">�̸��Ϸ� ã��</label></li>
                        </ul>
                        <dl>
                            <dd style="padding-left:8px;"><input type="text" name="p_findpwd_userid" id="oFindPwdUserId" class="inputText defaultWordText" title="���̵� �Է��ϼ���." style="width:320px; height:18px;" /></dd>
                            <dd style="padding-left:8px;"><input type="text" name="p_findpwd_name" id="oFindPwdUserName" class="inputText defaultWordText" title="�̸��� �Է��ϼ���" style="width:320px; height:18px;" /></dd>
                            <div id="oCertiType1">
                                <dd style="padding-left:8px;"><input type="text" name ="p_findpwd_mobile" id="oFindPwdUserMobile" class="inputText defaultWordText" title="�޴��� ��ȣ�� �Է��ϼ���" maxlength="13" style="width:320px; height:18px;" /></dd>
                            </div>
                            <div id="oCertiType2" style="display: none;">
                                <dd style="padding-left:8px;"><input type="text" name="p_findpwd_email" id="oFindPwdUserEmail" class="inputText defaultWordText" title="�̸����ּ� �Է��ϼ���" style="width:320px; height:18px;" /></dd>
                            </div>
                        </dl>
                        <p class="tx1">
                            <span id="oCertiMsg1" style="display:block;">�Է��Ͻ� ������ �ùٸ� ���, �ӽ� ��й�ȣ�� ȸ������ �ڵ������� ���ڰ� �߼۵˴ϴ�.</span>
                            <span id="oCertiMsg2" style="display:none;">�Է��Ͻ� ������ �ùٸ� ���, �ӽ� ��й�ȣ�� ȸ������ �̸��Ϸ� �߼۵˴ϴ�.</span>
                        </p>
                        <a href="javascript:fnFindPassword();" class="btn_check"><img src="/images/2013/common/btn_check.gif" alt="Ȯ��" /></a>
                    </div>
                    <!-- //boxRight -->
                </div>
                <!-- //searhIdpw -->
            </div>
            <!-- //#subCont -->
        </div>
    </form>

</div>
<!--  //container-new �� //-->

<%
    if (!sMessage.equals("")) {
        out.println("<script language='javascript'> alert('"+ sMessage +"'); </script>");
    }

    if (sIsOk.equals("0")) {
       out.println("<script language='javascript'> window.open('http://check.namecheck.co.kr/checkplus_new_model/checkplus.cb?m=checkplusSerivce&EncodeData="+ sEncData + "','', 'width=425, height=535');</script>");
    }
%>

<%@ include file="/learn/user/2013/portal/include/footer.html"%>