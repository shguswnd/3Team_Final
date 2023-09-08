package service.file;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import controller.admin.dto.AdminRegisterDto;
import controller.admin.dto.StoreInfoUpdateDto;

@Service
public class FileService {
	
	// 임시 사라질 수 있음
	private final String PATH = "/files/upload";
	
	// 사업자 등록증 저장
	public void saveAdminBusinesslicense(AdminRegisterDto dto, HttpServletRequest request) {
		
		String basicPath = request.getServletContext().getRealPath("/files/");
		createPath(basicPath);
		createPath(basicPath + "upload/");
		
		if (!dto.getFile().getOriginalFilename().equals("")) {
			FileOutputStream fs = null;
			try {
				 createPath(dto.getRealFilePath());
			        createPath(dto.getRealFilePath() + dto.getEmail());
			        File destFile = new File(dto.getRealFilePath() + dto.getEmail() + "/" + dto.getFile().getOriginalFilename());
			        fs = new FileOutputStream(destFile);
			        fs.write(dto.getFile().getBytes());
			        
			        // 파일 권한 설정
			        destFile.setExecutable(false);
			        destFile.setReadable(true);
			        destFile.setWritable(false);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					fs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
	}
	
	// 프로필 이미지 변경 변경
	public void updateAdminProfile(StoreInfoUpdateDto dto, String userId) {
		if (!dto.getFile().getOriginalFilename().equals("")) {
			FileOutputStream fs = null;
			try {
				createPath(dto.getProfile_path());
				createPath(dto.getProfile_path() + userId);
				fs = new FileOutputStream(dto.getProfile_path() + userId + "/" + dto.getFile().getOriginalFilename());
				fs.write(dto.getFile().getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					fs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
	}
	
	private void createPath(String path) {
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
	}
}
