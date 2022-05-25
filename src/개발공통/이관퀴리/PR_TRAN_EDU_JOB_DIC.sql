CREATE OR REPLACE PROCEDURE PR_TRAN_EDU_JOB_DIC
IS
v_maxNttId NUMBER;
v_maxFileId	NUMBER;
BEGIN
	/* MAX NTT_ID�� ���ϱ� */
    --SELECT NVL(MAX(DICARY_SN),0) INTO v_maxNttId FROM TN_JOB_DICARY;

	/* ��������ī���� - ��������  */
    INSERT INTO TN_JOB_DICARY (
		DICARY_SN,
       	CTGRY_SE1,
       	CTGRY_SE2,
       	DICARY_SJ,
       	FRST_REGIST_PNTTM,
       	FRST_REGISTER_ID,
       	LAST_UPDT_PNTTM,
       	LAST_UPDUSR_ID,
       	DELETE_AT
    )
    SELECT
    	JI_ID,
       	SUBSTR(DIV_CODE,0,1),
       	DIV_CODE,
       	JOB_NAME,
       	SYSDATE,
       	NULL,
       	NULL,
       	NULL,
       	'N'
    FROM JOB_INFO
    ORDER BY JI_ID ASC;


	INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '1' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','��������',
            'C','��������',
            'D','��������',
            'F','��������',
            'G','��������',
            'I','��������',
            'J','��������',
            'K','��������'
        ),
        INFO_SEQ_1
    FROM JOB_INFO WHERE INFO_SEQ_1 IS NOT NULL
    ORDER BY JI_ID ASC;

    INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '2' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','��������',
            'C','�غ���',
            'D','��������',
            'F','�غ���',
            'G','��������',
            'I','��������',
            'J','��������',
            'K','��������'
        ),
        INFO_SEQ_2
    FROM JOB_INFO WHERE INFO_SEQ_2 IS NOT NULL
    ORDER BY JI_ID ASC;

    INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '3' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','������ ��������',
            'C','�����а� �ڰ�',
            'D','��������',
            'F','�����а� �ڰ�',
            'G','���ޱ���',
            'I','�������� ���� ������',
            'J','��������',
            'K','��������'
        ),
        INFO_SEQ_3
    FROM JOB_INFO WHERE INFO_SEQ_3 IS NOT NULL
    ORDER BY JI_ID ASC;

    INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '4' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','�ֿ� ������',
            'C','���� �� ���',
            'D','��¸���',
            'F','���� �� ���',
            'G','����Ư��',
            'I','���� �� ���豸��',
            'J','��¸���',
            'K','��¸���'
        ),
        INFO_SEQ_4
    FROM JOB_INFO WHERE INFO_SEQ_4 IS NOT NULL
    ORDER BY JI_ID ASC;

    INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '5' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','�ֿ� ��� �� ����Ʈ����',
            'C','���ڸ� ����',
            'D','�ʿ� ����, �Ʒ�',
            'F','���ڸ� ����',
            'G','�ٽɿ���',
            'I','�ٽɿ���',
            'J','�ʿ� ����, �Ʒ�',
            'K','�ʿ� ����, �Ʒ�'
        ),
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'G',INFO_SEQ_5 || chr(13) || chr(10) || INFO_SEQ_6 || chr(13) || chr(10) || INFO_SEQ_7,
            'I',INFO_SEQ_5 || chr(13) || chr(10) || INFO_SEQ_6 || chr(13) || chr(10) || INFO_SEQ_7,
            INFO_SEQ_5
        )
    FROM JOB_INFO WHERE INFO_SEQ_5 IS NOT NULL
    ORDER BY JI_ID ASC;

    INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '6' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','���� �� ���豸��',
            'C','���ô�ü �� ���',
            'D','��Ÿ',
            'F','���ô�ü �� ���',
            'G','',
            'I','',
            'J','��Ÿ',
            'K','��Ÿ'
        ),
        INFO_SEQ_6
    FROM JOB_INFO WHERE INFO_SEQ_6 IS NOT NULL AND SUBSTR(DIV_CODE,0,1) NOT IN ('G','I')
    ORDER BY JI_ID ASC;

    INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '7' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','����Ư��'
        ),
        INFO_SEQ_7
    FROM JOB_INFO WHERE INFO_SEQ_7 IS NOT NULL AND SUBSTR(DIV_CODE,0,1)  IN ('A')
    ORDER BY JI_ID ASC;

    INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '8' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','�ٽɿ���',
            'G','��Ÿ',
            'I','��°���'
        ),
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A',INFO_SEQ_8 || chr(13) || chr(10) || INFO_SEQ_9 || chr(13) || chr(10) || INFO_SEQ_10,
            INFO_SEQ_8
        )
    FROM JOB_INFO WHERE INFO_SEQ_8 IS NOT NULL AND SUBSTR(DIV_CODE,0,1)  IN ('A','G','I')
    ORDER BY JI_ID ASC;

    INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '11' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','��°���'
        ),
        INFO_SEQ_11
    FROM JOB_INFO WHERE INFO_SEQ_11 IS NOT NULL AND SUBSTR(DIV_CODE,0,1)  IN ('A')
    ORDER BY JI_ID ASC;

    INSERT INTO TN_JOB_DICARY_CN (
    	DICARY_SN, CN_SN, FRST_REGIST_PNTTM, SUB_SJ, SUB_CN
    )
    SELECT
    	 JI_ID, '12' AS CN_SN, SYSDATE,
        DECODE(SUBSTR(DIV_CODE,0,1),
        	'A','��Ÿ �ٹ� �� �����Ȳ'
        ),
        INFO_SEQ_12
    FROM JOB_INFO WHERE INFO_SEQ_12 IS NOT NULL AND SUBSTR(DIV_CODE,0,1)  IN ('A')
    ORDER BY JI_ID ASC;

END PR_TRAN_EDU_JOB_DIC;