package kr.madison.common.dao;

import kr.madison.common.vo.ImageVO;

import org.springframework.stereotype.Repository;

@Repository
public class ImageDAO extends CommonDAO{

	public int uploadImageFile(ImageVO paramVO){
		getSqlSession().insert("Image.uploadImageFile", paramVO);
		return paramVO.getFid();
	}
	
	public ImageVO loadImage(ImageVO paramVO){
		return getSqlSession().selectOne("Image.loadImage", paramVO);
	}
}
