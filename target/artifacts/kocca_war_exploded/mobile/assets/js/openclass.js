/**
 * �������� �� ȭ������ �̵��Ѵ�.
 * @param type : app / web ����
 * @param seq : �������� �Ϸù�ȣ
 * @param prevPage : ���� ������ ����. �������� �� ȭ���� ��� ���� ��ΰ� 3������ ����. �̸� �����ϱ� ���� ��
 */
function fnOpenClassViewDetail(type, seq, prevPage, etcArg1, etcArg2) {
    var url = "/servlet/controller.mobile.openclass.OpenClassViewServlet";
    var param = "?process=openClassViewDetail&seq=" + seq;

    if ( prevPage == "popular" || prevPage == "category" ) {
        param += "&prevPage=" + prevPage;

    } else if ( prevPage == "theme" ) {
        param += "&prevPage=" + prevPage + "&themeNm=" + etcArg1;

    } else if ( prevPage == "categoryDetail" ) {
        param += "&prevPage=" + prevPage + "&lectureCls=" + etcArg1 + "&lectureClsNm=" + etcArg2;

    }

    fnMoveNavi( type, url + param );
}
