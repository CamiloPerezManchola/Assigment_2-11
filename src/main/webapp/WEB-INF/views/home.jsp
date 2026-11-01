<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>

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
            background: #f1f5f9;
            color: #1e293b;
        }

        /* NAVBAR */

        .navbar {
            background: #0f172a;
            padding: 18px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .navbar-brand {
            font-size: 19px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .navbar-brand span {
            color: #60a5fa;
        }

        .navbar-user {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 13px;
            color: #cbd5e1;
        }

        .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            color: white;
        }

        /* MAIN */

        .container {
            max-width: 1100px;
            margin: 45px auto;
            padding: 0 25px;
        }

        /* WELCOME CARD */

        .welcome-card {
            background: linear-gradient(120deg, #1e3a8a, #2563eb);
            border-radius: 18px;
            padding: 38px;
            color: white;
            margin-bottom: 35px;
            box-shadow: 0 12px 30px rgba(37,99,235,0.18);
        }

        .welcome-card h1 {
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .welcome-card p {
            color: #dbeafe;
            font-size: 14px;
        }

        .welcome-badge {
            display: inline-block;
            margin-top: 20px;
            background: rgba(255,255,255,0.15);
            padding: 8px 13px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        /* SECTION */

        .section-title {
            margin-bottom: 18px;
        }

        .section-title h2 {
            font-size: 19px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 6px;
        }

        .section-title p {
            font-size: 13px;
            color: #64748b;
        }

        /* CARDS */

        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 18px;
            margin-bottom: 40px;
        }

        .access-card {
            display: block;
            text-decoration: none;
            background: white;
            padding: 25px;
            border-radius: 14px;
            border: 1px solid #e2e8f0;
            transition: all 0.25s ease;
        }

        .access-card:hover {
            transform: translateY(-5px);
            border-color: #93c5fd;
            box-shadow: 0 12px 25px rgba(15,23,42,0.08);
        }

        .card-icon {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
            margin-bottom: 17px;
        }

        .admin-icon {
            background: #fef3c7;
        }

        .user-icon {
            background: #dbeafe;
        }

        .editor-icon {
            background: #f3e8ff;
        }

        .creator-icon {
            background: #dcfce7;
        }

        .create-icon {
            background: #fce7f3;
        }

        .access-card h3 {
            font-size: 15px;
            color: #0f172a;
            margin-bottom: 7px;
        }

        .access-card p {
            font-size: 12px;
            color: #64748b;
            line-height: 1.6;
        }

        .card-arrow {
            display: block;
            text-align: right;
            color: #2563eb;
            font-size: 18px;
            margin-top: 12px;
        }

        /* TEST SECTION */

        .test-section {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 25px;
            margin-bottom: 30px;
        }

        .test-section h2 {
            font-size: 17px;
            margin-bottom: 7px;
            color: #0f172a;
        }

        .test-section > p {
            font-size: 12px;
            color: #64748b;
            margin-bottom: 20px;
        }

        .test-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }

        .test-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            padding: 11px 16px;
            border-radius: 9px;
            font-size: 12px;
            font-weight: 700;
            transition: 0.2s;
        }

        .error-500 {
            background: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
        }

        .error-500:hover {
            background: #fee2e2;
        }

        .error-404 {
            background: #fff7ed;
            color: #c2410c;
            border: 1px solid #fed7aa;
        }

        .error-404:hover {
            background: #ffedd5;
        }

        /* FOOTER */

        .footer {
            text-align: center;
            padding: 25px;
            color: #94a3b8;
            font-size: 11px;
        }

        /* LOGOUT */

        .logout-form {
            margin: 0;
        }

        .logout-btn {
            background: #dc2626;
            color: white;
            border: none;
            padding: 10px 17px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }

        .logout-btn:hover {
            background: #b91c1c;
            transform: translateY(-1px);
        }

        @media (max-width: 600px) {
            .navbar {
                padding: 16px 20px;
            }

            .navbar-brand {
                font-size: 16px;
            }

            .navbar-user span {
                display: none;
            }

            .container {
                margin: 25px auto;
                padding: 0 16px;
            }

            .welcome-card {
                padding: 28px 22px;
            }

            .welcome-card h1 {
                font-size: 23px;
            }

            .cards-grid {
                grid-template-columns: 1fr;
            }

            .test-buttons {
                flex-direction: column;
            }

            .test-btn {
                justify-content: center;
            }
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->

    <nav class="navbar">

        <div class="navbar-brand">
            SECURITY<span>APP</span>
        </div>

        <div class="navbar-user">
            <div class="user-avatar">
                <sec:authentication property="name"/>
            </div>

            <span>
                <sec:authentication property="name"/>
            </span>

            <form method="post"
                  action="${pageContext.request.contextPath}/logout"
                  class="logout-form">

                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>

                <button type="submit" class="logout-btn">
                    ↪ Log out
                </button>
            </form>
        </div>

    </nav>


    <!-- MAIN CONTENT -->

    <main class="container">

        <!-- WELCOME -->

        <section class="welcome-card">
            <h1>
                Welcome back, <sec:authentication property="name"/>! 👋
            </h1>

            <p>
                Welcome to your application dashboard.
                Select an option below to explore the different access levels.
            </p>

            <div class="welcome-badge">
                ✓ AUTHENTICATED SESSION
            </div>
        </section>


        <!-- ROLE ACCESS -->

        <div class="section-title">
            <h2>Application Modules</h2>
            <p>Explore the different endpoints and role-based access controls.</p>
        </div>


        <div class="cards-grid">

            <a href="${pageContext.request.contextPath}/admin/hello"
               class="access-card">

                <div class="card-icon admin-icon">👑</div>
                <h3>Admin Panel</h3>
                <p>Access the administrator endpoint and test ADMIN permissions.</p>
                <span class="card-arrow">→</span>
            </a>


            <a href="${pageContext.request.contextPath}/user/hello"
               class="access-card">

                <div class="card-icon user-icon">👤</div>
                <h3>User Area</h3>
                <p>Access the standard user endpoint and test USER permissions.</p>
                <span class="card-arrow">→</span>
            </a>


            <a href="${pageContext.request.contextPath}/editor/hello"
               class="access-card">

                <div class="card-icon editor-icon">✏️</div>
                <h3>Editor Workspace</h3>
                <p>Access the editor endpoint and test EDITOR permissions.</p>
                <span class="card-arrow">→</span>
            </a>


            <a href="${pageContext.request.contextPath}/creator/hello"
               class="access-card">

                <div class="card-icon creator-icon">🎨</div>
                <h3>Creator Space</h3>
                <p>Access the creator endpoint and test CREATOR permissions.</p>
                <span class="card-arrow">→</span>
            </a>


            <a href="${pageContext.request.contextPath}/creator/create"
               class="access-card">

                <div class="card-icon create-icon">✨</div>
                <h3>Create Content</h3>
                <p>Test the content creation endpoint with the appropriate role.</p>
                <span class="card-arrow">→</span>
            </a>

        </div>


        <!-- ERROR TESTING -->

        <section class="test-section">

            <h2>🧪 Error Testing</h2>

            <p>
                Use these endpoints to test how the application handles HTTP errors.
            </p>

            <div class="test-buttons">

                <a href="${pageContext.request.contextPath}/test/error"
                   class="test-btn error-500">

                    ⚠️ Force HTTP 500
                </a>

                <a href="${pageContext.request.contextPath}/does-not-exist"
                   class="test-btn error-404">

                    🔍 Force HTTP 404
                </a>

            </div>

        </section>

    </main>


    <!-- FOOTER -->

    <footer class="footer">
        © 2026 SecurityApp · Spring Security Demonstration
    </footer>

</body>
</html>
