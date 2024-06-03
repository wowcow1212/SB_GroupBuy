package com.user.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

public class UserUtil {

	public UserUtil() {
	}
	
	public static String uploadImg(MultipartFile mf) {
		String filename = mf.getOriginalFilename();
		String extension = "";
		
		int i = filename.lastIndexOf('.');
		if(i >= 0) {
			extension = filename.substring(i);
		}
		
		Random random = new Random();
		int raNumber = random.nextInt(10000);
		
		filename = "user" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_"
				+ raNumber + extension;
		
		String fileDir = "C:/temp/upload/";
		File pathexist = new File(fileDir);
		if(!pathexist.exists()) {
			pathexist.mkdirs();
		}
		
		File fileDirPath = new File(fileDir, filename);
		
		try {
			mf.transferTo(fileDirPath);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return filename;
	}
	
	public static String saveWebPhoto(String imageUrl) {
		
		Random random = new Random();
		int raNumber = random.nextInt(10000);
		
		String fileName = "user" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber + ".jpg";
        
        try {
            URL url = new URL(imageUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                InputStream inputStream = connection.getInputStream();
                BufferedImage image = ImageIO.read(inputStream);
                
                // 將圖像保存到本地
                String fileDir = "C:/temp/upload/";
        		File pathexist = new File(fileDir);
        		if(!pathexist.exists()) {
        			pathexist.mkdirs();
        		}
        		
        		File fileDirPath = new File(fileDir, fileName);
                ImageIO.write(image, "jpg", fileDirPath);
                
                System.out.println("Image saved to: " + fileDirPath.getAbsolutePath());
            } else {
                System.out.println("Error retrieving image: " + responseCode);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		return fileName;
	}

}


