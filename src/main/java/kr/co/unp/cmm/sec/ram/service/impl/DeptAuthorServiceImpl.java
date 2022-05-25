package kr.co.unp.cmm.sec.ram.service.impl;

import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;

import kr.co.unp.cmm.crud.paging.PageInfo;
import kr.co.unp.cmm.dataaccess.ISqlDAO;
import kr.co.unp.cmm.sec.ram.service.AuthorManageVO;
import kr.co.unp.cmm.sec.ram.service.DeptAuthor;
import kr.co.unp.cmm.sec.ram.service.DeptAuthorService;
import kr.co.unp.cmm.sec.ram.service.DeptAuthorVO;
import kr.co.unp.member.vo.UsersVO;
import kr.co.unp.util.ZValue;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 부서권한에 관한 ServiceImpl 클래스를 정의한다.
 * @author 공통서비스 개발팀 이문준
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.11  이문준          최초 생성
 *
 * </pre>
 */

@Service("DeptAuthorService")
public class DeptAuthorServiceImpl implements DeptAuthorService {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	@Resource(name="deptAuthorDAO")
    private DeptAuthorDAO deptAuthorDAO;

	@Resource(name = "authorManageDAO")
	protected AuthorManageDAO authorManageDAO;

	@Resource(name = "pageInfo")
	private PageInfo pageInfo;

	@Resource(name = "SqlDAO")
	ISqlDAO<ZValue> deptDao;

	/**
	 * 부서별 할당된 권한목록 조회
	 * @param deptAuthorVO DeptAuthorVO
	 * @return List<DeptAuthorVO>
	 * @exception Exception
	 */
	public List<DeptAuthorVO> selectDeptAuthorList(DeptAuthorVO deptAuthorVO) throws Exception {
		return deptAuthorDAO.selectDeptAuthorList(deptAuthorVO);
	}

	/**
	 * 부서에 해당하는 사용자에게 시스템 메뉴/접근권한을 일괄 할당
	 * @param deptAuthor DeptAuthor
	 * @exception Exception
	 */
	public void insertDeptAuthor(DeptAuthor deptAuthor) throws Exception {
		deptAuthorDAO.insertDeptAuthor(deptAuthor);
	}

	/**
	 * 부서별 시스템 메뉴 접근권한을 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param deptAuthor DeptAuthor
	 * @exception Exception
	 */
	public void updateDeptAuthor(DeptAuthor deptAuthor) throws Exception {
		deptAuthorDAO.updateDeptAuthor(deptAuthor);
	}

	/**
	 * 불필요한 부서권한를 조회하여 데이터베이스에서 삭제
	 * @param deptAuthor DeptAuthor
	 * @exception Exception
	 */
	public void deleteDeptAuthor(DeptAuthor deptAuthor) throws Exception {
		deptAuthorDAO.deleteDeptAuthor(deptAuthor);
	}

    /**
	 * 부서권한 목록조회 카운트를 반환한다
	 * @param deptAuthorVO DeptAuthorVO
	 * @return int
	 * @exception Exception
	 */
	public int selectDeptAuthorListTotCnt(DeptAuthorVO deptAuthorVO) throws Exception {
		return deptAuthorDAO.selectDeptAuthorListTotCnt(deptAuthorVO);
	}

	/**
	 * 부서목록 조회
	 * @param deptAuthorVO DeptAuthorVO
	 * @return List<DeptAuthorVO>
	 * @exception Exception
	 */
	public List<DeptAuthorVO> selectDeptList(DeptAuthorVO deptAuthorVO) throws Exception {
		return deptAuthorDAO.selectDeptList(deptAuthorVO);
	}

    /**
	 * 부서 목록조회 카운트를 반환한다
	 * @param deptAuthorVO DeptAuthorVO
	 * @return int
	 * @exception Exception
	 */
	public int selectDeptListTotCnt(DeptAuthorVO deptAuthorVO) throws Exception {
		return deptAuthorDAO.selectDeptListTotCnt(deptAuthorVO);
	}

	/**
	 * 신규회원 권한롤(ROLE_사번) 자동생성후 해당 관리자에게 권한롤 부여
	 */
	public void registNewEmployeeAuthor(ModelMap model) throws Exception {
		List<ZValue> newEmpList = authorManageDAO.selectNewEmployee();
		if(!CollectionUtils.isEmpty(newEmpList))
		{
			authorManageDAO.insertNewEmployeeAuthor();

			String roleMsg = "";
			for(ZValue z : newEmpList)
			{
				DeptAuthor deptAuthor = new DeptAuthor();
	    		deptAuthor.setUniqId(z.getString("emstCode"));
	    		deptAuthor.setAuthorCode(z.getString("authorCode"));
	    		deptAuthorDAO.insertDeptAuthor(deptAuthor);
				roleMsg += "[" + z.getString("emstCode") + "," + z.getString("emstName") + "]";
			}
			roleMsg += "\\n신규권한등록 하였습니다.";
	        model.addAttribute("roleMsg", roleMsg);
		}
	}

	public void updateNewEmployeePinno(ModelMap model) throws Exception {

	}

	public void selectDeptAuthorList(DeptAuthorVO deptAuthorVO, AuthorManageVO authorManageVO, ModelMap model) throws Exception{

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(deptAuthorVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(deptAuthorVO.getPageUnit());
		paginationInfo.setPageSize(deptAuthorVO.getPageSize());

		deptAuthorVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		deptAuthorVO.setLastIndex(paginationInfo.getLastRecordIndex());
		deptAuthorVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		if( !UnpUserDetailsHelper.isAuthenticated("ROLE_SUPER") ){
			UsersVO user = UnpUserDetailsHelper.getAuthenticatedUser();
			deptAuthorVO.setLarCd(user.getDeptId());
		}
        int totCnt = 0;
		List<DeptAuthorVO> deptAuthorList = deptAuthorDAO.selectDeptAuthorList(deptAuthorVO);
		if( org.apache.commons.collections.CollectionUtils.isNotEmpty(deptAuthorList) ){
			totCnt = deptAuthorList.get(0).getTotalRows();
		}
		paginationInfo.setTotalRecordCount(totCnt);

        model.addAttribute("paginationInfo", paginationInfo);

		deptAuthorVO.setDeptAuthorList(deptAuthorDAO.selectDeptAuthorList(deptAuthorVO));
        model.addAttribute("deptAuthorList", deptAuthorVO.getDeptAuthorList());

    	authorManageVO.setAuthorManageList(authorManageDAO.selectAuthorAllList());
        model.addAttribute("authorManageList", authorManageVO.getAuthorManageList());

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

    	StringBuffer link = new StringBuffer();
    	link.append("/bos/cmm/sec/ram/DeptAuthorList").append("?larCd=").append(deptAuthorVO.getLarCd()).append("&midCd=").append(deptAuthorVO.getMidCd()).append("&smCd=").append(deptAuthorVO.getSmCd());
    	link.append("&searchCnd=").append(deptAuthorVO.getSearchCnd()).append("&searchWrd=").append(URLEncoder.encode(deptAuthorVO.getSearchWrd(), "UTF-8"));
    	String pageNav = pageInfo.getPageNavString(deptAuthorVO.getPageUnit(), totCnt, deptAuthorVO.getPageIndex(), link.toString());

    	model.addAttribute("resultCnt", totCnt);
    	model.addAttribute("pageNav", pageNav);
	}
}