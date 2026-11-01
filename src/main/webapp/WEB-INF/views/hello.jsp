<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role Access</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #0f172a, #1e3a8a, #2563eb);
            padding: 20px;
        }

        .hello-card {
            background: white;
            width: 100%;
            max-width: 470px;
            padding: 45px 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 25px 60px rgba(0,0,0,0.2);
        }

        .role-icon {
            width: 80px;
            height: 80px;
            background: #eff6ff;
            border-radius: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 38px;
            margin: 0 auto 25px;
        }

        .badge {
            display: inline-block;
            background: #eff6ff;
            color: #2563eb;
            padding: 7px 14px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 0.7px;
            margin-bottom: 20px;
        }

        h2 {
            color: #0f172a;
            font-size: 27px;
            font-weight: 800;
            margin-bottom: 12px;
        }

        .description {
            color: #64748b;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        .access-info {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
            color: #475569;
            font-size: 12px;
        }

        .access-info strong {
            color: #15803d;
        }

        .btn {
            display: block;
            padding: 14px;
            border-radius: 10px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
            transition: 0.2s;
        }

        .btn:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        .footer {
            margin-top: 25px;
            font-size: 11px;
            color: #94a3b8;
        }
    </style>
</head>

<body>

    <div class="hello-card">

        <div class="role-icon">👋</div>

        <div class="badge">ROLE AUTHENTICATED</div>

        <h2>Hello ${role}!</h2>

        <p class="description">
            Welcome to your role-specific area.
            Spring Security has successfully allowed access
            to this endpoint.
        </p>

        <div class="access-info">
            <strong>✓ Access Granted</strong><br><br>
            Your current role has the required permissions
            to access this resource.
        </div>

        <a href="${pageContext.request.contextPath}/home" class="btn">
            ← Back to Dashboard
        </a>

        <div class="footer">
            SecurityApp · Role-Based Access Control
        </div>

    </div>

</body>
</html>
