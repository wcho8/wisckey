package kr.madison.common.controller;

import java.io.IOException;

import kr.madison.common.service.ImageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/Image/*")
public class ImageController extends CommonController{

	@Autowired
	ImageService imageService;
	
	@RequestMapping("/uploadImageFile")
	@ResponseBody
	public String uploadImageFile(@RequestParam("file") MultipartFile upload) throws Exception{
		int fid = 0;
		try{
			fid = imageService.uploadImageFile(upload);
			
			String filepath = "/Image/loadImage/"+fid;
			
			return filepath;
		}catch(Exception e){
			e.printStackTrace();
			return "Image too large";
		}
	}
	
	@RequestMapping("/loadImage/{fid}")
	@ResponseBody
	public byte[] loadImage(@PathVariable("fid") int fid){
		return imageService.loadImage(fid);
	}
}
