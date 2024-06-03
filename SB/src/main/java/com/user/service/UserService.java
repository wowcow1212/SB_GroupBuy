package com.user.service;

import java.io.IOException;
import java.net.http.HttpClient;
import java.time.LocalDateTime;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;


import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;


import org.apache.http.ParseException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import org.hibernate.Hibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import com.match.bean.TagsBean;
import com.match.repository.TagsRepository;
import com.user.bean.UserBean;
import com.user.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository uRepository;

	@Autowired
	private TagsRepository tRepository;
	
	

	public UserBean creatUser(UserBean userBean) {
		return uRepository.save(userBean);
	}

	public UserBean getLoginUserData(UserBean userBean) {
		return uRepository.getLoginUserData(userBean.getUserAccount(), userBean.getUserPassword());
	}

	public UserBean getUserData(int userNo) {
		Optional<UserBean> op = uRepository.findById(userNo);

		if (op.isPresent())
			return op.get();

		return null;
	}
	public List<UserBean> getAllUserData() {
		return uRepository.findAll();
	}

	public int deleteUser(int userNo) {
		uRepository.deleteById(userNo);
		return 1;
	}

	@Transactional
	public UserBean updateUser(UserBean inputUserBean) {
		return uRepository.save(inputUserBean);
	}

	public UserBean updateUserLastLoginTime(UserBean user) {
		user.setLastLoginDatetime(LocalDateTime.now());
		UserBean resultBean = uRepository.save(user);
		return resultBean;
	}
	
	public List<UserBean> findUserBySearch(String searchName){
		return uRepository.findUserBySearch(searchName);
	}
	
	public UserBean findForgetUserBean(String email, String account) {
		return uRepository.findForgetUserBean(email, account);
	}
	
	public UserBean checkVerificationCode(String verificationCode) {
		return uRepository.checkVerificationCode(verificationCode);
	}
	
	public UserBean getGoogleLoginUserData(String googleID) {
		return uRepository.getGoogleLoginUserData(googleID);
	}
	

	
// ----- Tags : ManyToMany -------
	
	
	// 取得使用者資料
    public Optional<UserBean> getDataById(Integer userNo) {
        return uRepository.findById(userNo);
    }
    
    
    // 獲取所有使用者及其關聯的標籤                                           //創建了一個 List<Set<TagsBean>> 對象 userTags。然後,我們遍歷所有 UserBean 實例,初始化每個實例中的 tagsBeans 集合,並將其添加到 userTags 列表中。最終,我們返回這個列表,它包含了所有使用者關聯的標籤集合。
//    public List<Set<TagsBean>> getAllUsersWithTags() {
//        List<UserBean> users = uRepository.findAll();
//        List<Set<TagsBean>> userTags = new ArrayList<>();
//        for (UserBean user : users) {
//            Hibernate.initialize(user.getTagsBeans());                      // Hibernate.initialize(user.getTagsBeans());：使用 Hibernate 的 initialize 方法來強制初始化每個使用者對象中的標籤集合。這樣做是為了在返回結果時確保標籤集合已經加載，避免了懶加載引起的應用程式錯誤。
//            userTags.add(user.getTagsBeans());
//        }
//        return userTags;
//    }
    
    
	// 獲取所有使用者及所有資料
  public List<UserBean> getAllUsersWithTags() {
      List<UserBean> users = uRepository.findAll();
      for (UserBean user : users) {
          Hibernate.initialize(user.getTagsBeans());                       
      }
      return users;
  }
    
    
    // 使用者添加一個或多個標籤
    public UserBean addTagsToUser(Integer userNo, List<Integer> tagNos) {
        Optional<UserBean> optionalUser = uRepository.findById(userNo);
        if (optionalUser.isPresent()) {
            UserBean user = optionalUser.get();
            Set<TagsBean> tags = user.getTagsBeans();
            for (Integer tagNo : tagNos) {
                Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
                if (optionalTag.isPresent()) {
                    tags.add(optionalTag.get());
                }
            }
            user.setTagsBeans(tags);
            return uRepository.save(user);
        } else {
            throw new IllegalArgumentException("User not found with id: " + userNo);
        }
    }
    
    
    
    
	// 使用者移除一個或多個標籤
    public UserBean removeTagsFromUser(Integer userNo, List<Integer> tagNos) {
        Optional<UserBean> optionalUser = uRepository.findById(userNo);
        if (optionalUser.isPresent()) {
            UserBean user = optionalUser.get();
            Set<TagsBean> tags = user.getTagsBeans();
            for (Integer tagNo : tagNos) {
                Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
                if (optionalTag.isPresent()) {
                    tags.remove(optionalTag.get());
                }
            }
            user.setTagsBeans(tags);
            return uRepository.save(user);
        } else {
            throw new IllegalArgumentException("User not found with id: " + userNo);
        }
    }
   
    
    
    
    // ----- 實作Tags------
    
    @Transactional
    public void updateUserTags(UserBean userBean, List<String> selectedTags) {
//    	System.err.println(userBean.getTagsBeans());
        // 清空使用者原有的標籤
    	userBean.getUserNo();
    	
    	
        userBean.getTagsBeans().clear();                         
        List<String> aaList =  new ArrayList<>();
        // 根據選擇的標籤名稱列表批量查詢標籤實體
        List<TagsBean> tags = tRepository.findByTagNameIn(selectedTags);
        
        if (!tags.isEmpty()) {
            // 如果查詢結果不為空,添加查詢到的標籤實體到使用者的標籤集合中
            userBean.getTagsBeans().addAll(tags);
        } else {
            // 如果查詢結果為空,可以選擇忽略或進行錯誤處理
            // 這裡選擇忽略空結果,不做任何操作
        }
        
        // 儲存更新後的使用者資料
        uRepository.save(userBean);
    }
    
    
    
    
    
    // ----- Match 實作 -----
    
    
    // 從findAll() 裡隨機選擇用戶
    
    public UserBean getRandomUser(List<UserBean> users, int currentUserNo) {
        // 過濾掉與當前使用者不同的使用者
        List<UserBean> otherUsers = new ArrayList<>();
        for (UserBean user : users) {
            if (user.getUserNo() != currentUserNo) {
                otherUsers.add(user);
            }
        }

        // 如果其他使用者為空，返回null
        if (otherUsers.isEmpty()) {
            return null;
        }

        // 從其他使用者中隨機選擇一個使用者
        Random random = new Random();
        int randomIndex = random.nextInt(otherUsers.size());
        return otherUsers.get(randomIndex);
    }
    
    
    
    
    //刷新下一位使用者    

    public UserBean getNextUser(Integer currentUserNo) {
        List<UserBean> nextUsers = uRepository.findNextUsers(currentUserNo);
        if (!nextUsers.isEmpty()) {
            return nextUsers.get(0); // 返回下一位使用者
        }
        return null; // 如果沒有下一位使用者,則返回 null
    }
    
    
    

    
	
    //----Test----	
	
	

//所有的標籤用repository放到set裡面，再用set方法取出
//先做新增
//再做selectAll

	
	
//// 更新與現有使用者關聯的標籤。
//	public UserBean updateUserWithTags(UserBean updatedUser, List<Integer> tagNos) {
//		Optional<UserBean> optionalUser = uRepository.findById(updatedUser.getUserNo());
//		if (optionalUser.isPresent()) {
//			UserBean user = optionalUser.get();
//
//			// 清空原有的標籤關聯
//			user.getTags().clear();
//
//			// 添加新的標籤關聯
//			Set<TagsBean> tags = new HashSet<>();
//			for (Integer tagNo : tagNos) {
//				Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
//				if (optionalTag.isPresent()) {
//					tags.add(optionalTag.get());
//				} else {
//					throw new IllegalArgumentException("標籤不存在: " + tagNo);
//				}
//			}
//			user.setTags(tags);
//
//			return uRepository.save(user);
//		}
//		return null;
//	}
//	
//
//	
//	
//	//關聯 UserBean 與 TagsBean
//	public UserBean associateUserWithTags(Integer userNo, List<Integer> tagNos) {
//	    // 獲取 UserBean
//	    Optional<UserBean> optionalUser = uRepository.findById(userNo);
//	    if (optionalUser.isPresent()) {
//	        UserBean user = optionalUser.get();
//	        Set<TagsBean> tags = new HashSet<>();
//
//	        // 獲取 TagsBean 列表
//	        for (Integer tagNo : tagNos) {
//	            Optional<TagsBean> optionalTag = tRepository.findById(tagNo);
//	            if (optionalTag.isPresent()) {
//	                TagsBean tag = optionalTag.get();
//	                tags.add(tag);
//	                tag.getUsers().add(user); // 將 UserBean 添加到 TagsBean 的 users 集合中
//	                tRepository.save(tag); // 保存 TagsBean
//	            }
//	        }
//
//	        // 關聯 UserBean 與 TagsBean
//	        user.setTags(tags);
//
//	        // 保存 UserBean
//	        return uRepository.save(user);
//	    }
//	    return null;
//	}
	
	
	
	// ---------- LINEPAY金流 ---------------
	private static final String LinePayUrl = "https://sandbox-api-pay.line.me/v2/payments/request";
	private static final String ChannelSecret = "64e9607268ad77d84190c95c76a58054";
    private static final String ChannelId = "2004736885";

    public String getRequestLinePay(UserBean user, Integer amount, String currency, String productName, String confirmUrl) throws ParseException, IOException, JSONException {
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost post = new HttpPost(LinePayUrl);
		post.setHeader("Content-Type", "application/json; charset=UTF-8");
		post.setHeader("X-LINE-ChannelId", ChannelId);
		post.setHeader("X-LINE-ChannelSecret", ChannelSecret);
		
		Random random = new Random();
		int raNum = random.nextInt(10000);
		
		String orderId = "Point" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + raNum;
		
		String json = String.format("{\"amount\": %d, \"productName\": \"%s\", \"currency\": \"%s\", \"confirmUrl\": \"%s\", \"orderId\": \"%s\"}",
				amount, productName, currency, confirmUrl, orderId);
		
		System.out.println(json);
		
        StringEntity entity = new StringEntity(json, "UTF-8");
        post.setEntity(entity);
        
        CloseableHttpResponse response = client.execute(post);
        int statusCode = response.getStatusLine().getStatusCode();
        String responseBody = EntityUtils.toString(response.getEntity());
        
        if(statusCode == 200) {
        	JSONObject jsonObject = new JSONObject(responseBody);
        	System.out.println("回傳: " + jsonObject.optString("returnCode"));
        	if(jsonObject.optString("returnCode").equals("0000")) {
        		String confirmWeb = jsonObject.getJSONObject("info").getJSONObject("paymentUrl").getString("web");
        		return confirmWeb;
        	}
        }
        
        return null;
	}
    
    public UserBean insertPoint100(UserBean user) {
    	user.setPoint(user.getPoint() + 100);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint300(UserBean user) {
    	user.setPoint(user.getPoint() + 310);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint500(UserBean user) {
    	user.setPoint(user.getPoint() + 520);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint1000(UserBean user) {
    	user.setPoint(user.getPoint() + 1050);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint2000(UserBean user) {
    	user.setPoint(user.getPoint() + 2150);
    	return uRepository.save(user);
    }
    
    public UserBean insertPoint3000(UserBean user) {
    	user.setPoint(user.getPoint() + 3250);
    	return uRepository.save(user);
    }
    


	

}
