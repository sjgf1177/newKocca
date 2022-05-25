/*
 * $Id: ZValue.java,v 1.1 2005/12/13 13:04:44 1111 Exp $
 *
 * Copyright 2004 ZEROUP Co., Ltd. All rights reserved.
 *
 */

/*
 * $Log: ZValue.java,v $
 * Revision 1.1  2005/12/13 13:04:44  1111
 * *** empty log message ***
 *
 * Revision 1.1  2005/12/13 06:52:43  1111
 * *** empty log message ***
 *
 * Revision 1.4  2005/07/20 05:49:00  smurf07
 * *** empty log message ***
 *
 * Revision 1.3  2005/07/15 03:27:09  smurf07
 * *** empty log message ***
 *
 *
 */

package kr.co.unp.util;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ZValue extends ListOrderedMap implements java.io.Serializable {
	/** use serialVersionUID from JDK 1.0.2 for interoperability */
	private static final long serialVersionUID = 5849794470754667710L;

	protected Log log = LogFactory.getLog(this.getClass());

	protected String name = null;

	public ZValue() {
	}

	public ZValue(String name) {
		this.name = name;
	}
	
	public Object getId(){
		return get("id");
	}

	public boolean getBoolean(String s) {
		String s1 = getString(s);
		boolean flag = false;
		try {
			flag = (new Boolean(s1)).booleanValue();
		} catch (Exception exception) {
		}

		return flag;
	}

	public double getDouble(String s) {
		String s1 = removeComma(getString(s));
		if (s1.equals(""))
			return 0.0D;
		double d = 0.0D;
		try {
			d = Double.valueOf(s1).doubleValue();
		} catch (Exception exception) {
			d = 0.0D;
		}

		return d;
	}

	public float getFloat(String s) {
		return (float) getDouble(s);
	}

	public int getInt(String s) {
		double d = getDouble(s);
		return (int) d;
	}

	public int getInt(String s, int initVal) {
		int ret = getInt(s);
		if (ret == 0)
			ret = initVal;
		return ret;
	}

	public long getLong(String s) {
		String s1 = removeComma(getString(s));
		if (s1.equals(""))
			return 0L;
		long l = 0L;
		try {
			l = Long.valueOf(s1).longValue();
		} catch (Exception exception) {
			l = 0L;
		}

		return l;
	}

	public String getString(String s) {
		String s1 = null;
		try {
			Object obj = super.get(s);
			if (obj == null) {
				return "";
			}

			Class<?> class1 = obj.getClass();
			if (class1.isArray()) {
				int i = Array.getLength(obj);
				if (i == 0) {
					s1 = "";
				} else {
					Object obj1 = Array.get(obj, 0);
					if (obj1 == null)
						s1 = "";
					else
						s1 = obj1.toString();
				}
			} else {
				s1 = obj.toString();
			}
		} catch (Exception exception) {
			s1 = "";
		}

		return s1.trim();
	}

	public String getString(String s, String initVal) {
		String result = getString(s);
		if ("".equals(result))
			result = initVal;
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<String> getList(String s) {
		Object obj = super.get(s);
		if(obj instanceof List){
			return (List<String>)obj;
		}
		List<String> al = new ArrayList<String>();
		try {
			Class<?> class1 = obj.getClass();
			if (obj != null) {
				if (class1.isArray()) {
					int i = Array.getLength(obj);
					if (i != 0) {
						for (int j = 0; j < i; j++) {
							Object obj1 = Array.get(obj, j);
							if (obj1 != null){
								al.add(obj1.toString());
							}
						}
					}
				}
				else {
					al.add(obj.toString());
				}
			}
		} catch (Exception exception) {
		}

		return al;
	}

	@SuppressWarnings("unchecked")
	public List<String> getStartWithList(String s){
		List<String> al = new ArrayList<String>();
		Iterator<String> it = keySet().iterator();
		while(it.hasNext()){
			String key = it.next();
			if( key.startsWith(s) ){
				al.add(getString(key));
			}
		}
		return al;
	}

	@Override
	public Object put(Object key, Object value) {
		return super.put(convert2CamelCase((String) key), value);
	}

	public void putObject(Object key, Object value) {
		super.put(key, value);
	}

	public void put(String s, List<?> al) {
		String as[] = new String[al.size()];
		for (int i = 0; i < al.size(); i++) {
			if (al.get(i) != null)
				as[i] = (String) al.get(i);
			else
				as[i] = "";
		}

		super.put(s, as);
	}

	protected static String removeComma(String s) {
		if (s == null)
			return null;
		if (s.indexOf(",") != -1) {
			StringBuffer stringbuffer = new StringBuffer();
			for (int i = 0; i < s.length(); i++) {
				char c = s.charAt(i);
				if (c != ',')
					stringbuffer.append(c);
			}

			return stringbuffer.toString();
		} else {
			return s;
		}
	}

	public void setValue(String s, String s1) {
		super.put(s, s1);
	}

	public void set(String s, String s1) {
		super.put(s, s1);
	}

	public void set(String s, List<?> al) {
		String as[] = new String[al.size()];
		for (int i = 0; i < al.size(); i++) {
			if (al.get(i) != null)
				as[i] = (String) al.get(i);
			else
				as[i] = "";
		}
		put(s, as);
	}

	public String convert2CamelCase(String underScore) {
		if (underScore == null)
			return "";
		if (underScore.indexOf('_') < 0 && Character.isLowerCase(underScore.charAt(0)))
			return underScore;
		StringBuilder result = new StringBuilder();
		boolean nextUpper = false;
		int len = underScore.length();
		for (int i = 0; i < len; i++) {
			char currentChar = underScore.charAt(i);
			if (currentChar == '_') {
				nextUpper = true;
				continue;
			}
			if (nextUpper) {
				result.append(Character.toUpperCase(currentChar));
				nextUpper = false;
			} else {
				result.append(Character.toLowerCase(currentChar));
			}
		}

		return result.toString();
	}

	@SuppressWarnings("unchecked")
	public Map<String, String> getStartWithParam(String s){
		Map<String, String> result = new HashMap<String, String>();
		Iterator<String> it = this.keySet().iterator();
		while(it.hasNext()){
			String key = it.next();
			if( key.startsWith(s) ){
				result.put(key, this.getString(key));
			}
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public String toString() {
		StringBuilder result = new StringBuilder();
		result.append("{");
		Iterator<Object> it = keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			String value = getString(key);
			result.append("(" + key + "," + value + ")");
		}
		result.append("}");
		return result.toString();
	}

	public static void main(String[] args) throws Exception {
		/*
		 * ZValue zvl1 = new ZValue(); zvl1.put("k1", "v11"); zvl1.put("k2",
		 * "v12"); zvl1.put("k3", "v12");
		 *
		 * ZValue zvl2 = new ZValue(); zvl2.put("k1", "v21"); zvl2.put("k2",
		 * "v22"); zvl2.put("k3", "v22");
		 *
		 * ZValue zvl3 = new ZValue(); zvl3.put("k1", "v31"); zvl3.put("k2",
		 * "v32"); zvl3.put("k3", "v32");
		 *
		 * ArrayList list = new ArrayList(); list.add(zvl1); list.add(zvl2);
		 * list.add(zvl3);
		 *
		 * String jsonV = ZValue.getArrayJSONValue(list);
		 * System.out.println(jsonV);
		 */

		ZValue zvl1 = new ZValue();
		zvl1.put("k1", "v11");
		zvl1.put("k2", "v12");
		zvl1.put("k3", "v12");
		zvl1.put("arr", new String[] { "1", "2", "3" });

	}

}