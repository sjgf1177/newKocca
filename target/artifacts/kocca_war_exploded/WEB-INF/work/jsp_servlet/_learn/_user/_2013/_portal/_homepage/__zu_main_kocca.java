package jsp_servlet._learn._user._2013._portal._homepage;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import com.credu.library.DataBox;
import com.credu.library.RequestBox;
import com.credu.library.RequestManager;
import com.credu.library.StringManager;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.util.Date;

public final class __zu_main_kocca extends  weblogic.servlet.jsp.JspBase  implements weblogic.servlet.jsp.StaleIndicator {

    private static void _releaseTags(javax.servlet.jsp.tagext.JspTag t) {
        while (t != null) {
            if(t instanceof javax.servlet.jsp.tagext.Tag) {
                javax.servlet.jsp.tagext.Tag tmp = (javax.servlet.jsp.tagext.Tag)t;
                t = ((javax.servlet.jsp.tagext.Tag) t).getParent();
                try {
                    tmp.release();
                } catch(Exception ignore) {}
            }
            else {
                t = ((javax.servlet.jsp.tagext.SimpleTag)t).getParent();
            }
        }
    }

    public boolean _isStale(){
        boolean _stale = _staticIsStale((weblogic.servlet.jsp.StaleChecker) getServletConfig().getServletContext());
        return _stale;
    }

    public static boolean _staticIsStale(weblogic.servlet.jsp.StaleChecker sci) {
        if (sci.isResourceStale("/learn/user/2013/portal/homepage/zu_Main_KOCCA.jsp", 1422236050395L ,"9.2.3.0","Asia/Seoul")) return true;
        if (sci.isResourceStale("/learn/user/2013/portal/include/header.jsp", 1422236050130L ,"9.2.3.0","Asia/Seoul")) return true;
        if (sci.isResourceStale("/learn/user/2013/portal/include/footer.html", 1422236050130L ,"9.2.3.0","Asia/Seoul")) return true;
        return false;
    }

    private static void _writeText(javax.servlet.ServletResponse rsp, javax.servlet.jsp.JspWriter out, String block, byte[] blockBytes) 
    throws java.io.IOException {
        if (!_WL_ENCODED_BYTES_OK || _hasEncodingChanged(rsp)){
            out.print(block);
        } else {
            ((weblogic.servlet.jsp.ByteWriter)out).write(blockBytes, block);
        }
    }

    private static boolean _hasEncodingChanged(javax.servlet.ServletResponse rsp){
        if (_WL_ORIGINAL_ENCODING.equals(rsp.getCharacterEncoding())){
            return false;
        }
        return true;
    }

    private static boolean _WL_ENCODED_BYTES_OK = true;
    private static final String _WL_ORIGINAL_ENCODING = "euc-kr";

    private static byte[] _getBytes(String block){
        try {
            return block.getBytes(_WL_ORIGINAL_ENCODING);
        } catch (java.io.UnsupportedEncodingException u){
            _WL_ENCODED_BYTES_OK = false;
        }
        return null;
    }

    private final static String  _wl_block0 ="\r\n";
    private final static byte[]  _wl_block0Bytes = _getBytes( _wl_block0 );

    private final static String  _wl_block1 ="\r\n<!DOCTYPE html> \r\n<html>\r\n\t<head> \r\n    <meta property=\"og:title\" content=\"";
    private final static byte[]  _wl_block1Bytes = _getBytes( _wl_block1 );

    private final static String  _wl_block2 ="\">\r\n    <meta property=\"og:url\" content=\"";
    private final static byte[]  _wl_block2Bytes = _getBytes( _wl_block2 );

    private final static String  _wl_block3 ="\">\r\n    <meta property=\"og:description\" content=\"";
    private final static byte[]  _wl_block3Bytes = _getBytes( _wl_block3 );

    private final static String  _wl_block4 ="\">\r\n    <meta property=\"og:image\" content=\"";
    private final static byte[]  _wl_block4Bytes = _getBytes( _wl_block4 );

    private final static String  _wl_block5 ="\">\r\n\r\n\t<meta charset=\"euc-kr\">\r\n\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n\r\n\t<title>";
    private final static byte[]  _wl_block5Bytes = _getBytes( _wl_block5 );

    private final static String  _wl_block6 ="</title>\r\n\r\n    <link href=\"/css/jqueryui/1.10.0/themes/base/jquery-ui.css\" rel=\"stylesheet\" />\r\n\t<link href=\"/css/2013/common.css\" rel=\"stylesheet\">\r\n\t<link href=\"/css/2013/layout.css\" rel=\"stylesheet\">\r\n\r\n\t<link href=\"/css/2013/header.css\" rel=\"stylesheet\">\r\n";
    private final static byte[]  _wl_block6Bytes = _getBytes( _wl_block6 );

    private final static String  _wl_block7 ="\r\n\t<link href=\"/css/2013/main.css\" rel=\"stylesheet\">\r\n";
    private final static byte[]  _wl_block7Bytes = _getBytes( _wl_block7 );

    private final static String  _wl_block8 ="\r\n\t<link href=\"/css/2013/sub.css\" rel=\"stylesheet\">\r\n\r\n\t<script type=\"text/javascript\" src=\"/js/jquery/1.8.3/jquery.js\"></script>\r\n    <script type=\"text/javascript\" src=\"/js/jqueryui/1.10.0/jquery-ui.js\"></script>\r\n    <script type=\"text/javascript\" src=\"/js/2013/jquery.selectbox-0.6.1.js\"></script>\r\n    <script type=\"text/javascript\" src=\"/js/2013/common.js\"></script>\r\n\t<script type=\"text/javascript\" src=\"/js/2013/header.js\"></script>\r\n\t<script type=\"text/javascript\" src=\"/js/2013/lib.js\"></script>\r\n\t<script type=\"text/javascript\" src=\"/js/2013/main.js\"></script>\r\n    <script type=\"text/javascript\" src=\"/script/cresys_lib.js\"></script>\r\n    <script type=\"text/javascript\" src=\"/script/mainscript.js\"></script>\r\n    <!-- <script type=\"text/javascript\" src=\"/js/2013/caption.js\"></script> //-->\r\n    <!-- <script type=\"text/javascript\" src=\"/js/2013/jquery.easing.1.3.js\"></script> //-->\r\n    <!-- <script type=\"text/javascript\" src=\"/js/2013/jquery.cycle2.min.js\"></script> //-->\r\n\r\n</head>\r\n<body>\r\n<!-- ��� �⺻ form //-->\r\n<form name=\"topdefaultForm\" method=\"post\" action=\"/\" id=\"topdefaultForm\" >\r\n    <input type=\"hidden\" name=\"p_process\" value=\"\" />\r\n    <input type=\"hidden\" name=\"gubun\" value=\"0\" />\r\n    <input type=\"hidden\" name=\"menuid\" value=\"\" />\r\n    <input type=\"hidden\" name=\"url\" value=\"\" />\r\n    <input type=\"hidden\" name=\"p_cmuno\" value=\"\" />\r\n    <input type=\"hidden\" name=\"searchClass\" value=\"\" />\r\n    <input type=\"hidden\" name=\"p_auth\" value=\"\" />\r\n    <input type=\"hidden\" name=\"p_topuserid\" value=\"\" />\r\n    <input type=\"hidden\" name=\"p_toppwd\" value=\"\" />\r\n    <input type=\"hidden\" name=\"p_area\" value=\"\" />\r\n    <input type=\"hidden\" name=\"p_lsearchtext\" id=\"oLsearchtext\" value=\"\" />\r\n    <input type=\"hidden\" name=\"p_lecture_cls\" value=\"\" /> <!-- ��������(��������) �з��� ��ȸ�� �ʿ��Ͽ� �ش� ������Ʈ �߰� //-->\r\n    <input type=\"hidden\" name=\"pageNo\" value=\"\" /> <!-- ��������(��������) ����¡ ����� �ʿ��Ͽ� �ش� ������Ʈ �߰� //-->\r\n    <input type=\"submit\" class=\"close\" title=\"����\" />\r\n</form>\r\n\r\n<!-- topbar -->\r\n<div id=\"topbar\">\r\n\t<!-- body -->\r\n\t<div class=\"body\">\r\n\t\t<div class=\"app-link\">\r\n\t\t\t<a href=\"/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp\">�ѱ���������ī���̾�</a>\r\n\t\t</div>\r\n\t\t<div class=\"util\">\r\n";
    private final static byte[]  _wl_block8Bytes = _getBytes( _wl_block8 );

    private final static String  _wl_block9 ="\r\n\t\t\t<a href=\"/learn/user/2013/portal/homepage/zu_MainLogin.jsp\">�α���</a><span class=\"line\"> | </span>\r\n\t\t\t<a href=\"/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberJoin\">ȸ������</a>\r\n";
    private final static byte[]  _wl_block9Bytes = _getBytes( _wl_block9 );

    private final static String  _wl_block10 ="\r\n            <a href=\"#\" class=\"my-menu-open\">";
    private final static byte[]  _wl_block10Bytes = _getBytes( _wl_block10 );

    private final static String  _wl_block11 ="�� ���θ޴�</a><span class=\"line\"> | </span>\r\n\t\t\t<div class=\"my-menu-layer\">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t<li><a href=\"/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage\">�¶��� ���ǽ�</a></li>\r\n\t\t\t\t\t<li><a href=\"/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage\">���屳�� ���ǽ�</a></li>\r\n\t\t\t\t\t<li><a href=\"/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE\">���� �ۼ��� ��</a></li>\r\n\t\t\t\t\t<li><a href=\"/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage\">��㳻��</a></li>\r\n\t\t\t\t\t<li><a href=\"/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate\">��������</a></li>\r\n\t\t\t\t</ul>\r\n\t\t\t</div>\r\n\t\t\t<a href=\"javascript:mainmenu(\'998\');\">�α׾ƿ�</a>\r\n";
    private final static byte[]  _wl_block11Bytes = _getBytes( _wl_block11 );

    private final static String  _wl_block12 ="\r\n\t\t</div>\r\n\t</div>\r\n\t<!-- /body -->\r\n</div>\r\n<!-- /topbar -->\r\n<!-- header-new -->\r\n<div id=\"header-new\">\r\n\t<div class=\"brand\">\r\n\t\t<a href=\"/servlet/controller.homepage.MainServlet\"><img src=\"/images/common/brand.png\" alt=\"�ѱ���������ī����\"></a>\r\n\t</div>\r\n\r\n<!--\r\n\t<div class=\"search\">\r\n\t\t<div class=\"field\">\r\n\t\t\t<input type=\"text\">\r\n\t\t\t<input type=\"image\" src=\"/images/common/btn-search.png\" alt=\"�˻�\">\r\n\t\t</div>\r\n\t\t<div class=\"word\">\r\n\t\t\t<ul id=\"searchWord\">\r\n\t\t\t\t<li>\r\n\t\t\t\t\t<span><a href=\"#\">�α�˻���1</a></span>\r\n\t\t\t\t\t<span><a href=\"#\">�α�˻���1</a></span>\r\n\t\t\t\t\t<span><a href=\"#\">�α�˻���1</a></span>\r\n\t\t\t\t\t<span><a href=\"#\">�α�˻���1</a></span>\r\n\t\t\t\t</li>\r\n\t\t\t\t<li>\r\n\t\t\t\t\t<span><a href=\"#\">�α�˻���2</a></span>\r\n\t\t\t\t\t<span><a href=\"#\">�α�˻���2</a></span>\r\n\t\t\t\t\t<span><a href=\"#\">�α�˻���2</a></span>\r\n\t\t\t\t\t<span><a href=\"#\">�α�˻���2</a></span>\r\n\t\t\t\t</li>\r\n\t\t\t</ul>\r\n\t\t</div>\r\n\t</div>\r\n\r\n-->\r\n</div>\r\n<!-- /header-new -->\r\n<!-- nav -->\r\n<div id=\"nav\">\r\n\t<div class=\"sub-bg\"></div>\r\n\t<ul>\r\n\t\t<li><a href=\"/servlet/controller.homepage.HomeNoticeServlet?p_process=List\">���ҽ�</a>\r\n\t\t\t<ul>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.HomeNoticeServlet?p_process=List\">��������</a></li>\r\n                <li><a href=\"/servlet/controller.homepage.TongBoardServlet?p_process=list\" >��ī���� �̾߱�</a></li>\r\n                <li><a href=\"/servlet/controller.homepage.CMUBoardServlet?p_process=list\" >CMU ���丮</a></li>\r\n\t\t\t\t<!-- 2015-01-09 ������\r\n                <li><a href=\"javascript:alert(\'�̺�Ʈ �غ����Դϴ�.\');\">�̺�Ʈ</a></li>\r\n                <li><a href=\"/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList\">�����ڷ�</a></li>\r\n                -->\t\t\t\t\r\n\t\t\t</ul>\r\n\t\t</li>\r\n\t\t<li><a href=\"/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001\">���屳��</a>\r\n\t\t\t<ul>\r\n\t\t\t\t<li><a href=\"/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001\">������ �����米��</a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=002\">������ ���� �缺����</a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList\">�����ȳ�</a></li>\r\n\t\t\t</ul>\r\n\t\t</li>\r\n\t\t<li><a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList\">�¶��α���</a>\r\n\t\t\t<ul>\r\n\t\t\t\t<li><a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList\">�оߺ�</a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup\">������</a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem\">����ü�赵</a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=LiteratureSubjectList\">�޳��ι���</a></li>\r\n\t\t\t</ul>\r\n\t\t</li>\r\n\t\t<li><a href=\"javascript:fnOpenClassList(\'ALL\');\">��������</a>\r\n\t\t\t<ul>\r\n\t\t\t\t<li><a href=\"javascript:fnOpenClassList(\'ALL\');\">�з���</a></li>\r\n\t\t\t\t<li><a href=\"javascript:fnOpenClassList(\'ALL\');\">�׸���</a></li>\r\n\t\t\t</ul>\r\n\t\t</li>\r\n<!--\r\n\t\t<li><a href=\"/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage\">�ڷ��</a>\r\n\t\t\t<ul>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage\">�¶��α���</a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.CMUBoardServlet?p_process=list\" >CMU ���丮</a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.TongBoardServlet?p_process=list\">��ī���� �ҽ� ���̾߱�</a></li>\r\n\t\t\t</ul>\r\n\t\t</li>\r\n-->\r\n        <li><a href=\"/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome\">������</a>\r\n\t\t\t<ul>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome\">�н�����</a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList\">�����ϴ� ����</a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList\">��������</a></li>\r\n\t\t\t\t<!--\r\n                <li><a href=\"javascript:alert(\'������ �߱޾ȳ� �غ����Դϴ�.\');\">������ �߱޾ȳ�</a></li>\r\n                -->\r\n\t\t\t</ul>\r\n\t\t</li>\r\n\t\t<li><a href=\"/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision\">��ī���̼Ұ�</a>\r\n\t\t\t<ul>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Vision\">��ī���̼Ұ�</a></li>\r\n                <li><a href=\"/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage\">�λ縻</a></li>\r\n                <li><a href=\"/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility\">�ü��Ұ�</a></li>\r\n                <li><a href=\"/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu\">��������ȳ�</a></li>\r\n                <li><a href=\"/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR\">ȫ������</a></li>\r\n                <li><a href=\"/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER\">�������±��</a></li>\r\n                <li><a href=\"/servlet/controller.homepage.HomePageContactServlet?p_process=contactus\">���޹���</a></li>\r\n                <li><a href=\"/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction\">���ô±�</a></li>\r\n\t\t\t</ul>\r\n\t\t</li>\r\n\t</ul>\r\n</div>\r\n<!-- /nav -->";
    private final static byte[]  _wl_block12Bytes = _getBytes( _wl_block12 );

    private final static String  _wl_block13 ="\r\n<!-- main-container -->\r\n<div id=\"main-container\">\r\n\t<!-- main-content1 -->\r\n\t<div class=\"main-content1\">\r\n\t\t<!-- main-banner -->\r\n\t\t<div class=\"main-banner\">\r\n\t\t\t<div class=\"header\">\r\n\t\t\t\t<ul id=\"mainBannerLg\">\r\n                    ";
    private final static byte[]  _wl_block13Bytes = _getBytes( _wl_block13 );

    private final static String  _wl_block14 ="\r\n\t\t\t\t</ul>\r\n\t\t\t</div>\r\n\t\t\t<div class=\"body\">\r\n\t\t\t\t<ul id=\"mainBanner\">\r\n                    ";
    private final static byte[]  _wl_block14Bytes = _getBytes( _wl_block14 );

    private final static String  _wl_block15 ="\r\n\t\t\t\t</ul>\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t\t<!-- /main-banner -->\r\n\t\t<!-- side -->\r\n\t\t<div class=\"side\">\r\n\t\t\t<!-- lt-tab -->\r\n\t\t\t<div class=\"lt-tab\">\r\n\t\t\t\t<div class=\"header\">\r\n\t\t\t\t\t<h3>���ҽ�</h3>\r\n\t\t\t\t\t<ul>\r\n\t\t\t\t\t\t<li class=\"active\"><a href=\"#\">��ü</a></li>\r\n\t\t\t\t\t\t<li><a href=\"#\">����</a></li>\r\n\t\t\t\t\t\t<li><a href=\"#\">�̺�Ʈ</a></li>\r\n\t\t\t\t\t\t<!-- <li><a href=\"#\">�����ڷ�</a></li> //-->\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t\t<a href=\"#\" class=\"more\" style=\"display:none;\"><img src=\"/images/common/btn-more.png\" alt=\"�� ����\"></a>\r\n\t\t\t\t</div>\r\n                <!-- ��ü �� ��� ���� //-->\r\n\t\t\t\t<div class=\"body\">\r\n\t\t\t\t\t<ul>\r\n";
    private final static byte[]  _wl_block15Bytes = _getBytes( _wl_block15 );

    private final static String  _wl_block16 ="\r\n\t\t\t\t\t\t<li><a href=\"#\" onclick=\"fnViewBoardDetail(\'";
    private final static byte[]  _wl_block16Bytes = _getBytes( _wl_block16 );

    private final static String  _wl_block17 ="\', ";
    private final static byte[]  _wl_block17Bytes = _getBytes( _wl_block17 );

    private final static String  _wl_block18 =");\"><strong>[";
    private final static byte[]  _wl_block18Bytes = _getBytes( _wl_block18 );

    private final static String  _wl_block19 ="]</strong> ";
    private final static byte[]  _wl_block19Bytes = _getBytes( _wl_block19 );

    private final static String  _wl_block20 ="</a> ";
    private final static byte[]  _wl_block20Bytes = _getBytes( _wl_block20 );

    private final static String  _wl_block21 ="</li>\r\n";
    private final static byte[]  _wl_block21Bytes = _getBytes( _wl_block21 );

    private final static String  _wl_block22 ="\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n                <!-- ��ü �� ��� ���� //-->\r\n\r\n                <!-- �������� �� ��� ���� //-->\r\n\t\t\t\t<div class=\"body\">\r\n\t\t\t\t\t<ul>\r\n";
    private final static byte[]  _wl_block22Bytes = _getBytes( _wl_block22 );

    private final static String  _wl_block23 ="\r\n\t\t\t\t\t\t<li><a href=\"#\" onclick=\"fnViewBoardDetail(\'NOTICE\', ";
    private final static byte[]  _wl_block23Bytes = _getBytes( _wl_block23 );

    private final static String  _wl_block24 ="\r\n\t\t\t\t\t\t<li><a href=\"#\">��ϵ� ���������� �����ϴ�.</li>\r\n";
    private final static byte[]  _wl_block24Bytes = _getBytes( _wl_block24 );

    private final static String  _wl_block25 ="\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n                <!-- �������� �� ��� �� //-->\r\n\r\n                <!-- �̺�Ʈ �� ��� ���� //-->\r\n\t\t\t\t<div class=\"body\">\r\n\t\t\t\t\t<ul>\r\n";
    private final static byte[]  _wl_block25Bytes = _getBytes( _wl_block25 );

    private final static String  _wl_block26 ="\r\n\t\t\t\t\t\t<li><a href=\"#\" onclick=\"fnViewBoardDetail(\'EVENT\', ";
    private final static byte[]  _wl_block26Bytes = _getBytes( _wl_block26 );

    private final static String  _wl_block27 ="\r\n\t\t\t\t\t\t<li><a href=\"#\">���� �������� �̺�Ʈ�� �����ϴ�.</li>\r\n";
    private final static byte[]  _wl_block27Bytes = _getBytes( _wl_block27 );

    private final static String  _wl_block28 ="\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n                <!-- �̺�Ʈ �� ��� �� //-->\r\n\r\n                <!-- �����ڷ� �� ��� \r\n\t\t\t\t<div class=\"body\">\r\n\t\t\t\t\t<ul>\r\n\t\t\t\t\t\t<li><a href=\"#\"><strong>[444]</strong> ���� �Դϴ� <img src=\"/images/common/icon-n.png\" alt=\"N\"></a></li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n                //-->\r\n\t\t\t</div>\r\n\t\t\t<!-- /lt-tab -->\r\n\t\t\t<div class=\"banner\">\r\n\t\t\t\t<a href=\"http://www.ckl.or.kr/\" target=\"_blank\" title=\"��â���� �����ϴ�.\"><img style=\"border-style:solid; border-color:#dedede; border-width:1px;\" src=\"/images/main/bnr.jpg\" alt=\"Content Korea Lab. ���ѹα� ������ â������ �������ڸ��Ʒ��� å�����ڽ��ϴ�.\"></a>\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t\t<!-- /side -->\r\n\t</div>\r\n\t<!-- /main-content1 -->\r\n\t<!-- main-content2 -->\r\n\t<div class=\"main-content2\">\r\n\t\t<!-- lt-wz-group -->\r\n\t\t<div class=\"lt-wz-group\">\r\n\t\t\t<div class=\"header\">\r\n\t\t\t\t<ul>\r\n\t\t\t\t\t<li class=\"active\"><a href=\"#\">��ī���� �̾߱�</a></li>\r\n\t\t\t\t\t<li><a href=\"#\">��ۿ���</a></li>\r\n\t\t\t\t\t<li><a href=\"#\">����</a></li>\r\n\t\t\t\t\t<li><a href=\"#\">����ĳ</a></li>\r\n\t\t\t\t\t<li><a href=\"#\">����&middot;����</a></li>\r\n\t\t\t\t\t<li><a href=\"#\">��������</a></li>\r\n\t\t\t\t</ul>\r\n\t\t\t</div>\r\n            <!-- ��ī���� �̾߱� ���� //-->\r\n\t\t\t<div class=\"body\" style=\"display:block;\">\r\n";
    private final static byte[]  _wl_block28Bytes = _getBytes( _wl_block28 );

    private final static String  _wl_block29 ="\r\n\t\t\t\t<div class=\"type2-lg\">\r\n\t\t\t\t\t<a href=\"/servlet/controller.homepage.TongBoardServlet?p_process=view&p_pageno=1&p_pagesize=15&seq=";
    private final static byte[]  _wl_block29Bytes = _getBytes( _wl_block29 );

    private final static String  _wl_block30 ="&searchType=title&searchKeyword=\">\r\n\t\t\t\t\t\t<span class=\"thumb\"><img src=\"";
    private final static byte[]  _wl_block30Bytes = _getBytes( _wl_block30 );

    private final static String  _wl_block31 ="\" alt=\"";
    private final static byte[]  _wl_block31Bytes = _getBytes( _wl_block31 );

    private final static String  _wl_block32 ="\"></span>\r\n\t\t\t\t\t\t<span class=\"con\">\r\n\t\t\t\t\t\t\t<span class=\"subject\">";
    private final static byte[]  _wl_block32Bytes = _getBytes( _wl_block32 );

    private final static String  _wl_block33 ="</span>\r\n\t\t\t\t\t\t\t<span class=\"text\">";
    private final static byte[]  _wl_block33Bytes = _getBytes( _wl_block33 );

    private final static String  _wl_block34 ="</span>\r\n\t\t\t\t\t\t</span>\r\n\t\t\t\t\t</a>\r\n\t\t\t\t</div>\r\n\t\t\t\t<ul class=\"type2\">\r\n";
    private final static byte[]  _wl_block34Bytes = _getBytes( _wl_block34 );

    private final static String  _wl_block35 ="\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.homepage.TongBoardServlet?p_process=view&p_pageno=1&p_pagesize=15&seq=";
    private final static byte[]  _wl_block35Bytes = _getBytes( _wl_block35 );

    private final static String  _wl_block36 ="&searchType=title&searchKeyword=\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"";
    private final static byte[]  _wl_block36Bytes = _getBytes( _wl_block36 );

    private final static String  _wl_block37 ="\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">";
    private final static byte[]  _wl_block37Bytes = _getBytes( _wl_block37 );

    private final static String  _wl_block38 ="</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n";
    private final static byte[]  _wl_block38Bytes = _getBytes( _wl_block38 );

    private final static String  _wl_block39 ="\r\n\r\n\t\t\t\t</ul>\r\n\t\t\t</div>\r\n            <!-- ��ī���� �̾߱� �� //-->\r\n\r\n            <!-- ��ۿ��� ���� //-->\r\n\t\t\t<div class=\"body\">\r\n\t\t\t\t<ul class=\"type1\">\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CB10015\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171433171_lee1.gif\" alt=\"After Effect CS5\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">After Effect CS5</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CB10017\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171434491_lee1.gif\" alt=\"Adobe Premiere Pro CS5\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">Adobe Premiere Pro CS5</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CB10020\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171436031_lee1.gif\" alt=\"������ ���� �� ����\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">������ ���� �� ����</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CB12003\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171446581_lee1.gif\" alt=\"�۾��⸦ ���� â���� ���\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">�۾��⸦ ���� â���� ���</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t</ul>\r\n\t\t\t\t<div class=\"type1-lg\">\r\n\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CB12007\">\r\n\t\t\t\t\t\t<span class=\"thumb\"><img src=\"/images/main/_category_thumb/CB12007_dslr_188x338.jpg\" alt=\"�������� �η��� ���� DSLR Ȱ���ϱ�\"></span>\r\n\t\t\t\t\t\t<span class=\"subject\">�������� �η��� ���� DSLR Ȱ���ϱ�</span>\r\n\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t</a>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n            <!-- ��ۿ��� �� //-->\r\n\r\n            <!-- ���� ���� //-->\r\n\t\t\t<div class=\"body\">\r\n\t\t\t\t<ul class=\"type1\">\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CG14006\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171615491_lee1.gif\" alt=\"Unity3D�� �̿��� ����� ���� ����\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">Unity3D�� �̿��� ����� ���� ����</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CG07126\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171530451_lee1.gif\" alt=\"����ĳ���͵�����1\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">����ĳ���͵�����1</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CG11001\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171545581_lee1.gif\" alt=\"���� ��ȹ �� �׷��� �ǹ��ڸ� ���� ���ӱ�� ����\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">���� ��ȹ �� �׷��� �ǹ��ڸ� ���� ���ӱ�� ����</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CG14005\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171615111_lee1.gif\" alt=\"3D ������ ���� ĳ���� �𵨸�\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">3D ������ ���� ĳ���� �𵨸�</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t</ul>\r\n\t\t\t\t<div class=\"type1-lg\">\r\n\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CG12011\">\r\n\t\t\t\t\t\t<span class=\"thumb\"><img src=\"/images/main/_category_thumb/CG12011_Unity3d_188x338.jpg\" alt=\"Unity3d�� �̿��� ���� �����\"></span>\r\n\t\t\t\t\t\t<span class=\"subject\">Unity3d�� �̿��� ���� �����</span>\r\n\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t</a>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n            <!-- ���� �� //-->\r\n\r\n            <!-- ����ĳ ���� //-->\r\n\t\t\t<div class=\"body\">\r\n\t\t\t\t<ul class=\"type1\">\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CK09167\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171643441_lee1.gif\" alt=\"�渮��� �ִϸ��̼� ���丮�ڸ� ����\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">�渮��� �ִϸ��̼� ���丮�ڸ� ����</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CK14010\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171732421_lee1.gif\" alt=\"ĳ���� �ɸ����� ����\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">ĳ���� �ɸ����� ����</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CK14001\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171726501_lee1.gif\" alt=\"���丮�ڸ��� �߻��� ���� ���� ��ȭ â���� ���\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">���丮�ڸ��� �߻��� ���� ���� ��ȭ â���� ���</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CK14002\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171727211_lee1.gif\" alt=\"ĳ���Ϳ� �÷��� ���� ���� ��ȭ â���� ���\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">ĳ���Ϳ� �÷��� ���� ���� ��ȭ â���� ���</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t</ul>\r\n\t\t\t\t<div class=\"type1-lg\">\r\n\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CK14003\">\r\n\t\t\t\t\t\t<span class=\"thumb\"><img src=\"/images/main/_category_thumb/CK14003_character_188x338.jpg\" alt=\"ĳ���� �ɸ����� ����\"></span>\r\n\t\t\t\t\t\t<span class=\"subject\">ĳ���� �ɸ����� ����</span>\r\n\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t</a>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n            <!-- ����ĳ �� //-->\r\n\r\n            <!-- ���ǰ��� ���� //-->\r\n\t\t\t<div class=\"body\">\r\n\t\t\t\t<ul class=\"type1\">\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CK10080\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171702541_lee1.gif\" alt=\"������ȹ�� ȫ�������� �ǹ�\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">������ȹ�� ȫ�������� �ǹ�</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CK11004\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171715281_lee1.gif\" alt=\"�۷��ù�ȭ�������� ���ؿ� ���\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">�۷��ù�ȭ�������� ���ؿ� ���</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CK06063\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171624211_lee1.gif\" alt=\"�������ۿ�ũ��\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">�������ۿ�ũ��</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CK10073\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/bulletin/Subject_introducefile_201407171658231_lee1.gif\" alt=\"����������������ȹ�� �ؿ�����\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">����������������ȹ�� �ؿ�����</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t</ul>\r\n\t\t\t\t<div class=\"type1-lg\">\r\n\t\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=previewSubjDetailPage&p_subj=CG14007\">\r\n\t\t\t\t\t\t<span class=\"thumb\"><img src=\"/images/main/_category_thumb/CG14007_pop_music_188x338.jpg\" alt=\"�������ǰ� ģ������\"></span>\r\n\t\t\t\t\t\t<span class=\"subject\">�������ǰ� ģ������</span>\r\n\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t</a>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n            <!-- ���ǰ��� �� //-->\r\n\r\n            <!-- �������� ���� //-->\r\n\t\t\t<div class=\"body\">\r\n\t\t\t\t<ul class=\"type1\">\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.infomation.GoldClassHomePageServlet?p_process=selectView&p_seq=129&p_lecture_cls=GC03\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/accept/GoldClassAdmin_img_file/129.jpg\" alt=\"�������� �����з� ���� �����ϱ� 1 - ���丮�� �⺻ ����\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">�������� �����з� ���� �����ϱ� 1 - ���丮�� �⺻ ����</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.infomation.GoldClassHomePageServlet?p_process=selectView&p_seq=159&p_lecture_cls=GC07\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/accept/GoldClassAdmin_img_file_201406301702561_lee1.jpg\" alt=\"ACES ����Ұ� 1 - ���� ���� RGB\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">ACES ����Ұ� 1 - ���� ���� RGB</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.infomation.GoldClassHomePageServlet?p_process=selectView&p_seq=177&p_lecture_cls=GC06\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/accept/GoldClassAdmin_img_file_201406301710131_lee1.jpg\" alt=\"�������� �ְ��� �귣�� �ʸ� �������� 1��\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">�������� �ְ��� �귣�� �ʸ� �������� 1��</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t\t<li>\r\n\t\t\t\t\t\t<a href=\"/servlet/controller.infomation.GoldClassHomePageServlet?p_process=selectView&p_seq=61&p_lecture_cls=GC04\">\r\n\t\t\t\t\t\t\t<span class=\"thumb\"><img src=\"http://edu.kocca.or.kr/upload/accept/GoldClassAdmin_img_file_201405231539221_lee1.gif\" alt=\"���������� ���ϴ�\"></span>\r\n\t\t\t\t\t\t\t<span class=\"subject\">���������� ���ϴ�</span>\r\n\t\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t\t</a>\r\n\t\t\t\t\t</li>\r\n\t\t\t\t</ul>\r\n\t\t\t\t<div class=\"type1-lg\">\r\n\t\t\t\t\t<a href=\"/servlet/controller.infomation.GoldClassHomePageServlet?p_process=selectView&p_seq=87&p_lecture_cls=GC01\">\r\n\t\t\t\t\t\t<span class=\"thumb\"><img src=\"/images/main/_category_thumb/openclass_87_188x338.jpg\" alt=\"TV���� Ʈ���� 1 - ���� ���� ��������� �ȸ��� ���� �帣 - ������ I\"></span>\r\n\t\t\t\t\t\t<span class=\"subject\">TV���� Ʈ���� 1 - ���� ���� ��������� �ȸ��� ���� �帣 - ������ I</span>\r\n\t\t\t\t\t\t<span class=\"text\"></span>\r\n\t\t\t\t\t</a>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n            <!-- �������� �� //-->\r\n\r\n\t\t</div>\r\n\t\t<!-- /lt-wz-group -->\r\n\t\t<!-- side -->\r\n\t\t<div class=\"side\">\r\n\r\n            <div class=\"search\">\r\n                <div class=\"field\">\r\n                    <input type=\"text\" class=\"mainSearchInput\" id=\"topWarp_searchText\" name=\"topWarp_searchText\" placeholder=\"�����˻�\" onkeypress=\"searchtotal_enter(event);\" style=\"font-weight:bold; color:#808080;\" />\r\n                    <a href=\"#\" onclick=\"totalSubjSearch1();\"><input type=\"image\" src=\"/images/common/btn-search.png\" alt=\"�����˻�\"/></a>\r\n                </div>\r\n\r\n                <div class=\"word\">\r\n                    <ul id=\"searchWord\">\r\n                        <li>\r\n";
    private final static byte[]  _wl_block39Bytes = _getBytes( _wl_block39 );

    private final static String  _wl_block40 ="\r\n                        </li>\r\n                        <li>\r\n";
    private final static byte[]  _wl_block40Bytes = _getBytes( _wl_block40 );

    private final static String  _wl_block41 ="\r\n                            <span><a href=\"javascript:fnSearchSubjByKeyword(\'";
    private final static byte[]  _wl_block41Bytes = _getBytes( _wl_block41 );

    private final static String  _wl_block42 ="\');\">";
    private final static byte[]  _wl_block42Bytes = _getBytes( _wl_block42 );

    private final static String  _wl_block43 ="</a></span>\r\n";
    private final static byte[]  _wl_block43Bytes = _getBytes( _wl_block43 );

    private final static String  _wl_block44 ="\r\n                        </li>\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n\r\n\t\t\t<!-- lt-tab -->\r\n            <!--\r\n\t\t\t<div class=\"lt-tab\">\r\n\t\t\t\t<div class=\"header\">\r\n\t\t\t\t\t<h3>�Խ���</h3>\r\n\t\t\t\t\t<ul>\r\n\t\t\t\t\t\t<li class=\"active\"><a href=\"#\">Best �ı�</a></li>\r\n\t\t\t\t\t\t<li><a href=\"#\">�ڷ�</a></li>\r\n\t\t\t\t\t\t<li><a href=\"#\">����</a></li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t\t<a href=\"#\" class=\"more\"><img src=\"/images/common/btn-more.png\" alt=\"MORE\"></a>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class=\"body\">\r\n\t\t\t\t\t<ul>\r\n\t\t\t\t\t\t<li><a href=\"#\"><strong>[���]</strong> ���� �Դϴ� <img src=\"/images/common/icon-n.png\" alt=\"N\"></a></li>\r\n\t\t\t\t\t\t<li><a href=\"#\"><strong>[���]</strong> ���� �Դϴ�</a></li>\r\n\t\t\t\t\t\t<li><a href=\"#\"><strong>[���]</strong> ���� �Դϴ�</a></li>\r\n\t\t\t\t\t\t<li><a href=\"#\"><strong>[���]</strong> ���� �Դϴ�</a></li>\r\n\t\t\t\t\t\t<li><a href=\"#\"><strong>[���]</strong> ���� �Դϴ�</a></li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class=\"body\">\r\n\t\t\t\t\t<ul>\r\n\t\t\t\t\t\t<li><a href=\"#\"><strong>[222]</strong> ���� �Դϴ� <img src=\"/images/common/icon-n.png\" alt=\"N\"></a></li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n\t\t\t\t<div class=\"body\">\r\n\t\t\t\t\t<ul>\r\n\t\t\t\t\t\t<li><a href=\"#\"><strong>[333]</strong> ���� �Դϴ� <img src=\"/images/common/icon-n.png\" alt=\"N\"></a></li>\r\n\t\t\t\t\t</ul>\r\n\t\t\t\t</div>\r\n\t\t\t</div>\r\n            //-->\r\n\t\t\t<!-- /lt-tab -->\r\n\r\n\t\t\t<div class=\"banner\">\r\n\t\t\t\t<a href=\"/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR\"><img src=\"/images/main/banner_0";
    private final static byte[]  _wl_block44Bytes = _getBytes( _wl_block44 );

    private final static String  _wl_block45 =".jpg\" width=\"280\" height=\"96\" alt=\"ȫ������ �ٷκ���\"></a>\r\n\t\t\t</div>\r\n\t\t\t<div class=\"banner\">\r\n\t\t\t\t<a href=\"/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList\"><img src=\"/images/main/bn-apply.jpg\" alt=\"�¶��α��� ������û\"></a>\r\n\t\t\t</div>\r\n\t\t\t<ul class=\"quick\">\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService\"><img src=\"/images/main/q1-off.png\" class=\"ro\" alt=\"�������� ����\"></a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome\"><img src=\"/images/main/q2-off.png\" class=\"ro\" alt=\"�н� ���̵�\"></a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList\"><img src=\"/images/main/q3-off.png\" class=\"ro\" alt=\"�����ϴ� ����\"></a></li>\r\n\t\t\t\t<li><a href=\"/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage\"><img src=\"/images/main/q4-off.png\" class=\"ro\" alt=\"������ ���\"></a></li>\r\n\t\t\t</ul>\r\n\t\t</div>\r\n\t\t<!-- /side -->\r\n\t</div>\r\n\t<!-- main-content2 -->\r\n\t<!-- main-content3 -->\r\n\t<div class=\"main-content3\">\r\n\t\t<!-- col1 -->\r\n\t\t<div class=\"col1\">\r\n\t\t\t<img src=\"/images/main/callcenter.jpg\" alt=\"�ѱ���������ī���� �������� ����ó�Դϴ�. ���� ���� ���Ǵ� ������ȣ 02, ���� 3219, ��ȣ 6540�̸�, �¶��� ���� ���Ǵ� ������ȣ 02, ���� 3219, ��ȣ 5483�Դϴ�.\">\r\n\t\t</div>\r\n\t\t<!-- col1 -->\r\n\t\t<!-- col2 -->\r\n\t\t<div class=\"col2\">\r\n\t\t\t<ul>\r\n\t\t\t\t<li><a href=\"https://www.facebook.com/edukocca\" target=\"_blank\"><img src=\"/images/main/sns-f.png\" alt=\"���̽���\" /></a></li>\r\n\t\t\t\t<li><a href=\"https://twitter.com/edukocca\" target=\"_blank\"><img src=\"/images/main/sns-t.png\" alt=\"Ʈ����\" /></a></li>\r\n\t\t\t\t<li><a href=\"http://blog.naver.com/kocca01\" target=\"_blank\"><img src=\"/images/main/sns-b.png\" alt=\"��α�\" /></a></li>\r\n\t\t\t\t<li><a href=\"http://www.youtube.com/KoreanContent\" target=\"_blank\"><img src=\"/images/main/sns-y.png\" alt=\"������\" /></a></li>\r\n\t\t\t</ul>\r\n\t\t</div>\r\n\t\t<!-- col2 -->\r\n\t\t<!-- col3 -->\r\n\t\t<div class=\"col3\">\r\n\t\t\t<a href=\"/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp\"><img src=\"/images/main/f-app.png\" alt=\"����Ͽ����� �ѱ���������ī����\"></a>\r\n\t\t</div>\r\n\t\t<!-- col3 -->\r\n\t</div>\r\n\t<!-- main-content3 -->\r\n</div>\r\n<!-- /main-container -->\r\n";
    private final static byte[]  _wl_block45Bytes = _getBytes( _wl_block45 );

    private final static String  _wl_block46 ="<!-- footer-new -->\r\n<div id=\"footer-new\">\r\n\t<!-- body -->\r\n\t<div class=\"body\">\r\n\t\t<!-- brand -->\r\n\t\t<div class=\"brand\">\r\n\t\t\t<img src=\"/images/common/brand-footer.png\" alt=\"�ѱ���������ī����\">\r\n\t\t</div>\r\n\t\t<!-- /brand -->\r\n\t\t<!-- info -->\r\n\t\t<div class=\"info\">\r\n\t\t\t<div class=\"link-group\">\r\n\t\t\t\t<a href=\"/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome\">�̿�ȳ�</a><span class=\"line\"> | </span>\r\n\t\t\t\t<a href=\"/servlet/controller.homepage.HomePageContactServlet?p_process=contactus\">���޹���</a><span class=\"line\"> | </span>\r\n\t\t\t\t<a href=\"/servlet/controller.homepage.HomePageHelpServlet?p_process=SiteMap\">����Ʈ��</a>\r\n\t\t\t\t<select onchange=\"fnMoveFamilySite(this.value);\">\r\n\t\t\t\t\t<option value=\"\">���û���Ʈ</option>\r\n                    <option value=\"http://www.mcst.go.kr/\">��ȭü��������</option>\r\n                    <option value=\"http://www.kocca.kr/\">�ѱ������������</option>\r\n                    <option value=\"http://library.kocca.or.kr/\">������������</option>\r\n                    <option value=\"http://www.gamehub.or.kr/\">�۷ι�������꼾��</option>\r\n                    <option value=\"http://www.culturecontent.com/\">��ȭ����������</option>\r\n                    <!-- <option value=\"http://www.dccenter.kr/main_ft.jsp?syscd=FT\">�������̿뺸ȣ����</option> 2015-01-16 ���� Ȩ������ ���� �Ұ� //-->\r\n                    <!-- <option value=\"http://www.contentright.or.kr/\">���۱���Ź�����ý���</option> 2015-01-16 ���� Ȩ������ ������ ������. ���п��� �˻����� ���� //-->\r\n                    <option value=\"http://www.uci.or.kr/\">�������ĺ�ü��(UCI)</option>\r\n                    <option value=\"http://www.kgq.or.kr/\">���ӱ����ڰݱ������</option>\r\n                    <option value=\"http://www.culturist.or.kr/\">�����η������ý���</option>\r\n\t\t\t\t</select>\r\n\t\t\t</div>\r\n\t\t\t<div class=\"copyright\">\r\n\t\t\t\t����Ư���� ��õ�� �񵿵��� 203-1 ���ȸ�� 8�� | ����ڵ�Ϲ�ȣ:117-82-04412<br>\r\n\t\t\t\tCOPYRIGHT&copy; 2013 KOCCA ALL RIGHTS RESERVED\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t\t<!-- /info -->\r\n\t\t<!-- logo-group -->\r\n\t\t<div class=\"logo-group\">\r\n\t\t\t<a href=\"http://validator.w3.org/check?uri=http://edu.kocca.or.kr/servlet/controller.homepage.MainServlet\"><img src=\"http://edu.kocca.or.kr/images/2013/common/mark_1.png\" alt=\"������α�� ����\" /></a>\r\n\t\t\t<a href=\"javascript:pop_view(\'http://edu.kocca.or.kr/contents/temp/wa.html\',410,570,\'no\');\"><img src=\"http://edu.kocca.or.kr/images/2013/common/mark_2.gif\" alt=\"��������ڸ��� Ŭ�������� Ư�����\" /></a>\r\n\t\t\t<a href=\"javascript:pop_view(\'http://edu.kocca.or.kr/contents/temp/wau.html\',410,570,\'no\');\"><img src=\"http://edu.kocca.or.kr/images/2013/common/mark_3.gif\" alt=\"�� ���ټ� �������Ʈ ����\" /></a>\r\n\t\t\t<a href=\"javascript:pop_view(\'http://edu.kocca.or.kr/contents/temp/elearning.html\',410,570,\'no\');\"><img src=\"http://edu.kocca.or.kr/images/2013/common/mark_4.gif\" alt=\"e���������������\" /></a>\r\n\t\t\t<a href=\"javascript:pop_view(\'http://edu.kocca.or.kr/contents/temp/i_safe.html\',410,570,\'no\');\"><img src=\"http://edu.kocca.or.kr/images/2013/common/mark_5.gif\" alt=\"����������ȣ���� ����\" /></a>\r\n\t\t\t<a href=\"javascript:pop_view(\'http://edu.kocca.or.kr/contents/temp/eprivacy.html\',410,570,\'no\');\"><img src=\"http://edu.kocca.or.kr/images/2013/common/mark_6.gif\" alt=\"����������ȣ�������Ʈ ����\" /></a>\r\n\t\t\t<a href=\"javascript:pop_view(\'http://edu.kocca.or.kr/contents/temp/gcs.html\',410,570,\'no\');\"><img src=\"http://edu.kocca.or.kr/images/2013/common/mark_7.gif\" alt=\"�������������� ǰ������\" /></a>\r\n\t\t\t<a href=\"javascript:pop_view(\'https://mark.inicis.com/mark/popup_v1.php?no=19844&amp;st=1322725008\',520,625,\'no\')\"><img src=\"http://edu.kocca.or.kr/images/2013/common/mark_8.gif\" alt=\"�̴Ͻý� ���� �ý���\" /></a>\r\n\t\t\t<a href=\"#\"><img src=\"http://edu.kocca.or.kr/images/2013/common/mark_9.gif\" alt=\"\" /></a>\r\n\t\t</div>\r\n\t\t<!-- /logo-group -->\r\n\t</div>\r\n\t<!-- /body -->\r\n</div>\r\n<!-- /footer-new -->\r\n<form name=\"familySiteform\" action=\"\" method=\"get\" target=\"_blank\">\r\n</form>\r\n</body>\r\n</html>";
    private final static byte[]  _wl_block46Bytes = _getBytes( _wl_block46 );

    private final static String  _wl_block47 ="\r\n\r\n";
    private final static byte[]  _wl_block47Bytes = _getBytes( _wl_block47 );

    private String subStringBytes(String str, int byteLength) {
        // String �� byte ���� ��ŭ �ڸ���.

        int retLength = 0;
        int tempSize = 0;
        int asc;

        if(str == null || "".equals(str) || "null".equals(str)){
            str = "";
        }

        int length = str.length();

        for (int i = 1; i <= length; i++) {
            asc = (int) str.charAt(i - 1);
            if (asc > 127) {
                if (byteLength >= tempSize + 2) {
                    tempSize += 2;
                    retLength++;
                } else {
                    return str.substring(0, retLength) + "...";
                }
            } else {
                if (byteLength > tempSize) {
                    tempSize++;
                    retLength++;
                }
            }
        }

        return str.substring(0, retLength);
    }


    static private javelin.jsp.JspFunctionMapper _jspx_fnmap = javelin.jsp.JspFunctionMapper.getInstance();

    public void _jspService(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) 
    throws javax.servlet.ServletException, java.io.IOException {

        javax.servlet.ServletConfig config = getServletConfig();
        javax.servlet.ServletContext application = config.getServletContext();
        javax.servlet.jsp.tagext.JspTag _activeTag = null;
        Object page = this;
        javax.servlet.jsp.JspWriter out;
        javax.servlet.jsp.PageContext pageContext = javax.servlet.jsp.JspFactory.getDefaultFactory().getPageContext(this, request, response, "/learn/library/error.jsp", true , 8192 , true );
        response.setHeader("Content-Type", "text/html;charset=euc-kr");
        out = pageContext.getOut();
        javax.servlet.jsp.JspWriter _originalOut = out;
        javax.servlet.http.HttpSession session = request.getSession( true );
        try {;
            response.setContentType("text/html;charset=euc-kr");
            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}
            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}
            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}
            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}
            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}
            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}
            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}
            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}
            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    box.put("isMain", "Y");

    ArrayList<DataBox> mainBannerList = (ArrayList)request.getAttribute("mainBannerList");
    ArrayList<DataBox> mainNoticeList = (ArrayList)request.getAttribute("mainNoticeList");
    ArrayList<DataBox> popularKeywordList = (ArrayList)request.getAttribute("popularKeywordList");
    ArrayList<DataBox> academyStoryList = (ArrayList)request.getAttribute("academyStoryList");

    ArrayList<DataBox> noticeList = new ArrayList<DataBox>();
    ArrayList<DataBox> eventList = new ArrayList<DataBox>();

    DataBox dbox = null;

    StringBuffer mainBannerLgSB = new StringBuffer();
    StringBuffer mainBannerSB = new StringBuffer();
    for ( int i = 0 ; i < mainBannerList.size() ; i++ ) {
        dbox = (DataBox)mainBannerList.get(i);

            mainBannerLgSB.append("<li>");
            mainBannerLgSB.append("<a href=\"").append(dbox.getString("d_url")).append("\" target=\"").append(dbox.getString("d_url_target")).append("\"><img src=\"").append(dbox.getString("d_save_img_nm").replaceAll("\\\\", "/")).append("\" alt=\"").append(dbox.getString("d_explain")).append("\" /></a>");
            mainBannerLgSB.append("</li>\n");

            mainBannerSB.append("<li>\n");
            mainBannerSB.append("<a href=\"#\" data-slide-index=\"").append(i).append("\">\n");
            mainBannerSB.append("   <span class=\"thumb\"><img src=\"").append(dbox.getString("d_save_img_nm").replaceAll("\\\\", "/")).append("\" alt=\"").append(dbox.getString("d_explain")).append("\" /></span>\n");
            mainBannerSB.append("   <span class=\"text\">").append(dbox.getString("d_title")).append("</span>\n");
            mainBannerSB.append("</a>\n");
            mainBannerSB.append("</li>\n");
    }

    SimpleDateFormat sdf = new SimpleDateFormat("dd");
    Date dt = new Date();
    String dd = sdf.format(dt);

            {_writeText(response, out, _wl_block0, _wl_block0Bytes);}

    String topWarp_userid = box.getSession("userid");
    String topWarp_usernm = box.getSession("name");
    String topWarp_gadmin = box.getSession("gadmin");

    boolean isUserLogin = ( !topWarp_userid.equals("") ) ? true : false;

    String titleStr = box.getString("title_str");
    titleStr = (titleStr == null || titleStr.equals("")) ? "�ѱ���������ī����" : titleStr + " - �ѱ���������ī����";

            {_writeText(response, out, _wl_block1, _wl_block1Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( box.getString("og_title") 
));
            {_writeText(response, out, _wl_block2, _wl_block2Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( box.getString("og_url") 
));
            {_writeText(response, out, _wl_block3, _wl_block3Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( box.getString("og_description") 
));
            {_writeText(response, out, _wl_block4, _wl_block4Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( box.getString("og_image") 
));
            {_writeText(response, out, _wl_block5, _wl_block5Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( titleStr 
));
            {_writeText(response, out, _wl_block6, _wl_block6Bytes);}

    if ( box.getString("isMain").equals("Y") ) {

            {_writeText(response, out, _wl_block7, _wl_block7Bytes);}

    }

            {_writeText(response, out, _wl_block8, _wl_block8Bytes);}

        if(topWarp_userid.equals("")) {

            {_writeText(response, out, _wl_block9, _wl_block9Bytes);}

        } else {

            {_writeText(response, out, _wl_block10, _wl_block10Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf(topWarp_usernm
));
            {_writeText(response, out, _wl_block11, _wl_block11Bytes);}

        }

            {_writeText(response, out, _wl_block12, _wl_block12Bytes);}
            {_writeText(response, out, _wl_block13, _wl_block13Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( mainBannerLgSB.toString() 
));
            {_writeText(response, out, _wl_block14, _wl_block14Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( mainBannerSB.toString() 
));
            {_writeText(response, out, _wl_block15, _wl_block15Bytes);}

    String boardType = "";
    String gubunCode = "";
    String gubunName = "";
    String newYn = "";
    int seq = 0;

    for ( int i = 0 ; i < mainNoticeList.size() ; i++ ) {
        dbox = (DataBox)mainNoticeList.get(i);
        seq = dbox.getInt("d_seq");
        boardType = dbox.getString("d_board_type");
        gubunCode = dbox.getString("d_gubun_code");
        newYn = dbox.getString("d_new_yn");
        if ( boardType.equals("NOTICE") ) {
            noticeList.add( dbox );
            gubunName = (gubunCode.equals("N") ? "����" : ( gubunCode.equals("G") ? "�ȳ�" : "����" ) );
        } else {
            eventList.add( dbox );
            gubunName = "���";
        }

        if ( i < 5 ) {

            {_writeText(response, out, _wl_block16, _wl_block16Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( boardType 
));
            {_writeText(response, out, _wl_block17, _wl_block17Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( seq 
));
            {_writeText(response, out, _wl_block18, _wl_block18Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( gubunName 
));
            {_writeText(response, out, _wl_block19, _wl_block19Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( this.subStringBytes( dbox.getString("d_title"), 36) 
));
            {_writeText(response, out, _wl_block20, _wl_block20Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( newYn.equals("Y") ? "<img src=\"/images/common/icon-n.png\" alt=\"�ű�\"/>" : "" 
));
            {_writeText(response, out, _wl_block21, _wl_block21Bytes);}

        }
    }

            {_writeText(response, out, _wl_block22, _wl_block22Bytes);}

    if ( noticeList != null && noticeList.size() > 0 ) {
        for ( int i = 0 ; i < noticeList.size() ; i++ ) {
            dbox = (DataBox)noticeList.get(i);
            seq = dbox.getInt("d_seq");
            gubunCode = dbox.getString("d_gubun_code");
            newYn = dbox.getString("d_new_yn");
            gubunName = gubunCode.equals("N") ? "����" : ( gubunCode.equals("G") ? "�ȳ�" : "����" );

            {_writeText(response, out, _wl_block23, _wl_block23Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( seq 
));
            {_writeText(response, out, _wl_block18, _wl_block18Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( gubunName 
));
            {_writeText(response, out, _wl_block19, _wl_block19Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( this.subStringBytes( dbox.getString("d_title"), 36) 
));
            {_writeText(response, out, _wl_block20, _wl_block20Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( newYn.equals("Y") ? "<img src=\"/images/common/icon-n.png\" alt=\"�ű�\"/>" : "" 
));
            {_writeText(response, out, _wl_block21, _wl_block21Bytes);}

        }
    } else {

            {_writeText(response, out, _wl_block24, _wl_block24Bytes);}

    }

            {_writeText(response, out, _wl_block25, _wl_block25Bytes);}

    if ( eventList != null && eventList.size() > 0 ) {
        for ( int i = 0 ; i < eventList.size() ; i++ ) {
            dbox = (DataBox)eventList.get(i);
            seq = dbox.getInt("d_seq");
            gubunCode = dbox.getString("d_gubun_code");
            newYn = dbox.getString("d_new_yn");
            gubunName = (gubunCode.equals("O") ) ? "����" : "����" ;

            {_writeText(response, out, _wl_block26, _wl_block26Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( seq 
));
            {_writeText(response, out, _wl_block18, _wl_block18Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( gubunName 
));
            {_writeText(response, out, _wl_block19, _wl_block19Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( this.subStringBytes( dbox.getString("d_title"), 36) 
));
            {_writeText(response, out, _wl_block20, _wl_block20Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( newYn.equals("Y") ? "<img src=\"/images/common/icon-n.png\" alt=\"�ű�\"/>" : "" 
));
            {_writeText(response, out, _wl_block21, _wl_block21Bytes);}

        }
    } else {

            {_writeText(response, out, _wl_block27, _wl_block27Bytes);}

    }

            {_writeText(response, out, _wl_block28, _wl_block28Bytes);}

    for ( int i = 0 ; i < academyStoryList.size() ; i++ ) {
        dbox = (DataBox)academyStoryList.get(i);
        if ( i == 0 ) {

            {_writeText(response, out, _wl_block29, _wl_block29Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( dbox.getInt("d_seq") 
));
            {_writeText(response, out, _wl_block30, _wl_block30Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( !dbox.getString("d_save_img_nm").equals("") ? dbox.getString("d_save_img_nm") : "/images/main/_thumb.gif"
));
            {_writeText(response, out, _wl_block31, _wl_block31Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( dbox.getString("d_title") 
));
            {_writeText(response, out, _wl_block32, _wl_block32Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( dbox.getString("d_title").replaceAll("\'\'", "\'") 
));
            {_writeText(response, out, _wl_block33, _wl_block33Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( this.subStringBytes( StringManager.removeHTML( StringManager.removeHTMLHead( dbox.getString("d_cont") ) ).replaceAll("&nbsp;", " ").replaceAll("<br>", ""), 170 ) 
));
            {_writeText(response, out, _wl_block34, _wl_block34Bytes);}

        } else {

            {_writeText(response, out, _wl_block35, _wl_block35Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( dbox.getInt("d_seq") 
));
            {_writeText(response, out, _wl_block36, _wl_block36Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( !dbox.getString("d_save_img_nm").equals("") ? dbox.getString("d_save_img_nm") : "/images/main/_thumb.gif"
));
            {_writeText(response, out, _wl_block31, _wl_block31Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( dbox.getString("d_title") 
));
            {_writeText(response, out, _wl_block37, _wl_block37Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( dbox.getString("d_title").replaceAll("\'\'", "\'") 
));
            {_writeText(response, out, _wl_block38, _wl_block38Bytes);}

        }
    }

            {_writeText(response, out, _wl_block39, _wl_block39Bytes);}

    for ( int i = 0 ; i < popularKeywordList.size() ; i++ ) {
        dbox = (DataBox)popularKeywordList.get(i);

        if ( i != 0 && i % 4 == 0 ) {

            {_writeText(response, out, _wl_block40, _wl_block40Bytes);}

        }

            {_writeText(response, out, _wl_block41, _wl_block41Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( dbox.getString("d_keyword") 
));
            {_writeText(response, out, _wl_block42, _wl_block42Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( dbox.getString("d_keyword") 
));
            {_writeText(response, out, _wl_block43, _wl_block43Bytes);}

    }

            {_writeText(response, out, _wl_block44, _wl_block44Bytes);}
            out.print( weblogic.utils.StringUtils.valueOf( Integer.parseInt(dd) % 2 
));
            {_writeText(response, out, _wl_block45, _wl_block45Bytes);}
            {_writeText(response, out, _wl_block46, _wl_block46Bytes);}
            {_writeText(response, out, _wl_block47, _wl_block47Bytes);}
        } catch (Throwable __ee){
            if(!(__ee instanceof javax.servlet.jsp.SkipPageException)) {
                while ((out != null) && (out != _originalOut)) out = pageContext.popBody(); 
                _releaseTags(_activeTag);
                pageContext.handlePageException(__ee);
            }
        }
    }
}
