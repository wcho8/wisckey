package kr.madison.common.service;

import java.io.IOException;

import kr.madison.common.dao.ImageDAO;
import kr.madison.common.vo.ImageVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageService {
	@Autowired
	ImageDAO imageDAO;
	
	public int uploadImageFile(MultipartFile upload) throws Exception{
		ImageVO vo = new ImageVO();
		vo.setFileContent(upload.getBytes());
		vo.setFilename(upload.getOriginalFilename());
		vo.setFiletype(upload.getContentType());
		vo.setFilesize(upload.getSize());
		
		if(upload.getSize() >= 5*1024*1024){
			return 0;
		}
		int fid = imageDAO.uploadImageFile(vo);
		
		return fid;
	}
	
	public byte[] loadImage(int fid){
		ImageVO vo = new ImageVO();
		vo.setFid(fid);
		vo = imageDAO.loadImage(vo);
		byte[] image = vo.getFileContent();
		return image;
	}
}
