<%
    //*** ���ε�ȭ����� �ڵ�  ///////////////////////////////////////
    ArrayList alist = (ArrayList)CodeAdminBean.getUploadCodeName();
    String s_codenmlist = "";
    for(int a=0; a<alist.size(); a++){
       DataBox data  = (DataBox)alist.get(a);
       s_codenmlist+="."+data.getString("d_codenm");
       if(a<alist.size()-1) s_codenmlist+=",";
    }
    //*** ���ε�ȭ����� �ڵ�  ///////////////////////////////////////   
%>

<script language="javascript">  
    //���� Ȯ���� ���͸�
     function limitFile(file)
     {
         var ss_codenmlist = "<%=s_codenmlist%>";
         var extArray = ss_codenmlist.split(",");
         allowSubmit = false;

         while (file.indexOf("\\") != -1)
         {
            file = file.slice(file.indexOf("\\") + 1);
            ext = file.slice(file.indexOf(".")).toLowerCase();
            for (var i = 0; i < extArray.length; i++)
            {
                if (extArray[i] == ext) 
                { 
                    allowSubmit = true; 
                    break; 
                }
            }
        }

        if (!allowSubmit)
        {
            alert("�Է��Ͻ� ������ ���ε� �� �� ���� �����Դϴ�.");
            return false;
        }else{
            return true;
        }
     }
</script>