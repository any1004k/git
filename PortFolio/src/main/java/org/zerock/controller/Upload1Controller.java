package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;
import org.zerock.service.Board1Service;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class Upload1Controller {
	
	
	private static final Logger logger = LoggerFactory.getLogger(Upload1Controller.class);
	
	@Autowired
	private Board1Service board1Service;
	
	
	/*오늘날짜 만드는 메서드*/
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator); //=> 오늘날짜 가지고 yyyy \\ MM \\ dd 로 반환함.
	
	}
	
	/*이미지파일인지 검사하는 메서드*/
	private boolean checkImageType (File file) {
		
		try {
			String type = Files.probeContentType(file.toPath());
			logger.debug("probeContentType결과는 : " + type);
			return type.startsWith("image"); // 컨텐트타입이 이미지로 시작하면 true 반환.
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
	
	/*popup.js에서 확인버튼 누르면 이리로 온다. AttachFileDTO에 파일경로,이름,유형 담아서 리스트로 리턴하기.*/
	@PostMapping(value="/uploadAjaxAction", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] UploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<AttachFileDTO>();
		
		String uploadFolder= "C:\\upload";
	
		/*logger.info("UploadFile : "+UploadFile[0].getOriginalFilename());*/
		
		logger.info("UploadFile : "+UploadFile);
		
		/*S : 오늘날짜폴더 만들기*/
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder,uploadFolderPath);
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		/*E : 오늘날짜폴더 만들기*/
		
		for(MultipartFile uploadFile : UploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO(); 
		
			/*인터넷 익스플로러를 위해서 getOriginalFilename()후에, 파일이름 따로 빼는 작업.*/
			String originalFilename = uploadFile.getOriginalFilename();		
			originalFilename = originalFilename.substring(originalFilename.lastIndexOf("\\")+1);
			attachDTO.setFilename(originalFilename);
			
			
			/*S : uuid 작업*/
			UUID uuid = UUID.randomUUID();
			originalFilename = uuid.toString()+"_"+originalFilename;
			
			/*E : uuid 작업*/
			
				
			try {
				File saveFile = new File(uploadPath,originalFilename);
				uploadFile.transferTo(saveFile);
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadpath(uploadFolderPath);
				
				/*S : 이미지파일이면 섬네일도 만들어서 저장해라 작업*/
				if(checkImageType(saveFile)) {
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+originalFilename));
					Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
					logger.debug(".getInputStream()은 바로 : ");
					attachDTO.setImage(true);
					
				}
				/*E : 이미지 .... 작업*/
				
				list.add(attachDTO);
				
			}catch(Exception e) {
				logger.debug(e.getMessage());
			}
			
		}//for끝
		
		
		return new ResponseEntity<>(list,HttpStatus.OK);
		
		
	}//uploadFormAction끝
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*이미지파일찾아서 바이트형식으로 이미지데이터 보내주기.*/
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		logger.debug("업로드컨트롤러, 화면에 이미지 뿌리는 메서드. 전달받은 파일경로와 이름은 : "+fileName);
		File file = new File("C:\\upload\\"+fileName);
		
		logger.debug("String을 파일객체로 변환하면  : "+file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type",Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
			
			
			logger.debug("file.toPath()결과는  : "+file.toPath());
			logger.debug("Files.probeContentType결과는  : "+Files.probeContentType(file.toPath()));
			logger.debug("FileCopyUtils.copyToByteArray(file)결과는  : "+FileCopyUtils.copyToByteArray(file));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}//getFile끝.
	
	
	
	@GetMapping(value="/download", produces= MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile (@RequestHeader("User-Agent") String userAgent, String fileName){
		
		logger.debug("받은 파일이름은 : "+fileName);        
		
		Resource resource = new FileSystemResource("c:\\upload\\"+fileName);		
		logger.debug("서버에서 주는 파일의 전체 경로 : "+resource);
		
		if (resource.exists()==false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		
		String resourceUuidName = resource.getFilename();	
		
		String resourceName =resourceUuidName.substring(resourceUuidName.indexOf("_")+1);
		
		
		
		HttpHeaders headers = new HttpHeaders();
				
		try {
			String downloadName = null;
			if(userAgent.contains("Trident")) {
				logger.debug("IE browser");
				downloadName = URLEncoder.encode(resourceName, "UTF-8").replaceAll("\\+", "");
				
			}else if(userAgent.contains("Edge")) {
				logger.debug("Edge browser");
				downloadName = URLEncoder.encode(resourceName, "UTF-8");
				logger.debug("엣지 이름 : "+downloadName);
			}else {
				logger.debug("Chrome browser");
				downloadName = new String(resourceName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			
			headers.add("Content-Disposition", "attachment; filename="+ downloadName);
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}//-- downloadFile
	
	
	
	
	
	@PostMapping("deleteFile")
	@ResponseBody //자바객체를 응답본문의 객체로 변환함.
	public ResponseEntity<String> deleteFile (String fileName, String type, String uuid, String bno){
		logger.debug("첨부파일 컨트롤러 딜리트, 받은 파일은 : "+ fileName);
		
		File file;
		int bnoi = Integer.parseInt(bno);
		
		try {
			file= new File("c:\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
			logger.debug("첨부파일 컨트롤러 딜리트, 삭제된 파일객체는 : "+ file);
			
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				file = new File(largeFileName);
				file.delete();
				
			}
			
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		if(bnoi!=0) {
		board1Service.deleteAttach(uuid,bnoi);
		}
		return new ResponseEntity<String>("파일이 삭제되었습니다.", HttpStatus.OK);
	}//deleteFile끝
		
		
		
	
	
	
	
	
}
