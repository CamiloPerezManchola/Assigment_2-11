<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #0f172a, #1e3a8a, #2563eb);
            padding: 20px;
        }

        .login-container {
            width: 100%;
            max-width: 420px;
            background: white;
            padding: 45px 40px;
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.25);
        }

        .login-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .login-icon {
            width: 70px;
            height: 70px;
            background: #eff6ff;
            color: #2563eb;
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            margin: 0 auto 20px;
        }

        .login-header h2 {
            color: #0f172a;
            font-size: 27px;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .login-header p {
            color: #64748b;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 22px;
        }

        .form-group label {
            display: block;
            color: #334155;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 9px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            font-size: 14px;
            outline: none;
            transition: all 0.3s ease;
            background: #f8fafc;
        }

        .form-group input:focus {
            border-color: #2563eb;
            background: white;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        .btn-login {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            color: white;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 8px;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.3);
        }

        .message {
            padding: 13px 15px;
            border-radius: 9px;
            font-size: 13px;
            margin-bottom: 20px;
            text-align: center;
        }

        .error {
            color: #b91c1c;
            background: #fef2f2;
            border: 1px solid #fecaca;
        }

        .success {
            color: #15803d;
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
        }

        .login-footer {
            text-align: center;
            margin-top: 30px;
            color: #94a3b8;
            font-size: 12px;
        }

        /* TEST ACCOUNTS MENU */

        .test-menu-container {
            position: fixed;
            bottom: 25px;
            right: 25px;
            z-index: 1000;
        }

        .test-menu-toggle {
            background: #0f172a;
            color: white;
            border: 1px solid rgba(255,255,255,0.2);
            padding: 13px 18px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 5px 20px rgba(0,0,0,0.25);
            transition: 0.3s;
        }

        .test-menu-toggle:hover {
            background: #2563eb;
            transform: translateY(-2px);
        }

        .test-menu {
            display: none;
            position: absolute;
            bottom: 60px;
            right: 0;
            width: 270px;
            background: white;
            border-radius: 15px;
            padding: 18px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.25);
            animation: appear 0.2s ease;
        }

        .test-menu.active {
            display: block;
        }

        @keyframes appear {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .test-menu h3 {
            color: #0f172a;
            font-size: 15px;
            margin-bottom: 5px;
        }

        .test-menu p {
            color: #64748b;
            font-size: 11px;
            margin-bottom: 15px;
        }

        .role-option {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 11px;
            border: 1px solid #e2e8f0;
            border-radius: 9px;
            margin-bottom: 8px;
            transition: 0.2s;
        }

        .role-option:hover {
            background: #f8fafc;
            border-color: #2563eb;
        }

        .role-info {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .role-name {
            font-size: 12px;
            font-weight: 700;
            color: #1e293b;
        }

        .role-user {
            font-size: 11px;
            color: #94a3b8;
        }

        .role-badge {
            font-size: 9px;
            font-weight: 700;
            padding: 4px 7px;
            border-radius: 5px;
            background: #eff6ff;
            color: #2563eb;
        }

        .btn-fill {
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 7px 10px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-fill:hover {
            background: #1d4ed8;
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 35px 25px;
            }

            .test-menu-container {
                bottom: 15px;
                right: 15px;
            }
        }
    </style>
</head>

<body>

<div class="login-container">

    <div class="login-header">
        <div class="login-icon">🔐</div>
        <h2>Bienvenido</h2>
        <p>Introduce tus credenciales para continuar</p>
    </div>

    <c:if test="${param.error != null}">
        <div class="message error">
            ⚠️ Usuario o contraseña incorrectos.
        </div>
    </c:if>

    <c:if test="${param.logout != null}">
        <div class="message success">
            ✓ Has cerrado sesión correctamente.
        </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/doLogin">

        <div class="form-group">
            <label for="username">Usuario</label>
            <input
                type="text"
                id="username"
                name="username"
                placeholder="Introduce tu usuario"
                autocomplete="username"
                required
            />
        </div>

        <div class="form-group">
            <label for="password">Contraseña</label>
            <input
                type="password"
                id="password"
                name="password"
                placeholder="Introduce tu contraseña"
                autocomplete="current-password"
                required
            />
        </div>

        <input
            type="hidden"
            name="${_csrf.parameterName}"
            value="${_csrf.token}"
        />

        <button type="submit" class="btn-login">
            Iniciar sesión →
        </button>

    </form>

    <div class="login-footer">
        © 2026 · Acceso seguro al sistema
    </div>

</div>


<!-- TEST ACCOUNTS FLOATING MENU -->

<div class="test-menu-container">

    <div class="test-menu" id="testMenu">

        <h3>🧪 Cuentas de prueba</h3>
        <p>Selecciona un rol para rellenar las credenciales.</p>

        <div class="role-option">
            <div class="role-info">
                <span class="role-name">Administrator</span>
                <span class="role-user">admin</span>
                <span class="role-badge">ADMIN</span>
            </div>
            <button type="button" class="btn-fill"
                onclick="fillCredentials('admin', 'admin123')">
                Usar
            </button>
        </div>

        <div class="role-option">
            <div class="role-info">
                <span class="role-name">Standard User</span>
                <span class="role-user">user</span>
                <span class="role-badge">USER</span>
            </div>
            <button type="button" class="btn-fill"
                onclick="fillCredentials('user', 'user123')">
                Usar
            </button>
        </div>

        <div class="role-option">
            <div class="role-info">
                <span class="role-name">Editor</span>
                <span class="role-user">editor</span>
                <span class="role-badge">EDITOR</span>
            </div>
            <button type="button" class="btn-fill"
                onclick="fillCredentials('editor', 'editor123')">
                Usar
            </button>
        </div>

        <div class="role-option">
            <div class="role-info">
                <span class="role-name">Creator</span>
                <span class="role-user">creator</span>
                <span class="role-badge">CREATOR</span>
            </div>
            <button type="button" class="btn-fill"
                onclick="fillCredentials('creator', 'creator123')">
                Usar
            </button>
        </div>

    </div>

    <button type="button" class="test-menu-toggle" onclick="toggleTestMenu()">
        🧪 Test Accounts
    </button>

</div>


<script>
    function toggleTestMenu() {
        document.getElementById('testMenu').classList.toggle('active');
    }

    function fillCredentials(username, password) {
        document.getElementById('username').value = username;
        document.getElementById('password').value = password;

        document.getElementById('testMenu').classList.remove('active');
    }

    // Close the menu when clicking outside it
    document.addEventListener('click', function(event) {
        const container = document.querySelector('.test-menu-container');

        if (!container.contains(event.target)) {
            document.getElementById('testMenu').classList.remove('active');
        }
    });
</script>

</body>
</html>
