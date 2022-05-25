<%!
	
	public static SelectSet[] kistep_getselectSet = null;
	public static SelectSet[] bbs_getselectSet = null;
	public static SelectSet[] orgin_getselectSet = null;  //05.21 �߰�
	public static SelectSet[] attfile_getselectSet = null;
	public static SelectSet[] kistep_selectSet = null; //�˻� ������� ������ �ʵ�� �����ϴµ� �ʿ��� ����
	public static SelectSet[] bbs_selectSet = null; //�˻� ������� ������ �ʵ�� �����ϴµ� �ʿ��� ����
	public static SelectSet[] orgin_selectSet = null; //�˻� ������� ������ �ʵ�� �����ϴµ� �ʿ��� ����
	public static SelectSet[] attfile_selectSet = null; //�˻� ������� ������ �ʵ�� �����ϴµ� �ʿ��� ����

	public static OrderBySet[] kistep_orderbys = null;
	public static FilterSet[] kistep_filterSet = null; //���͸��ϴµ� �ʿ��� �ʵ带 ���͸��� ������� ���� ��Ƶδ� ����

	public static String kistepwhereSetStr ="";
	public static String orginwhereSetStr ="";
	public static String attfilewhereSetStr ="";


	public static String nullCheck(String str) throws Exception {
		if(str == null || str == "") return "";
		str = str.replaceAll("<","&lt;");
		str = str.replaceAll(">","&gt;");
		str = str.replaceAll("&","&amp;");
		str = str.replaceAll("'","&#39;");
		return str.trim();
	}

	/*
	 * ���� SelectSet
	*/
	public static SelectSet[] kistep_selectSet(String cate){
		SelectSet[] selectSet = null;

		if(cate.equals("orgin")){
			selectSet = new SelectSet[]{
				new SelectSet("NTT_CLS", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_SJ", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_CN", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_ORGIN", Protocol.SelectSet.HIGHLIGHT),
				new SelectSet("NTT_URL", Protocol.SelectSet.NONE),
				new SelectSet("REG_DATE", Protocol.SelectSet.NONE),
				new SelectSet("NTT_ORGIN_PH", Protocol.SelectSet.HIGHLIGHT),
				new SelectSet("WEIGHT", Protocol.SelectSet.NONE)
			};
		}else if(cate.equals("attfile")){ 
			selectSet = new SelectSet[]{
				new SelectSet("ORIGNL_FILE_NM", Protocol.SelectSet.HIGHLIGHT),
				new SelectSet("ATT_CN", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("ATT_URL", Protocol.SelectSet.NONE),
				new SelectSet("NTT_SJ", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_URL", Protocol.SelectSet.NONE),
				new SelectSet("REG_DATE", Protocol.SelectSet.NONE),
				new SelectSet("BBS_NM", Protocol.SelectSet.NONE),
				new SelectSet("WEIGHT", Protocol.SelectSet.NONE)	
					
			};
			
		}else if(cate.equals("bbs")){ 
			selectSet = new SelectSet[]{
				new SelectSet("NTT_CLS", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_SJ", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_CN", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_ORGIN", Protocol.SelectSet.HIGHLIGHT),
				new SelectSet("NTT_URL", Protocol.SelectSet.NONE),
				new SelectSet("REG_DATE", Protocol.SelectSet.NONE),
				new SelectSet("BBS_NM", Protocol.SelectSet.NONE),
				new SelectSet("WEIGHT", Protocol.SelectSet.NONE)					
			};
			
		}else{
			selectSet = new SelectSet[]{
				new SelectSet("NTT_CLS", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_SJ", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_CN", (byte)(Protocol.SelectSet.SUMMARIZE | Protocol.SelectSet.HIGHLIGHT), 200),
				new SelectSet("NTT_ORGIN", Protocol.SelectSet.HIGHLIGHT),
				new SelectSet("NTT_URL", Protocol.SelectSet.NONE),
				new SelectSet("REG_DATE", Protocol.SelectSet.NONE),
				new SelectSet("WEIGHT", Protocol.SelectSet.NONE)					
			};
		}

		return selectSet;
	}

	/*
	 * ���� whereSet
	*/
	public static ArrayList kistep_whereSet (String searchQuery, String cate, String searchArea){
		
		int whereCheck =0;
		//�˻��� ����� ����Ʈ�� ��� ����
		ArrayList whereList = new ArrayList();
		String[] searchQueryArr = searchQuery.split("\\$\\|");
		
		for(int i=0; i < searchQueryArr.length; i++){
			whereList.add(new WhereSet(Protocol.WhereSet.OP_BRACE_OPEN));

			if(!cate.equals("attfile")){
				if(searchArea.equals("total") || searchArea.equals("title")){
					whereList.add(new WhereSet ("NTT_SJ", Protocol.WhereSet.OP_HASALL, searchQueryArr[i], 1000));  //����
					whereCheck++;
				}
				if(searchArea.equals("total") || searchArea.equals("contents")){
					if(whereCheck > 0){
						whereList.add(new WhereSet (Protocol.WhereSet.OP_OR)); 
					}
					whereList.add(new WhereSet ("NTT_CN", Protocol.WhereSet.OP_HASALL, searchQueryArr[i], 800));   //����
					whereCheck++;
				}
				if(searchArea.equals("total") || searchArea.equals("orgin")){
					if(whereCheck > 0){
						whereList.add(new WhereSet (Protocol.WhereSet.OP_OR)); 
					}
					whereList.add(new WhereSet ("NTT_ORGIN", Protocol.WhereSet.OP_HASALL, searchQueryArr[i], 500));  //��ó���
					if(cate.equals("orgin")){
						whereList.add(new WhereSet (Protocol.WhereSet.OP_OR)); 
						whereList.add(new WhereSet ("NTT_ORGIN_PH", Protocol.WhereSet.OP_HASALL, searchQueryArr[i], 200));  //��ó��� �н�
					}
					whereCheck++;
				}
				if(searchArea.equals("total") || searchArea.equals("keyword")){
					if(whereCheck > 0){
						whereList.add(new WhereSet (Protocol.WhereSet.OP_OR)); 
					}
					whereList.add(new WhereSet ("NTT_KEYWORD", Protocol.WhereSet.OP_HASALL, searchQueryArr[i], 300));   //Ű����
				}
			}else{
				if(searchArea.equals("total") || searchArea.equals("title")){
					whereList.add(new WhereSet ("ORIGNL_FILE_NM", Protocol.WhereSet.OP_HASALL, searchQueryArr[i], 1000));  //�����ϸ�
					whereList.add(new WhereSet (Protocol.WhereSet.OP_OR)); 
					whereList.add(new WhereSet ("NTT_SJ", Protocol.WhereSet.OP_HASALL, searchQueryArr[i], 1000));  //����
					whereCheck++;
				}
				if(searchArea.equals("total") || searchArea.equals("contents")){
					if(whereCheck > 0){
						whereList.add(new WhereSet (Protocol.WhereSet.OP_OR)); 
					}
					whereList.add(new WhereSet ("ATT_CN", Protocol.WhereSet.OP_HASALL, searchQueryArr[i], 800));   //÷������ ����
					whereCheck++;
				}
			}
			whereList.add(new WhereSet(Protocol.WhereSet.OP_BRACE_CLOSE));
			if(i < searchQueryArr.length-1){
				whereList.add(new WhereSet (Protocol.WhereSet.OP_AND)); 
			}
		}
		
		
		return whereList;
	}

	/*
	 * ���� OrderBySet
	*/
	public static OrderBySet[] kistep_orderBySet(String searchSort){
		
		OrderBySet[] orderbys = new OrderBySet[1]; 
		if(searchSort.equals("date")){  //�ֽż�
			orderbys[0] = new OrderBySet(true, "REG_DATE", Protocol.OrderBySet.OP_POSTWEIGHT);
		}else{   //��Ȯ��
			orderbys[0] = new OrderBySet(true, "REG_DATE", Protocol.OrderBySet.OP_PREWEIGHT); 
		}
		return orderbys;
	}

	/*
	 * ���� FilterSet
	*/
	public static FilterSet[] kistep_filterSet(String searchStartDate, String searchEndDate){
		FilterSet[] filterSet = null;
		ArrayList filterList = new ArrayList(); //���͸� �� ����Ʈ�� ��� ����

		if(!searchStartDate.equals("") && !searchEndDate.equals("")){
			String startDate = searchStartDate.replaceAll("-","");
			String endDate = searchEndDate.replaceAll("-","");
			filterList.add(new FilterSet(Protocol.FilterSet.OP_RANGE, "REG_DATE", new String[]{startDate, endDate}));
		}
		
		// arraylist ��� filter�� filterSet�� ��´�.
		filterSet = new FilterSet[filterList.size()];
		for (int i = 0; i < filterList.size(); i++) {
			filterSet[i] = (FilterSet) filterList.get(i);
		}

		return filterSet;
	}

	/*
	 * ���հ˻� API
	*/
	public static Result[] getSearchResults(String searchQuery, String allsearchQuery, String searchCategory, String searchSort,  String searchArea, String searchStartDate, String searchEndDate, String researchQuery,
	    int page_start, int page_size, String SEARCH_HOST,int SEARCH_PORT) throws Exception{
				
		Result[] resultlist = null; //�˻������ ������ �ִ� ����

		//���� OrderBySet ����=====================================================================================================
		kistep_orderbys = kistep_orderBySet(searchSort);
		//���� OrderBySet ����=====================================================================================================

		//���� FilterSet ����=====================================================================================================
		kistep_filterSet = kistep_filterSet(searchStartDate, searchEndDate);
		//���� FilterSet ����=====================================================================================================


		//HRST ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query hrst_m3Query = null; //������ ��� �κ�
		ArrayList whereList_hrst = new ArrayList();
		ArrayList whereList_hrst_where = new ArrayList();
		WhereSet[] hrst_whereSet = null; //�˻����� �˻��� �� �ʵ带 �����ϴµ� �ʿ��� ����
		
		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����
		//SelectSet ����=====================================================================================================
		kistep_selectSet = kistep_selectSet("");
		//SelectSet ����=====================================================================================================
		
		//WhereSet ����=====================================================================================================	
		//����� ��˻�
		/*if (researchQuery.equals("on")) {
			System.out.println(kistepwhereSetStr);
			WhereSet[] old_whereSet = parser.parseWhereSet(kistepwhereSetStr);       
			for(int i = 0; i < old_whereSet.length; i++){
				whereList_hrst.add(old_whereSet[i]);
			}  
			whereList_hrst.add(new WhereSet(Protocol.WhereSet.OP_AND)); //���������� ����������  and�� �˻�
			
		}*/
		whereList_hrst_where = kistep_whereSet(allsearchQuery, "", searchArea);
		
		for(int w=0; w < whereList_hrst_where.size(); w++ ){
			whereList_hrst.add(whereList_hrst_where.get(w));
		}

		//arraylist ��� where�� whereSet�� ��´�.
		hrst_whereSet = new WhereSet[whereList_hrst.size()];
		for (int i = 0; i < whereList_hrst.size(); i++) {
			hrst_whereSet[i] = (WhereSet) whereList_hrst.get(i);
		}

		hrst_m3Query = new Query(startTag, endTag);
		hrst_m3Query.setOrderby(kistep_orderbys);
		hrst_m3Query.setSelect(kistep_selectSet);
		hrst_m3Query.setWhere(hrst_whereSet); 
		if (kistep_filterSet != null) {
			hrst_m3Query.setFilter(kistep_filterSet);
		}
		hrst_m3Query.setFrom("HRST"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		
		hrst_m3Query.setResult(page_start - 1, (page_start - 1)+ page_size - 1); //������ ���
		hrst_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		hrst_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		hrst_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		hrst_m3Query.setPrintQuery(false); 
		hrst_m3Query.setLoggable(true);
		hrst_m3Query.setDebug(true);  
		hrst_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( hrst_m3Query );
		//System.out.print(queryStr);
		kistepwhereSetStr = parser.whereSetToString(hrst_whereSet);
		//System.out.println("kistepwhereSetStr " +kistepwhereSetStr);
		
		//RSTI ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query rsti_m3Query = null; //������ ��� �κ�
		
		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����
		
		rsti_m3Query = new Query(startTag, endTag);
		rsti_m3Query.setOrderby(kistep_orderbys);
		rsti_m3Query.setSelect(kistep_selectSet);
		rsti_m3Query.setWhere(hrst_whereSet); 
		if (kistep_filterSet != null) {
			rsti_m3Query.setFilter(kistep_filterSet);
		}
		rsti_m3Query.setFrom("RSTI"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		
		rsti_m3Query.setResult(page_start - 1, (page_start - 1)+ page_size - 1); //������ ���
		//rsti_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		rsti_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		rsti_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		rsti_m3Query.setPrintQuery(false); 
		//rsti_m3Query.setLoggable(true);
		rsti_m3Query.setDebug(true);  
		//rsti_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( rsti_m3Query );
		//System.out.print(queryStr);
		
		//RDPS ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query rdps_m3Query = null; //������ ��� �κ�
		
		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����
		
		rdps_m3Query = new Query(startTag, endTag);
		rdps_m3Query.setOrderby(kistep_orderbys);
		rdps_m3Query.setSelect(kistep_selectSet);
		rdps_m3Query.setWhere(hrst_whereSet); 
		if (kistep_filterSet != null) {
			rdps_m3Query.setFilter(kistep_filterSet);
		}
		rdps_m3Query.setFrom("RDPS"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		
		rdps_m3Query.setResult(page_start - 1, (page_start - 1)+ page_size - 1); //������ ���
		//rdps_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		rdps_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		rdps_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		rdps_m3Query.setPrintQuery(false); 
		//rdps_m3Query.setLoggable(true);
		rdps_m3Query.setDebug(true);  
		//rdps_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( rdps_m3Query );
		//System.out.print(queryStr);
		

		//ICST ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query icst_m3Query = null; //������ ��� �κ�
		
		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����
		
		icst_m3Query = new Query(startTag, endTag);
		icst_m3Query.setOrderby(kistep_orderbys);
		icst_m3Query.setSelect(kistep_selectSet);
		icst_m3Query.setWhere(hrst_whereSet); 
		if (kistep_filterSet != null) {
			icst_m3Query.setFilter(kistep_filterSet);
		}
		icst_m3Query.setFrom("ICST"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		
		icst_m3Query.setResult(page_start - 1, (page_start - 1)+ page_size - 1); //������ ���
		//icst_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		icst_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		icst_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		icst_m3Query.setPrintQuery(false); 
		//icst_m3Query.setLoggable(true);
		icst_m3Query.setDebug(true);  
		//icst_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( icst_m3Query );
		//System.out.print(queryStr);
		
		//BIS ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query bis_m3Query = null; //������ ��� �κ�
		
		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����
		
		bis_m3Query = new Query(startTag, endTag);
		bis_m3Query.setOrderby(kistep_orderbys);
		bis_m3Query.setSelect(kistep_selectSet);
		bis_m3Query.setWhere(hrst_whereSet); 
		if (kistep_filterSet != null) {
			bis_m3Query.setFilter(kistep_filterSet);
		}
		bis_m3Query.setFrom("BIS"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		
		bis_m3Query.setResult(page_start - 1, (page_start - 1)+ page_size - 1); //������ ���
		//bis_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		bis_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		bis_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		bis_m3Query.setPrintQuery(false); 
		//bis_m3Query.setLoggable(true);
		bis_m3Query.setDebug(true);  
		//bis_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( bis_m3Query );
		//System.out.print(queryStr);	
	
		//AIM ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query aim_m3Query = null; //������ ��� �κ�
		
		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����
		
		aim_m3Query = new Query(startTag, endTag);
		aim_m3Query.setOrderby(kistep_orderbys);
		aim_m3Query.setSelect(kistep_selectSet);
		aim_m3Query.setWhere(hrst_whereSet); 
		if (kistep_filterSet != null) {
			aim_m3Query.setFilter(kistep_filterSet);
		}
		aim_m3Query.setFrom("AIM"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		
		aim_m3Query.setResult(page_start - 1, (page_start - 1)+ page_size - 1); //������ ���
		//aim_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		aim_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		aim_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		aim_m3Query.setPrintQuery(false); 
		//aim_m3Query.setLoggable(true);
		aim_m3Query.setDebug(true);  
		//aim_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( aim_m3Query );
		//System.out.print(queryStr);	

		//BBS ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query bbs_m3Query = null; //������ ��� �κ�
		
		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����

		//SelectSet ����=====================================================================================================
		bbs_selectSet = kistep_selectSet("bbs");
		//SelectSet ����=====================================================================================================
		
		bbs_m3Query = new Query(startTag, endTag);
		bbs_m3Query.setOrderby(kistep_orderbys);
		bbs_m3Query.setSelect(bbs_selectSet);
		bbs_m3Query.setWhere(hrst_whereSet); 
		if (kistep_filterSet != null) {
			bbs_m3Query.setFilter(kistep_filterSet);
		}
		bbs_m3Query.setFrom("BBS"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		
		bbs_m3Query.setResult(page_start - 1, (page_start - 1)+ page_size - 1); //������ ���
		//bbs_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		bbs_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		bbs_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		bbs_m3Query.setPrintQuery(false); 
		//bbs_m3Query.setLoggable(true);
		bbs_m3Query.setDebug(true);  
		//bbs_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( bbs_m3Query );
		//System.out.print(queryStr);	
		

		//ORGIN ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query orgin_m3Query = null; //������ ��� �κ�
		ArrayList whereList_orgin = new ArrayList();
		ArrayList whereList_orgin_where = new ArrayList();
		WhereSet[] orgin_whereSet = null; //�˻����� �˻��� �� �ʵ带 �����ϴµ� �ʿ��� ����
		
		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����
		//SelectSet ����=====================================================================================================
		orgin_selectSet = kistep_selectSet("orgin");
		//SelectSet ����=====================================================================================================
		
		//WhereSet ����=====================================================================================================	
		//����� ��˻�
		/*if (researchQuery.equals("on")) {
			WhereSet[] old_whereSet = parser.parseWhereSet(orginwhereSetStr);       
			for(int i = 0; i < old_whereSet.length; i++){
				whereList_orgin.add(old_whereSet[i]);
			}  
			whereList_orgin.add(new WhereSet(Protocol.WhereSet.OP_AND)); //���������� ����������  and�� �˻�
			
		}
		*/
		whereList_orgin_where = kistep_whereSet(allsearchQuery, "orgin", searchArea);
		
		for(int w=0; w < whereList_orgin_where.size(); w++ ){
			whereList_orgin.add(whereList_orgin_where.get(w));
		}

		//arraylist ��� where�� whereSet�� ��´�.
		orgin_whereSet = new WhereSet[whereList_orgin.size()];
		for (int i = 0; i < whereList_orgin.size(); i++) {
			orgin_whereSet[i] = (WhereSet) whereList_orgin.get(i);
		}

		
		orgin_m3Query = new Query(startTag, endTag);
		orgin_m3Query.setOrderby(kistep_orderbys);
		orgin_m3Query.setSelect(orgin_selectSet);
		orgin_m3Query.setWhere(orgin_whereSet); 
		if (kistep_filterSet != null) {
			orgin_m3Query.setFilter(kistep_filterSet);
		}
		orgin_m3Query.setFrom("ORGIN"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		
		orgin_m3Query.setResult(page_start - 1, (page_start - 1)+ page_size - 1); //������ ���
		//orgin_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		orgin_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		orgin_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		orgin_m3Query.setPrintQuery(false); 
		//orgin_m3Query.setLoggable(true);
		orgin_m3Query.setDebug(true);  
		//orgin_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( orgin_m3Query );
		//System.out.print(queryStr);
		orginwhereSetStr = parser.whereSetToString(orgin_whereSet);


		//ATTFILE ����   ===========================================================================================================
		//�Ʒ��� ���� ������ �Ѱ��� ���� ��� �׷��������� �����ϴµ� �ʿ��� ����Ÿ�Լ���..
		Query attfile_m3Query = null; //������ ��� �κ�
		ArrayList whereList_attfile = new ArrayList();
		ArrayList whereList_attfile_where = new ArrayList();
		WhereSet[] attfile_whereSet = null; //�˻����� �˻��� �� �ʵ带 �����ϴµ� �ʿ��� ����
		
		// �������� �Ѱ��� ��ɾ� setting 
		//�˻��� ����� ����Ʈ�� ��� ����
		//SelectSet ����=====================================================================================================
		attfile_selectSet = kistep_selectSet("attfile");
		//SelectSet ����=====================================================================================================
		
		//WhereSet ����=====================================================================================================	
		//����� ��˻�
		/*if (researchQuery.equals("on")) {
			WhereSet[] old_whereSet = parser.parseWhereSet(attfilewhereSetStr);       
			for(int i = 0; i < old_whereSet.length; i++){
				whereList_attfile.add(old_whereSet[i]);
			}  
			whereList_attfile.add(new WhereSet(Protocol.WhereSet.OP_AND)); //���������� ����������  and�� �˻�
			
		}*/
		whereList_attfile_where = kistep_whereSet(allsearchQuery, "attfile", searchArea);
		
		for(int w=0; w < whereList_attfile_where.size(); w++ ){
			whereList_attfile.add(whereList_attfile_where.get(w));
		}

		//arraylist ��� where�� whereSet�� ��´�.
		attfile_whereSet = new WhereSet[whereList_attfile.size()];
		for (int i = 0; i < whereList_attfile.size(); i++) {
			attfile_whereSet[i] = (WhereSet) whereList_attfile.get(i);
		}

		
		attfile_m3Query = new Query(startTag, endTag);
		attfile_m3Query.setOrderby(kistep_orderbys);
		attfile_m3Query.setSelect(attfile_selectSet);
		attfile_m3Query.setWhere(attfile_whereSet); 
		if (kistep_filterSet != null) {
			attfile_m3Query.setFilter(kistep_filterSet);
		}
		attfile_m3Query.setFrom("ATTFILE"); // ����� �ݷ��ǿ� ��û�Ѵ�.
		
		attfile_m3Query.setResult(page_start - 1, (page_start - 1)+ page_size - 1); //������ ���
		//attfile_m3Query.setQueryLogger("template"); //�˻��α׸� ����� ����̸� ����
		//�˻��ɼ��� ����-> �˻�ĳ��, �ҿ��, ������ ���
		attfile_m3Query.setSearchOption((byte)(Protocol.SearchOption.CACHE | Protocol.SearchOption.BANNED | Protocol.SearchOption.STOPWORD)); 
		//���Ǿ� /���Ǿ� Ȯ�� ���
		attfile_m3Query.setThesaurusOption((byte)(Protocol.ThesaurusOption.QUASI_SYNONYM | Protocol.ThesaurusOption.EQUIV_SYNONYM)); 
		attfile_m3Query.setPrintQuery(false); 
		//attfile_m3Query.setLoggable(true);
		attfile_m3Query.setDebug(true);  
		//attfile_m3Query.setLogKeyword(searchQuery.toCharArray());

		//queryStr = parser.queryToString( attfile_m3Query );
		//System.out.print(queryStr);
		attfilewhereSetStr = parser.whereSetToString(attfile_whereSet);

		//////�˻� ���� ���� ����////////////////////////////////////////////////////////////////////////////
		QuerySet querySet =  null;

		if(searchArea.equals("orgin") || searchArea.equals("keyword")){
			querySet = new QuerySet(8);
			querySet.addQuery(hrst_m3Query);
			querySet.addQuery(rsti_m3Query);
			querySet.addQuery(rdps_m3Query);
			querySet.addQuery(icst_m3Query);
			querySet.addQuery(bis_m3Query);
			querySet.addQuery(aim_m3Query);
			querySet.addQuery(bbs_m3Query);
			querySet.addQuery(orgin_m3Query);

			kistep_getselectSet = hrst_m3Query.getSelectFields();
			orgin_getselectSet = orgin_m3Query.getSelectFields();
		}else {
			querySet = new QuerySet(9);
			querySet.addQuery(hrst_m3Query);
			querySet.addQuery(rsti_m3Query);
			querySet.addQuery(rdps_m3Query);
			querySet.addQuery(icst_m3Query);
			querySet.addQuery(bis_m3Query);
			querySet.addQuery(aim_m3Query);
			querySet.addQuery(bbs_m3Query);
			querySet.addQuery(orgin_m3Query);
			querySet.addQuery(attfile_m3Query);

			kistep_getselectSet = hrst_m3Query.getSelectFields();
			bbs_getselectSet = bbs_m3Query.getSelectFields();
			orgin_getselectSet = orgin_m3Query.getSelectFields();
			attfile_getselectSet = attfile_m3Query.getSelectFields();
		}


		CommandSearchRequest.setProps(SEARCH_HOST, SEARCH_PORT, 5000, 1, 10); //����ð�,min pool size, max pool size ������
		CommandSearchRequest command = new CommandSearchRequest(SEARCH_HOST, SEARCH_PORT);
		
		if(!searchQuery.equals("")){
			ret = command.request(querySet);
		}

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
<%  request.setCharacterEncoding("utf-8"); %>
<%
	String ImgUrl = "http://pms.ccbrain.co.kr:9093";	

	int PageSize = 0;
    int InPageNumber = 0;
    int page_start = 1;
    int page_size = 3;
	int InreCnt=0;   

	int pagenavi_TotalSize = 0;
	int kistep_TotalSize = 0;

	int hrst_TotalSize = 0;
	int hrst_RealSize = 0;
	int rsti_TotalSize = 0;
	int rsti_RealSize = 0;
	int rdps_TotalSize = 0;
	int rdps_RealSize = 0;
	int icst_TotalSize = 0;
	int icst_RealSize = 0;
	int bis_TotalSize = 0;
	int bis_RealSize = 0;
	int aim_TotalSize = 0;
	int aim_RealSize = 0;
	int orgin_TotalSize = 0;
	int orgin_RealSize = 0;
	int bbs_TotalSize = 0;
	int bbs_RealSize = 0;
	int attfile_TotalSize = 0;
	int attfile_RealSize = 0;

	String NTT_CLS = "";
	String NTT_SJ = "";
	String NTT_CN = "";
	String NTT_ORGIN = "";
	String NTT_URL = "";
	String REG_DATE = "";
	String NTT_ORGIN_PH = "";
	String ORIGNL_FILE_NM = "";
	String ATT_URL = "";
	String ATT_CN = "";
	String BBS_NM = "";

	String searchQuery = "";  //�˻� ������ �˻���
	String allsearchQuery = "";	//��� �˻���
	String searchCategory = "";  //ī�װ� 
	String searchArea = "";		//�˻� ����
	String searchPeriod = "";	//�˻� �Ⱓ
	String searchStartDate = "";	//�˻� �Ⱓ ������
	String searchEndDate = "";	//�˻� �Ⱓ ������
	String searchSort = "";	//����
	String PageNumber              ="";    //������ ��ȣ
	String detailDisplay = "";	//�󼼰˻� ���⿩��
	String researchQuery = "";	//��˻�
	//String kistepwhereSetStr = "";	//���� whereset
	//String orginwhereSetStr = "";	//���� whereset
	//String attfilewhereSetStr = "";	//���� whereset

	searchQuery = nullCheck(request.getParameter("searchQuery"));  
	allsearchQuery = nullCheck(request.getParameter("allsearchQuery"));  
	searchCategory = request.getParameter("searchCategory");    
    if (searchCategory == null || searchCategory == "") {searchCategory = "total";}
	searchArea = request.getParameter("searchArea");    
    if (searchArea == null || searchArea == "") {searchArea = "total";}
	searchPeriod = request.getParameter("searchPeriod");    
    if (searchPeriod == null || searchPeriod == "") {searchPeriod = "total";}
	searchStartDate = nullCheck(request.getParameter("searchStartDate")); 
	searchEndDate = nullCheck(request.getParameter("searchEndDate")); 
	searchSort = request.getParameter("searchSort");    
    if (searchSort == null || searchSort == "") {searchSort = "date";}
	PageNumber = request.getParameter("PageNumber");                //PageNumber���� �޴� �κ�, ���� ������ �⺻�� 1
    if (PageNumber == null || PageNumber == "") {PageNumber = "1";}
	detailDisplay = nullCheck(request.getParameter("detailDisplay")); 
	researchQuery = nullCheck(request.getParameter("researchQuery")); 
	
	kistepwhereSetStr = nullCheck(request.getParameter("kistepwhereSetStr")); 
	kistepwhereSetStr = kistepwhereSetStr.replaceAll("&#39;","'");
	orginwhereSetStr = nullCheck(request.getParameter("orginwhereSetStr")); 
	orginwhereSetStr = orginwhereSetStr.replaceAll("&#39;","'");
	attfilewhereSetStr = nullCheck(request.getParameter("attfilewhereSetStr")); 
	attfilewhereSetStr = attfilewhereSetStr.replaceAll("&#39;","'");
	
		//��� �˻��� ����
	InreCnt =0;
    if(!researchQuery.equals("")){
        if(InreCnt == 0){
            allsearchQuery = allsearchQuery ;   
            InreCnt = 1;
        }                                                                                                             
        if(InreCnt > 0) {
            String[] tempArr = allsearchQuery.split("\\$\\|");
            String tempValue = allsearchQuery;
             for(int j=0; j<tempArr.length; j++){
                if(tempArr[j].equals(researchQuery)){
                
                  if(tempValue.substring(tempValue.lastIndexOf("$|"+researchQuery), tempValue.length()).equals("$|"+researchQuery)){
                      tempValue = tempValue.substring(0, tempValue.length() - (researchQuery.length()+2));
                  }
                }
             }           
            allsearchQuery = tempValue +"$|"+  researchQuery ;
        }
    }else{
        allsearchQuery = searchQuery;
    }
 
	try {
        InPageNumber = Integer.parseInt(PageNumber); //String���� PageSz�� int������ ����
    } catch (Exception e) {
        InPageNumber = 1;
    }

	if(searchCategory.equals("total")){
		page_size = 3;
	}else{
		page_size = 10;
	}

	DecimalFormat formatter = new DecimalFormat("#,##0");       //���� õ���� , ǥ��

	 //���������� ����
    if(!PageNumber.equals("")){
		page_start = 1 + (page_size * (InPageNumber - 1));
	}//String���� PageNumber�� int������ ����

	Result hrst_result = null;   //�˻� ����� �������µ� �ʿ��� ����
	Result rsti_result = null;   //�˻� ����� �������µ� �ʿ��� ����
	Result rdps_result = null;   //�˻� ����� �������µ� �ʿ��� ����
	Result icst_result = null;   //�˻� ����� �������µ� �ʿ��� ����
	Result bis_result = null;   //�˻� ����� �������µ� �ʿ��� ����
	Result aim_result = null;   //�˻� ����� �������µ� �ʿ��� ����
	Result bbs_result = null;   //�˻� ����� �������µ� �ʿ��� ����
	Result orgin_result = null;   //�˻� ����� �������µ� �ʿ��� ����
	Result attfile_result = null;   //�˻� ����� �������µ� �ʿ��� ����

	Result[] kistep_resultlist = null; //�˻������ ������ �ִ� ����

	if(!searchQuery.equals("")){
		
		kistep_resultlist = getSearchResults(searchQuery, allsearchQuery, searchCategory, searchSort, searchArea, searchStartDate, searchEndDate, researchQuery, page_start, page_size, SEARCH_HOST,SEARCH_PORT);
		
		if(ret > 0){
			if(kistep_resultlist[0] != null && kistep_resultlist.length > 1){
				hrst_result = kistep_resultlist[0];
				hrst_TotalSize =  hrst_result.getTotalSize();   // HRST �˻� ���
				hrst_RealSize = hrst_result.getRealSize();      // ���������� ǥ�õǴ� ����

				rsti_result = kistep_resultlist[1];
				rsti_TotalSize =  rsti_result.getTotalSize();   // RSTI �˻� ���
				rsti_RealSize = rsti_result.getRealSize();      // ���������� ǥ�õǴ� ����

				rdps_result = kistep_resultlist[2];
				rdps_TotalSize =  rdps_result.getTotalSize();   // RDPS �˻� ���
				rdps_RealSize = rdps_result.getRealSize();      // ���������� ǥ�õǴ� ����

				icst_result = kistep_resultlist[3];
				icst_TotalSize =  icst_result.getTotalSize();   // ICST �˻� ���
				icst_RealSize = icst_result.getRealSize();      // ���������� ǥ�õǴ� ����

				bis_result = kistep_resultlist[4];
				bis_TotalSize =  bis_result.getTotalSize();   // BIS �˻� ���
				bis_RealSize = bis_result.getRealSize();      // ���������� ǥ�õǴ� ����

				aim_result = kistep_resultlist[5];
				aim_TotalSize =  aim_result.getTotalSize();   // AIM �˻� ���
				aim_RealSize = aim_result.getRealSize();      // ���������� ǥ�õǴ� ����

				bbs_result = kistep_resultlist[6];
				bbs_TotalSize =  bbs_result.getTotalSize();   // �Խ��� �˻� ���
				bbs_RealSize = bbs_result.getRealSize();      // ���������� ǥ�õǴ� ����

				orgin_result = kistep_resultlist[7];
				orgin_TotalSize =  orgin_result.getTotalSize();   // ��ó��� �˻� ���
				orgin_RealSize = orgin_result.getRealSize();      // ���������� ǥ�õǴ� ����

				if(!(searchArea.equals("orgin") || searchArea.equals("keyword"))){
					attfile_result = kistep_resultlist[8];
					attfile_TotalSize =  attfile_result.getTotalSize();   // ÷������ �˻� ���
					attfile_RealSize = attfile_result.getRealSize();      // ���������� ǥ�õǴ� ����
				}

				kistep_TotalSize = hrst_TotalSize + rsti_TotalSize + rdps_TotalSize + icst_TotalSize + bis_TotalSize + aim_TotalSize + bbs_TotalSize + orgin_TotalSize + attfile_TotalSize;
				if(searchCategory.equals("hrst")){
					pagenavi_TotalSize = hrst_TotalSize;
				}else if(searchCategory.equals("rsti")){
					pagenavi_TotalSize = rsti_TotalSize;
				}else if(searchCategory.equals("rdps")){
					pagenavi_TotalSize = rdps_TotalSize;
				}else if(searchCategory.equals("icst")){
					pagenavi_TotalSize = icst_TotalSize;
				}else if(searchCategory.equals("bis")){
					pagenavi_TotalSize = bis_TotalSize;
				}else if(searchCategory.equals("aim")){
					pagenavi_TotalSize = aim_TotalSize;
				}else if(searchCategory.equals("bbs")){
					pagenavi_TotalSize = bbs_TotalSize;
				}else if(searchCategory.equals("orgin")){
					pagenavi_TotalSize = orgin_TotalSize;
				}else if(searchCategory.equals("attfile")){
					pagenavi_TotalSize = attfile_TotalSize;
				}
		   }
		}
	}

%>