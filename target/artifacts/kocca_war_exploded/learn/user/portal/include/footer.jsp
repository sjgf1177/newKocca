        </div>
<!-- content �� -->
    </div>
    <div id="allmenu" style="display:none;"></div>
</div>
<!--// container -->
<hr />
    <!-- Footer Menu ���� -->
    <%if(mainType.equals("A")){%>
	    <%@ include file="/learn/user/portal/include/newSubFooterA.jsp" %>
    <%}else if(mainType.equals("B")){%>
	    <%@ include file="/learn/user/portal/include/newSubFooterB.jsp" %>
    <%}else{%>
	    <%@ include file="/learn/user/portal/include/footer_include.jsp" %>
    <%}%>
    <!-- Footer Menu ���� -->

</body>
</html> 