/**
 * ���԰��� �� ȭ������ �̵��Ѵ�.
 * @param type : app / web ����
 * @param subj : ���԰��� �ڵ�
 * @param year : �����⵵
 * @param subjSeq : ���԰����� ���� ����
 */
function fnViewOnlineClassDetail(type, subj, year, subjseq) {
    var url = "/servlet/controller.mobile.onlineclass.OnlineClassDetailServlet?process=selectOnlineClassDetail&subj=" + subj + "&year=" + year + "&subjseq=" + subjseq;

    fnMoveNavi( 2, url, "");
}
