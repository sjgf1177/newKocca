<%@ page import="com.credu.library.DataBox" %>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%
    DataBox dbox        = (DataBox)request.getAttribute("member");

    String v_name="";
    String v_userid="";
    String v_chk="";
    String v_sw="";
    if(dbox != null)
    {
        v_name              = dbox.getString("d_name");
        v_userid            = dbox.getString("d_userid");
        v_chk            = dbox.getString("d_val");  //���� �ߴ��� ����
        if(!v_chk.equals(""))
        {
            v_sw="1";
            out.print("<script> alert('������ �ѹ��� �ϽǼ� �ֽ��ϴ�. ���� ���� �մϴ�.');window.close();</script>");
        }
    }
    else
    {
        v_sw="1";
        out.print("<script> alert('ȸ�������� �����ϴ�. ���� ���� �մϴ�.');window.close();</script>");
    }

    if(!v_sw.equals("1"))
    {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�ѱ���������ī����</title>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type='text/javascript' src='/script/jquery.form.js'></script>

<style type="text/css">
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
    }
    .style1 {
        color: #333333;
        font-size: 12px;
        line-height: 15pt;
    }
    .style3 {
        color: #333333;
        font-weight: bold;
        font-size: 12px;
    }
    .style4 {
        color: #333333;
        font-size: 12px;
    }    
</style>

<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
    var question="";
    question+="���� ������ ������ ������ �ȴ����� Ŀ��ŧ���� ü�����̴����� ����(���̵� ��)�� �����ϴ�<span style='color:red'>[���ᱳ�� �������� ����]</span><br>���� ���뿡 ���� ��������� �����ϴ�";
    question+="���� ����(������)�� �������̴�<span style='color:red'>[������ ���� ������ �ִ� ��츸 ����]</span><br>������ ���� ��ų�� ����ϴ�(���� ���)�������� ��� �´� ���������� ����<br>����Ѵ��¶��� ��� ȯ�� ������ ����<br>����Ѵ�";
//    question+="���Բ����� �ѱ�������������� <b>�¶���<br>���� ���� ����ó�� ������ ������ �µ�</b>�� ���� ���������� �󸶳�</br>�����ϼ̽��ϱ�?";
    question+="���� ��û ��� �� ������ �����ϴ����� ���� ���� ó���� ������ �Ⱓ ����<br>����ȴ����� ���� ���������� �� �����Ѵ�����, ���Ǵ亯, FAQ �� ����� ���Ǹ� ���� �޴��� �����Ѵ��������� �䱸������ �����ϱ� ���Ͽ�<br>����Ѵ�";
    question+="���Ʃ�ʹ� �н����� �� ����� �� �Ѵ��¶��� ���� ����Ʈ�� ������ �� �ȴ��¶��� ���� ����Ʈ �޴��� �̿��ϱ� ���ϰ� �����Ǿ� �ִ��¶��� ���� ����Ʈ�� ���ϴ� �޴���<br>Ŭ������ �� ������ �̵� �ӵ��� ������";
    question+="�¶��� ���� ����Ʈ�� �������ų� ������ ���� �������̴�����, �۾�ü �� �¶��� ���� ����Ʈ �������� ���õǾ����� ȭ�鿡 ���õǴ� ���� ������ ���� ������ �����̴�";
//    question+="���Բ����� ���ͱ�����μ� �ѱ�������������� ��ȸ�� å�Ӱ� ���� ���࿡  ���� �󸶳�  �����Ͻʴϱ�?";
//    question+="<b>[���� ���� ���������Ը� ����]<b><br>�ѱ�������������� �¶��� ���� ����Ʈ�� ������� �������� Ȱ������ �ʴ´��ѱ�������������� �¶��� ��������� ��������� ����缺�� �⿩�Ѵ�";
//    question+="�ѱ�������������� �¶��� ��������� �����������  �������� ������ �⿩�Ѵ����� ���� �� ����� ���� ���� ��ȣ�� ���Ͽ� ����Ѵ�";
    var question1="���Բ����� �ռ� ���� �ֽ� ����(��������, ������ ����, �̿�����, �ü� ȯ�� ��)�� ��� ����� �� �ѱ�������������� <b>�¶��� ���� ���񽺿� ���� ���������� �󸶳� �����ϼ̽��ϱ�?</b>";
    question1+="���Բ��� ���̽� �ð�, ���, ��� ���� ����Ͽ� ����ϼ̴� �Ϳ�  ����  �ѱ�������������� <b>�¶��� �������񽺿� �󸶳� �����ϼ̽��ϱ�?</b>";
    question1+="���� ����, ������ ����, �̿�����, �ü� ȯ��, ������ ���� ���� ��� ����� ��, ���Բ����� �¶��� ���� ���񽺸� �����ø鼭  �ѱ�������������� ���� <b>�� ���� �����ϰ� �Ǿ����ϱ�?</b>";
    
    var nowPage=1; //���� ������
    var pageView=5; //�������� ǥ���� ��
    var totalPage=Math.ceil((question.split("").length+1)/pageView); //�� ������ ��
    var ans= new Array(question.split("").length+1); //���� ���� �ϴ� ����
    var btn_sw=false;
    var presentSelect="";
    
    $(document).ready(function(){
        for(var ii=0;ii<ans.length;ii++)
        {
            ans[ii]=-1;
        }

        displayState();
        addQuestion();
    });

    //���� �������� �̵�
    function btn_Pre()
    {
        if(nowPage==1)
        {
            alert("ù ������ �Դϴ�.");
            return;
        }
        nowPage--;
        contentClear();
        addQuestion();
        displayState();
        ansRestore();
    }

    function next2()
    {
        for(var i=21;i<24;i++)
        {
            if(ans[i]==undefined || ans[i]==null || ans[i]==-1)
            {
                alert(i+"��° ������ �������� �ʾҽ��ϴ�");
                return;
            }
        }
        if(presentSelect=="")
        {
            alert("����Ƽ���� ���� �Ͽ� �ֽʽÿ�");
            return;
        }

        insert();
        presentSave();
    }

    //���� �������� �̵�
    function btn_Next()
    {
        if(nowPage==(totalPage-1))
        {
            for(var i=16;i<21;i++)
            {
                if(ans[i]==undefined || ans[i]==null || ans[i]==-1)
                {
                    alert(i+"��° ������ �������� �ʾҽ��ϴ�");
                    return;
                }
            }
               $(".a1b1").hide();
               $(".a1b3").show();
    //            alert("������ ������ �Դϴ�.");
            return;
        }

        var start=nowPage*pageView-pageView+1;
        var end=nowPage*pageView+1;

        for(var i=start;i<end;i++)
        {
            if(i==4 || i==6)
            { }
            else
            {
                if(ans[i]==undefined || ans[i]==null || ans[i]==-1)
                {
                    alert(i+"��° ������ �������� �ʾҽ��ϴ�");
                    return;
                }
            }
        }

        nowPage++;
        contentClear();
        addQuestion();
        displayState();
        ansRestore();
    }

    //���� �����
    function addQuestion()
    {
        var tr=document.createElement("tr");
        var questionSplit= question.split("");
        var start=nowPage*pageView-pageView;
        var end=nowPage*pageView;
        
        for(var i=start;i<end;i++)
        {
            var td=document.createElement("td");
            $(td).attr("height","70px");
            $(td).attr("align","center");
            $(td).attr("width","20px");
            $(td).css("backgroundColor","e8f1f5");
            $(td).attr("class","style3");
            $(td).text((i+1));
            $(tr).append(td);
            td=document.createElement("td");
            $(td).attr("width","10px");
            $(td).css("backgroundColor","fbfbfb");
            $(tr).append(td);
            td=document.createElement("td");
            $(td).attr("align","left");
            $(td).attr("width","250px");
            $(td).css("backgroundColor","fbfbfb");
            $(td).attr("class","style1");

            if(questionSplit[i]!=null)
            {
                $(td).html(questionSplit[i]);
                $(tr).append(td);
                for(var j=0;j<7;j++)
                {
                    td=document.createElement("td");
                    $(td).attr("align","center");

                    var opt=document.createElement("<input name='a"+(i+1)+"' type='radio' onclick='ansSave("+(i+1)+","+j+")'/>");
                    $(td).append(opt);
                    $(tr).append(td);
                }

                $("#content").append(tr);
                tr=document.createElement("tr");
            }
        }
    }

    //���� ���� ������
    function contentClear()
    {
        $("#content").html("");
    }

    //���� ���¸� ȭ�鿡 ǥ��
    function displayState()
    {
        $("#questionAndTotal").text(nowPage+" / "+ 5);
    }

    // int1: ������ȣ int2: ������ ��ü ����
    function ansSave(int1,int2)
    {
        ans[int1]=int2;
    }

    //���� Ȥ�� ���� ��ư�� Ŭ���� �ش� �������� �ѹ��̶� ���� üũ �Ͽ��ٸ� ���� ��Ű�� �Լ�
    function ansRestore()
    {
        var start=nowPage*pageView-pageView;
        var end=nowPage*pageView+1;

        for(var i=start;i<end;i++)
        {
            if(ans[i]!=undefined && ans[i]!=null && ans[i]!=-1)
            {
                var obj=$("[name='a"+i+"']").parent().parent();
                $("input:eq("+ans[i]+")",obj).attr("checked","checked");
            }
        }
    }

    //�۵��
    function insert() {
        var ansTmp="";

//        if(!chkVal())
//            return;

        if(btn_sw)
            return;

        for(var i=1;i<ans.length;i++)
        {
            ansTmp+=ans[i]+",";
        }

        ansTmp=ansTmp.substr(0,ansTmp.length-1);

        btn_sw=true;
        $("#nform1").ajaxSubmit({
           url:'/servlet/controller.community.CommunityRiskServlet',
           type:'post',
            data:{p_ans:ansTmp},
           success: function(){
//                $(".a1b1").hide();
//                $(".a1b2").show();
            }
        });
    }

    function presentSave()
    {
        if(presentSelect=="")
        {
            alert("����Ƽ���� ���� �Ͽ� �ֽʽÿ�");
            return;
        }
        
        $.ajax({
           url:'/servlet/controller.community.CommunityRiskServlet',
           type:'post',
            data:{p_ans:presentSelect,p_process:'eventPresent',p_userid:'<%=v_userid%>'},
           success: function(){
               alert("������ �Ϸ�Ǿ����ϴ�.\n �������ּż� �����մϴ�");
               window.close();
            }
        });
    }

    function savePresent(str)
    {
        presentSelect=str;
    }

    //���� �� ���� �ߴ��� ����
    function chkVal()
    {
        var chk=false;
        var len=question.split("").length;
                
        for(var i=1;i<len;i++)
        {
            if(ans[i]==undefined && ans[i]==null)
            {
                alert(i+" �� ���� ���� ���� �ʾҽ��ϴ�.");
                return chk;
            }
        }

        return true;
    }
</SCRIPT>

<body >
<form name="nform1" method="post" id="nform1">
    <input type = "hidden" name = "p_process" value="eventInsert">
    <input type = "hidden" name = "p_userid" value="<%=v_userid%>">

    <table border="0" cellpadding="0" cellspacing="0" width="850px" style="margin:0 auto;" class="a1b1">
        <tr>
            <td><img src="/tmp/images/top.gif" width="850" height="85" /></td>
          </tr>

        <tr>
            <td align="center" valign="top" background="/tmp/images/bg.gif"><br><br>
                <table width="810" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="30">&nbsp;</td>
                      </tr>
                      <tr class="a1b1">
                        <td>
                            <table width="810" border="0" cellpadding="0" cellspacing="1" bgcolor="0096ce">
                          <tr>
                            <td bgcolor="#FFFFFF">
                                <table width="808" border="0" cellspacing="0" cellpadding="0">
                              <tr >
                                <td height="48" colspan="3" align="center" background="/tmp/images/table_top_bg.gif" class="style3">�򰡿��</td>
                                <td align="center" background="/tmp/images/table_top_bg.gif" class="style4">�����׷����ʴ�<br />(�ſ�Ҹ���)</td>
                                <td align="center" background="/tmp/images/table_top_bg.gif"><span class="style4">�׷����ʴ�<br />(�Ҹ���)</span></td>
                                <td align="center" background="/tmp/images/table_top_bg.gif"><span class="style4">�׷����������̴�<br />(�ణ�Ҹ���)</span></td>
                                <td align="center" background="/tmp/images/table_top_bg.gif"><span class="style4">�ݹ��̴�<br />(����)</span></td>
                                <td align="center" background="/tmp/images/table_top_bg.gif"><span class="style4">�׷����̴�<br />(�ణ����)</span></td>
                                <td align="center" background="/tmp/images/table_top_bg.gif"><span class="style4">�׷���<br />(����)</span></td>
                                <td align="center" background="/tmp/images/table_top_bg.gif"><span class="style4">�����׷���<br />(�ſ츸��)</span></td>
                              </tr>
                              <tbody id="content">
                              </tbody>
                            </table></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table width="810" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="382" height="50">&nbsp;</td>
                            <td width="43"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','/tmp/images/btn_ok_o.gif',1)"></a></td>
                            <td align="right" class="a1b1"><span class="style1" id="questionAndTotal" ></span></td>
                            <td width="75" align="right" class="style1 a1b1" >
                                <img src="/tmp/images/btn_next.gif" name="Image4" width="43" height="24" border="0" id="Image4" style="CURSOR:POINTER" onclick="btn_Next()"/>
                            </td>
                          </tr>
                        </table></td>
                      </tr>
                    </table>
                    <br />
                    <br /></td>
                  </tr>
                  <tr>
                    <td height="1" bgcolor="d2d2d2"></td>
                  </tr>
    </table>


    <table width="850" border="0" align="center" cellpadding="0" cellspacing="0" class="a1b3" style="margin:0 auto;display:none">
        <tr>
            <td><img src="/tmp/images/top.gif" width="850" height="85" /></td>
        </tr>
        <tr>
            <td align="center" valign="top" background="/tmp/images/bg.gif"><br />
        <br />
            <table width="810" border="0" cellspacing="0" cellpadding="0">
            <tr>
            <td height="50" align="left"><span class="style1"><b>21.</b> ȸ���Բ����� �ռ� ���� �ֽ� ����(��������, ������ ����, �̿�����, �ü� ȯ�� ��)�� ���
            ����� �� �ѱ�������������� <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�¶��� ���� ���񽺿� ���� ���������� �󸶳�  �����ϼ̽��ϱ�?</b></span></td>
            </tr>
            <tr>
            <td><table width="810" border="0" cellpadding="8" cellspacing="1" bgcolor="c7dae2">
            <tr>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ſ� �Ҹ���</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�Ҹ���</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ణ �Ҹ���</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">����</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ణ ���� </span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">����</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ſ� ���� </span></td>
            </tr>
            <tr>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a24" onclick="ansSave(21,0)"> </td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a24" onclick="ansSave(21,1)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a24" onclick="ansSave(21,2)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a24" onclick="ansSave(21,3)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a24" onclick="ansSave(21,4)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a24" onclick="ansSave(21,5)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a24" onclick="ansSave(21,6)"></td>
            </tr>
            </table>          </td>
            </tr>
            <tr>
            <td height="30">&nbsp;</td>
            </tr>
            <tr>
            <td height="30" align="left"><span class="style1"><b>22.</b> ȸ���Բ��� ���̽� <b>�ð�, ���, ��� ���� ����Ͽ� ����ϼ̴� �Ϳ�  ����</b> �ѱ�������������� �¶��� �������񽺿� �󸶳� <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ϼ̽��ϱ�?
            </span></td>
            </tr>
            <tr>
            <td><table width="810" border="0" cellpadding="8" cellspacing="1" bgcolor="c7dae2">
            <tr>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ſ� �Ҹ���</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�Ҹ���</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ణ �Ҹ���</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">����</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ణ ���� </span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">����</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ſ� ���� </span></td>
            </tr>
            <tr>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a25" onclick="ansSave(22,0)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a25" onclick="ansSave(22,1)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a25" onclick="ansSave(22,2)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a25" onclick="ansSave(22,3)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a25" onclick="ansSave(22,4)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a25" onclick="ansSave(22,5)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a25" onclick="ansSave(22,6)"></td>
            </tr>
            </table></td>
            </tr>
            <tr>
            <td height="30">&nbsp;</td>
            </tr>
            <tr>
            <td height="30" align="left"><span class="style1"><b>23.</b> ���� ����, ������ ����, �̿�����, �ü� ȯ��, ������ ���� ���� ��� ����� ��, ȸ���Բ����� �¶��� ���� ���񽺸� �����ø鼭  <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ѱ�������������� ���� <b>�� ���� �����ϰ� �Ǿ����ϱ�?</b></span></td>
            </tr>
            <tr>
            <td><table width="810" border="0" cellpadding="8" cellspacing="1" bgcolor="c7dae2">
            <tr>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ſ� �Ҹ���</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�Ҹ���</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ణ �Ҹ���</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">����</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ణ ���� </span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">����</span></td>
            <td align="center" bgcolor="e8f1f5"><span class="style3">�ſ� ���� </span></td>
            </tr>
            <tr>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a26" onclick="ansSave(23,0)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a26" onclick="ansSave(23,1)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a26" onclick="ansSave(23,2)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a26" onclick="ansSave(23,3)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a26" onclick="ansSave(23,4)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a26" onclick="ansSave(23,5)"></td>
            <td align="center" bgcolor="#FFFFFF"><input type="radio" name="a26" onclick="ansSave(23,6)"></td>
            </tr>
            </table>
            </td>
            </tr>
                <tr>
                    <td height="15px"></td>
                </tr>
            <tr>
                <td colspan="7" align="right"><span style=" color: #333333;font-size: 12px;line-height: 15pt;"> 5 / 5 </span></td>
            </tr>
            <tr>
                <td height="15px"></td>
            </tr>
        </table>
    </td>
        </tr>
        <tr>
            <td align="center" valign="top" background="/tmp/images/bg.gif">
                <table width="810" border="0" cellpadding="8" cellspacing="1" bgcolor="c7dae2">

          <tr>
            <td align="center" bgcolor="#FFFFFF">
                <table width="95%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="50" colspan="4" align="left"><p class="style1 style5">�� ����Ƽ�� �߼��� ���� ���Ͻô� ��ǰ�� �����Ͽ�  �ֽñ� �ٶ��ϴ�.(7�� 29��(��) �߼� ����)<br />
                &nbsp;&nbsp;&nbsp;&nbsp;��ǰ ������ ���Ͽ� ���������� Ȯ�����ֽñ� �ٶ��ϴ�.</p></td>
                </tr>

              <tr>
                <td width="25%" align="center"><table width="180" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="center"><img src="/tmp/images/gift_baskin.gif" width="150" height="150" /></td>
                  </tr>
                  <tr>
                    <td height="40" align="center" class="style3">����Ų��� ��ȯ��<br />
                      (1����)</td>
                  </tr>
                  <tr>
                      <td><input type="radio" name="p_present" onclick="savePresent('0')"></td>
                  </tr>
                  <tr>
                    <td height="30" align="center">&nbsp;</td>
                  </tr>
                </table></td>
                <td width="25%" align="center"><table width="180" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="center"><img src="/tmp/images/gift_dunkin.gif" width="150" height="150" /></td>
                  </tr>
                  <tr>
                    <td height="40" align="center" class="style3">��Ų ��ȯ��<br />
                      (1����)</td>
                  </tr>
                    <tr>
                      <td><input type="radio" name="p_present" onclick="savePresent('1')"></td>
                  </tr>
                  <tr>
                    <td height="30" align="center">&nbsp;</td>
                  </tr>
                </table></td>
                <td width="25%" align="center"><table width="180" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="center"><img src="/tmp/images/gift_tous.gif" width="150" height="150" /></td>
                  </tr>
                  <tr>
                    <td height="40" align="center" class="style3">�ѷ��긣 ��ȯ��<br />
                      (1����)</td>
                  </tr>
                    <tr>
                      <td><input type="radio" name="p_present" onclick="savePresent('2')"></td>
                  </tr>
                  <tr>
                    <td height="30" align="center">&nbsp;</td>
                  </tr>
                </table></td>
                <td width="25%" align="center"><table width="180" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="center"><img src="/tmp/images/gift_oil.gif" width="150" height="150" /></td>
                  </tr>
                  <tr>
                    <td height="40" align="center" class="style3">SK ������<br />
                      (1����)</td>
                  </tr>
                    <tr>
                      <td><input type="radio" name="p_present" onclick="savePresent('3')"></td>
                  </tr>
                  <tr>
                    <td height="30" align="center">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="40" colspan="4" align="left" class="style1"></td>
                </tr>
                <tr>
                    <td align="center" colspan="4"> <img src="/tmp/images/btn_ok_o.gif" name="Image4"  border="0" style="CURSOR:POINTER" onclick="next2()"/>
                    </td>
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td height="1" bgcolor="d2d2d2"></td>
          </tr>
        </table>
     </td>
        </tr>
        </table>   
</form>
</body>
</html>
<%}%>