/**
*@ �߿��Ѻκ��� div �κ��� ����(height) ���� Ȯ���� �ҷ��;��ϰ�
*��ġ(top,left) �κ��� �� ����� ��..
*@���� : divƮ��..  div�ȿ� div�� �־ ���� ��ġ��������..appendchild�� ������ �κ��� �ǳ��� �߰�..
*            ��� �ݺ��ϰ� ��.. �ᱹ �Ѹ��ϴ� ȿ��.
*RollingBanner=function("div��ü","��� �±�","��� height","�Ѹ� ����","�ӵ�","������");
*�翬�� �����̰� �ӵ����� Ŀ��..ǥ�ð� ��..
*2007�� 1�� 11�� ����� ....by Dohyup
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
