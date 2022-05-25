package kr.co.edu.onlineEdu.web;

import kr.co.unp.cmm.crud.service.ParameterContext;
import kr.co.unp.cmm.crud.web.DefaultCmmProgramController;
import kr.co.unp.util.ZValue;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/{siteName}/onlineEdu/edcsystm")
public class EdcSystmController extends DefaultCmmProgramController {
	@Override
	protected String getProgramId(ParameterContext<ZValue> paramCtx) {
		return "edcsystm";
	}
	
}


