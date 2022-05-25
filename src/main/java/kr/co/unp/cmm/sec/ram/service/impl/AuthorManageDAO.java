package kr.co.unp.cmm.sec.ram.service.impl;

import java.util.List;

import kr.co.unp.cmm.sec.ram.service.AuthorManage;
import kr.co.unp.cmm.sec.ram.service.AuthorManageVO;
import kr.co.unp.util.ZValue;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * 권한관리에 대한 DAO 클래스를 정의한다.
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

@Repository("authorManageDAO")
public class AuthorManageDAO extends EgovAbstractDAO {

    /**
	 * 권한목록을 조회한다.
	 * @param authorManageVO AuthorManageVO
	 * @return List<AuthorManageVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<AuthorManageVO> selectAuthorList(AuthorManageVO authorManageVO) throws Exception {
        return (List<AuthorManageVO>)list("authorManageDAO.selectAuthorList", authorManageVO);
    }
	
	/**
	 * 권한을 등록한다.
	 * @param authorManage AuthorManage
	 * @exception Exception
	 */
    public void insertAuthor(AuthorManage authorManage) throws Exception {
        insert("authorManageDAO.insertAuthor", authorManage);
    }

    /**
	 * 권한을 수정한다.
	 * @param authorManage AuthorManage
	 * @exception Exception
	 */
    public void updateAuthor(AuthorManage authorManage) throws Exception {
        update("authorManageDAO.updateAuthor", authorManage);
    }

    /**
	 * 권한을 삭제한다.
	 * @param authorManage AuthorManage
	 * @exception Exception
	 */
    public void deleteAuthor(AuthorManage authorManage) throws Exception {
        delete("authorManageDAO.deleteAuthor", authorManage);
    }

    /**
	 * 권한을 조회한다.
	 * @param authorManageVO AuthorManageVO
	 * @return AuthorManageVO
	 * @exception Exception
	 */
    public AuthorManageVO selectAuthor(AuthorManageVO authorManageVO) throws Exception {
        return (AuthorManageVO) selectByPk("authorManageDAO.selectAuthor", authorManageVO);
    }

    /**
	 * 권한목록 총 갯수를 조회한다.
	 * @param authorManageVO AuthorManageVO
	 * @return int
	 * @exception Exception
	 */
    @SuppressWarnings("deprecation")
	public int selectAuthorListTotCnt(AuthorManageVO authorManageVO)  throws Exception {
        return (Integer)getSqlMapClientTemplate().queryForObject("authorManageDAO.selectAuthorListTotCnt", authorManageVO);
    }
    
    /**
	 * 모든 권한목록을 조회한다.
	 * @param authorManageVO AuthorManageVO
	 * @return List<AuthorManageVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<AuthorManageVO> selectAuthorAllList() throws Exception {
        return (List<AuthorManageVO>)list("authorManageDAO.selectAuthorAllList", null);
    }    

    @SuppressWarnings("unchecked")
    public List<ZValue> selectNewEmployee()  throws Exception {
        return (List<ZValue>)list("authorManageDAO.selectNewEmployee", null);
    }

    public void insertNewEmployeeAuthor() throws Exception {
        insert("authorManageDAO.insertNewEmployeeAuthor", null);
    }

}
