<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Chat</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script> -->
    <style>
        .chat-wrap{display:flex;height:80vh;border:1px solid #ddd;}
        .thread-list{width:280px;border-right:1px solid #ddd;overflow-y:auto;}
        .thread-item{padding:10px;cursor:pointer;border-bottom:1px solid #eee;}
        .thread-item.active{background:#e9f3ff;}
        .chat-box{flex:1;display:flex;flex-direction:column;}
        .messages{flex:1;overflow-y:auto;padding:10px;}
        .msg{margin:5px 0;max-width:60%;padding:8px 12px;border-radius:10px;}
        .msg.ADMIN{background:#0d6efd;color:#fff;margin-left:auto;}
        .msg.USER{background:#f1f1f1;}
        .input-row{display:flex;border-top:1px solid #ddd;padding:8px;}
        .input-row input{flex:1;padding:8px;}
    </style>
</head>
<body>
<h3 style="padding:10px;">Quản lý chat khách hàng</h3>

 <!-- <nav class="sidebar ">
                <ul>
                    <li>
                        <a href="/admin/dashboard"><i class="fa-solid fa-house ico-side"></i>Dashboards</a>
                    </li>
                    
                    <li>
                        <a href="/admin/brands"><i class="fa-solid fa-folder-open ico-side"></i>Quản lí danh muc</a>
                    </li>
                    <li>
                        <a href="/admin/products"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí sản phẩm</a>
                    </li>
                    <li>
                         <a href="/admin/comments"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí bình luận</a>
                    </li>
                    <li>
                         <a href="/admin/post"><i class="fa-solid fa-user ico-side"></i>Quản lý bài viết</a>
                    </li>
                    <li>
                      <a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a>
                    </li>
                    <li><li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li></li>

                </ul>
            </nav> -->
            <a href="/admin/dashboard">Quay lai</a>
<div class="chat-wrap">
    <div class="thread-list" id="threadList"></div>
    <div class="chat-box">
        <div class="messages" id="messages"></div>
        <div class="input-row">
            <input type="text" id="msgInput" placeholder="Nhập tin nhắn..." disabled/>
            <button id="sendBtn" disabled>Gửi</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@7/bundles/stomp.umd.min.js"></script>
<script>
const ctx = "${pageContext.request.contextPath}";
let stompClient = null;
let currentUserId = null;
let currentSub = null;

function connect() {
    const socket = new SockJS(ctx + "/ws-chat");
    stompClient = new StompJs.Client({
        webSocketFactory: () => socket,
        onConnect: () => {
            // lắng nghe thông báo có thread mới / tin mới để reload sidebar
            stompClient.subscribe("/topic/chat/admin/notify", () => loadThreads());
            loadThreads();
        }
    });
    stompClient.activate();
}

function loadThreads() {
    fetch(ctx + "/api/chat/threads")
        .then(res => res.json())
        .then(data => {
            const list = document.getElementById("threadList");
            list.innerHTML = "";
            data.forEach(t => {
                const div = document.createElement("div");
                div.className = "thread-item" + (t.userId === currentUserId ? " active" : "");
                div.innerHTML = "<b>" + t.userName + "</b><br/><small>" + t.lastMessage + "</small>";
                div.onclick = () => openThread(t.userId);
                list.appendChild(div);
            });
        });
}

function openThread(userId) {
    currentUserId = userId;
    document.getElementById("msgInput").disabled = false;
    document.getElementById("sendBtn").disabled = false;

    // huỷ subscribe cũ
    if (currentSub) currentSub.unsubscribe();

    fetch(ctx + "/api/chat/history/" + userId)
        .then(res => res.json())
        .then(renderMessages);

    currentSub = stompClient.subscribe("/topic/chat/" + userId, (msg) => {
        const m = JSON.parse(msg.body);
        appendMessage(m);
    });

    loadThreads(); // để cập nhật highlight active
}

function renderMessages(list) {
    const box = document.getElementById("messages");
    box.innerHTML = "";
    list.forEach(appendMessage);
}

function appendMessage(m) {
    const box = document.getElementById("messages");
    const div = document.createElement("div");
    div.className = "msg " + m.senderRole;
    div.innerText = m.content;
    box.appendChild(div);
    box.scrollTop = box.scrollHeight;
}

document.getElementById("sendBtn").onclick = sendMessage;
document.getElementById("msgInput").addEventListener("keypress", function(e){
    if (e.key === "Enter") sendMessage();
});

function sendMessage() {
    const input = document.getElementById("msgInput");
    const content = input.value.trim();
    if (!content || !currentUserId) return;
    stompClient.publish({
        destination: "/app/chat/" + currentUserId,
        body: JSON.stringify({ senderRole: "ADMIN", content: content })
    });
    input.value = "";
}

connect();
</script>
</body>
</html>