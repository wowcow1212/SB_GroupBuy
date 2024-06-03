package com.group.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.group.dto.ItemDto;
import com.group.model.Item;
import com.group.service.ItemService;
import com.group.service.ItemSpecService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ItemSpecService itemSpecService;

	@GetMapping(value = "/groupitems/{eventno}")
	@ResponseBody
	public List<ItemDto> findItemsByEventNoDto(@PathVariable("eventno") Integer eventno) {
		List<ItemDto> items = itemService.findItemsByEventNoDto(eventno);
		return items;
	}

	@PostMapping(value = "/insertitem")
	public ResponseEntity<Map<String, String>> insertItem(@RequestBody List<ItemDto> insertItemsJson, HttpServletRequest request)
			throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		Integer eventno = (Integer) session.getAttribute("eventno");

		Random random = new Random();

		String fileDir = "C:/temp/upload/";

		for (ItemDto insertItemJson : insertItemsJson) {
			String itemName = insertItemJson.getItemName();
			Integer itemPrice = insertItemJson.getItemPrice();
			String itemDesc = insertItemJson.getItemDesc();
			String itemImgData = insertItemJson.getItemImgPath();
			int raNumber = random.nextInt(100000);

			if (itemImgData.startsWith("data:image")) {
				List<String> itemSpecs = insertItemJson.getItemSpec();
				String[] parts = itemImgData.split(",");
				String base64Image = parts[1];
				String type = parts[0].split(";")[0].split("/")[1];

//				將base64編碼解成Bytes
				byte[] imageBytes = Base64.getDecoder().decode(base64Image);

				String fileName = "item" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"))
						+ "_" + raNumber + "." + type;
				Path filePath = Paths.get(fileDir + fileName);

				FileUtils.writeByteArrayToFile(new File(filePath.toString()), imageBytes);

				System.out.println("-------" + filePath + "----------");

				Item insertItem = itemService.insertItem(eventno, itemName, itemPrice, itemDesc, fileName);
				
				for (String itemSpec : itemSpecs) {
					itemSpecService.insertItemSpec(insertItem, itemSpec);
				}
				
			}
		}
		
		System.out.println("eventNO: ------" + eventno);
		
		Map<String, String> response = new HashMap<>();
        response.put("redirectUrl", "/group/eachgroup/" + eventno);
        return ResponseEntity.ok(response);
	}

	@PostMapping(value = "/updateitem", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public Item updateItem(@RequestParam("iuname") String name, @RequestParam("/iuprice") Integer price,
			@RequestParam("iudescription") String description, @RequestParam("iupicture") MultipartFile mf,
			HttpServletRequest request) throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		Integer itemno = (Integer) session.getAttribute("itemno");

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

		Item item = itemService.updateItem(itemno, name, price, description, filename);

		return item;
	}

}
