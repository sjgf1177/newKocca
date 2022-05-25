import java.awt.*;
import java.io.*;
import java.net.*;
import javax.swing.*;
import javax.swing.event.*;
import java.util.*;

public class JTableApplet extends JApplet{	
	String serverUrl;
	String servletUrl;
	String[][] tabledata;
	URL url;
	URLConnection conn;
	ObjectOutputStream objout;
	ObjectInputStream objin;
	
	public void init(){
		serverUrl = "http://"+getDocumentBase().getHost();
		servletUrl = "/servlet/com.credu.scorm.getTableValue";
		
		serverUrl = serverUrl + servletUrl;
		
	//	System.out.println("local 111 server url:"+serverUrl);
		try{
			url = new URL(serverUrl);
			conn=url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			conn.setRequestProperty("Content-type","application/octet-stream");
			
						
			String filename = this.getParameter("filename");
			String course_code = this.getParameter("course_code");
			
			if(filename!=null ){
				if(!((filename.trim()).equals("null")) && !(filename.trim().equals(""))){									
					objout= new ObjectOutputStream(conn.getOutputStream());
					objout.writeObject(filename+":"+course_code);
					objout.close();
				
					objin = new ObjectInputStream(conn.getInputStream());									
					tabledata = (String[][])objin.readObject();
					objin.close();
				}
			}	
			
		}catch(Exception e){
			e.printStackTrace();
		}			
		

		String[][] data={{"","","","","","","",""},{"","","","","","","",""}};
		
		boolean exit_bl = true;
		if(tabledata == null){
			exit_bl = false;			
		}else{
			//System.out.println("table�� �����Ͱ� �ִ�.");
			data = new String[tabledata.length][8];
			data = tabledata;	
		}
			
		
		 
		 	
		//Show Table
		Container cp = this.getContentPane();		
		cp.setLayout(new BorderLayout());
		
		String col_names[]={"��������","�ʱ����ϸ�","�����н�","�ִ��н��ð�","�н��ð� �ʰ��̺�Ʈ","�������","����","��Ÿ����Ÿ"};
		
		JTable jtable = new JTable(data,col_names);
		
		cp.add(new JScrollPane(jtable));
		this.setSize(800,150);
		this.setVisible(true);
	}
	
	public void start(){
		
	}	
}