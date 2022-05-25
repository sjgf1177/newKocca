<%
//**********************************************************
//  1. ��  ��: ȸ������_����Ȯ��
//  2. ���ϸ�: /certi/email/emailCerti.jsp
//  3. ��  ��: ȸ������_����Ȯ��
//  4. ȯ  ��: JDK 1.5
//  5. ��  ��: 1.0
//  6. ��  ��:
//  7. ��  ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    // ���� ȭ���� ȣ���� ���а��� ������ �ִ�.
    // regForm: ȸ������ / findPwd: ��й�ȣ ã��
    String sReserved1 = box.getStringDefault("param_r1", "");
    String resultPage = "";

    if (sReserved1.equals("regMember") ) {
        // resultPage = "/learn/user/2013/portal/member/zu_MemberInfo_I_new.jsp";
        resultPage = "/servlet/controller.member.MemberJoinRegServlet";
    } else if (sReserved1.equals("findPwd") ) {
        resultPage = "/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd";
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="subject" content="�ѱ���������ī����" />
<meta name="title" content="�ѱ���������ī����" />
<meta name="description" content="�ѱ���������ī����" />
<meta name="keywords" content="ȸ������ �̸�������, kocca, �ѱ���������ī����" />
<meta name="robots" content="index,follow" />

<title>�̸��� ���� - ȸ������ - �̿�ȳ� - �н����� | �ѱ���������ī����</title>

<style type="text/css">
    * {margin:0; padding:0;}
    img {border:0; vertical-align:top;}
    ul {list-style:none;}
    body {font-family: '����', Dotum; font-size: 12px;}
    #wrap {width:630px; height:300px; margin:0; auto; border:solid; border-color:#8c8b8b;}
</style>

<script src="/js/jquery/1.8.3/jquery.js"></script>
<script type="text/javascript">
    $(function() {
        $("#oCertiNumCheckArea > a").attr("onclick", "");
    });

    /**
     * �Է��� �̸��� �ּҷ� ������ȣ�� �߼��Ѵ�.
     */
    function fnSendCertiNum() {
        if ( $("#oUserInputEmail").val() === "") {
            alert("�̸��� �ּҸ� �Է��� �ֽʽÿ�.");
            $("#oUserInputEmail").focus();
            return;
        } else if ( fnCheckEmailValidation($("#oUserInputEmail").val()) == false ) {
            alert("EMail �ּҸ� �ùٸ��� �Է��� �ֽʽÿ�.");
            return false;
        } else {

            $("#oEmail").val( $("#oUserInputEmail").val() );
            var param = $("#oEmailCertiForm").serialize();

            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "post"
                ,   url : "/certi/email/sendCertiEmailAjax.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        // ��� �ڵ� ��
                        // S : ����
                        // EE : �̸��� �߼� ����
                        // EI : DB Insert ����
                        if (data.result == "S") {
                            alert("�Է��Ͻ� �̸��Ϸ� ������ȣ�� �߼۵Ǿ����ϴ�.");
                            $("#oUserInputCertiNum").attr("readonly", false);
                            $("#oBtnCertiCheck").attr("disabled", false);
                            $("#oCertiNumCheckArea > a").attr("onclick", "javascript:fnCheckCertiNum();").attr("style", "cursor:pointer");
                            $("#oSeq").val( data.seq );
                            $("#oCertiNum").val( data.certiNum );
                        } else if (data.result == "EE") {
                            alert("�̸��� �߼� ���� ������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����Ͻñ� �ٶ��ϴ�.");
                            return;
                        } else if (data.result == "EI") {
                            alert("�ý��� ������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����Ͻñ� �ٶ��ϴ�.");
                            return;
                        } else {
                            alert("�� �� ���� ������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����Ͻñ� �ٶ��ϴ�.");
                            return;
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
     * �̸��� �� �̸������� ID�˻�
     */
    function fnCheckEmailValidation(strEmail) {
        /** ��������
         - @�� 2���̻�
         - .�� �پ ������ ���
         -  @.��  .@�� �����ϴ� ���
         - ��ó����.�� ��� **/
        var regDoNot = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;

        /** �ʼ�����
         - @������ �ϳ��̻��� ���ڰ� �־�� ��
         - @�� �ϳ��־�� ��
         - Domain�� .�� �ϳ� �̻� �־�� ��
         - Domain���� ������ ���ڴ� ������ 2~4���̾�� �� **/
        var regMust = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4})$/;

        if ( !regDoNot.test(strEmail) && regMust.test(strEmail) ) {
            return true;

        } else {
            return false;
        }
    }

    /**
     * �Է��� ���� ��ȣ�� Ȯ���Ѵ�.
     */
    function fnCheckCertiNum() {
        if( $("#oUserInputCertiNum").val() == "" ) {
            alert("������ȣ�� �Է��ϼ���.");
            $("#oUserInputCertiNum").focus();
            return;

        } else {
            var param = "seq=" + $("#oSeq").val() + "&user_certi_num=" + $("#oUserInputCertiNum").val();
            // ������ȣ Ȯ��
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/certi/email/checkCertiNumAjax.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {
                        // ��� �ڵ� ��
                        if (data.result == "S") {
                            alert("������ �Ϸ�Ǿ����ϴ�.");
                            if ( parent.opener.name == "Parent_window" ) {
                                $("#oEmailCertiForm").attr("action", "<%= resultPage %>");
                                $("#oEmailCertiForm").attr("method", "post");
                                $("#oEmailCertiForm").attr("target", "Parent_window").submit();

                                // parent.opener.location = "/servlet/controller.homepage.MainMemberJoinServlet?p_process=memberInfoInsesrt&certiType=EMAIL&email=" + $("#oEmail").val();
                                // parent.opener.location = "/learn/user/2013/portal/member/zu_MemberInfo_I_new.jsp?certiType=" + paramCertiType + "&email=" + paramEmail;
                            } else {
                                alert("�θ� â�� ����Ǿ� ȸ�� ������ ������ �� �����ϴ�.");
                            }
                            self.close();
                        } else if (data.result == "EN") {
                            alert("�߸��� ���� ��ȣ�� �Է��Ͽ����ϴ�.\n�ٽ� �Է��� �ֽñ� �ٶ��ϴ�.");
                            $("#oUserInputCertiNum").focus();
                            return;
                        } else if (data.result == "ET") {
                            alert("���ѵ� ���� �ð��� �ʰ��Ͽ����ϴ�.\n������ȣ�� ��߱� �Ͻñ� �ٶ��ϴ�.");
                            $("#oUserInputCertiNum").val("");
                            $("#oUserInputCertiNum").attr("readonly", "readonly");
                            $("#oCertiNumCheckArea > a").attr("onclick", "");
                            return;
                        } else {
                            alert("�� �� ���� ������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����Ͻñ� �ٶ��ϴ�.");
                            return;
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
     * ���� â�� �ݴ´�.
     */
    function fnClosewin() {
        self.close();
    }

</script>

<body>

<form id="oEmailCertiForm" name="emailCertiForm">
    <div id="wrap">
        <div style="height:20px; background-color:#8c8b8b; padding:20px;">
            <span style="font-size:16px; color:#fff; font-weight:bold;">�̸��� ����</span>
            <div style="position: absolute; left:580px; top: 20px;">
                <a href="javascript:fnClosewin();"><img src="/images/certi/close.gif" alt="�̸��� ���� â �ݱ�"></a>
            </div>
        </div>
        
        <div style="padding:40px;">
            <div style="height:40px;">
                <span style="padding-right:16px; font-weight:bold;"><label for="oUserInputEmail">�̸����ּ�</label></span>
                <input type="text" style="width:320px; height:26px; padding-rigt:" id="oUserInputEmail" name="userInputEmail" />
                <a href="#" onclick="fnSendCertiNum();"><img src="/images/certi/send.gif" style="padding:2px;" alt="������ȣ�ޱ�" /></a>
            </div>
            <div style="height:40px;" id="oCertiNumCheckArea">
                <span style="padding-right:28px; font-weight:bold;"><label for="oUserInputCertiNum">������ȣ</label></span>
                <input type="text" style="width:150px; height:26px;" id="oUserInputCertiNum" name="userInputCertiNum" maxlength="6" readonly />
                <a onclick="javascript:fnCheckCertiNum();"><img src="/images/certi/confirm.gif" style="padding:2px;"alt="Ȯ��" /></a>
            </div>
            <div style="padding-top:40px;">
                <span >�� �����Ͻ� �̸����ּҷ� ���۵� ������ȣ�� 10�� �̳��� �Է��Ͽ� �ֽñ� �ٶ��ϴ�.</span> 
            </div>
        </div>
         
    </div>

    <input type="hidden" id="oSeq" name="seq" value="" />
    <input type="hidden" id="oCertiNum" name="certiNum" value="" />
    <input type="hidden" id="oCertiType" name="certiType" value="EMAIL" />
    <input type="hidden" id="oEmail" name="email" value="" />
</form>

</body>
</html>
