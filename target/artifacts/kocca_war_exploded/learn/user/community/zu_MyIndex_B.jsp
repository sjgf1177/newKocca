            <p class="visual"><img src="<%=!v_tmp_img_path.equals("") ? "/servlet/controller.library.DownloadServlet?p_savefile="+v_tmp_img_path : "/images/portal/community/community.jpg" %>" width="335px" height="200px"/></p>
        
            <div class="section ri">
                <p class="tit"><img src="/images/portal/community/maintit_1.gif" alt="Ŀ�´�Ƽ �Ұ�" /></p>
                <p class="con"><%=v_tmp_intro %></p>
            </div>

            <div class="fl_l">
            <div class="section le mg_rn">
                <p class="tit"><img src="/images/portal/community/maintit_2.gif" alt="��������" class="tit" /><a href="javascript:uf_moveBrdMenuList(1,0);" class="btn"><img src="/images/portal/btn/btn_more.gif" alt="more" /></a></p>
                <ul>
                <%
                if(listDirectBrd != null && listDirectBrd.size() > 0 ) {
                    for(int i = 0; i < listDirectBrd.size(); i++) {
                	    DataBox dbox = (DataBox)listDirectBrd.get(i);
                %>
                    <li><a href="javascript:uf_viewOK(<%=dbox.getString("d_menuno")%>,<%=dbox.getString("d_brdno")%>);"><%=StringManager.formatTitle(dbox.getString("d_title"), 25)%></a> <span><%=FormatDate.getFormatDate(dbox.getString("d_register_dte"), "yyyy-MM-dd")%></span></li>
                <%  }
                } else {%>
                    <li>��ϵ� ���� �����ϴ�.</li>
                <%} %>    
                </ul>
            </div>

            <div class="cboth section le">
                <p class="tit"><img src="/images/portal/community/maintit_4.gif" alt="�ֱٰԽñ�" class="tit" /><a href="javascript:totalSearch();" class="btn"><img src="/images/portal/btn/btn_more.gif" alt="more" /></a></p>
                <ul>
                <%
                if(listBrd != null && listBrd.size() > 0 ) {
				    for(int i = 0; i < listBrd.size(); i++) {
				          DataBox dbox = (DataBox)listBrd.get(i);
				%>
                    <li><a href="javascript:uf_viewOK(<%=dbox.getString("d_menuno")%>,<%=dbox.getString("d_brdno")%>);"><%=StringManager.formatTitle(dbox.getString("d_title"), 25)%></a> <span><%=FormatDate.getFormatDate(dbox.getString("d_register_dte"), "yyyy-MM-dd")%></span></li>
                <%  }
                } else {%>
                    <li>��ϵ� ���� �����ϴ�.</li>
                <%} %>     
                </ul>
            </div>
            </div>

            
            <div class="fl_r">
            <div class="section ri">
                <p class="tit"><img src="/images/portal/community/maintit_3.gif" alt="��������" class="tit" /><a href="javascript:goPage();" class="btn"><img src="/images/portal/btn/btn_more.gif" alt="more" /></a></p>
                <dl class="qna">
                <% if(masterBox != null) { %>
                    <dt><%=v_need_question%></dt>
                <%      for(int j=0;j<detailList.size();j++){
                            detailBox = (DataBox)detailList.get(j);  %>
                    <dd class="list"><input type="radio" name="p_fieldno<%=v_questno%>a" value="<%=detailBox.getString("d_fieldno")%> <%if(j==1)out.print(" checked");%>"/><%=detailBox.getString("d_field_name")%> </dd>
                <%      }  %>
                    <dd class="btn">
                    <%if(v_apply_cnt==0&&(Long.parseLong(FormatDate.getDate("yyyyMMdd"))>=Long.parseLong(v_fdte)&&Long.parseLong(FormatDate.getDate("yyyyMMdd"))<=Long.parseLong(v_tdte))){%>
                    <a href="javascript:uf_replyData(<%=v_pollno%>,1);" class="btn_gr"><span>��ǥ�ϱ�</span></a>
                    <% } else {%>
                    <a href="javascript:alert('�Ⱓ�� �ƴϰų� �̹� ��ǥ�ϽŻ����Դϴ�');" class="btn_gr"><span>��ǥ�ϱ�</span></a>
                    <% } %>
                    <a href="javascript:uf_resultviewOK('<%=v_pollno %>');" class="btn_gr"><span>�������</span></a>
                    </dd>                
                <%  } else {  %>
                    <dd> �������簡 �����ϴ�.</dd>
                <% } %>
                </dl>
            </div>
            </div>

