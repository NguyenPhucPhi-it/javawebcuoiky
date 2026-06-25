<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Chat</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <style>
        .chat-wrap { display:flex; height: calc(100vh - 140px); border:1px solid #ddd; border-radius:8px; background:#fff; }
        .thread-list { width:260px; border-right:1px solid #eee; overflow-y:auto; }
        .thread-item { padding:12px; cursor:pointer; border-bottom:1px solid #f0f0f0; font-size:13px; }
        .thread-item.active { background:#e9f3ff; }
        .thread-item b { display:block; margin-bottom:3px; }
        .thread-item small { color:#888; }
        .chat-box { flex:1; display:flex; flex-direction:column; }
        .messages { flex:1; overflow-y:auto; padding:12px; display:flex; flex-direction:column; gap:6px; }
        .msg { max-width:60%; padding:8px 12px; font-size:13px; }
        .msg.ADMIN { background:#0d6efd; color:#fff; margin-left:auto; border-radius:12px 12px 2px 12px; }
        .msg.USER  { background:#f1f1f1; color:#333; border-radius:12px 12px 12px 2px; }
        .input-row { display:flex; border-top:1px solid #eee; padding:10px; }
        .input-row input { flex:1; padding:8px 12px; border:1px solid #ddd; border-radius:6px; font-size:13px; }
        .input-row button { margin-left:8px; }
    </style>
</head>
<body>
    <div class="container-fluid main-page">
        <div class="app-main">
            <nav class="sidebar">
                <ul>
                    <li><a href="/admin/dashboard"><i class="fa-solid fa-house ico-side"></i>Dashboards</a></li>
                    <li><a href="/admin/brands"><i class="fa-solid fa-folder-open ico-side"></i>Quản lí danh mục</a></li>
                    <li><a href="/admin/products"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí sản phẩm</a></li>
                    <li><a href="/admin/comments"><i class="fa-solid fa-comments ico-side"></i>Quản lí bình luận</a></li>
                    <li><a href="/admin/post"><i class="fa-solid fa-newspaper ico-side"></i>Quản lý bài viết</a></li>
                    <li><a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a></li>
                    <li><a href="/admin/chat"><i class="fa-solid fa-message ico-side"></i>Chat khách hàng</a></li>
                    <li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li>
                </ul>
            </nav>

            <div class="main-content">
                <div class="container">
                    <h3 class="title-page">Chat khách hàng</h3>

                    <div class="chat-wrap">
                        <div class="thread-list" id="threadList"></div>
                        <div class="chat-box">
                            <div class="messages" id="messages"></div>
                            <div class="input-row">
                                <input type="text" id="msgInput" placeholder="Nhập tin nhắn..." disabled class="form-control"/>
                                <button id="sendBtn" disabled class="btn btn-primary ms-2">Gửi</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@7/bundles/stomp.umd.min.js"></script>
    <script>
        const ctx = "${pageContext.request.contextPath}";
        let stompClient = null, currentUserId = null, currentSub = null;

        function connect() {
            const socket = new SockJS(ctx + "/ws-chat");
            stompClient = new StompJs.Client({
                webSocketFactory: () => socket,
                onConnect: () => {
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
            if (currentSub) currentSub.unsubscribe();
            fetch(ctx + "/api/chat/history/" + userId)
                .then(res => res.json())
                .then(renderMessages);
            currentSub = stompClient.subscribe("/topic/chat/" + userId, (msg) => {
                appendMessage(JSON.parse(msg.body));
            });
            loadThreads();
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
        document.getElementById("msgInput").addEventListener("keypress", e => {
            if (e.key === "Enter") sendMessage();
        });

        function sendMessage() {
            const input = document.getElementById("msgInput");
            const content = input.value.trim();
            if (!content || !currentUserId) return;
            stompClient.publish({
                destination: "/app/chat/" + currentUserId,
                body: JSON.stringify({ senderRole: "ADMIN", content })
            });
            input.value = "";
        }

        connect();
    </script>
</body>
</html>