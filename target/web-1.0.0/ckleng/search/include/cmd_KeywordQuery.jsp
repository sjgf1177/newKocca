<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.diquest.ir.common.msg.protocol.query.QuerySet" %>
<%@ page import="com.diquest.ir.common.msg.protocol.query.Query" %>
<%@ page import="com.diquest.ir.common.msg.protocol.query.SelectSet" %>
<%@ page import="com.diquest.ir.common.msg.protocol.query.FilterSet" %>
<%@ page import="com.diquest.ir.common.msg.protocol.query.WhereSet" %>
<%@ page import="com.diquest.ir.common.msg.protocol.result.ResultSet" %>
<%@ page import="com.diquest.ir.common.msg.protocol.result.Result" %>
<%@ page import="com.diquest.ir.common.msg.protocol.query.OrderBySet" %>
<%@ page import="com.diquest.ir.common.msg.protocol.query.GroupBySet" %>
<%@ page import="com.diquest.ir.common.msg.protocol.result.GroupResult" %>
<%@ page import="com.diquest.ir.common.msg.protocol.Protocol" %>
<%@ page import="com.diquest.ir.client.command.profile.CommandProfile"%>
<%@ page import="com.diquest.ir.common.msg.protocol.query.QueryParser" %>
<%@ page import="com.diquest.ir.client.command.CommandSearchRequest" %>
<%@ page import="com.diquest.ir.common.msg.collection.CollectionInfo"%>
<%@ page import="com.diquest.ir.common.msg.collection.ProfileInfo"%>
<%@ page import="com.diquest.ir.common.msg.ext.body.common.ErrorMessage"%>
<%@ page import="com.diquest.ir.client.util.PostPageNavigator"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.*"%>

<%!
	public static int ret = -1;
	public static String queryStr = "";
	public static char[] startTag = "<strong>".toCharArray();
	public static char[] endTag = "</strong>".toCharArray(); 
	public static QueryParser parser = new QueryParser();

	public static SelectSet[] hot_getselectSet = null;

	/*
	 * ����/�α�˻��� API
	*/
	public static Result[] getKeywordSearchResults(String SEARCH_HOST,int SEARCH_PORT) throws Exception{
		
		Result[] resultlist = null; //�˻������ ������ �ִ� ����
		//�ϰ� �α�˻��� ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query hot_m3Query = null; //������ ��� �κ�
		ArrayList whereList_hot = new ArrayList();
		SelectSet[] hot_selectSet = null;
		WhereSet[] hot_whereSet = null; //�˻����� �˻��� �� �ʵ带 �����ϴµ� �ʿ��� ����

		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����

		//SelectSet ����=====================================================================================================
		hot_selectSet = new SelectSet[]{
			new SelectSet("KEYWORD", Protocol.SelectSet.NONE),
			new SelectSet("RANKING", Protocol.SelectSet.NONE),
			new SelectSet("PREV_RANK", Protocol.SelectSet.NONE)
		};
		//SelectSet ����=====================================================================================================

		//whereSet
		whereList_hot.add(new WhereSet(Protocol.WhereSet.OP_BRACE_OPEN));
		whereList_hot.add(new WhereSet ("NULL_KEYWORD", Protocol.WhereSet.OP_HASALL, "!@#$%",1));  
		whereList_hot.add(new WhereSet(Protocol.WhereSet.OP_BRACE_CLOSE));

		//arraylist ��� where�� whereSet�� ��´�.
		hot_whereSet = new WhereSet[whereList_hot.size()];
		for (int i = 0; i < whereList_hot.size(); i++) {
			hot_whereSet[i] = (WhereSet) whereList_hot.get(i);
		}

		//OrderBySet ����=====================================================================================================
		OrderBySet[] orderbys_hot = new OrderBySet[1]; 
		orderbys_hot[0] = new OrderBySet(true, "RANKING", Protocol.OrderBySet.OP_NONE);
		//OrderBySet ����=====================================================================================================

		hot_m3Query = new Query("", "");
		hot_m3Query.setOrderby(orderbys_hot);
		hot_m3Query.setSelect(hot_selectSet);
		hot_m3Query.setWhere(hot_whereSet); 
		hot_m3Query.setFrom("HOTKEYWORD"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		hot_m3Query.setResult(0, 4); //������ ���
		//hot_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		hot_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		//hot_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		hot_m3Query.setPrintQuery(false); 
		//hot_m3Query.setLoggable(true);
		hot_m3Query.setDebug(true);  
		//hot_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( hot_m3Query );
		//System.out.print(queryStr);

		//////�˻� ���� ���� ����////////////////////////////////////////////////////////////////////////////
		QuerySet querySet = new QuerySet(1);
		querySet.addQuery(hot_m3Query);

		hot_getselectSet = hot_m3Query.getSelectFields();

		CommandSearchRequest.setProps(SEARCH_HOST, SEARCH_PORT, 5000, 1, 10); //����ð�,min pool size, max pool size ������
		CommandSearchRequest command = new CommandSearchRequest(SEARCH_HOST, SEARCH_PORT);
		
		ret = command.request(querySet);

		//System.out.print("-- wiz error0 : " + ret + "--");
		if (ret < 0) {
			resultlist = new Result[1];
			resultlist[0] = new Result();
		}else{
			resultlist = command.getResultSet().getResultList(); 
		}
		  
		return resultlist;
	}

%>
<%
	int hot_TotalSize = 0;
	int hot_RealSize = 0;

	String KEYWORD = "";
	String RANKING = "";
	String PREV_RANK = "";

	String selectFieldTITLE = ""; //������������ ������ ��Ű���� �ҷ� �ö� ����ϴ� ���� 

	Result hot_result = null;   //�˻� ����� �������µ� �ʿ��� ����
	Result[] hot_resultlist = null; //�˻������ ������ �ִ� ����

	hot_resultlist = getKeywordSearchResults(SEARCH_HOST,SEARCH_PORT);
	if(ret > 0){
		if(hot_resultlist[0] != null && hot_resultlist.length > 0){
			hot_result = hot_resultlist[0];
			hot_TotalSize =  hot_result.getTotalSize();   // ���� �α�˻��� �˻� ���
			hot_RealSize = hot_result.getRealSize();      // ���������� ǥ�õǴ� ����
	   }
	}

%>