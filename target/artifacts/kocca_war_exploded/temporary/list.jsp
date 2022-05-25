<%@ page contentType = "text/html;charset=euc-kr" %>

<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.EncryptUtil" %>

<%
    EncryptUtil encryptUtil = new EncryptUtil("anszhstkdlxm", "wkqkroqkf");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> �ѱ���������ī���� </title>
  <meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

<style>
    .menu a {cursor:pointer; font-weight:bold;}
    .menu ul li a{cursor:pointer; font-weight:bold; font-size:10pt;}
    .menu .hide{display:none;}
    .ulSubHide {display:none;}
</style>

<script type="text/javascript" src="/js/2013/jquery-1.8.3.min.js"></script>

<script>
    $(document).ready(function(){
        $(".menu > a").click(function(){
            var firstMenu = $(this).next("ul");
 
            // submenu �� ȭ��� ���϶��� ���� ������� ���� �ƴϸ� �Ʒ��� ������� ��ġ��
            if( firstMenu.is(":visible") ){
                firstMenu.slideUp();
            } else {
                firstMenu.slideDown();
            }
        });

        $(".menu > .hide > li > a").click(function(){
            var submenu = $(this).next("ul");

            var subj = $(this).attr("data-value");

            if( submenu.is(":visible") ){
                submenu.slideUp();
            } else {
                if (subj == "CK06086") {
                    fnViewLecture("http://edu.kocca.or.kr/servlet/controller.contents.EduStart?p_subj=CK06086&p_year=2014&p_subjseq=0027", 1040, 780);
                } else {
                    fnSearchList($(this).next("ul"), subj);
                    submenu.slideDown();
                }
            }
        });

        $(".menu:eq(0)>a").click();
    });

    function fnViewLecture(url, width, height) {
        window.open(url, "previewWin", "top=0, left=0, width="+width+", height="+height+", status=no, resizable=no");
    }

    function fnSearchList( obj, subj ) {
        var list = "";
        $.ajax({
                type : "get"
            ,   url : "/servlet/controller.temp.TempServlet"
            ,   dataType : "xml"
            ,   data : "subj=" + subj
            ,   success : function (xml) {
                    var xmlDoc = $(xml).find("ROOT");

                    var subjObj = $(xmlDoc).find("d_subj");
                    var subjNmObj = $(xmlDoc).find("d_subjnm");
                    var widthObj = $(xmlDoc).find("d_width");
                    var heightObj = $(xmlDoc).find("d_height");
                    var lessonObj = $(xmlDoc).find("d_lesson");
                    var sdescObj = $(xmlDoc).find("d_sdesc");
                    var startingObj = $(xmlDoc).find("d_starting");


                    list = "";
                    for( var i = 0 ; i < subjObj.length; i++) {
                        list += "<li><a href=\"javascript:fnViewLecture('http://edu.kocca.or.kr" + startingObj.eq(i).text() + "', " + widthObj.eq(i).text() + ", " + heightObj.eq(i).text() + ");\">[" + lessonObj.eq(i).text() + "] " + sdescObj.eq(i).text() + "</a></li>";
                    }

                    $(obj).html( list );

                    obj.slideDown();

                }
            ,   complete: function() {
                    // alert("complete");
                }
            ,   error: function() {
                    // alert("error");
                }
        });
    }
</script>
 </head>

 <body>

<%= "asdf : " + encryptUtil.encrypt("") %>
<div>
    <ul>
        <li class="menu">
            <a>���԰��� ���</a>
            <ul class="hide">
                <li>
                    <a data-value="CG06100" style="text-decoration:none;">�ƽþ� ��ȭ</a>
                    <ul class="ulSubHide" id="oList">
                    </ul>
                </li>
                <li>
                    <a data-value="CK08146" style="text-decoration:none;">��ȭ����� ��ʿ���</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK07108" style="text-decoration:none;">�̱� ��ȭ</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK06055" style="text-decoration:none;">��ȭ������ �������</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CB09143" style="text-decoration:none;">��������� ����� ������</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CG06100" style="text-decoration:none;">3D Data Exporting Techniques</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CG07161" style="text-decoration:none;">MOD �������� �� Ȱ��</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CG09192" style="text-decoration:none;">��ʸ� ���� ���Ӹ����� ����</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CG09188" style="text-decoration:none;">��Ʈ��ũ �̷�</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CG08181" style="text-decoration:none;">���ӻ������</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK06077" style="text-decoration:none;">�ð� ���� ��ȭ�� ĳ����</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK06079" style="text-decoration:none;">������ �ִϸ��̼� ����� ���</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK08149" style="text-decoration:none;">÷�ܱ�� �ִϸ��̼�</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CB09138" style="text-decoration:none;">�̵����� �缺���</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK07144" style="text-decoration:none;">[�Թ�] �������ͽ���ȸ�� ��ȭ������</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK06034" style="text-decoration:none;">�ؿ���������</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CB09155" style="text-decoration:none;">������ ����Ͻ��� ���������� �̷а� ����</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK06086" style="text-decoration:none;">��ȭ������ ���丮�ڸ� ���</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK10001" style="text-decoration:none;">�����ΰ� ��ǥ(���۱ǽ�ȭ)</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK10003" style="text-decoration:none;">��ȭ��������</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK06091" style="text-decoration:none;">���߹�ȭ�м�</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

                <li>
                    <a data-value="CK10002" style="text-decoration:none;">�����ϰ� ���� ��ȭ������ ����</a>
                    <ul class="ulSubHide">
                    </ul>
                </li>

            </ul>
        </li>

        <!--
        <li class="menu">
            <a>��������</a>
            <ul class="hide">
                <li>�޴�2-1</li>
            </ul>
        </li>
        //-->
    </ul>
</div>

  
 </body>
</html>
