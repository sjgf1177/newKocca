<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ page errorPage="/jsp/library/error.jsp"%>
<%@ page import="com.credu.library.DataBox"%>
<%@ page import="java.util.ArrayList"%>

<%@ include file="/mobile/jsp/include/init.jsp"%>

<%
	// �������� ���
	ArrayList newsList = (ArrayList) request.getAttribute("newsList");
	DataBox dbox = null;

	String pageTitle = "��ī���̼Ұ�";

	String titleTag = "";

	if (isApp) {
		titleTag = "��ī���̼Ұ�";
	} else if (isWeb) {
		titleTag = "��ī���̼Ұ� | �ѱ���������ī����";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<title><%=titleTag%></title>
<link href="/mobile/assets/css/style.css" rel="stylesheet">
<script src="/mobile/assets/js/jquery-1.11.1.min.js"></script>
<script src="/mobile/assets/js/json2.js"></script>
<script src="/mobile/assets/js/common.js"></script>
<script>
    var isApp = eval("<%= isApp %>");
	/**
	 * ȭ�� �ʱ�ȭ
	 */
	$(document).ready(
			function() {
				$('.panel-category .panel-header a').click(
						function() {
							var panelBody = $(this).parent().parent().children(
									'.panel-body');

							if (panelBody.length > 0) {
								if (panelBody.is(':hidden')) {
									if ($(this).children('i').hasClass(
											'icon-ar-down')) {
										$('.panel-category .panel-header a i')
												.removeClass('icon-ar-up')
												.addClass('icon-ar-down');
										$(this).children('i').removeClass(
												'icon-ar-down').addClass(
												'icon-ar-up');
									}
									// $('.panel-body').hide();
									panelBody.show();
								} else {
									if ($(this).children('i').hasClass(
											'icon-ar-down')
											|| $(this).children('i').hasClass(
													'icon-ar-up')) {
										$('.panel-category .panel-header a i')
												.removeClass('icon-ar-up')
												.addClass('icon-ar-down');
									}
									panelBody.hide();
								}
								return false;
							} else {
								return true;
							}
						});

				$("#oMap img").attr({
					"width" : "",
					"height" : ""
				}).css({
					"max-width" : "100%"
				});

				$("#oPrVideo").attr({
					"width" : "",
					"height" : ""
				}).css({
					"max-width" : "100%"
				});
			});

	var currListCnt = 0;

	/**
	 * �����ڷ� ��� ������
	 */
	function fnViewMoreNewsList() {

		currListCnt = $(".article-list").children("li").length;

		var i = 0;

		$
				.ajax({
					type : "get",
					url : "/servlet/controller.mobile.information.InformationServlet",
					dataType : "json",
					data : "process=newsList&currListCnt=" + currListCnt,
					success : function(data) {

						var list = "";
						var totalListCnt = 0;
						var targetObj = $(".article-list");

						$
								.each(
										data.newsList,
										function() {

											list = "<li>\n";
											list += "   <a href=\"javascript:fnViewNewsDetail("
													+ this.d_seq + ");\">\n";
											list += "       <span class=\"thumb\">\n";
											list += "           <img src=\"" + this.d_savefile + "\" alt=\"\">\n";
											list += "       </span>\n";
											list += "       <span class=\"body\">\n";
											list += "           <span class=\"subject\">\n";
											list += "               "
													+ this.d_title + "\n";
											list += "           </span>\n";
											// list += "           <span class=\"text\">\n";
											// list += "               ���� �Դϴ� ���� �Դϴ� ���� �Դϴ� ���� �Դϴ� ���� �Դϴ� ���� �Դϴ�\n";
											// list += "           </span>\n";
											list += "       </span>\n";
											list += "   </a>\n";
											list += "</li>\n";

											targetObj.append(list);
											totalListCnt = this.d_totcnt;
											i++;
										});

						currListCnt = targetObj.children("li").length;

						if (currListCnt == totalListCnt) {
							$(".btn-more").hide();
						}

					},
					complete : function(arg1, arg2) {
						// alert("result : " + arg2);
					},
					error : function(arg1, arg2) {
					}
				});
	}

	/**
	 * �����ڷ� �� ȭ�� �̵�
	 */
	function fnViewNewsDetail(seq) {
		fnMoveNavi(
				"2",
				"/servlet/controller.mobile.information.NewsServlet?process=selectNewsDetail&seq="
						+ seq, "");
	}

	/**
	 * ȫ������ ����
	 */
	function fnViewIntroMovie() {
		// $(".view-movie-frame").remove();

		// var movieStr = "";

		$.ajax({
			type : "get",
			url : "/mobile/jsp/information/intro_movie.json",
			dataType : "json",
			success : function(data) {
				// window.open("", "asdf", "");
				// location.target = "_blank";
				// location.href = data.movieURL;
				// movieStr = "<div class=\"view-movie-frame\">\n";
				// movieStr += "   <video autoplay loop poster=\"/images/portal/academy/pr_video_20140729.jpg\" width=\"240\" height=\"160\" id=\"oPrVideo\">\n";
				// movieStr += "       <source src=\"" + data.movieURL + "\" type=\"video/mp4\">\n";
				// movieStr += "   </video>\n";
				// movieStr += "</div>\n";

				// $("#oIntroMovie").append(movieStr);

				// $("#oPrVideo").play();

				var v = {
					"playVideo" : {
						"url" : data.movieURL
					}
				};

				if (isApp) {
					location.href = data.movieURL;
					// document.location = "newin:@" + JSON.stringify(v);
				} else {
					location.href = data.movieURL;
				}

				return;
			}
		});

	}
</script>
</head>
<body>

	<!-- header -->
	<%@ include file="/mobile/jsp/include/header.jsp"%>
	<!-- /header -->

	<%@ include file="/mobile/jsp/include/slidemenu.jsp"%>

	<div class="container">
		<!--<div class="panel panel-category">
        <div class="panel-header">
            <a href="#">��ī���� �Ұ� <i class="icon icon-ar-down"></i></a>
        </div>
        <div class="panel-body panel-body-collapse panel-body-info">
        �������о� ����缺�� �߽ɿ� �ִ� �ѱ���������ī���̴� �̷� ������ ����� ������ ������ �о�
        �ٽ����縦 �缺�ϰ� �ֽ��ϴ�. ������ ���� �缺, ������ ���� �米��, �¶��� ��������� ���� ������
        ���������� �ߵ��� ���� ���°� �ֽ��ϴ�.
        </div>
    </div>
    -->
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="#">������� �λ縻 <i class="icon icon-ar-down"></i></a>
			</div>
			<div class="panel-body panel-body-collapse panel-body-info">
				�ѱ���������ī���̴� �ѱ�������������� �����������η¾缺����Դϴ�. <br />
				<br /> �ѱ���������ī���̴� â��/����/���� ���� Ű���带 �ٽɰ�ġ�� ������ ��� ���忡�� �ʿ��� ������ â�����縦
				�缺�ϱ� ���� ����ϰ� �ֽ��ϴ�. <br />
				<br /> �������� ������� â������ â�Ǵɷ¿��� ��Ե˴ϴ�. ����� â�ۿ����� ���ձ������ ���� ���縦 �缺�ϱ�
				���ؼ��� ü������ ���� Ŀ��ŧ���� ���������� �ʿ��մϴ�. <br />
				<br /> �ѱ���������ī���̴� ������ �ְ� �������� ǳ���� ���� ���Ͽ�, ���� �ְ��� ������ ���۱��� ������ ��������
				������ ��� �����η±���, ������ ��������, �������� �ؿܿ��� �� �¶��� �������� ���� ��ϰ� �ֽ��ϴ�. �̸� ����
				�۷ι� ���� �缺�� ���� ������ ��� ���� ����������μ��� ���Ұ� ��� ���࿡ �ּ��� ���ϰڽ��ϴ�. <br />
				<br /> �����ε� ���� ���ɰ� ���� ��Ź�帳�ϴ�.
			</div>
		</div>
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="#">������� �ȳ� <i class="icon icon-ar-down"></i></a>
			</div>
			<div class="panel-body panel-body-collapse panel-body-info">


				<h4 class="subTit_h4_gray">���̹���������ī���� http://edu.kocca.kr</h4>
				<div class="academiSec gray" style="padding-bottom: 16px;">
					<ul>
						<li>��������� ���� �η� �� ����������, �ѱ���������ī���� ȸ�� ����� ���԰����� �������� ����</li>
						<li>�оߺ� ���� Ʃ���� Ʃ�͸� ���� ����</li>
						<li>������ ���� ����</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">���� ��û/����</h4>
				<div class="academiSec gray" style="padding-bottom: 16px;">
					<ul>
						<li>��û��� : �¶��� ��û / http://edu.kocca.kr</li>
						<li>��û���� : �ѱ���������ī���� ȸ��, ��û ȸ���� ���� ����</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">���������</h4>
				<div class="academiSec gray" style="padding-bottom: 16px;">
					<ul>
						<li>������� : �н��� ���� PC �Ǵ� ����Ͽ��� �¶��� �н�</li>
						<li>����� : ����н� ü��</li>
						<li>����� : ��ۿ��� / ���� / ��ȭ������ ��ȹ, ����, ����Ͻ� �о� �� �</li>
						<li>�н��Ⱓ : ���� ������ ���� �н� 1����</li>
						<li>������� : ����</li>
					</ul>
				</div>

				<h4 class="subTit_h4_gray">��������</h4>
				<div class="academiSec gray">
					<ul>
						<li>�ѱ���������ī���� �¶��α�����<br />Tel : 02-6310-0770
						</li>
					</ul>
				</div>

			</div>
		</div>

		<!-- 
    <div class="panel panel-category">
        <div class="panel-header">
            <a href="#">ȫ������ <i class="icon icon-ar-down"></i></a>
        </div>
        <div class="panel-body panel-body-collapse panel-body-info" id="oIntroMovie">
            <div class="view-movie-frame">
                <a href="javascript:fnViewIntroMovie();">
                    <img src="/images/portal/academy/pr_video_20140729.jpg" alt="">
                    <i class="icon-play"><i></i></i>
                </a>
            </div>
            
            <div class="view-movie-frame">
                <video autoplay loop poster="/images/portal/academy/pr_video_20140729.jpg" width="320" height="180" id="oPrVideo">
                    <source src="http://w.hunet.hscdn.com/hunet/M_b2b/kocca/mobile/pr/kocca_intro.mp4" type="video/mp4">
                </video>
            </div>
            //
        </div>
    </div>
     -->

		<%-- <div class="panel panel-category" id="oNewsPanel">
			<div class="panel-header">
				<a href="#">�����ڷ� <i class="icon icon-ar-down"></i></a>
			</div>
			<div class="panel-body panel-body-collapse panel-body-info">
				<ul class="article-list">
					<%
						if (newsList.size() > 0) {
							for (int i = 0; i < newsList.size(); i++) {
								dbox = (DataBox) newsList.get(i);
					%>
					<li><a
						href="javascript:fnViewNewsDetail(<%=dbox.getInt("d_seq")%>);">
							<span class="thumb"> <img
								src="<%=dbox.getString("d_savefile")%>" alt="">
						</span> <span class="body"> <span class="subject"> <%=dbox.getString("d_title")%>
							</span> <!--
                            <span class="text">
                                ���� �Դϴ� ���� �Դϴ� ���� �Դϴ� ���� �Դϴ� ���� �Դϴ� ���� �Դϴ�
                            </span>
                            //-->
						</span>
					</a></li>
					<%
						}
						} else {
					%>
					<li class="no-data">��ϵ� ������ �����ϴ�.</li>
					<%
						}
					%>
				</ul>
				<%
					if (newsList.size() > 0) {
				%>
				<a href="javascript:fnViewMoreNewsList();" class="btn-more">������
					<i class="icon icon-cir-plus"></i>
				</a>
				<%
					}
				%>
			</div>
		</div> --%>
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="#">���ô±� <i class="icon icon-ar-down"></i></a>
			</div>
			<div class="panel-body panel-body-collapse panel-body-info" id="oMap">
				<div
					style="font: 400 12px/normal dotum, sans-serif; width: 98%; color: rgb(51, 51, 51); position: relative; font-size-adjust: none; font-stretch: normal;">
					<div>
						<a
							href="http://map.daum.net/?urlX=509811.25&amp;urlY=1136370.0&amp;name=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C%20%EB%8F%99%EB%8C%80%EB%AC%B8%EA%B5%AC%20%ED%9A%8C%EA%B8%B0%EB%A1%9C%2066&amp;map_type=TYPE_MAP&amp;from=roughmap"
							target="_blank"><img width="598" height="298" class="map"
							style="border: 1px solid rgb(204, 204, 204); border-image: none;"
							src="http://cfile186.uf.daum.net/image/2354A25058DC89B728B2BF"></a>
					</div>
				</div>

			</div>
		</div>
		<%
			if (isApp) {
		%>
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="javascript:fnShowBrowser('http://facebook.com/edukocca');"
					target="_blank">���̽���</a>
			</div>
		</div>
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="javascript:fnShowBrowser('http://twitter.com/edukocca');"
					target="_blank">Ʈ����</a>
			</div>
		</div>
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="javascript:fnShowBrowser('https://blog.naver.com/edukocca');"
					target="_blank">��α�</a>
			</div>
		</div>
		<div class="panel panel-category">
			<div class="panel-header">
				<a
					href="javascript:fnShowBrowser('http://www.youtube.com/user/ContentKoreaLab');"
					target="_blank">You Tube</a>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="http://facebook.com/edukocca" target="_blank">���̽���</a>
			</div>
		</div>
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="http://twitter.com/edukocca" target="_blank">Ʈ����</a>
			</div>
		</div>
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="https://blog.naver.com/edukocca" target="_blank">��α�</a>
			</div>
		</div>
		<div class="panel panel-category">
			<div class="panel-header">
				<a href="https://www.youtube.com/channel/UCJ78W_fNjOW7A-lZ6uEClgA"
					target="_blank">You Tube</a>
			</div>
		</div>
		<%
			}
		%>
	</div>

</body>
</html>