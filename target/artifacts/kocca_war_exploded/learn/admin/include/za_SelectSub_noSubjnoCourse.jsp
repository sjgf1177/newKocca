<%   
        int classdepth = conf.getInt("subj.class.depth");
        SelectSubjBean selectSubj = new SelectSubjBean();      
%>

<%//----------------------------------------------------------  UpperClass   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
��з�
<select name = "s_upperclass" onChange = "javascript:whenSelection('change')" class="inputpsearch">
<%    
        ArrayList upperList = selectSubj.getUpperClass(box);
        for(int k = 0; k < upperList.size(); k++) {
            DataBox selectbox = (DataBox)upperList.get(k);  
        %>             
    <option value = "<%= selectbox.getString("d_upperclass")%>" <% if ((box.getString("s_upperclass").equals(selectbox.getString("d_upperclass")))) out.print("selected"); %>>
        <%= selectbox.getString("d_classname")%></option>
<%   }  %>
</select>

<%//----------------------------------------------------------  MiddleClass   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if(classdepth > 1) {
%>
�ߺз�
<select name = "s_middleclass" onChange = "javascript:whenSelection('change')" class="inputpsearch">
<%    
        ArrayList middleList = selectSubj.getMiddleClass(box);
        for(int k = 0; k < middleList.size(); k++) {
            DataBox selectbox = (DataBox)middleList.get(k);  
        %>             
    <option value = "<%= selectbox.getString("d_middleclass")%>" <% if ((box.getString("s_middleclass").equals(selectbox.getString("d_middleclass")))) out.print("selected"); %>>
        <%= selectbox.getString("d_classname")%></option>
<%   }  %>
</select>

<%//----------------------------------------------------------  LowerClass   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    }
    if(classdepth > 2) {
%>
�Һз�
<select name = "s_lowerclass" onChange = "javascript:whenSelection('change')" class="inputpsearch">
<%    
        ArrayList lowerList = selectSubj.getLowerClass(box);
        for(int k = 0; k < lowerList.size(); k++) {
            DataBox selectbox = (DataBox)lowerList.get(k);  
        %>             
    <option value = "<%= selectbox.getString("d_lowerclass")%>" <% if ((box.getString("s_lowerclass").equals(selectbox.getString("d_lowerclass")))) out.print("selected"); %>>
        <%= selectbox.getString("d_classname")%></option>
<%   }  %>
</select>
<%
    }    
    //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%>
