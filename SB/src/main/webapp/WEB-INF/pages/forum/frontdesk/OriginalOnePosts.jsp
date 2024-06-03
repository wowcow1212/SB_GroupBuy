<%@ page import="com.forum.bean.PostsBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>單筆文章</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<div>
    <form method="get" action="/postsFrontDesk/AllPosts">
        <button type="submit">返回</button>
    </form>
</div>

<c:forEach var="post" items="${updateSelect}">
    <div>
        <div><c:out value="${post.categoriesBean.title_name}" /></div>
        <div><c:out value="${post.title}" /></div>
        <div><c:out value="${post.userBean.userChineseName}" /></div>
        <div><c:out value="${post.update_date}" /></div>
        <div><c:out value="${post.content}" /></div>
        <div><c:out value="${post.view_count}" /></div>
        <div><span id="likesCount${post.post_no}">${post.likesBean.size()}</span></div>
        <div><img class="avatar" src="http://localhost:8080/localimages/${post.userBean.avatar}" alt="" style="width:300px"></div>
        <div><img src="http://localhost:8080/localimages/${post.image_url}"></div>
        <div>
            <button class="like-btn" onclick="likeOrUnlike(${post.post_no})">喜歡</button>
        </div>
        <div>
            <form method="post" action="/postsFrontDesk/DeletePosts" onsubmit="return confirm('您確定要刪除這個帖子嗎？');">
                <input type="hidden" name="postsNo" value="${post.post_no}">
                <input type="hidden" name="_method" value="delete">
                <button type="submit" ${post.userBean.userNo==userNo?"":"hidden"}>刪除</button>
            </form>
        </div>
        <div>
            <form method="get" action="/postsFrontDesk/UpdateSelectPosts">
                <input type="hidden" name="postsNo" value="${post.post_no}">
                <button type="submit" ${post.userBean.userNo==userNo?"":"hidden"}>編輯</button>
            </form>
        </div>
        <div>
            <form method="get" action="/reportsFrontDesk/SelectReportsPosts">
                <input type="hidden" name="postsNo" value="${post.post_no}">
                <button type="submit">檢舉</button>
            </form>
        </div>
        <div>
    		<form id="replyForm" method="post" action="/repliesFrontDesk/InsertReplies">
        		<input type="hidden" name="user_no" value="${post.userBean.userNo}">
        		<input type="hidden" name="post_no" value="${post.post_no}">
        		<h2>回覆：</h2>
        		<textarea id="replyContent" name="content" rows="4" cols="50" required></textarea>
        		<br>
        		<button type="button" onclick="submitReply()">提交回覆</button>
    		</form>
		</div>
    </div>
</c:forEach>

<div>
    <c:if test="${not empty repliesM}">
        <c:forEach var="replies" items="${repliesM}">
                <div><c:out value="${replies.content}" /></div>
                <div><c:out value="${replies.update_date}" /></div>
                <div><c:out value="${replies.userBean.userChineseName}" /></div>
                <div><img class="avatar" src="http://localhost:8080/localimages/${replies.userBean.avatar}" alt="" style="width:300px"></div>
               
                <div>
    				<button class="delete-btn" data-reply-id="${replies.reply_no}" onclick="confirmDelete(this)">刪除</button>
				</div>
                
                <div>
                <form method="get" action="/repliesFrontDesk/UpdateSelectReplies">
                    <input type="hidden" name="repliesNo" value="${replies.reply_no}">
                    <button type="submit">編輯</button>
                </form>
            	</div>
        </c:forEach>
    </c:if>
    <c:if test="${empty repliesM}">
        <div>
            <div colspan="5">尚無回覆</div>
        </div>
    </c:if>
</div>

<script>
	//喜歡
    function likeOrUnlike(post_no) {
        $.ajax({
            url: "/likesFrontDesk/likeOrUnlike?post_no=" + post_no,
            method: 'POST',
            success: function (response) {
                var likesCountSpan = document.getElementById('likesCount' + post_no);
                var currentLikesCount = parseInt(likesCountSpan.innerText);
                if (response === "Liked") {
                    likesCountSpan.innerText = currentLikesCount + 1;
                } else if (response === "Unliked") {
                    likesCountSpan.innerText = currentLikesCount - 1;
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    
	//回覆
    function submitReply() {
        $.ajax({
            url: "/repliesFrontDesk/InsertReplies",
            method: 'POST',
            data: {
                user_no: $("#replyForm input[name='user_no']").val(),
                post_no: $("#replyForm input[name='post_no']").val(),
                content: $("#replyContent").val()
            },
            success: function (response) {
                // 在這裡處理成功提交回覆後的邏輯

                // 清空回覆內容輸入框
                $("#replyContent").val('');
                
                // 重新整理頁面以顯示新回覆
                location.reload();
            },
            error: function (error) {
                console.log(error);
            }
        });
        
    }
       
		//刪除回覆
        function deleteReply(button) {
         	// 這裡改為使用 'reply-id' 而不是 'reply-no'
            var replyNo = $(button).data('reply-id'); 
            $.ajax({
                url: "/repliesFrontDesk/DeleteReplies",
                method: 'POST', // 或 'DELETE'，根據您的後端設定
                data: { repliesNo: replyNo },
                success: function (response) {
                	// 刪除成功後，直接移除回覆的部分
                    $(button).closest('.reply').remove(); // 刪除整個回應 div
                    
                    location.reload();
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
        
        //確定是否刪除回覆
        function confirmDelete(button) {
            var replyNo = $(button).data('reply-id');
            var confirmation = confirm('您確定要刪除此回覆嗎？');
            if (confirmation) {
                deleteReply(button); // 如果用戶確定刪除，則調用刪除回覆的函數
            }
        }
        
        function editReply(replyId) {
            // 獲取回覆內容的 div 元素
            var replyContentDiv = document.getElementById('replyContent_' + replyId);
            
            // 獲取回覆的原始內容
            var originalContent = replyContentDiv.innerText.trim();
            
            // 將原始內容替換為可編輯的文本框
            replyContentDiv.innerHTML = '<textarea id="editedReplyContent_' + replyId + '" rows="4" cols="50">' + originalContent + '</textarea>';
            
            // 添加保存按鈕
            replyContentDiv.innerHTML += '<button onclick="saveEditedReply(' + replyId + ')">保存</button>';
        }
		
</script>
</body>
</html>