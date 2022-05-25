<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_process      = box.getStringDefault("p_process","gomsmemberPop");
    String  v_cmuno      = box.getString("p_cmuno");//������ ������������ ������ ������.
    String  v_brd_fg      = box.getStringDefault("p_brd_fg","2");//�ڷ���� ����Ʈ���Ѵ�.

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_grcode     = box.getSession("tem_grcode");
    String  s_grtype     = GetCodenm.get_grtype(box,s_grcode);



    ArrayList gradeList  = (ArrayList)request.getAttribute("gradeList");


    String   v_scriptAry="";
    ArrayList list  = (ArrayList)request.getAttribute("list");
    
    if(list.size() != 0 ) {
        for (int i=0;i<list.size();i++){
            DataBox dbox = (DataBox)list.get(i);
            String v_for_directory_fg    =dbox.getString("d_directory_fg");
            String v_tmpdir        ="false";
    
            int v_subcnt =0;
            for (int j=0;j<list.size();j++){
                 DataBox dbox1 = (DataBox)list.get(j);
                 if(dbox1.getString("d_parent").equals(dbox.getString("d_menuno"))){
                    if(dbox.getInt("d_lv")<dbox1.getInt("d_lv")){
                       v_subcnt++;
                    }
                 }
            }
    
            if ("directory".equals(v_for_directory_fg))v_tmpdir="true";
            v_scriptAry += "addMemory( "+v_tmpdir
                          +"          ,"+dbox.getString("d_menuno")
                          +"          , 'MAIN'"            
                          +"          , '"+dbox.getString("d_title")+"'"
                          +"          , '"+dbox.getString("d_read_cd")+"'"
                          +"          , '"+dbox.getString("d_write_cd")+"'"
                          +"          , '"+dbox.getString("d_arrange")+"'"
                          +"          , '"+dbox.getString("d_fileadd_fg")+"'"
                          +"          , '"+dbox.getString("d_filecnt")+"'"
                          +"          , '"+dbox.getString("d_directory_fg")+"'"
                          +"          , '"+dbox.getString("d_directory_memo")+"'"
                          +"          , '"+dbox.getString("d_brd_fg")+"'"
                          +"          , '"+dbox.getString("d_brd_nm")+"'"
                          +"          , '"+dbox.getString("d_root")+"'"
                          +"          , '"+dbox.getString("d_parent")+"'"
                          +"          , '"+(dbox.getInt("d_lv")-1)+"'"
                          +"          , '"+dbox.getString("d_position")+"'"
                          +"          , '"+dbox.getString("d_limit_list")+"'"
                          +"          ,"+v_subcnt
                          +" ); \n";
        }   
    } else {
        
    }
%>  

<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
   var IMG_PATH = "/images/community/tree/";
   var EXT_PATH = "/images/community/tree/ext/";
   var IMG_WIDTH   = "21";
   var IMG_HEIGHT  = "19";

   var BLANK       = "BLANK.gif";
   var BLANK_LINE  = "BLANK_LINE.gif";
   var CLOSE       = "CLOSE.gif";
   var CLOSE_END   = "CLOSE_END.gif";
   var DIR         = "DIR.gif";
   var DIR_OPEN    = "DIR_OPEN.gif";
   var OPEN        = "OPEN.gif";
   var OPEN_END    = "OPEN_END.gif";
   var NODE        = "PAPER.gif";

   var MEMORY     = new Array();
   var ITEM       = new Array();
   var LEVEL      = new Array();
   var IS_FIRST   = true;
   var PREV_LEVEL = 1;


   function initTree(){
     if ( IS_FIRST ){
        <%=v_scriptAry%>
        IS_FIRST = false;
     }
     PREV_LEVEL = 0;
     LEVEL    = new Array();
     ITEM     = new Array();
     ITEM     = extractItem();
     var text = makeTree();
     document.getElementById("TREE").innerHTML = text;
   }

    //dir           :���丮����[true/false] 
    //menuno        :�۹�ȣ
    //target        :���������
    //directory_fg  :���丮����
    //brd_fg        :�ڷ�Ǳ���
    //root          :ROOT��ȣ
    //parent        :�����۹�ȣ
    //positionb     :������ġ
    //titile        :������
    function addMemory( dir , menuno , target , desc , read_cd,write_cd,arrange,fileadd_fg,filecnt,directory_fg
                       ,directory_memo,brd_fg, brd_nm,root,parent,level,position,limit_list,subcnt){
       var index = MEMORY.length;
       MEMORY[index] = new Object;
       MEMORY[index].dir            = dir;
       MEMORY[index].menuno         = menuno;
       MEMORY[index].target         = target;
       MEMORY[index].desc   = desc;
       MEMORY[index].read_cd        = read_cd       ;
       MEMORY[index].write_cd       = write_cd      ;
       MEMORY[index].arrange        = arrange       ;
       MEMORY[index].fileadd_fg     = fileadd_fg    ;
       MEMORY[index].filecnt        = filecnt       ;
       MEMORY[index].directory_fg   = directory_fg  ;
       MEMORY[index].directory_memo = directory_memo;
       MEMORY[index].brd_fg         = brd_fg        ;
       MEMORY[index].brd_nm         = brd_nm        ;
       MEMORY[index].root           = root          ;
       MEMORY[index].parent         = parent        ;
       MEMORY[index].level          = level;
       MEMORY[index].position       = position;
       MEMORY[index].limit_list      = limit_list;
       MEMORY[index].subcnt      = subcnt;
       if( MEMORY[index].dir == false )
            MEMORY[index].open = true;
       else
            MEMORY[index].open = false;

   }
  // ������� �ϴ� Item ����
  function extractItem(){
    var buff            = new Array();
    var close_top_level = null;
    for (var i = 0 ; i < MEMORY.length ; i++ ){
       if (close_top_level == null ){
          if (MEMORY[i].open == false ){
             var cnt   = buff.length;
             buff[cnt] = MEMORY[i];
             buff[cnt].index = i;
             close_top_level = MEMORY[i].level;
          }  else {
             var cnt = buff.length;
             buff[cnt] = MEMORY[i];
             buff[cnt].index = i;
          }
       } else if (close_top_level < MEMORY[i].level ){
                 continue;
       } else if (close_top_level >= MEMORY[i].level ){
                 var cnt = buff.length;
                 buff[cnt] = MEMORY[i];
                 buff[cnt].index = i;
                 if (MEMORY[i].open == false ){
                     close_top_level = MEMORY[i].level;
                 } else {
                    close_top_level = null;
                    continue;
                 }
       }
    }
    return buff;
  }

    
    // HTML ����
    function makeTree() {
        var tempBrdFg   = "";
        var text        = "";

        text +="<div class=\"menu_box\">";
        for (var i = 0 ; i < ITEM.length ; i++ ){
            if (true ){
                if(ITEM[i].brd_fg != tempBrdFg) {
                    text +="    <dl>";
                    text +="        <dt><A href=\"JavaScript:mainClick('"+ITEM[i].brd_fg+"');\"><span id='div_brdnm"+ITEM[i].brd_fg+"'>"+ITEM[i].brd_nm+"</span></a></dt>"
                    text +="        <div id = 'BOARD_"+ITEM[i].brd_fg+"' style='display:none;'>";
                }
                
                tempBrdFg = ITEM[i].brd_fg;
                  
                if(ITEM[i+1] == null || ITEM[i+1].brd_fg != tempBrdFg) {
                	text +="        <dd class=\"end\"><A href=\"javascript:uf_MoveCode('"+ITEM[i].menuno+"','"+ITEM[i].desc+"','"+ITEM[i].read_cd+"','"+ITEM[i].write_cd+"','"+ITEM[i].arrange+"','"+ITEM[i].fileadd_fg+"','"+ITEM[i].filecnt+"','"+ITEM[i].directory_fg+"','"+ITEM[i].directory_memo+"','"+ITEM[i].brd_fg+"','"+ITEM[i].root+"','"+ITEM[i].parent+"','"+ITEM[i].level+"','"+ITEM[i].position+"','"+ITEM[i].limit_list+"',"+ITEM[i].subcnt+", "+i+");\"><span id='subMenu'>"+ITEM[i].desc+"</span></A></dd>";
                	text += "</div>";
                	text += "</dl>";
                } else {
                	text +="        <dd><A href=\"javascript:uf_MoveCode('"+ITEM[i].menuno+"','"+ITEM[i].desc+"','"+ITEM[i].read_cd+"','"+ITEM[i].write_cd+"','"+ITEM[i].arrange+"','"+ITEM[i].fileadd_fg+"','"+ITEM[i].filecnt+"','"+ITEM[i].directory_fg+"','"+ITEM[i].directory_memo+"','"+ITEM[i].brd_fg+"','"+ITEM[i].root+"','"+ITEM[i].parent+"','"+ITEM[i].level+"','"+ITEM[i].position+"','"+ITEM[i].limit_list+"',"+ITEM[i].subcnt+", "+i+");\"><span id='subMenu'>"+ITEM[i].desc+"</span></A></dd>";
                }
            }
        }
        text +="</div>";
        return text;
    }

    function mainClick(brdFg){
        var divObj  = document.getElementById("BOARD_"+brdFg);

        if(divObj.style.display == "none") {
            divObj.style.display = "block"
        } else {
            divObj.style.display = "none"
        }

        document.form1.p_brd_fg.value = brdFg;

        ClickMain(brdFg);
    }

    function ClickMain(brdFg) {
        var objGubun;

        if(brdFg == 1 ) {
            var divBrdnm1    = document.getElementById("div_brdnm1");
            var divBrdnm2    = document.getElementById("div_brdnm2");
            divBrdnm1.style.fontWeight = "bold";
            if(divBrdnm2 != null) divBrdnm2.style.fontWeight = "";
        } else if(brdFg == 2 ) {
            var divBrdnm1    = document.getElementById("div_brdnm1");
            var divBrdnm2    = document.getElementById("div_brdnm2");
            if(divBrdnm1 != null) divBrdnm1.style.fontWeight = "";
            divBrdnm2.style.fontWeight = "bold";
        } 
            var menuAry     = document.getElementsByName("subMenu");
            var aryLen      = menuAry.length;

            for(var i = 0 ; i < aryLen ; i++){
                    menuAry[i].style.fontWeight = "";
        }

            document.form1.p_menuno.value='';
            document.form1.p_title.value='';
            document.form1.p_directory_fg.value='';
            document.form1.p_fileadd_fg.checked=true;
            document.form1.p_filecnt.value=0;
            document.form1.p_root.value='';
            document.form1.p_parent.value='';
            document.form1.p_lv.value=0;
            document.form1.p_position.value=0;
            document.form1.p_limit_list.value='';
            document.form1.p_search_fg.value="N";    
             document.form1.p_subcnt.value=0;    
             MEMORY = new Array();
             IS_FIRST = true;
            
    }

    function ClickSub(brdFg, idx) {
        var objGubun;

        if(brdFg == 1 ) {
            var divBrdnm1    = document.getElementById("div_brdnm1");
            var divBrdnm2    = document.getElementById("div_brdnm2");
            divBrdnm1.style.fontWeight = "bold";
            if(divBrdnm2 != null) divBrdnm2.style.fontWeight = "";
        } else if(brdFg == 2 ) {
            var divBrdnm1    = document.getElementById("div_brdnm1");
            var divBrdnm2    = document.getElementById("div_brdnm2");
            if(divBrdnm1 != null) divBrdnm1.style.fontWeight = "";
            divBrdnm2.style.fontWeight = "bold";
        } 

        if(idx != null) {
            var menuAry     = document.getElementsByName("subMenu");
            var aryLen      = menuAry.length;

            for(var i = 0 ; i < aryLen ; i++){
                if(i==idx){
                    menuAry[i].style.fontWeight = "bold";
                } else {
                    menuAry[i].style.fontWeight = "";
                }
            }
        }
    }
    
function fst(){

  alert('dd');
}  
    // BLANK/LINE_BLANK �̹��� ����
    function getBlankImage(index){
       var temp = "";
       var image = "";
       if( PREV_LEVEL > ITEM[index].level ) delLEVEL(ITEM[index].level);
       for (var i = 0 ; i < ITEM[index].level ; i++ ) {
           if (LEVEL[i] != null ) {
              if (LEVEL[i] == true ) {
                 image = BLANK_LINE;
              } else {
                 image = BLANK;
              }
          } else {
            if (isLine(index , i)  ){
                image = BLANK_LINE;
                LEVEL[i] = true;
            } else {
                image = BLANK;
                LEVEL[i] = false;
           }
         }
         temp += "<IMG border=0 src=" + IMG_PATH + image + " width=" + IMG_WIDTH + " height=" + IMG_HEIGHT + ">";
       }
       PREV_LEVEL = ITEM[index].level
       return temp;
    }

    // LEVEL �� ����Ȯ�� �� ����.
    function delLEVEL(present_level){
       if (LEVEL != null ){
          for (var i = 0 ; i < LEVEL.length ; i++ ){
               if( i < present_level ) continue;
               LEVEL[i] = null;
          }
       }
    }

    // OPEN/CLOSE �̹��� ����.
    function getLinkerImage(index){
       var temp = "";
       var image = "";
       if (ITEM[index].open == false ){
          image = CLOSE;
       } else {
          image = OPEN;
       }

       if (ITEM[index].dir == true ){
          temp += "<A href='JavaScript:toggle(" + ITEM[index].index + ");'>"
       }
       if (isEndNode(index) ){
          if (ITEM[index].open == false ){
             temp += "<IMG border=0 src=" + IMG_PATH + CLOSE + " alt=���� width=" + IMG_WIDTH + " height=" + IMG_HEIGHT + ">";
          } else {
             temp += "<IMG border=0 src=" + IMG_PATH + OPEN  + " alt=�ݱ� width=" + IMG_WIDTH + " height=" + IMG_HEIGHT + ">";
          }
       } else {
         if (ITEM[index].open == false ){
             temp += "<IMG border=0 src=" + IMG_PATH + CLOSE_END + " alt=���� width=" + IMG_WIDTH + " height=" + IMG_HEIGHT + ">";
         } else {
             temp += "<IMG border=0 src=" + IMG_PATH + OPEN_END  + " alt=�ݱ� width=" + IMG_WIDTH + " height=" + IMG_HEIGHT + ">";
         }
       }
       if( ITEM[index].dir == true ) temp += "</A>"
       return temp;
    }


    // ���丮 �̹��� ����
    function getDirImage(index){
       var temp = "";
       if( ITEM[index].dir == true ){
          temp += "<A href='JavaScript:toggle(" + ITEM[index].index + ");'>"
       }

       if (ITEM[index].dir == true ){
          if (ITEM[index].open == true ){
              temp += "<IMG border=0 src=" + IMG_PATH + DIR_OPEN + " width=" + IMG_WIDTH + " height=" + IMG_HEIGHT + ">";
          } else {
              temp += "<IMG border=0 src=" + IMG_PATH + DIR + " width=" + IMG_WIDTH + " height=" + IMG_HEIGHT + ">";
          }
       } else {
          if (ITEM[index].ext_image == null ){
              temp += "<IMG border=0 src=" + IMG_PATH + NODE + " width=" + IMG_WIDTH + " height=" + IMG_HEIGHT + ">";
          } else {
              temp += "<IMG border=0 src=" + IMG_PATH + NODE + " width=" + IMG_WIDTH + " height=" + IMG_HEIGHT + ">";
          }
       }
       if( ITEM[index].dir == true ) temp += "</A>"
       return temp;
    }

    // ������ ������� üũ.
    function isEndNode(index){
       var result = false;
       for (var i = (index + 1) ; i < ITEM.length ; i++ ){
           if (ITEM[i].level == ITEM[index].level ){
               result = true;
               break;
           } else if (ITEM[i].level < ITEM[index].level ) {
               result = false;
               break;
           }
       }
       return result;
    }

    // ���� �̹��� Drawing ���� üũ.
    function isLine(index, level){
       var result = false;

       for (var i = index ; i < ITEM.length ; i++ ){
           if (ITEM[i].level < level ){
               result = false;
               break;
           }else if( ITEM[i].level == level ) {
               result = true;
               break;
           }
       }
       return result;
    }


   function uf_MoveCode(menuno,desc , read_cd,write_cd,arrange,fileadd_fg,filecnt,directory_fg
                       ,directory_memo,brd_fg,root,parent,level,position,limit_list,subcnt, idx){
    document.form1.p_menuno.value=menuno;
    document.form1.p_title.value=desc;
    document.form1.p_read_cd.value=read_cd;
    document.form1.p_write_cd.value=write_cd;
    document.form1.p_arrange.value=arrange;

    document.form1.p_fileadd_fg.checked=true;
    document.form1.p_filecnt.value=filecnt;
    document.form1.p_directory_fg.value=directory_fg;
    document.form1.p_brd_fg.value=brd_fg;
    document.form1.p_root.value=root;
    document.form1.p_parent.value=parent;
    document.form1.p_lv.value=eval(level)+1;
    document.form1.p_position.value=position;
    document.form1.p_limit_list.value=limit_list;
    document.form1.p_search_fg.value="Y";
     document.form1.p_subcnt.value=subcnt;

     ClickSub(brd_fg, idx);

  }


   function setInit(){
    document.form1.p_menuno.value='';
    document.form1.p_title.value='';

    document.form1.p_fileadd_fg.checked=true;
    document.form1.p_filecnt.value=0;
    document.form1.p_root.value='';
    document.form1.p_parent.value='';
    document.form1.p_lv.value=0;
    document.form1.p_position.value=0;
    document.form1.p_limit_list.value='';
    document.form1.p_search_fg.value="N";    
     document.form1.p_subcnt.value=0;    
     MEMORY = new Array();
     IS_FIRST = true;
     initTree();
   }

   function toggle( index ){
     if ( MEMORY[index].open == false ){
          MEMORY[index].open = true;
     } else{
          MEMORY[index].open = false;
     }
     initTree();
   }

function uf_updateOK() {
    if(document.form1.p_search_fg.value =='N'){
       alert('��ȸ�� ����Ǿ���մϴ�.');return;
    }

    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "updatemenuData";
    document.form1.submit();
}

function uf_deleteOK() {
    if(document.form1.p_search_fg.value =='N'){
       alert('��ȸ�� ����Ǿ���մϴ�.');return;
    }
    if(document.form1.p_subcnt.value >0){
       alert('���� ���� ������ ����Ǿ���մϴ�.');document.form1.p_ins_title.focus();return;  
    }
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "deletemenuData";
    document.form1.submit();
}

function uf_addOK() {
    //if(document.form1.p_directory_fg.value =='file'){
    //   alert('���̻� ����޴��� �߰��Ҽ� �����ϴ�.');return;
    //}
    
    if(document.form1.p_selBrdFg.value == "") {
        alert('�Խ��� �з��� �����ϼ���');
        document.form1.p_selBrdFg.focus();
        return;
    }

    document.form1.p_brd_fg.value = document.form1.p_selBrdFg[document.form1.p_selBrdFg.selectedIndex].value;

    if(document.form1.p_ins_title.value ==''){
       alert('��Ī�� �Է��Ͽ����մϴ�.');document.form1.p_ins_title.focus();return;
    }
    if(document.form1.p_dupchk.value =='N'){
       alert('Ŀ�´�Ƽ �ߺ�üũ�� �Ͽ����մϴ�.');document.form1.p_ins_title.focus();return;
    }
    if(document.form1.p_dupchk.value =='N'){
       alert('Ŀ�´�Ƽ �ߺ�üũ�� �Ͽ����մϴ�.');document.form1.p_ins_title.focus();return;
    }

    
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "insertmenuData";
    document.form1.submit();
}
function uf_tabOK(p_brd_fg) {
    document.form1.p_brd_fg.value=p_brd_fg;
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movemenuPage";
    document.form1.submit();
}


function uf_listOK() {
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "selectmsmainPage";
    document.form1.submit();
}

function uf_dupcheck() {
    var menuType = document.getElementById("p_selBrdFg");

    if(menuType.value == "") {
        alert('�޴�Ÿ���� �����ϼ���.');
        menuType.focus();
        return;
    }
        
	
    if(document.form1.p_ins_title.value ==''){
       alert('��Ī�� �Է��Ͽ����մϴ�.');document.form1.p_ins_title.focus();return;
    }
   open_window('cmuDupCheck', '/servlet/controller.community.CommunityPopUpServlet?p_process=boarddupchkPage&p_cmuno='+document.form1.p_cmuno.value+'&p_title='+document.form1.p_ins_title.value+'&p_brd_fg='+menuType.value, 100, 100, 490, 300, 'no', 'no', 'no', 'no', 'no');
  
}
function uf_msPopMember() {
   open_window('msPopMember', '/servlet/controller.community.CommunityPopUpServlet?p_process=menumemPage&p_static_cmuno=<%=v_cmuno%>&p_cmuno=<%=v_cmuno%>&p_cbxflag=Y', 100, 100, 750, 480, 'no', 'no', 'no', 'no', 'no');
  
}

function uf_authorityOK() {
document.form1.p_limit_list.value='';
}

window.onload = function () {
	initTree();
}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"    method = "post">
<input type = "hidden" name = "p_process"           value="">
<input type = "hidden" name = "p_userid"            value = "">
<input type = "hidden" name = "p_cmuno"             value = "<%=v_cmuno%>">
<input type = "hidden" name = "p_brd_fg"            value = "">
<input type = "hidden" name = "p_root"          value = "">
<input type = "hidden" name = "p_parent"        value = "">
<input type = "hidden" name = "p_lv"            value = "">
<input type = "hidden" name = "p_position"      value = "">
<input type = "hidden" name = "p_directory_fg"      value = "">
<input type = "hidden" name = "p_menuno"            value = "">
<input type = "hidden" name = "p_search_fg"            value = "N">
<input type = "hidden" name = "p_subcnt"            value = "0">
<input type = "hidden" name = "p_dupchk" value="<%=box.getStringDefault("p_dupchk","N")%>">


            <h1><img src="/images/portal/community/tit_08.gif" alt="�޴�����" /></h1>
            
            <div id="TREE"></div>
            
            <div class="menu_board">
                <p class="mg_b8"><img src="/images/portal/community/stit_08_1.gif" alt="�޴�����" /></p>
                <table class="list">
                <!--[if ie]><colgroup><col width="85px" /><col /></colgroup><![endif]-->
                <colgroup><col width="105px" /><col /></colgroup>
                <thead>
                <tr>
                    <th class="ta_l">��Ī</th>
                    <td class="ta_l in end"><input name="p_title" type="text" class="inbox" style="width:285px;" value="" /></td>
                </tr>
                <tr>
                    <th class="ta_l">���Ѽ���</th>
                    <td class="ta_l in end">
                        �������
                        <select name="p_read_cd" class="mg_r70">
                        <%  
                        for(int i = 0; i < gradeList.size(); i++) {
                            DataBox dbox = (DataBox)gradeList.get(i);
                            if("01".equals(dbox.getString("d_grcode"))) continue;
                        %>
                            <option value="<%=dbox.getString("d_grcode")%>"><%=dbox.getString("d_kor_nm")%></option>
                        <% }%>
                        </select>
                        �б����
                        <select name="p_write_cd">
                        <%  
                        for(int i = 0; i < gradeList.size(); i++) {
                            DataBox dbox = (DataBox)gradeList.get(i);
                            if("01".equals(dbox.getString("d_grcode"))) continue;
                        %>
                            <option value="<%=dbox.getString("d_grcode")%>"><%=dbox.getString("d_kor_nm")%></option>
                        <% }%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th class="ta_l">�����ڵ��</th>
                    <td class="ta_l in end"><textarea name="p_limit_list" class="mg_b3" style="width:270px; height:40px;"></textarea> <a href="javascript:uf_msPopMember();" class="board_btn va_t"><span>ȸ���˻�</span></a> <a href="javascript:uf_authorityOK();" class="board_btn va_t"><span>���ѻ���</span></a></td>
                </tr>
                <tr>
                    <th class="ta_l">����÷�ο���</th>
                    <td class="ta_l in end">
                        <input type=checkbox name=p_fileadd_fg value="Y">
                        <input name="p_filecnt" type="text" class="inbox" size="3" maxlength=3 />������
                    </td>
                </tr>
                <tr>
                    <th class="ta_l">����</th>
                    <td class="ta_l in end">
                        <select name="p_arrange" >
                            <option value="title"       >����</option>
                            <option value="userid"      >�ۼ���</option>
                            <option value="register_dte">�ۼ�����</option>
                            <option value="read_cnt"    >��ȸ��</option>
                        </select> 
                    </td>
                </tr>
                </thead>
                </table>
                
                <p class="btn"><a href="javascript:uf_updateOK();" class="btn_gr"><span>����</span></a> <a href="javascript:uf_deleteOK();" class="btn_gr"><span>����</span></a></p>

                <p class="mg_t20 mg_b8"><img src="/images/portal/community/stit_08_2.gif" alt="�޴��߰�" /></p>
                <table class="list">
                <!--[if ie]><colgroup><col width="85px" /><col /></colgroup><![endif]-->
                <colgroup><col width="105px" /><col /></colgroup>
                <thead>
                <tr>
                    <th class="ta_l">��Ī</th>
                    <td class="ta_l in end"><input name="p_ins_title" type="text" class="inbox fl_l mg_r6" style="width:218px;" onkeyup="javascript:document.form1.p_dupchk.value ='N';"  onkeypress="javascript:fnKeyPressEnter(event, 'uf_dupcheck');"/> <p class="fl_l mg_t1"><a href="javascript:uf_dupcheck();" class="board_btn"><span>�ߺ�Ȯ��</span></a></p></td>
                </tr>
                <tr>
                    <th class="ta_l">���Ѽ���</th>
                    <td class="ta_l in end">
                        �������
                        <select name="p_ins_write_cd" class="mg_r70">
                        <%  
                        for(int i = 0; i < gradeList.size(); i++) {
                            DataBox dbox = (DataBox)gradeList.get(i);
                            if("01".equals(dbox.getString("d_grcode"))) continue;
                        %>
                            <option value="<%=dbox.getString("d_grcode")%>"><%=dbox.getString("d_kor_nm")%></option>
                        <% }%>
                        </select>
                        �б����
                        <select name="p_ins_read_cd">
                        <%  
                        for(int i = 0; i < gradeList.size(); i++) {
                            DataBox dbox = (DataBox)gradeList.get(i);
                            if("01".equals(dbox.getString("d_grcode"))) continue;
                        %>
                            <option value="<%=dbox.getString("d_grcode")%>"><%=dbox.getString("d_kor_nm")%></option>
                        <% }%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th class="ta_l">�޴�Ÿ��</th>
                    <td class="ta_l in end">
                        <select name="p_selBrdFg" id="p_selBrdFg" style="width:100px;">
                            <option value="">--����--</option>
                            <option value="2">�Խ���</option>
                            <option value="1">�ڷ��</option>
                        </select>
                    </td>
                </tr>
                </thead>
                </table>
                
                <input type="hidden" name="p_ins_directory_fg" value="file" />
                
                <p class="list_btn"><a href="javascript:uf_addOK();" class="btn_gr"><span>�߰�</span></a></p>

</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->