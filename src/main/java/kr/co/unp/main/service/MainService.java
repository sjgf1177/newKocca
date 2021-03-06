package kr.co.unp.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import kr.co.unp.cmm.sec.ram.service.impl.UnpUserDetailsHelper;
import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.context.ServletContextAware;

import com.siren24.Base64;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;

import kr.co.unp.bbs.vo.FileVO;
import kr.co.unp.cmm.crud.mvr.ModelAndViewResolver;
import kr.co.unp.cmm.crud.service.DefaultCmmProgramService;
import kr.co.unp.cmm.crud.service.ParameterContext;
import kr.co.unp.cmm.crud.util.MVUtils;
import kr.co.unp.mpm.service.MasterMenuManager;
import kr.co.unp.mpm.vo.MenuManageVO;
import kr.co.unp.ntcn.service.NtcnAlertProgramService;
import kr.co.unp.siteMng.service.SiteMngService;
import kr.co.unp.util.CacheUtil;
import kr.co.unp.util.UnpCollectionUtils;
import kr.co.unp.util.ZValue;

public class MainService extends DefaultCmmProgramService implements ServletContextAware {
	Logger log = Logger.getLogger(this.getClass());

	private final String[] MAIN_BBS_ID = { "B0000011", "B0000017", "B0000041", "B0000042", "B0000044", "B0000050", "B0000023" };
	private final String[] TESTBED_BBS_ID = { "B0000061", "B0000062"};

	public static final String PORTAL_MAIN_CACHE_NAME = "storedMain";

	@Resource(name = "cacheUtil")
	private CacheUtil cacheUtil;

	@Resource(name = "masterMenuManagerService")
	private MasterMenuManager masterMenuManagerService;

	@Resource(name = "siteMngService")
	private SiteMngService siteMngService;

	@Resource(name = "ntcnAlertService")
	private NtcnAlertProgramService ntcnAlertService;

	public void main(ParameterContext<ZValue> paramCtx) throws Exception {
		ZValue param = paramCtx.getParam();
		ModelMap model = paramCtx.getModel();
		
		if (SiteMngService.TESTBED_SITE_NAME.equals(param.getString("siteName"))) {
			for (String bbsId : TESTBED_BBS_ID) { // ???????????????
				int num = 5; // ????????? ??????
				List<ZValue> boardList = getBbs(bbsId, num);
				model.addAttribute(bbsId + "List", boardList);
			}
		}else{
			for (String bbsId : MAIN_BBS_ID) { // ???????????????
				int num = 9; // ????????? ??????
				if ("B0000011".equals(bbsId) ){ //rsg20171212
					num = 20;
				}
				/*
				if ("B0000011".equals(bbsId) && (SiteMngService.EDUMOBILE_SITE_NAME).equals(param.getString("siteName"))) num = 5;
				else if ("B0000011".equals(bbsId)) num = 3;
				*/
				if ("B0000017".equals(bbsId)) num = 5;
				
				List<ZValue> boardList = getBbs(bbsId, num);
				model.addAttribute(bbsId + "List", boardList);
			}
		}

		if (SiteMngService.CKL_SITE_NAME.equals(param.getString("siteName"))) {
			param.put("siteId", SiteMngService.CKL_SITE_ID); // ????????? siteId
		}
		else if (SiteMngService.EDU_SITE_NAME.equals(param.getString("siteName"))) {
			// ???????????? ????????? ?????? ??????
			log.debug("// ???????????? ????????? ?????? ??????");
			List<ZValue> psitnCodeList = sqlDao.listDAO("mentorManageDAO.psitnCodeList", param);
			model.addAttribute("psitnCodeList", psitnCodeList);

			param.put("grcode", "N000001");
			param.put("firstIndex", "0");
			param.put("recordCountPerPage", "12");
			param.put("mainRecordCountPerPage", "6");
			
			// ??????????????? ??????(????????????)
			log.debug("// ??????????????? ??????(????????????)");
			List<ZValue> realmSubjList = lmsSqlDao.listDAO("realmListDAO.realmSubjRandomList", param);
			model.addAttribute("realmSubjList", realmSubjList);
			
			// ??????????????? ??????
			log.debug("// ??????????????? ??????");
			List<ZValue> onlineEduSubjList = lmsSqlDao.listDAO("realmListDAO.realmSubjList", param);
			model.addAttribute("onlineEduSubjList", onlineEduSubjList);

			//????????? ??? 1depth ??????
			log.debug("// ????????? ??? 1depth ??????");
			List<ZValue> realmTabList = lmsSqlDao.listDAO("realmListDAO.realmTabList", param);
			model.addAttribute("realmTabList",realmTabList);

			// ???????????? ??????
			log.debug("// ???????????? ??????");
			List<ZValue> openLectureList = lmsSqlDao.listDAO("openLecture.selectMainList", param);
			model.addAttribute("openLectureList", openLectureList);
			
			//???????????? ??????
			log.debug("// ???????????? ??????");
			List<ZValue> themeList = lmsSqlDao.listDAO("themeListDAO.selectThmeList", param);
			model.addAttribute("themeList", themeList);
			
			//???????????? ?????? ??????
			log.debug("// ???????????? ?????? ??????");
			List<ZValue> offlineEduList = sqlDao.listDAO("progrmMasterDAO.selectOfflineEduList", param);
			model.addAttribute("offlineEduList", offlineEduList);
			 
			//?????????????????? ??????
			log.debug("// ?????????????????? ?????? - ????????????, ???????????? ????????????, ?????????????????? ????????????");
			List<ZValue> eduSuportList = sqlDao.listDAO("optionalBoardDAO.selectEduSuportList", param);
			model.addAttribute("eduSuportList", eduSuportList);

			// ?????? ???????????? ??????(20???)
			log.debug("// ?????? ???????????? ??????");
			List<ZValue> popularityList = lmsSqlDao.listDAO("openLecture.selectPopularityList", param);
			model.addAttribute("popularityList", popularityList);

			// ????????? ??????
			log.debug("// ????????? ??????");
			param.put("tableNm", "TB_BBS_ESTN");
			param.put("bbsId", "B0000048");
			param.put("delcode", "0");
			param.put("bbsTyCode", "BBST03");
			List<ZValue> openEventList = sqlDao.listDAO("optionalBoardDAO.selectBoardArticleList", param);
			model.addAttribute("openEventList", openEventList);

			Map<String, List<FileVO>> fileMap = listHandler.getFileMap(param, openEventList);
			model.addAttribute("fileMap", fileMap);

			param.put("siteId", SiteMngService.EDU_SITE_ID); // ????????? siteId
		}
		else if (SiteMngService.EDUMOBILE_SITE_NAME.equals(param.getString("siteName"))) {
			param.put("siteId", SiteMngService.EDUMOBILE_SITE_ID);
			/*
			 * ??? ????????? ?????????
			
			List<ZValue> mainConcertImgList = sqlDao.listDAO("concertDAO.selectMainDisplayList" , param );
			model.addAttribute("mainConcertImgList", mainConcertImgList );
			
			Map<String, List<FileVO>> fileMap = listHandler.getFileMap(param, mainConcertImgList);
			model.addAttribute("fileMap", fileMap);
			 */
			
			param.put("grcode", "N000001");
			param.put("firstIndex", "0");
			param.put("recordCountPerPage", "12");
			param.put("mainRecordCountPerPage", "6");
			
			//???????????? ?????? ??????
			log.debug("// ???????????? ?????? ??????");
			List<ZValue> offlineEduList = sqlDao.listDAO("progrmMasterDAO.selectOfflineEduList", param);
			model.addAttribute("offlineEduList", offlineEduList);
			 
			//?????????????????? ??????
			log.debug("// ?????????????????? ??????");
			List<ZValue> eduSuportList = sqlDao.listDAO("optionalBoardDAO.selectEduSuportList", param);
			model.addAttribute("eduSuportList", eduSuportList);
		}
		else if (SiteMngService.CKLMOBILE_SITE_NAME.equals(param.getString("siteName"))) {
			param.put("siteId", SiteMngService.CKLMOBILE_SITE_ID);
		}
		else if (SiteMngService.TESTBED_SITE_NAME.equals(param.getString("siteName"))) {
			param.put("siteId", SiteMngService.TESTBED_SITE_ID);
			
			// TODO main ??????????????? ????????? ??????
			List<ZValue> mainConcertImgList = sqlDao.listDAO("concertDAO.selectMainDisplayList" , param );
			model.addAttribute("mainConcertImgList", mainConcertImgList );
			
			Map<String, List<FileVO>> fileMap = listHandler.getFileMap(param, mainConcertImgList);
			model.addAttribute("fileMap", fileMap);
		}

		// ?????????
		param.put("type", "01");
		List<ZValue> mainPopupList = ntcnAlertService.selectPublishList(param);
		model.addAttribute("mainPopupList", mainPopupList);
		
		//????????????
		List<ZValue> noticeList = getRecentNoticeList();
		model.addAttribute("noticeList", noticeList);
		
		// ?????????
		List<ZValue> eventList = getRecentEventList();
		model.addAttribute("eventList", eventList);
		
		// ????????????
		/*ZValue paramEmp = paramCtx.getParam();
		paramEmp.put("queryId", "empmnPblanc.selectEmpmnPblancList");
		paramEmp.put("firstIndex", 0);
		paramEmp.put("recordCountPerPage", 4);
		paramEmp.put("useAt", "Y");
		List<ZValue> empmnLogoCareerList = getCareerList(paramEmp);
		model.addAttribute("empmnLogoCareerList", empmnLogoCareerList);  */

		param.put("mode", param.getString("mode"));
	}

	public void preview(ParameterContext<ZValue> paramCtx) throws Exception {
		ZValue param = paramCtx.getParam();
		ModelMap model = paramCtx.getModel();

		String cvCon = new String(Base64.base64Decode(param.getString("cvCon").getBytes("UTF-8")), "UTF-8");
		model.addAttribute( "cvCon", cvCon );
	}

	public void contents(ParameterContext<ZValue> paramCtx) throws Exception {
		ZValue param = paramCtx.getParam();
		ModelMap model = paramCtx.getModel();
		ZValue siteInfo = siteMngService.getSiteBySiteName(param.getString("siteName"));
		model.addAttribute("siteName", param.getString("siteName"));
		String contextScopeMenuAllName = MasterMenuManager.CONTEXT_SCOPE_MENU_PREFIX + siteInfo.getString("siteId");
		
		@SuppressWarnings("unchecked")
		HashMap<String, List<MenuManageVO>> menuMap = (HashMap<String, List<MenuManageVO>>)servletContext.getAttribute(contextScopeMenuAllName);
		MenuManageVO currentVo = masterMenuManagerService.getCurrentMenu(menuMap, param.getInt("menuNo"));

		if ( currentVo != null ) {
			// ????????? ????????? ?????? ==================================
			if (SiteMngService.EDU_SITE_NAME.equals(param.getString("siteName")) || SiteMngService.EDUMOBILE_SITE_NAME.equals(param.getString("siteName"))) {
				param.put("siteSe", SiteMngService.EDU_SITE_NAME);
			}
			else if (SiteMngService.CKL_SITE_NAME.equals(param.getString("siteName")) || SiteMngService.CKLENG_SITE_NAME.equals(param.getString("siteName")) || SiteMngService.CKLMOBILE_SITE_NAME.equals(param.getString("siteName"))) {
				param.put("siteSe", SiteMngService.CKL_SITE_NAME);
			}		
			
			param.put("prgSe", "01");
			param.put("prgCl", "71");
			
			super.setCountQueryId("progrmMasterDAO.listCnt");
			super.setListQueryId("progrmMasterDAO.list");
			super.list(paramCtx);
			// ============================================
			
			model.addAttribute(ModelAndViewResolver.INCLUDE_PAGE, currentVo.getContentsPath());
		} else {
			model.addAttribute(ModelAndViewResolver.ERROR, "[menuNo,0][menuNm,ERROR?????????][menuLink,null][fullMenuLink,/"+param.getString("siteName")+"/main/contents.do?menuNo=0][path,][menuNoPath,][leafNodeYn,N]");
		}
	}

	public void siteGo(ParameterContext<ZValue> paramCtx) throws Exception {
		ZValue param = paramCtx.getParam();
		String link = param.getString("link");
		Assert.hasText(link);

		ModelMap model = paramCtx.getModel();
		model.addAttribute(ModelAndViewResolver.RESULT_CODE_KEY, ModelAndViewResolver.SUCCESS);
		model.addAttribute(ModelAndViewResolver.GO_URL_KEY, link);
	}

	public void removeCache(ParameterContext<ZValue> paramCtx) throws Exception {
		cacheUtil.remove(PORTAL_MAIN_CACHE_NAME);
		MVUtils.goUrl("javascript:history.back();", "??????????????? ?????? ?????????????????????.", paramCtx.getModel());
	}

	public void cklRight(ParameterContext<ZValue> paramCtx) throws Exception {
		ZValue param = paramCtx.getParam();
		ModelMap model = paramCtx.getModel();
		List<ZValue> boardList = null;
		if ("ckleng".equals(param.getString("siteName"))) {
			boardList = getBbs("B0000050", 5);
		}
		else {
			boardList = getBbs("B0000034", 5);
		}

		model.addAttribute("faqList", boardList);

		@SuppressWarnings("unchecked")
		List<ZValue> psList =  (List<ZValue>)cacheUtil.load("storedPopSrchwrd", "popularSrchwrdDAO.list2");
		if( psList == null ){
			param.put("endCnt", 10);
			psList = sqlDao.listDAO("popularSrchwrdDAO.list", param);
			cacheUtil.save("storedPopSrchwrd", "popularSrchwrdDAO.list2", psList);
		}
		model.addAttribute("psList", psList);
	}

	private List<ZValue> getBbs(String bbsId, int recordCountPerPage) throws Exception {
		ZValue param = new ZValue();
		param.put("bbsId", bbsId);
		param.put("id", bbsId);
		param.put("mainRecordCountPerPage", recordCountPerPage);
		param.put("queryId", "optionalBoardDAO.selectMainBoardArticleList");
		List<ZValue> boardList = getList(param);

		Map<String, List<FileVO>> fileMap = listHandler.getFileMap(param, boardList);
		UnpCollectionUtils.setFirstFile(boardList, fileMap, "atchFileId");

		return boardList;
	}

	private List<ZValue> getList(ZValue param) throws Exception {
		String id = param.getString("id");
		//List<ZValue> list = new ArrayList<ZValue>();
		//list = sqlDao.listDAO(param.getString("queryId"), param);
		@SuppressWarnings("unchecked")
		List<ZValue> list = (List<ZValue>) cacheUtil.load(PORTAL_MAIN_CACHE_NAME, id + "List");
		if (list == null) {
			list = sqlDao.listDAO(param.getString("queryId"), param);
			cacheUtil.save(PORTAL_MAIN_CACHE_NAME, id + "List", list);
		}

		Map<String, List<FileVO>> fileMap = listHandler.getFileMap(param, list);
		UnpCollectionUtils.setFirstFile(list, fileMap, "atchFileId");
		return list;
	}

	private List<ZValue> getCareerList(ZValue param) throws Exception {
		List<ZValue> list = new ArrayList<ZValue>();
		list = sqlDao.listDAO(param.getString("queryId"), param);

		Map<String, List<FileVO>> fileMap = listHandler.getFileMap(param, list);
		UnpCollectionUtils.setFirstFile(list, fileMap, "atchFileId");
		return list;
	}

	private List<ZValue> getRecentNoticeList() throws Exception {
		ZValue param = new ZValue();
		List<ZValue> recentNoticeList = sqlDao.listDAO("optionalBoardDAO.selectRecentNoticeList", param);

		cacheUtil.save(PORTAL_MAIN_CACHE_NAME, "recentNoticeList", recentNoticeList);

		Map<String, List<FileVO>> fileMap = listHandler.getFileMap(param, recentNoticeList);
		UnpCollectionUtils.setFirstFile(recentNoticeList, fileMap, "atchFileId");
		return recentNoticeList;
	}
	private List<ZValue> getRecentEventList() throws Exception {
		ZValue param = new ZValue();
		List<ZValue> recentEventList = sqlDao.listDAO("optionalBoardDAO.selectRecentEventList", param);

		cacheUtil.save(PORTAL_MAIN_CACHE_NAME, "recentEventList", recentEventList);

		Map<String, List<FileVO>> fileMap = listHandler.getFileMap(param, recentEventList);
		UnpCollectionUtils.setFirstFile(recentEventList, fileMap, "atchFileId");
		return recentEventList;
	}

	public List<ZValue> getCurriculumList(ZValue param) throws Exception {
		List<ZValue> resultList = lmsSqlDao.listDAO("realmListDAO.contentCurriculumList", param);

		return resultList;
	}

	public List<ZValue> getEduSubjList(ZValue param) throws Exception {
		List<ZValue> resultList = null;
		if("random".equals(param.getString("type"))) {
			resultList = lmsSqlDao.listDAO("realmListDAO.eduSubjRandomList", param);
		}else{
			resultList = lmsSqlDao.listDAO("realmListDAO.eduSubjNewList", param);
		}

		return resultList;
	}

	public String getRandomKeyword(ZValue param) throws Exception {
		String resultValue = sqlDao.selectString("searchDAO.randomKeyWord", param);

		return resultValue;
	}

	public int getCurriculumChkCnt(ZValue param) throws Exception {
		int resultCnt = lmsSqlDao.selectCount("realmListDAO.curriculumChkCnt", param);

		return resultCnt;
	}

	private ServletContext servletContext;
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
