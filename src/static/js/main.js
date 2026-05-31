// Holds active conversation ID (lazy creation)
let currentConversationId = null;

const chatMessages = document.getElementById("chatMessages");
const chatWelcome = document.getElementById("chatWelcome");
const chatForm = document.getElementById("chatForm");
const userInput = document.getElementById("userInput");
const sendBtn = document.getElementById("sendBtn");

function appendMessage(sender, content) {
    chatWelcome.style.display = "none";
    const wrapper = document.createElement("div");
    wrapper.classList.add("message-wrapper", sender);
    if (sender === "assistant") {
        const label = document.createElement("div");
        label.classList.add("message-label");
        label.textContent = "J.A.R.V.I.S";
        wrapper.appendChild(label);
    }
    const bubble = document.createElement("div");
    bubble.classList.add("message-bubble");
    if (content instanceof HTMLElement) {
        bubble.appendChild(content);
    } else {
        bubble.textContent = content;
    }

    wrapper.appendChild(bubble);
    chatMessages.appendChild(wrapper);
    chatMessages.scrollTop = chatMessages.scrollHeight;
    return bubble;
}

function createTypingIndicator() {
    const container = document.createElement("div");
    container.classList.add("typing-container");
    for (let i = 0; i < 3; i++) {
        const dot = document.createElement("div");
        dot.classList.add("loading-dot");
        container.appendChild(dot);
    }
    return container;
}

function toggleInputState(state) {
    userInput.disabled = state;
    sendBtn.disabled = state;
}

async function createConversation() {
    const res = await fetch("/api/conversations", {
        method: "POST"
    });

    if (!res.ok) {
        throw new Error("Failed to create conversation");
    }

    const data = await res.json();
    currentConversationId = data.conversation_id;
}

async function sendMessage(text) {
    return fetch(`/api/conversations/${currentConversationId}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ content: text })
    });
}

async function handleSubmit() {
    const text = userInput.value.trim();
    if (!text) return;

    try {
        if (!currentConversationId) {
            await createConversation();
        }

        appendMessage("user", text);
        userInput.value = "";
        toggleInputState(true);

        const typing = createTypingIndicator();
        const bubble = appendMessage("assistant", typing);

        const response = await sendMessage(text);
        if (!response.ok) {
            throw new Error("Request failed");
        }

        const data = await response.json();
        bubble.textContent = data.content;
    } catch (err) {
        console.error(err);
        appendMessage("assistant", "System error. Please try again.");
    } finally {
        toggleInputState(false);
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }
}

function startNewChat() {
    currentConversationId = null;
    if (!chatMessages || !chatWelcome) return;
    chatMessages.innerHTML = "";
    chatWelcome.style.display = "";
    if (userInput) userInput.value = "";
    toggleInputState(false);
}

// Chat UI exists only on the home page
if (chatForm && userInput && chatMessages && chatWelcome && sendBtn) {
    chatForm.addEventListener("submit", (e) => {
        e.preventDefault();
        handleSubmit();
    });

    userInput.addEventListener("keydown", (e) => {
        if (e.key === "Enter" && !e.shiftKey) {
            e.preventDefault();
            handleSubmit();
        }
    });

    const newChatBtn = document.getElementById("sidebar-new-chat-btn");
    if (newChatBtn) {
        newChatBtn.addEventListener("click", (e) => {
            e.preventDefault();
            startNewChat();
            window.history.replaceState({}, "", "/home");
        });
    }

    if (new URLSearchParams(window.location.search).get("action") === "new") {
        startNewChat();
        window.history.replaceState({}, "", "/home");
    }
}
