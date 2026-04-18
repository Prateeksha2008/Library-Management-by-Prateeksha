<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Library Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">

<style>
/* Authentication Pages Styles */

:root {
    --auth-bg-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    --auth-card-shadow: 0 20px 60px rgba(0,0,0,0.1);
    --auth-card-hover-shadow: 0 25px 80px rgba(0,0,0,0.15);
    --auth-border-radius: 20px;
    --auth-transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

body.auth-page {
    background: var(--auth-bg-gradient);
    margin: 0;
    padding: 2rem 1rem;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

body.auth-page::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle, rgba(255,255,255,0.05) 1px, transparent 1px);
    background-size: 30px 30px;
    pointer-events: none;
    z-index: -1;
}

.login-container {
    position: relative;
    z-index: 2;
}

.login-card {
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: var(--auth-border-radius);
    box-shadow: var(--auth-card-shadow);
    padding: 2.5rem;
    max-width: 420px;
    width: 100%;
    transition: var(--auth-transition);
}

.login-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--auth-card-hover-shadow);
}

.login-header {
    text-align: center;
    margin-bottom: 2.5rem;
}

.login-icon {
    width: 80px;
    height: 80px;
    background: var(--primary-gradient);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 1.5rem;
    box-shadow: 0 10px 30px rgba(44, 62, 80, 0.3);
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

.login-icon i {
    font-size: 2.5rem;
    color: white;
}

.login-title {
    font-family: 'Playfair Display', serif;
    font-size: 2rem;
    font-weight: 600;
    background: var(--primary-gradient);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 0.5rem;
}

.login-subtitle {
    color: #6c757d;
    font-weight: 400;
    margin-bottom: 0;
}

.form-floating {
    margin-bottom: 1.5rem !important;
}

.btn-login {
    background: var(--primary-gradient);
    border: none;
    border-radius: 12px;
    padding: 0.875rem 1.5rem;
    font-weight: 600;
    font-size: 1.1rem;
    color: white;
    width: 100%;
    position: relative;
    overflow: hidden;
    box-shadow: 0 8px 25px rgba(44, 62, 80, 0.3);
    transition: var(--auth-transition);
}

.btn-login::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    transition: left 0.5s;
}

.btn-login:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 35px rgba(44, 62, 80, 0.4);
}

.btn-login:hover::before {
    left: 100%;
}

.form-check {
    margin: 1.5rem 0;
}

.form-check-input:checked {
    background-color: #1ABC9C;
    border-color: #1ABC9C;
}

.forgot-link {
    color: #1ABC9C;
    text-decoration: none;
    font-weight: 500;
    transition: var(--auth-transition);
}

.forgot-link:hover {
    color: #16A085;
    text-decoration: underline;
}

.divider {
    text-align: center;
    margin: 2rem 0;
    position: relative;
}

.divider::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    height: 1px;
    background: #e9ecef;
}

.divider span {
    background: white;
    padding: 0 1rem;
    color: #6c757d;
    font-size: 0.9rem;
}

@media (max-width: 576px) {
    body.auth-page {
        padding: 1rem 0.5rem;
    }

    .login-card {
        margin: 0;
        padding: 1.5rem;
    }

    .login-title {
        font-size: 1.75rem;
    }

    .login-icon {
        width: 60px;
        height: 60px;
        margin-bottom: 1rem;
    }

    .login-icon i {
        font-size: 2rem;
    }
}

/* Common Library Management System Styles */

:root {
    --primary-gradient: linear-gradient(135deg, #2C3E50 0%, #1ABC9C 100%);
    --secondary-gradient: linear-gradient(135deg, #F39C12 0%, #E67E22 100%);
    --success-gradient: linear-gradient(135deg, #27AE60 0%, #2ECC71 100%);
    --info-gradient: linear-gradient(135deg, #3498DB 0%, #5DADE2 100%);
    --danger-gradient: linear-gradient(135deg, #E74C3C 0%, #EC7063 100%);
    --warning-gradient: linear-gradient(135deg, #F39C12 0%, #F7DC6F 100%);
    --bg-gradient: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
    --sidebar-bg: linear-gradient(180deg, #34495e 0%, #2c3e50 100%);
    --card-shadow: 0 10px 30px rgba(0,0,0,0.1);
    --card-hover-shadow: 0 15px 40px rgba(0,0,0,0.15);
    --border-radius: 12px;
    --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

* {
    transition: var(--transition);
}

body {
    font-family: 'Inter', sans-serif;
    font-size: .875rem;
    background: var(--bg-gradient);
    min-height: 100vh;
}

h1, h2, h3, h4, h5, h6 {
    font-family: 'Playfair Display', serif;
    font-weight: 500;
}

/* Header Styles */
.navbar {
    background: var(--primary-gradient) !important;
    backdrop-filter: blur(10px);
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

.navbar-brand {
    font-family: 'Playfair Display', serif;
    font-weight: 600;
    font-size: 1.5rem;
    text-shadow: 0 2px 4px rgba(0,0,0,0.3);
}

/* Sidebar Styles */
.sidebar {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    z-index: 100;
    padding: 48px 0 0;
    background: var(--sidebar-bg);
    border-right: 1px solid rgba(255,255,255,0.1);
    backdrop-filter: blur(10px);
}

@media (max-width: 767.98px) {
    .sidebar { top: 5rem; }
}

.sidebar-sticky {
    height: calc(100vh - 48px);
    overflow-x: hidden;
    overflow-y: auto;
    padding: 1rem 0;
}

.sidebar .nav-link {
    color: rgba(255,255,255,0.8);
    padding: 0.75rem 1.5rem;
    margin: 0.25rem 1rem;
    border-radius: var(--border-radius);
    font-weight: 500;
    display: flex;
    align-items: center;
}

.sidebar .nav-link:hover {
    color: #fff;
    background: rgba(255,255,255,0.1);
    transform: translateX(5px);
}

.sidebar .nav-link.active {
    background: linear-gradient(135deg, #1ABC9C 0%, #16A085 100%);
    color: #fff !important;
    box-shadow: 0 4px 15px rgba(26, 188, 156, 0.3);
}

.sidebar .nav-link i {
    margin-right: 0.5rem;
    width: 20px;
    text-align: center;
}

/* Main Content Styles */
.main-content {
    background: rgba(255,255,255,0.8);
    backdrop-filter: blur(10px);
    border-radius: var(--border-radius);
    margin: 1rem;
    padding: 2rem;
    box-shadow: var(--card-shadow);
}

/* Page Header Styles */
.page-header {
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(10px);
    border-radius: var(--border-radius);
    padding: 1.5rem;
    margin-bottom: 2rem;
    border: 1px solid rgba(255,255,255,0.2);
    box-shadow: var(--card-shadow);
}

.page-header.header-with-btn {
    padding: 1.5rem 2rem;
    margin: 1rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
}

.page-header h1 {
    margin: 0;
    background: var(--primary-gradient);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    font-weight: 600;
}

/* Button Styles */
.btn-modern {
    background: var(--primary-gradient);
    border: none;
    border-radius: var(--border-radius);
    padding: 0.75rem 1.5rem;
    font-weight: 600;
    color: white;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    box-shadow: 0 4px 15px rgba(44, 62, 80, 0.3);
    transition: var(--transition);
}

.btn-modern:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(44, 62, 80, 0.4);
    color: white;
    text-decoration: none;
}

/* Statistics Card Styles */
.stat-card {
    border: none;
    border-radius: var(--border-radius);
    box-shadow: var(--card-shadow);
    transition: var(--transition);
    overflow: hidden;
    position: relative;
}

.stat-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: inherit;
    z-index: -1;
}

.stat-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--card-hover-shadow);
}

.stat-card.primary {
    background: var(--primary-gradient);
}

.stat-card.warning {
    background: var(--warning-gradient);
}

.stat-card.success {
    background: var(--success-gradient);
}

.stat-card.info {
    background: var(--info-gradient);
}

.stat-card .card-body {
    position: relative;
    z-index: 2;
    padding: 1.5rem;
}

.stat-card .card-title {
    font-size: 0.9rem;
    font-weight: 600;
    margin-bottom: 0.5rem;
    opacity: 0.9;
}

.stat-card .card-text {
    font-size: 2.5rem;
    font-weight: 700;
    margin: 0;
    text-shadow: 0 2px 4px rgba(0,0,0,0.2);
}

.stat-card .stat-icon {
    position: absolute;
    top: 1rem;
    right: 1rem;
    font-size: 2.5rem;
    opacity: 0.3;
}

/* Table Styles */
.table-container {
    background: rgba(255,255,255,0.95);
    backdrop-filter: blur(10px);
    border-radius: var(--border-radius);
    box-shadow: var(--card-shadow);
    border: 1px solid rgba(255,255,255,0.2);
    overflow: hidden;
    margin: 1rem;
    margin-bottom: 2rem;
}

.table {
    margin-bottom: 0;
}

.table thead th {
    background: var(--primary-gradient);
    color: white;
    border: none;
    font-weight: 600;
    padding: 1rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    font-size: 0.85rem;
}

.table tbody tr {
    transition: var(--transition);
}

.table tbody tr:hover {
    background-color: rgba(26, 188, 156, 0.1);
    transform: scale(1.01);
}

.table tbody td {
    padding: 1rem;
    vertical-align: middle;
    border-color: rgba(0,0,0,0.05);
}

/* Action Button Styles */
.action-btn {
    border: none;
    border-radius: 8px;
    padding: 0.5rem;
    margin: 0 0.25rem;
    transition: var(--transition);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
}

.action-btn.edit {
    background: var(--warning-gradient);
    color: white;
    box-shadow: 0 4px 10px rgba(243, 156, 18, 0.3);
}

.action-btn.delete {
    background: var(--danger-gradient);
    color: white;
    box-shadow: 0 4px 10px rgba(231, 76, 60, 0.3);
}

.action-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0,0,0,0.2);
}

/* Badge Styles */
.badge-modern {
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-weight: 500;
    font-size: 0.8rem;
}

.badge-fiction {
    background: var(--info-gradient);
    color: white;
}

.badge-technology {
    background: var(--success-gradient);
    color: white;
}

/* Search Container Styles */
.search-container {
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(10px);
    border-radius: var(--border-radius);
    padding: 1.5rem;
    margin: 1rem;
    margin-bottom: 2rem;
    border: 1px solid rgba(255,255,255,0.2);
    box-shadow: var(--card-shadow);
}

.search-input {
    border: 2px solid #e9ecef;
    border-radius: var(--border-radius);
    padding: 0.875rem 1rem;
    font-size: 1rem;
    background: rgba(255, 255, 255, 0.8);
    backdrop-filter: blur(10px);
    transition: var(--transition);
}

.search-input:focus {
    border-color: #1ABC9C;
    box-shadow: 0 0 0 0.25rem rgba(26, 188, 156, 0.25);
    background: white;
    outline: none;
}

/* Section Title Styles */
.section-title {
    font-family: 'Playfair Display', serif;
    font-weight: 600;
    color: #2c3e50;
    margin-bottom: 1.5rem;
    padding-bottom: 0.5rem;
    border-bottom: 3px solid;
    border-image: var(--primary-gradient) 1;
    display: inline-block;
}

/* Form Styles */
.form-floating {
    margin-bottom: 1.5rem;
}

.form-floating .form-control {
    border: 2px solid #e9ecef;
    border-radius: var(--border-radius);
    padding: 1rem 0.75rem;
    font-size: 1rem;
    background: rgba(255, 255, 255, 0.8);
    backdrop-filter: blur(10px);
    transition: var(--transition);
}

.form-floating .form-control:focus {
    border-color: #1ABC9C;
    box-shadow: 0 0 0 0.25rem rgba(26, 188, 156, 0.25);
    background: white;
}

.form-floating label {
    color: #6c757d;
    font-weight: 500;
}

/* Form Container Styles */
.form-container {
    background: rgba(255,255,255,0.95);
    backdrop-filter: blur(10px);
    border-radius: var(--border-radius);
    padding: 2rem;
    margin: 1rem;
    box-shadow: var(--card-shadow);
    border: 1px solid rgba(255,255,255,0.2);
}

/* Row spacing for forms */
.form-container .row {
    margin-bottom: 1rem;
}

.form-container .row:last-child {
    margin-bottom: 0;
}

/* General form spacing */
.row .form-floating {
    margin-bottom: 1.5rem;
}

/* Button spacing */
.btn-modern, .btn-login {
    margin-top: 1rem;
}

/* Additional form group spacing */
.mb-3 {
    margin-bottom: 1.5rem !important;
}

.mb-4 {
    margin-bottom: 2rem !important;
}

/* Card and content spacing */
.card.mb-3, .stat-card.mb-3 {
    margin-bottom: 1.5rem !important;
}

/* Info card spacing */
.info-card {
    margin-bottom: 2rem;
}

/* Form actions styling */
.form-actions {
    display: flex;
    justify-content: flex-end;
    gap: 1rem;
    margin-top: 2rem;
    padding-top: 1.5rem;
    border-top: 1px solid rgba(0,0,0,0.1);
}

.form-actions.text-center {
    justify-content: center;
}

/* Form Select Fixes */
.form-floating > .form-select {
    padding-top: 1.625rem;
    padding-bottom: 0.625rem;
}

.form-floating > .form-select:focus ~ label,
.form-floating > .form-select:not([value=""]):valid ~ label {
    opacity: 0.65;
    transform: scale(0.85) translateY(-0.5rem) translateX(0.15rem);
}

.form-floating > .form-select[value=""] ~ label,
.form-floating > .form-select:invalid ~ label {
    opacity: 0.65;
    transform: scale(1) translateY(0) translateX(0);
    top: 50%;
    transform: translateY(-50%);
}

/* Responsive Design */
@media (max-width: 768px) {
    .page-header.header-with-btn {
        flex-direction: column;
        text-align: center;
    }

    .table-responsive {
        font-size: 0.8rem;
    }
}

</style>


</head>
<body class="auth-page">
<div class="login-container">
    <div class="login-card">
        <div class="login-header">
            <div class="login-icon">
                <i class="bi bi-book-half"></i>
            </div>
            <h3 class="login-title">Prateeksha's Library</h3>
            <p class="login-subtitle">Please sign in to your library account</p>
        </div>
		
		 <c:if test="${not empty errorMessage }">
		    <div class="alert alert-danger alert-dismissible fade show" role="alert">
		        <c:out value="${errorMessage}"/>
		        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		    </div>
		 </c:if>
		 
		
        <form action="Authentication" method="post">
        <input type="hidden" name="action" value="checkLogin">
            <div class="form-floating">
                <input type="text" class="form-control" id="username" name="username" placeholder="Username">
                <label for="username"><i class="bi bi-person-fill me-2"></i>Username</label>
            </div>
            <div class="text-danger small mb-3" id="usernameError"></div>

            <div class="form-floating">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                <label for="password"><i class="bi bi-lock-fill me-2"></i>Password</label>
            </div>
            <div class="text-danger small mb-3" id="passwordError"></div>

           
            <button type="submit" class="btn btn-login">
                <i class="bi bi-box-arrow-in-right me-2"></i>Sign In
            </button>
 

             
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
    // Add subtle animation to form elements
  //  document.addEventListener('DOMContentLoaded', function() {
    //    const formControls = document.querySelectorAll('.form-control');

      //  formControls.forEach(control => {
      ////      control.addEventListener('focus', function() {
           //     this.parentElement.style.transform = 'translateY(-2px)';
           // });

          //  control.addEventListener('blur', function() {
            //    this.parentElement.style.transform = 'translateY(0)';
          //  });
       // });
   // });
  
function setLoginValidation() {
const form = document.querySelector('.login-container form')
if(!form) {
	return
}

form.addEventListener('submit', function(event) {
const username = document.getElementById('username').value.trim()
const password = document.getElementById('password').value.trim()
const usernameError = document.getElementById('usernameError')
const passwordError = document.getElementById('passwordError')

usernameError.textContent=''
passwordError.textContent=''


let hasError = false;
if(!username) {
	
usernameError.textContent ="Please enter username"
hasError = true;
}

if(!password) {
passwordError.textContent = "Please enter password"
hasError = true;
}
if(hasError) {
event.preventDefault();
}
})
}
if(document.readyState == 'loading')
	{
	document.addEventListener('DOMContentLoaded',setLoginValidation)
	}
else
	{
	setLoginValidation()
	} 
</script>
</body>
</html>
