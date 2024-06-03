package com.match.controller;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
public class ImageController {

    private static final String IMAGE_DIRECTORY = "C:/temp/upload/";

    @GetMapping("/images/{filename:.+}")
    public ResponseEntity<Resource> getImage(@PathVariable String filename) {
        Path imagePath = Paths.get(IMAGE_DIRECTORY, filename);

        // 創建文件系統資源對象
        Resource resource = new FileSystemResource(imagePath);

        // 檢查文件是否存在
        if (!resource.exists()) {
            return ResponseEntity.notFound().build();
        }

        // 設置響應頭
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"");

        // 返回圖片資源
        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.IMAGE_JPEG)
                .body(resource);
    }
}