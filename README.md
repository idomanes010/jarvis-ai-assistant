# 🤖 J.A.R.V.I.S AI Assistant

J.A.R.V.I.S (Just A Rather Very Intelligent System) is a Full Stack AI-powered chatbot application built with Python and Flask.
The application provides a modern conversational interface inspired by Iron Man's J.A.R.V.I.S system and integrates with advanced language models to generate intelligent responses in real time.
---
## 🚀 Features

- AI-powered conversations
- Real-time chat interface
- Persistent conversation management
- Message history storage
- Modern J.A.R.V.I.S-inspired UI
- OpenAI API integration
- Custom Flask backend architecture
- Error handling and validation
- Responsive design
---
## 🛠️ Technology Stack

### Backend
- Python
- Flask
- OpenAI API
- RESTful Architecture
### Database

- Relational Database
- Custom DAL (Data Access Layer)

### Frontend

- HTML5
- CSS3
- Vanilla JavaScript
- Jinja2 Templates

### Architecture

- MVC-inspired design
- Template inheritance
- Service Layer
- Data Validation
- Error Handling

---

## 📂 Project Structure

```text
src/
│
├── controllers/
├── services/
├── dal/
├── models/
├── templates/
│   ├── home/
│   ├── about/
│   ├── errors/
│   └── layout/
│
├── static/
│   ├── css/
│   ├── js/
│   └── images/
│
└── app.py
```

---

## ⚙️ Installation
### Clone Repository

```bash
git clone <repository-url>
cd JARVIS
```

### Create Virtual Environment
```bash
python -m venv env
```
### Activate Environment
Windows:
```bash
env\Scripts\activate
```
Linux / Mac:

```bash
source env/bin/activate
```
### Install Dependencies

```bash
pip install -r requirements.txt
```
### Configure Environment Variables
Create a `.env` file:
```env
OPENAI_API_KEY=your_api_key_here
```
---
## ▶️ Run Application

```bash
flask --app src/app.py run --debug
```
or
```bash
python src/app.py
```
---
## 📸 Screenshots
### Home Screen
J.A.R.V.I.S command interface with real-time AI conversations.
### About Screen
System overview and technology stack.
### Error Handling
Custom J.A.R.V.I.S themed 404 error page.
---
## 🎯 Learning Objectives
This project demonstrates:
- Full Stack Web Development
- Flask Application Architecture
- REST API Design
- AI Integration
- Database Operations
- Frontend Development
- Template Inheritance
- Client-Server Communication
- Error Handling and Validation
---
## 👨‍💻 Developer
Developed by **Ido Manes**
Full Stack Python Development Course Project
---
## 📄 License
This project was created for educational purposes.