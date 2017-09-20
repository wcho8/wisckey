package kr.madison.geul.service;

import java.util.ArrayList;
import java.util.List;

import kr.madison.common.service.CommonService;
import kr.madison.geul.dao.GeulDAO;
import kr.madison.geul.vo.GeulVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeulService extends CommonService {

	@Autowired
	GeulDAO geulDAO;

	public List<GeulVO> findGeulList(GeulVO paramVO) {
		List<GeulVO> result = new ArrayList<GeulVO>();

		paramVO = checkTables(paramVO);
		paramVO.setUserno(paramVO.getUserno());
		result = geulDAO.findGeulList(paramVO);
		return result;
	}

	public List<GeulVO> findGeulTypes(GeulVO paramVO) {
		List<GeulVO> result = new ArrayList<GeulVO>();

		result = geulDAO.findGeulTypes(paramVO);
		return result;
	}

	public GeulVO checkTables(GeulVO paramVO) {
		String table_name = "";
		String idname = "";

		switch (paramVO.getPtypeid()) {
		case 1:
			table_name = "brd_freeboard";
			idname = "frid";
			break;
		/*
		 * case 2: table_name = "brd_freeboard"; idname = "frid"; break;
		 */
		case 3:
			table_name = "brd_employment";
			idname = "empid";
			break;
		/*
		 * 족보 case 4: table_name = "brd_employment"; break;
		 */
		case 5:
			table_name = "brd_schoolwork";
			idname = "swid";
			break;
		case 6:// 맛집
			table_name = "brd_extratips";
			idname = "tipid";
			break;
		case 7:// 벼룩시작
			table_name = "brd_extratips";
			idname = "tipid";
			break;
		/*
		 * 취업공고 case 8: table_name = "brd_employment"; break;
		 */
		case 9:// 생활팁
			table_name = "brd_extratips";
			idname = "tipid";
			break;
		}

		paramVO.setTable_name(table_name);
		paramVO.setIdname(idname);

		return paramVO;
	}

	public int findGeulListCount(GeulVO paramVO) {
		paramVO = checkTables(paramVO);
		int result = geulDAO.findGeulTotalCnt(paramVO);

		return result;
	}

	public List<GeulVO> findGeulRepList(GeulVO paramVO) {
		List<GeulVO> result = new ArrayList<GeulVO>();

		paramVO = checkTables(paramVO);
		paramVO.setUserno(paramVO.getUserno());
		result = geulDAO.findGeulRepList(paramVO);
		return result;
	}

}
