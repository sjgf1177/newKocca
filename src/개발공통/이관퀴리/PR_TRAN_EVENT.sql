CREATE OR REPLACE PROCEDURE CKL_TREE.PR_TRAN_EVENT


IS
v_maxNttId NUMBER;
v_maxFileId	NUMBER;
BEGIN
	/* MAX PRG_SN값 구하기 */
    SELECT NVL(MAX(PRG_SN),0) INTO v_maxNttId FROM TN_PROGRAM;
	UPDATE TRAN_TABLESN SET MAX_SN = v_maxNttId WHERE TABLE_NAME = 'TN_PROGRAM';


    SELECT NEXT_ID INTO v_maxFileId FROM TC_CMMNSN WHERE TABLE_NAME = 'TC_COMMNFILE';

	/* 콘텐츠아카데미 - 이벤트  */
    INSERT INTO TN_PROGRAM (
       PRG_SN,
       PRG_SE,
       PRG_NM,
       USE_AT,
       PRG_CN,
       ATCH_FILE_ID,
       REQST_BEGIN_DT,
       REQST_END_DT,
       FRST_REGIST_PNTTM,
       FRST_REGISTER_ID,
       LAST_UPDT_PNTTM,
       LAST_UPDUSR_ID,
       DELETE_AT,
       SITE_SE,
       URL,
       PSNCPA
    )
     SELECT
        v_maxNttId + EI_ID AS PRG_SN,
        '05' AS PRG_SE,
        A.EVENT_NAME,
        'Y' AS USE_AT,
        A.EVENT_CONT,
        DECODE(EVENT_IMG,NULL,NULL,'FILE_' || LPAD(EI_ID+v_maxFileId,15,'0')) AS ATCH_FILE_ID,
        TO_DATE(A.EVENT_SDATE, 'YYYYMMDD') AS REQST_BEGIN_DT,
        TO_DATE(A.EVENT_EDATE, 'YYYYMMDD') AS REQST_END_DT,
        A.REG_DATE AS FRST_REGIST_PNTTM,
        '3' AS FRST_REGISTER_ID,
        A.REG_DATE AS LAST_UPDT_PNTTM,
        '3' AS LAST_UPDUSR_ID,
        0 AS DELETE_AT,
        'edu' AS SITE_SE,
        A.EVENT_JOIN_URL AS URL,
        EI_ID AS PSNCPA
    FROM EVENT_INFO A
    ORDER BY A.REG_DATE ASC;



    INSERT INTO TC_COMMNFILE (
       ATCH_FILE_ID,
       FRST_REGIST_PNTTM,
       USE_AT
    )
    SELECT
    	ATCH_FILE_ID,
        SYSDATE AS TODAY,
        'Y'
    FROM TN_PROGRAM
    WHERE DECODE(PSNCPA,NULL,0,1) = 1
    AND DECODE(ATCH_FILE_ID,NULL,0,1) = 1
    AND PRG_SE = '05';



    INSERT INTO TC_COMMNFILE_DETAIL (
    	ATCH_FILE_ID,
        FILE_SN,
        FILE_STRE_COURS,
        STRE_FILE_NM,
        ORIGNL_FILE_NM,
        FILE_EXTSN,
        FILE_MG,
        FILE_CN,
        FILE_FIELD_NM
    )
    SELECT
    	A.ATCH_FILE_ID,
        '1',
        '/upload/culture/event/',
		B.EVENT_IMG,
        B.EVENT_IMG,
    	SUBSTR(B.EVENT_IMG, INSTR(B.EVENT_IMG, '.', -1) + 1) AS FILE_EXTSN,
        0,
        NULL,
        'file_1'
    FROM TN_PROGRAM A, EVENT_INFO B
    WHERE A.PSNCPA = B.EI_ID
    AND B.EVENT_IMG IS NOT NULL
    AND A.PRG_SE = '05';

    UPDATE TC_CMMNSN SET NEXT_ID = (SELECT TO_NUMBER(NVL(REPLACE(MAX(ATCH_FILE_ID),'FILE_'),0))+1 FROM TC_COMMNFILE) WHERE TABLE_NAME = 'TC_COMMNFILE';

    UPDATE TN_PROGRAM SET
    	PSNCPA = NULL
    WHERE DECODE(PSNCPA,NULL,0,1) = 1
    AND PRG_SE = '05';

END PR_TRAN_EVENT;

