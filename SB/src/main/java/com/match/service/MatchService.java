package com.match.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.match.bean.MatchBean;
import com.match.repository.MatchRepository;
import com.user.bean.UserBean;
import com.user.service.UserService;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class MatchService {

    @Autowired
    private MatchRepository matchRepos;
    
    @Autowired
    private UserService uService;

    public int likeUser(int user1No, int user2No) {
        MatchBean match = matchRepos.findByUser1NoAndUser2No(user1No, user2No);
        MatchBean oppositeMatch = matchRepos.findByUser1NoAndUser2No(user2No, user1No);

        if (match == null) {
            // 創建新的配對記錄
            match = new MatchBean(user1No, user2No, LocalDateTime.now());
            match.setMatchStatus(0); // 喜歡
            match = matchRepos.save(match);

            if (oppositeMatch != null && oppositeMatch.getMatchStatus() == 0) {
                // 對方之前也喜歡該用戶
                match.setMatchStatus(2); // 配對成功
                oppositeMatch.setMatchStatus(2);
                match.setMatchedAt(LocalDateTime.now());
                oppositeMatch.setMatchedAt(LocalDateTime.now());
                matchRepos.save(match);
                matchRepos.save(oppositeMatch);
                return 2;
            }
        } else {
            // 如果之前已經存在記錄，則對方已經作出回應
            if (oppositeMatch != null) {
                if (oppositeMatch.getMatchStatus() == 0) {
                    // 對方之前也喜歡該用戶
                    match.setMatchStatus(2); // 配對成功
                    oppositeMatch.setMatchStatus(2);
                    match.setMatchedAt(LocalDateTime.now());
                    oppositeMatch.setMatchedAt(LocalDateTime.now());
                    matchRepos.save(match);
                    matchRepos.save(oppositeMatch);
                    return 2;
                } else {
                    // 對方之前不喜歡該用戶
                    match.setMatchStatus(3); // 配對失敗
                    oppositeMatch.setMatchStatus(3);
                    match.setMatchedAt(LocalDateTime.now());
                    oppositeMatch.setMatchedAt(LocalDateTime.now());
                    matchRepos.save(match);
                    matchRepos.save(oppositeMatch);
                    return 3;
                }
            }
        }

        return 0; // 配對中
    }

    
    // 配對不成功會將"不喜歡"改為"配對失敗"
    public int dislikeUser(int user1No, int user2No) {
        MatchBean match = matchRepos.findByUser1NoAndUser2No(user1No, user2No);
        MatchBean oppositeMatch = matchRepos.findByUser1NoAndUser2No(user2No, user1No);

        if (match == null) {
            // 創建新的配對記錄
            match = new MatchBean(user1No, user2No, LocalDateTime.now());
            match.setMatchStatus(1); // 不喜歡
            match = matchRepos.save(match);

            if (oppositeMatch != null && oppositeMatch.getMatchStatus() == 1) {
                // 對方之前也不喜歡該用戶
                match.setMatchStatus(3); // 配對失敗
                oppositeMatch.setMatchStatus(3);
                match.setMatchedAt(LocalDateTime.now());
                oppositeMatch.setMatchedAt(LocalDateTime.now());
                matchRepos.save(match);
                matchRepos.save(oppositeMatch);
                return 3;
            }
        } else {
            if (oppositeMatch != null) {
                if (oppositeMatch.getMatchStatus() == 1) {
                    // 對方之前也不喜歡該用戶
                    match.setMatchStatus(3); // 配對失敗
                    oppositeMatch.setMatchStatus(3);
                    match.setMatchedAt(LocalDateTime.now());
                    oppositeMatch.setMatchedAt(LocalDateTime.now());
                    matchRepos.save(match);
                    matchRepos.save(oppositeMatch);
                    return 3;
                } else {
                    // 對方之前喜歡該用戶
                    match.setMatchStatus(3); // 配對失敗
                    oppositeMatch.setMatchStatus(3);
                    match.setMatchedAt(LocalDateTime.now());
                    oppositeMatch.setMatchedAt(LocalDateTime.now());
                    matchRepos.save(match);
                    matchRepos.save(oppositeMatch);
                    return 3;
                }
            } else {
                // 對方還沒有作出回應
                match.setMatchStatus(1); // 不喜歡
                match.setMatchedAt(LocalDateTime.now());
                matchRepos.save(match);
                return 1;
            }
        }

        return 1; // 不喜歡
    }

    public List<MatchBean> getSuccessfulMatches() {
        return matchRepos.findByMatchStatus(2); // 獲取 MatchStatus 為 2 (配對成功) 的記錄
    }
    
 // 獲取成功的使用者匹配列表，並將每個匹配中的使用者ID提取出來，放入一個列表中返回
    public List<Integer> getMatchedUserNos() {
        List<MatchBean> successfulMatches = getSuccessfulMatches();
        List<Integer> matchedUserNos = new ArrayList<>();
        for (MatchBean match : successfulMatches) {
            matchedUserNos.add(match.getUser1No());
            matchedUserNos.add(match.getUser2No());
        }
        return matchedUserNos;
    }
    
    
    public List<MatchBean> findByUser1NoAndMatchStatusIsSuccess(Integer user1No){
    	return matchRepos.findByUser1NoAndMatchStatus(user1No, 2);
	}
    
    public List<Integer> getMyMatchedUserNos(Integer user1No) {
        List<MatchBean> successfulMatches = findByUser1NoAndMatchStatusIsSuccess(user1No);
        List<Integer> matchedUserNos = new ArrayList<>();
        for (MatchBean match : successfulMatches) {
            matchedUserNos.add(match.getUser2No());
        }
        return matchedUserNos;
    }
    
    public List<UserBean> getMyMatchedUserBean(Integer user1No) {
        List<MatchBean> successfulMatches = findByUser1NoAndMatchStatusIsSuccess(user1No);
        List<UserBean> matchedUsers = new ArrayList<>();
        for (MatchBean match : successfulMatches) {
        	matchedUsers.add(uService.getUserData(match.getUser2No()));
        }
        return matchedUsers;
    }

    
    
    
    
    
    
	// 查詢所有配對
	public List<MatchBean> findAll(){
		return matchRepos.findAll();                                              // 檢索資料庫中所有的照片記錄
	}
    
	
    // 查詢一個配對
	public MatchBean getById(Integer matchNo) {                                   // 接收一個整數參數 photoNo，該參數是照片的唯一標識符。  //使用照片的唯一標識符 photoNo 來查詢資料庫，尋找具有相應標識符的社交照片對象。  //如果找到了該照片，則將其作為 SocialPhotosBean 對象返回。  //如果未找到該照片（即查詢結果為空），則返回 null。
		
		Optional<MatchBean> opMatch = matchRepos.findById(matchNo);               // 使用 findById 方法從 spRepos 中查詢照片。方法返回一個 Optional<SocialPhotosBean> 對象

		if(opMatch.isPresent()) {                                                 // 檢查 opPhoto 中是否存在查詢的照片  //isPresent() : Optional中的方法，用於檢查 Optional 對象是否包含一個非空值
			return opMatch.get();                                                 // true : 調用 Optional 類中的get()
		}
		
		return null;
	}
    
	
	//根據配對查詢
    public List<MatchBean> findByMatchStatus(Integer matchStatus) {
        return matchRepos.findByMatchStatus(matchStatus);
    }
    
    
    public List<MatchBean> findByUser1No(Integer user1No) {
        return matchRepos.findByUser1No(user1No);
    }
    
    public List<MatchBean> findByUser1NoAndMatchStatus(Integer user1No, Integer matchStatus) {
        return matchRepos.findByUser1NoAndMatchStatus(user1No, matchStatus);
    }
	
	
}