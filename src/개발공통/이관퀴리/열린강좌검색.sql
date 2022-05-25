SELECT
	A.SEQ ,   --��ȣ
   	A.LECNM , --����
   	REPLACE(A.VODIMG,'\','/') AS VODIMG,   -- �̹������
   	A.TUTORNM , 		-- �����
   	A.LECTURE_CLS,  -- �з��ڵ�
	DECODE(A.LECTURE_CLS,
    	'GC01','��ۿ���','GC02','����','GC03','��ȭ�ִ�ĳ����','GC04','���ǰ���','GC05','��Ÿ',
        'GC06','������ �λ���Ʈ','GC07','������ Ŭ����','GC08','�޳ݿ�������'
    ) AS LECTURE_CLS_NM,  -- �з���
    TO_DATE(A.LDATE,'YYYYMMDDHH24MISS') AS LDATE,   -- �����
    '500085' AS MENU_NO,
    '��������' AS MENU_NM,
    '/edu/onlineEdu/openLecture/view.do?pSeq' || A.SEQ || '&menuNo=500085'  AS LINK

FROM TZ_GOLDCLASS A ,
TZ_GOLDCLASS_GRMNG B ,
(
	SELECT SEQ,
        RANK() OVER( ORDER BY SUM(CNT) DESC, COUNT(SEQ) DESC, SEQ DESC) AS RNK
   	FROM TZ_VIEWCOUNT
  	WHERE VIEWDATE BETWEEN TO_CHAR(SYSDATE - 7, 'YYYYMMDD') AND TO_CHAR(SYSDATE, 'YYYYMMDD') /*WHERE VIEWDATE BETWEEN ADD_MONTHS(SYSDATE, -1) AND TO_CHAR(SYSDATE, 'YYYYMMDD') */
  	GROUP BY SEQ
) V
 WHERE A.USEYN = 'Y'
 AND B.GRCODE = 'N000001' /* getSession = tem_grcode */
 AND A.SEQ = B.SEQ(+)
 AND A.SEQ = V.SEQ(+)
ORDER BY V.RNK, A.LDATE DESC, A.SEQ DESC