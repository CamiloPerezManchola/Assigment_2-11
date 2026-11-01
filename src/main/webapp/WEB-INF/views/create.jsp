<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Content</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            background: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .create-card {
            width: 100%;
            max-width: 480px;
            background: white;
            padding: 45px 40px;
            border-radius: 20px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 15px 40px rgba(15,23,42,0.08);
            text-align: center;
        }

        .create-icon {
            width: 80px;
            height: 80px;
            background: #f3e8ff;
            color: #9333ea;
            border-radius: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 38px;
            margin: 0 auto 25px;
        }

        .badge {
            display: inline-block;
            background: #f3e8ff;
            color: #9333ea;
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 800;
            margin-bottom: 20px;
        }

        h2 {
            color: #0f172a;
            font-size: 26px;
            font-weight: 800;
            margin-bottom: 12px;
        }

        .description {
            color: #64748b;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        .info-box {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            padding: 18px;
            border-radius: 12px;
            text-align: left;
            margin-bottom: 25px;
        }

        .info-box h3 {
            font-size: 13px;
            color: #334155;
            margin-bottom: 8px;
        }

        .info-box p {
            font-size: 12px;
            color: #64748b;
            line-height: 1.6;
        }

        .btn-create {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #9333ea, #7e22ce);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .btn-create:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(147,51,234,0.25);
        }

        .btn-back {
            display: block;
            margin-top: 17px;
            color: #64748b;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            transition: 0.2s;
        }

        .btn-back:hover {
            color: #2563eb;
        }

        .footer {
            margin-top: 30px;
            color: #94a3b8;
            font-size: 11px;
        }

        @media (max-width: 480px) {
            .create-card {
                padding: 35px 25px;
            }
        }
    </style>
</head>

<body>

    <div class="create-card">

        <div class="create-icon">✨</div>

        <div class="badge">CREATOR WORKSPACE</div>

        <h2>Create Something</h2>

        <p class="description">
            You're about to execute a creation operation.
            This endpoint is protected by Spring Security.
        </p>

        <div class="info-box">
            <h3>📌 What happens next?</h3>
            <p>
                By clicking the button below, you will send
                a POST request to the creation endpoint.
                Spring Security will verify your permissions
                before processing the operation.
            </p>
        </div>

        <form method="post"
              action="${pageContext.request.contextPath}/creator/create">

            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>

            <button type="submit" class="btn-create">
                ✨ Create Now
            </button>

        </form>

        <a href="${pageContext.request.contextPath}/home" class="btn-back">
            ← Back to Dashboard
        </a>

        <div class="footer">
            SecurityApp · Creator Module
        </div>

    </div>

</body>
</html>
