<%@ page contentType = "text/html;charset=MS949" %>
<!----------------- �԰������ȸ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
          <tr>
            <td colspan="14" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title">No</td>
            <td class="table_title"><a href="javascript:whenOrder('grseq')" class="e">��������</a></td>
            <td class="table_title" colspan="2"><a href="javascript:whenOrder('subj')" class="e">����</a></td>
            <td class="table_title" width="4%"><a href="javascript:whenOrder('subjseq')" class="e">����<br>����</a></td>
            <!--td class="table_title"><a href="javascript:whenOrder('isonoff')" class="e">����</td-->
            <td class="table_title">��û�Ⱓ</td>
            <td class="table_title">�����Ⱓ</td>
            <td class="table_title">����</td>
            <td class="table_title">�ѽ�û<BR>�ο�</td>
            <td class="table_title">�������/<BR>�ݷ��ο�</td>
            <td class="table_title">�н�����<BR>�ο�</td>
            <td class="table_title">�н�����<BR>�ο�</td>
            <td class="table_title">�н��Ϸ�<BR>�ο�</td>
          </tr>
<%
if (ss_action.equals("go")) {    //go button ���ýø� list ���
                v_total = list.size();

	if (list.size() != 0 ) {	//������ �ִٸ�

		for(i = 0; i < v_total; i++) {
                    StudentStatusData data  = (StudentStatusData)list.get(i);
                    v_grseq         = data.getGrseq();
                    v_grseqnm       = data.getGrseqnm();
                    v_course        = data.getCourse();
                    v_cyear         = data.getCyear();
                    v_courseseq     = data.getCourseseq();
                    v_coursenm      = data.getCoursenm();
                    v_subj          = data.getSubj();
                    v_year          = data.getYear();
                    v_subjnm        = data.getSubjnm();
                    v_subjseq       = data.getSubjseq();
                    v_subjseqgr     = data.getSubjseqgr();
                    v_propstart     = data.getPropstart();
                    v_propend       = data.getPropend();
                    v_edustart      = data.getEdustart();
                    v_eduend        = data.getEduend();
                    v_studentlimit  = data.getStudentlimit();
                    v_isnewcourse   = data.getIsnewcourse();
                    v_rowspan       = data.getRowspan();
                    v_totalpage     = data.getTotalPageCount();
                    v_rowcount      = data.getRowCount();
                    v_isonoff       = data.getIsonoff();
					v_isbelongcourse = data.getIsbelongcourse();	//��������������
					v_subjcnt = data.getSubjcnt();					//���� ������

                    v_totalstulimit += v_studentlimit;

                    //if(v_isonoff.equals("ON")){     v_isonoff_value="���̹�";   }
                    //else                      {     v_isonoff_value="����";     }

                    v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));
                    if(!v_edustart.equals("")&&v_edustart.length() == 10){v_edustart_value = Integer.parseInt(v_edustart);}
                    if(!v_eduend.equals("")&&v_eduend.length() == 10){v_eduend_value = Integer.parseInt(v_eduend);}

                    v_procnt        = data.getProcnt();
                    v_cancnt        = data.getCancnt();

                    if(v_edustart_value>0&&v_edustart_value>=v_today){          //�н����������� ��Ÿ������������
                    //out.print(v_subjnm);
                    //out.print(v_subjseq);
                        v_proycnt       = data.getProycnt();
                        v_stucnt        = 0;
                        v_comcnt        = 0;
                    }
                    if(v_edustart_value>0&&v_edustart_value<v_today&&v_eduend_value>=v_today){  //�н��������ΰ����� ��Ÿ�������� ����
                        v_proycnt       = 0;
                        v_stucnt        = data.getStucnt();
                        v_comcnt        = 0;
                    }
                    if(v_eduend_value>0&&v_eduend_value<v_today){                                //�н��Ϸ������ ��Ÿ������������
                        v_proycnt       = 0;
                        v_stucnt        = 0;
                        v_comcnt        = data.getComcnt();
                    }

                    v_personcnt     = v_procnt;                        //������û�ο�(��û��+�����)
                    v_totalprocnt=v_totalprocnt+v_personcnt;           //�Ѽ�����û�ο�
                    v_totalcancnt=v_totalcancnt+v_cancnt;              //�Ѽ�������ο�
                    v_totalproycnt=v_totalproycnt+v_proycnt;           //�н������ο�
			        			v_totalstucnt=v_totalstucnt+v_stucnt;              //�н������ο�
			        			v_totalcomcnt=v_totalcomcnt+v_comcnt;              //�н��Ϸ��ο�

                    v_propstart     = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");
                    v_propend       = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");
                    v_edustart      = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
                    v_eduend        = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");
                    

                    if(v_studentlimit == 0) { 
                    	v_studentcnt = "-";
                    } else {
                    	v_studentcnt = String.valueOf(v_studentlimit);
                    }
                    
                    if(v_totalstulimit == 0) {
                    	v_totalcnt = "-";
                    } else {
                    	v_totalcnt = String.valueOf(v_totalstulimit);
                    }

		// �������������ο� ���� �޸� ���
		if(v_isbelongcourse.equals("Y")){		//�����������϶� - ������ course�� �Ͽ� �� �ȿ��� for������ ���� �������
%>
        <tr>
            <td class="table_01"><%= data.getDispnum()%></td>
            <td class="table_02_1" rowspan="<%=v_subjcnt%>"><%=v_grseqnm%></td>
            <td class="table_02_2" rowspan="<%=v_subjcnt%>"><font class="text_color04"><%=v_coursenm%></font></td>
            <td class="table_02_2" ><%=v_subjnm%></td>
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <!--td class="table_02_1"><%//=v_isonoff_value%></td-->
            <td class="table_02_1"><%= v_propstart %>~<%= v_propend %></td>
            <td class="table_02_1"><%= v_edustart %>~<%= v_eduend %></td>
            <td class="table_02_1"><%= v_studentcnt%></td>
            <td class="table_02_1"><%= v_personcnt %></td>
            <td class="table_02_1"><%= v_cancnt %></td>
            <td class="table_02_1"><%= v_proycnt %></td>
            <td class="table_02_1"><%= v_stucnt %></td>
            <td class="table_02_1"><%= v_comcnt %></td>

         </tr>

<% 
				//�������� ���� ������ �����ִ� ������ ���.
				for( int j = 0;  j < (v_subjcnt -1 ); j++ ){
					i++;
				
                    data  = (StudentStatusData)list.get(i);

                    v_grseq         = data.getGrseq();
                    v_grseqnm       = data.getGrseqnm();
                    v_course        = data.getCourse();
                    v_cyear         = data.getCyear();
                    v_courseseq     = data.getCourseseq();
                    v_coursenm      = data.getCoursenm();
                    v_subj          = data.getSubj();
                    v_year          = data.getYear();
                    v_subjnm        = data.getSubjnm();
                    v_subjseq       = data.getSubjseq();
                    v_subjseqgr     = data.getSubjseqgr();
                    v_propstart     = data.getPropstart();
                    v_propend       = data.getPropend();
                    v_edustart      = data.getEdustart();
                    v_eduend        = data.getEduend();
                    v_studentlimit  = data.getStudentlimit();
                    v_isnewcourse   = data.getIsnewcourse();
                    v_rowspan       = data.getRowspan();
                    v_totalpage     = data.getTotalPageCount();
                    v_rowcount      = data.getRowCount();
                    v_isonoff       = data.getIsonoff();
					v_isbelongcourse = data.getIsbelongcourse();	//��������������
					v_subjcnt = data.getSubjcnt();					//���� ������

                    //���� �����Ǵ� �κйݺ�( �ش������ �������� �����ϹǷ� �ӵ����̴¾���) 
					v_totalstulimit += v_studentlimit;

                    if(v_isonoff.equals("ON")){     v_isonoff_value="���̹�";   }
                    else                      {     v_isonoff_value="����";     }

                    v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));
                    if(!v_edustart.equals("")&&v_edustart.length() == 10){v_edustart_value = Integer.parseInt(v_edustart);}
                    if(!v_eduend.equals("")&&v_eduend.length() == 10){v_eduend_value = Integer.parseInt(v_eduend);}

                    v_procnt        = data.getProcnt();
                    v_cancnt        = data.getCancnt();

                    if(v_edustart_value>0&&v_edustart_value>=v_today){          //�н����������� ��Ÿ������������
                    //out.print(v_subjnm);
                    //out.print(v_subjseq);
                        v_proycnt       = data.getProycnt();
                        v_stucnt        = 0;
                        v_comcnt        = 0;
                    }
                    if(v_edustart_value>0&&v_edustart_value<v_today&&v_eduend_value>=v_today){  //�н��������ΰ����� ��Ÿ�������� ����
                        v_proycnt       = 0;
                        v_stucnt        = data.getStucnt();
                        v_comcnt        = 0;
                    }
                    if(v_eduend_value>0&&v_eduend_value<v_today){                                //�н��Ϸ������ ��Ÿ������������
                        v_proycnt       = 0;
                        v_stucnt        = 0;
                        v_comcnt        = data.getComcnt();
                    }

                    v_personcnt     = v_procnt;                        //������û�ο�(��û��+�����)
                    v_totalprocnt=v_totalprocnt+v_personcnt;           //�Ѽ�����û�ο�
                    v_totalcancnt=v_totalcancnt+v_cancnt;              //�Ѽ�������ο�
                    v_totalproycnt=v_totalproycnt+v_proycnt;           //�н������ο�
			        			v_totalstucnt=v_totalstucnt+v_stucnt;              //�н������ο�
			        			v_totalcomcnt=v_totalcomcnt+v_comcnt;              //�н��Ϸ��ο�

                    v_propstart     = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");
                    v_propend       = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");
                    v_edustart      = FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd");
                    v_eduend        = FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd");
                    

                    if(v_studentlimit == 0) {
                    	v_studentcnt = "-";
                    } else {
                    	v_studentcnt = String.valueOf(v_studentlimit);
                    }
                    
                    if(v_totalstulimit == 0) {
                    	v_totalcnt = "-";
                    } else {
                    	v_totalcnt = String.valueOf(v_totalstulimit);
                    }

%>
        <tr>
            <td class="table_01"><%= data.getDispnum()%></td>
            <td class="table_02_2" ><%=v_subjnm%></td>
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <!--td class="table_02_1"><%//=v_isonoff_value%></td-->
            <td class="table_02_1"><%= v_propstart %>~<%= v_propend %></td>
            <td class="table_02_1"><%= v_edustart %>~<%= v_eduend %></td>
            <td class="table_02_1"><%= v_studentcnt%></td>
            <td class="table_02_1"><%= v_personcnt %></td>
            <td class="table_02_1"><%= v_cancnt %></td>
            <td class="table_02_1"><%= v_proycnt %></td>
            <td class="table_02_1"><%= v_stucnt %></td>
            <td class="table_02_1"><%= v_comcnt %></td>

         </tr>

<%
				}
		}else{	// �Ϲݰ����̸�
%>

        <tr>
            <td class="table_01"><%= data.getDispnum() %></td>
            <td class="table_02_1"><%=v_grseqnm%></td>
            <td class="table_02_2"  colspan="2" ><font class="text_color04"><%=v_subjnm%></font></td>
            <td class="table_02_1"><%=StringManager.cutZero(v_subjseqgr)%></td>
            <!--td class="table_02_1"><%//=v_isonoff_value%></td-->
            <td class="table_02_1"><%= v_propstart %>~<%= v_propend %></td>
            <td class="table_02_1"><%= v_edustart %>~<%= v_eduend %></td>
            <td class="table_02_1"><%= v_studentcnt%></td>
            <td class="table_02_1"><%= v_personcnt %></td>
            <td class="table_02_1"><%= v_cancnt %></td>
            <td class="table_02_1"><%= v_proycnt %></td>
            <td class="table_02_1"><%= v_stucnt %></td>
            <td class="table_02_1"><%= v_comcnt %></td>
         </tr>

<%
		}

	}//for��
%>
         <tr>
            <td class="table_02_1" colspan="7">��</td>
            <td class="table_02_1"><%= v_totalcnt %></td>
            <td class="table_02_1"><%= v_totalprocnt %></td>
            <td class="table_02_1"><%= v_totalcancnt %></td>
            <td class="table_02_1"><%= v_totalproycnt %></td>
            <td class="table_02_1"><%= v_totalstucnt %></td>
            <td class="table_02_1"><%=v_totalcomcnt %></td>
         </tr>
<%
	}else{		//������ ���ٸ�

%>
		<tr>
           <td align="center" bgcolor="#F7F7F7" height="50" colspan="17">��ϵ� ������ �����ϴ�</td>
        </tr>
<%
	}

}

%>
	</table>
<!----------------- �԰���� ��ȸ �� ----------------->