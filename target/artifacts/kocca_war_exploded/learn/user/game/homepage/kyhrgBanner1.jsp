<%
//**********************************************************
//  1. ��      ��: Ȩ������ ���׽Ű�
//  2. ���α׷��� : BugSingo.jsp
//  3. ��      ��: Ȩ������ ���׽Ű�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.21
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
%>
<script language="JavaScript">
<!--
var adBtns = new Array('01.gif','02.gif','03.gif','04.gif','05.gif','06.gif','07.gif','08.gif','09.gif','10.gif','11.gif','12.gif','13.gif','14.gif');
var adUrl = new Array('http://cms.hsc.ac.kr:8080/ct/new/index.htm','http://dept.kaywon.ac.kr/animation.dept','http://subweb.kpu.ac.kr/game/index.do','http://dept.dpc.ac.kr/_EZAI/game','http://www.hansei.org','http://www.sdh.hs.kr','http://www.yewon.ac.kr/Subject/game/index.jsp','http://game.wsu.ac.kr/','http://ani.dmc.ac.kr/','http://www.game.hs.kr/','http://gacon.woosuk.ac.kr/','http://ct.cheju.ac.kr','http://www.anigo.or.kr','http://www.sugong.org/');
function getRand(n) {
             var r = Math.round(Math.random()*n-0.5);
             if ( r < 0 ) { r=0; } return r;
}
function bottomBarAds() {
             var i = 1;
             var k, t, f = 0;
             var sHtml = '';
             var sTmp = '';
             for ( k=0; k<14;k++ ) {
				i = k+i;
    		sHtml += "<span style='cursor:hand;width:190;height:108' onMouseOver='HisemBanner.stopRolling();' onMouseOut='HisemBanner.doRolling();' border='0'>  ";
    		sHtml += "	<table width='100%' border='0' cellspacing='0' cellpadding='0'>                                                                          ";
      		sHtml += "	  <tr>                                                                                                                                   ";
      		sHtml += "	    <td align=center><a href='"+adUrl[k]+"' target=_blank><img src='/images/user/game/homepage/type1/banner/"+adBtns[k]+"' width='179' height='50' border='0'></a></td>                ";
      		sHtml += "	  </tr>                                                                                                                                  ";
      		sHtml += "	  <tr>                                                                                                                                   ";
      		sHtml += "	    <td align=center height=4>"+k+"</td>                                                                                                      ";
      		sHtml += "	  </tr>                                                                                                                                  ";
      		sHtml += "	  <tr>                                                                                                                                   ";
      		sHtml += "	    <td align=center><a href='"+adUrl[i]+"' target=_blank><img src='/images/user/game/homepage/type1/banner/"+adBtns[i]+"' width='179' height='50' border='0'></a></td>                ";
      		sHtml += "	  </tr>                                                                                                                                  ";
      		sHtml += "	  <tr>                                                                                                                                   ";
      		sHtml += "	    <td align=center height=4>"+i+"</td>                                                                                                      ";
      		sHtml += "	  </tr>                                                                                                                                  ";
      		sHtml += "	</table>                                                                                                                                 ";
      		sHtml += "</span> ";

             }
             document.write(sHtml);
}
//-->
</script>
<table width="190" height="149" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="24"><img src="/images/user/game/homepage/type1/banner/banner_title.gif" width="190" height="24"></td>
  </tr>
  <tr>
    <td align="center" background="/images/user/game/homepage/type1/banner/benner_bg.gif">
    	<div id='Banner' style='position:relative; width:190px; height:108px; overflow:hidden;'>
    		<div id='highsem_banner' style='position:relative;border:0 solid;'>
			<script language=javascript>bottomBarAds();</script>
      		</div>
      	</div>
      </td>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
</table>
<script language='javascript'>
/**
*@ �߿��Ѻκ��� div �κ��� ����(height) ���� Ȯ���� �ҷ��;��ϰ�
*��ġ(top,left) �κ��� �� ����� ��..
*@���� : divƮ��..  div�ȿ� div�� �־ ���� ��ġ��������..appendchild�� ������ �κ��� �ǳ��� �߰�..
*            ��� �ݺ��ϰ� ��.. �ᱹ �Ѹ��ϴ� ȿ��.
*RollingBanner=function("div��ü","��� �±�","��� height","�Ѹ� ����","�ӵ�","������");
*�翬�� �����̰� �ӵ����� Ŀ��..ǥ�ð� ��..
*/
RollingBanner=function(obj,tag,hei,wid,spd,rtype)
{
	this.ban_obj = document.getElementById(obj); //div��ü
	this.ban_tag = this.ban_obj.getElementsByTagName(tag);
	this.ban_height = hei; //��� or text ����
	this.ban_width = wid; //����
//	this.ban_direction = drt; // ������ ������(div�±��̹Ƿ� top,left)
	this.ban_speed = spd; //�ӵ�
	this.ban_delay = 2000; //�����̴� �������ѳ���
	this.ban_cnt = 0; //����� top,left ��ġ �� ����  (0�� �ֻ���,�������)
	this.ban_timer;
	this.ban_rolling_type = rtype;
}

/*����� ���η� �Ѹ��Լ�*/
RollingBanner.prototype.doRolling=function()
{
	if(this.ban_rolling_type == "up" || this.ban_rolling_type == "down"){
		this.rollingY();
	}else if(this.ban_rolling_type == "left" || this.ban_rolling_type == "right") {
		this.rollingX();
	}
}

/*����� ���� �Ѹ��Լ�*/
RollingBanner.prototype.rollingX=function()
{
	obj=this;
	this.rollingTypeChecker(this.ban_rolling_type);
	if(this.ban_width > tmpcnt) {
		this.ban_obj.style.left = this.ban_cnt;
		this.ban_timer = setTimeout("obj.rollingX()",this.ban_speed);
	} else {
		this.ban_obj.appendChild(this.ban_tag[0]);
		this.ban_obj.style.left = 0;
		this.ban_timer = setTimeout("obj.rollingX()",2000);
		this.ban_cnt = 0;
	}
}

/*����� ���� �Ѹ��Լ�*/
RollingBanner.prototype.rollingY=function()
{
	obj = this; //��ü����
	this.rollingTypeChecker(this.ban_rolling_type);
	if(this.ban_height > tmpcnt) 	{
		this.ban_obj.style.top = this.ban_cnt;
		this.ban_timer = setTimeout("obj.rollingY()",this.ban_speed);
	} else	 {
		this.ban_obj.appendChild(this.ban_tag[0]);
		this.ban_obj.style.top = this.ban_cnt;
		this.ban_timer = setTimeout("obj.rollingY()",this.ban_delay);
		this.ban_cnt = 0;
	}
}

RollingBanner.prototype.stopRolling=function()
{
	clearTimeout(this.ban_timer);
}

/*����� ������ �����ϴ� �Լ�(left -> right, left <- right , top -> bottom, top <- bottom)*/
RollingBanner.prototype.rollingTypeChecker=function(rtype)
{
	if(this.ban_rolling_type == "right" || this.ban_rolling_type == "down") {
		this.ban_cnt++;
		tmpcnt = this.ban_cnt;
	}else if(this.ban_rolling_type == "left" || this.ban_rolling_type == "up") {
		this.ban_cnt--;
		tmpcnt = -this.ban_cnt;
	}else { //default
		this.ban_cnt++;
		tmpcnt = this.ban_cnt;
	}
}

/***** ("div��ü","��� �±�","��� height","�Ѹ� ����","�ӵ�","����");*******/
HisemBanner = new RollingBanner('highsem_banner', 'span', 1521, 345, 1, 'up');
HisemBanner.doRolling();
</script>
<!-- 345 -->