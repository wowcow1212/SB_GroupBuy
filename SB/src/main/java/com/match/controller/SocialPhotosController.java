//新增、刪除跟修改應該由用戶來做，這裡的管理員操作按鈕先關掉


package com.match.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.match.bean.SocialPhotosBean;
import com.match.service.SocialPhotosService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class SocialPhotosController {

	@Autowired
	private SocialPhotosService spService;
	
	
	
	// 查詢編號+主題名稱 
	@GetMapping("/queryPhotoNo")
	public String queryPhotos(@RequestParam(required = false, name = "photoNo") Integer photoNo,
	                         @RequestParam(required = false, name = "photoTheme") String photoTheme,
	                         Model model) {
	    List<SocialPhotosBean> photos;
	    if (photoNo != null) {
	    	SocialPhotosBean bean = spService.getById(photoNo);
	        photos = bean != null ? Collections.singletonList(bean) : Collections.emptyList();
	    } else if (photoTheme != null && !photoTheme.isEmpty()) {
	        photos = spService.findByPhotoTheme(photoTheme);
	    } else {
	        photos = spService.findAll();
	    }
	    model.addAttribute("photos", photos);
	    return "match/jsp/SocialPhotosHP.jsp";
	}


	
    // 查詢單張照片
    @GetMapping("/getSPhotos/{photoNo}")
    public String getPhotoById(@PathVariable Integer photoNo, Model model) {
        SocialPhotosBean photo = spService.getById(photoNo);
        if (photo == null) {
            // 處理找不到照片的情況,例如返回錯誤頁面或其他操作
            return "error";
        }
        model.addAttribute("photo", photo);
        return "match/jsp/SocialPhotosHP.jsp";
    }
    
	
	// 查詢單張照片
/*	@GetMapping("/getSPhotos/{photoNo}")
	public ResponseEntity<SocialPhotosBean> getPhotoById(@PathVariable Integer photoNo) {
		SocialPhotosBean photo = spService.getById(photoNo);
		if (photo == null) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(photo);
	}*/

	
	// 查詢所有照片  -  從這裡傳全部資料到前端
	@GetMapping("/socialPhotosHP")
	public String getAllPhotos(Model model) {
	    List<SocialPhotosBean> photos = spService.findAll();
	    model.addAttribute("photos", photos);
	    return "match/jsp/SocialPhotosHP.jsp";
	}
	
	
	// 查詢所有照片 (傳JSON)
//	@GetMapping("/getAllSPhotos")
//	public ResponseEntity<List<SocialPhotosBean>> getAllPhotos() {
//		List<SocialPhotosBean> photos = spService.findAll();
//		return ResponseEntity.ok(photos);
//	}
	
	
	// 刷新全部頁面
	@GetMapping("/refreshPhotos")
	public String refreshPhotosPage() {
		return "redirect:socialPhotosHP";
	}

	
	// 根據主題查詢照片
    @GetMapping("/photos/theme/{photoTheme}")
    public ResponseEntity<List<SocialPhotosBean>> getPhotosByTheme(@PathVariable String photoTheme) {
        List<SocialPhotosBean> photos = spService.findByPhotoTheme(photoTheme);
        return ResponseEntity.ok(photos);
    }
	
	
    // 删除照片
    @DeleteMapping("/deletePhoto/{photoNo}")
    public String deletePhoto(@PathVariable Integer photoNo) {
        spService.deleteById(photoNo);
        return "redirect:/socialPhotosHP";
    }

	
	// 删除照片 (傳JSON)
//	@DeleteMapping("/deleteSPhotos/{photoNo}")
//	public ResponseEntity<Void> deletePhoto(@PathVariable Integer photoNo) {
//		spService.deleteById(photoNo);
//		return ResponseEntity.noContent().build();
//	}
    
    
	//批量刪除
    @PostMapping("/deleteBatchPhotos")
    @ResponseBody
    public Map<String, Object> deleteBatchPhotos(@RequestBody List<Integer> photoNos) {
        if (!photoNos.isEmpty()) {
            for (Integer photoNo : photoNos) {
                spService.deleteById(photoNo);
            }
        }
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "照片刪除成功");
        return response;
    }
    
    
    
    
    
    // ----- Match 實作 -----

    
    
    
    // 通過調用 /MatchPhotos 路徑並傳遞 userNo 參數來獲取指定用戶的交友照片路徑列表
    @GetMapping("/MatchPhotos")
    @ResponseBody
    public List<String> getSocialPhotos(@RequestParam("userNo") Integer userNo) {
        List<String> socialPhotos = spService.findByUserNo(userNo);
        return socialPhotos;
    }

    

    
	
	// 接收用戶上傳的照片，將其儲存到伺服器中，並在資料庫中新增相應的記錄
    

	
	// -----多個input只能上傳一張圖片的方法
    
    
	// 更新照片方法
    @PostMapping(value = "/updatePhotos", consumes = "multipart/form-data", produces = "application/json;charset=UTF-8")     //POSTMAN測試 : consumes = "multipart/form-data"
    public String updateSPhotos(
        @RequestParam("userNo") Integer userNo,
        @RequestParam(value = "file1", required = false) MultipartFile file1,
        @RequestParam(value = "file1Theme", required = false) String file1Theme,
        @RequestParam(value = "file2", required = false) MultipartFile file2,
        @RequestParam(value = "file2Theme", required = false) String file2Theme,
        @RequestParam(value = "file3", required = false) MultipartFile file3,
        @RequestParam(value = "file3Theme", required = false) String file3Theme,
        @RequestParam(value = "file4", required = false) MultipartFile file4,
        @RequestParam(value = "file4Theme", required = false) String file4Theme,
        @RequestParam(value = "file5", required = false) MultipartFile file5,
        @RequestParam(value = "file5Theme", required = false) String file5Theme,
        @RequestParam(value = "file6", required = false) MultipartFile file6,
        @RequestParam(value = "file6Theme", required = false) String file6Theme,
        @RequestParam(value = "file7", required = false) MultipartFile file7,
        @RequestParam(value = "file7Theme", required = false) String file7Theme,
        @RequestParam(value = "file8", required = false) MultipartFile file8,
        @RequestParam(value = "file8Theme", required = false) String file8Theme,
        HttpServletRequest request, Model m) throws IllegalStateException, IOException {

        List<SocialPhotosBean> updatedPhotos = new ArrayList<>();
        
        
        try {
            // 處理每個文件
            if (file1 != null && !file1.isEmpty()) {                                     // 逐個檢查每個文件是否為空（即是否有上傳的文件）。如果文件不為空，則調用 processPhoto 方法處理該文件，並將處理結果添加到 updatedPhotos 列表中
                updatedPhotos.add(processPhoto(file1, file1Theme, userNo));
            }
            if (file2 != null && !file2.isEmpty()) {
                updatedPhotos.add(processPhoto(file2, file2Theme, userNo));
            }
            if (file3 != null && !file3.isEmpty()) {
                updatedPhotos.add(processPhoto(file3, file3Theme, userNo));
            }
            if (file4 != null && !file4.isEmpty()) {
                updatedPhotos.add(processPhoto(file4, file4Theme, userNo));
            }
            if (file5 != null && !file5.isEmpty()) {
                updatedPhotos.add(processPhoto(file5, file5Theme, userNo));
            }
            if (file6 != null && !file6.isEmpty()) {
                updatedPhotos.add(processPhoto(file6, file6Theme, userNo));
            }
            if (file7 != null && !file7.isEmpty()) {
                updatedPhotos.add(processPhoto(file7, file7Theme, userNo));
            }
            if (file8 != null && !file8.isEmpty()) {
                updatedPhotos.add(processPhoto(file8, file8Theme, userNo));
            }
            
            
        } catch (Exception e) {
            System.err.println(e.getMessage());
            throw new RuntimeException("Photo update failed", e);
        }

        return "redirect:/editMatchProfile";
    }
	
	
	//處理單個文件的上傳
	private SocialPhotosBean processPhoto(MultipartFile file, String theme, Integer userNo) throws IllegalStateException, IOException {
	  if (file != null && !file.isEmpty()) {
		String filename = generateFilename(file);                        // 調用 generateFilename 方法生成唯一的文件名
	    String fileDir = "C:/temp/upload/";                              // 將文件保存到指定的目錄中
	    File pathexist = new File(fileDir);
	    if (!pathexist.exists()) {
	        pathexist.mkdirs();
	    }
	    File fileDirPath = new File(fileDir, filename);
	    file.transferTo(fileDirPath);
	    return spService.insertOrUpdate(userNo, filename, theme);        // 調用 spService.insertOrUpdate 方法將文件信息和對應的主題插入或更新到數據庫中
	}                                                                    // processPhoto 方法接受一個 theme 參數，該參數表示每個文件對應的主題
	return null;
}	
    
   
	
	
    // 生成唯一的文件名
	private String generateFilename(MultipartFile file) {
	    String filename = file.getOriginalFilename();                    // 從原始文件名中提取擴展名
	    String extension = "";                                
	    int j = filename.lastIndexOf('.');
	    if (j >= 0) {
	        extension = filename.substring(j);
	    }
	    Random random = new Random();                                    // 結合當前時間戳和隨機數生成新的文件名    
	    int raNumber = random.nextInt(10000);
	    return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber + extension;
	    
	    
	    // 也可以這樣寫
	    // return System.currentTimeMillis() + "-" + new Random().nextInt(1000) + extension;

	}
	
	
	
	
	
	
	@PostMapping(value = "/insertSPhoto")
	@ResponseBody
	public List<SocialPhotosBean> insertSPhotos(@RequestParam("userNo") Integer userNo,
	                                            @RequestParam("sPhoto") MultipartFile[] mfs,
	                                            HttpServletRequest request) throws IllegalStateException, IOException {
	    HttpSession session = request.getSession();
	    List<SocialPhotosBean> insertedPhotos = new ArrayList<>();

	    for (MultipartFile mf : mfs) {
	        String filename = mf.getOriginalFilename();
	        String extension = "";
	        int i = filename.lastIndexOf('.');
	        if (i >= 0) {
	            extension = filename.substring(i);
	        }

	        Random random = new Random();
	        int raNumber = random.nextInt(10000);
	        filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber
	                + extension;

	        String fileDir = "C:/temp/upload/";
	        File pathexist = new File(fileDir);
	        if (!pathexist.exists()) {
	            pathexist.mkdirs();
	        }

	        File fileDirPath = new File(fileDir, filename);
	        mf.transferTo(fileDirPath);

	        /*SocialPhotosBean sPhoto = spService.insertOrUpdate(userNo, filename, theme);
	        insertedPhotos.add(sPhoto);*/
	    }

	    session.setAttribute("insertedPhotos", insertedPhotos);

	    return insertedPhotos;
	}
	
	
	
	
	
	
	
	// -----input上傳多張圖片的方法
	
	
	// 更新照片方法
	/*@PostMapping(value = "/updateSPhotos", consumes = "application/json" ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<SocialPhotosBean> updateSPhotos(@RequestParam("userNo") Integer userNo,
	                                            @RequestParam("photoPath") List<MultipartFile> photoPaths,
	                                            HttpServletRequest request) throws IllegalStateException, IOException {
	    List<SocialPhotosBean> updatedPhotos = new ArrayList<>();

	    for (int i = 0; i < photoPaths.size(); i++) {
	        MultipartFile mf = photoPaths.get(i);

	        String filename = mf.getOriginalFilename();
	        String extension = "";
	        int j = filename.lastIndexOf('.');
	        if (j >= 0) {
	            extension = filename.substring(j);
	        }
	        Random random = new Random();
	        int raNumber = random.nextInt(10000);
	        filename = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + "_" + raNumber
	                + extension;

	        String fileDir = "C:/temp/upload/";
	        File pathexist = new File(fileDir);
	        if (!pathexist.exists()) {
	            pathexist.mkdirs();
	        }
	        File fileDirPath = new File(fileDir, filename);
	        mf.transferTo(fileDirPath);

	        SocialPhotosBean sPhoto = spService.insertOrUpdate(userNo, filename, photoTheme);
	        updatedPhotos.add(sPhoto);
	    }

	    return updatedPhotos;
	}*/


}
