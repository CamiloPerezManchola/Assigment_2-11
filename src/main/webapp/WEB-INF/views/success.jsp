<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Operation Successful</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f1f5f9;
            padding: 20px;
        }

        .result-card {
            background: white;
            width: 100%;
            max-width: 450px;
            padding: 45px 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 15px 40px rgba(15,23,42,0.08);
            border: 1px solid #e2e8f0;
        }

        .icon {
            width: 75px;
            height: 75px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #dcfce7;
            color: #16a34a;
            border-radius: 50%;
            font-size: 35px;
            margin: 0 auto 25px;
        }

        h2 {
            color: #15803d;
            font-size: 24px;
            font-weight: 800;
            margin-bottom: 12px;
        }

        .subtitle {
            color: #64748b;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .status-badge {
            display: inline-block;
            background: #f0fdf4;
            color: #15803d;
            border: 1px solid #bbf7d0;
            padding: 9px 16px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .btn {
            display: block;
            width: 100%;
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
            box-shadow: 0 7px 18px rgba(37,99,235,0.2);
        }

        .footer {
            margin-top: 25px;
            color: #94a3b8;
            font-size: 11px;
        }
    </style>
</head>

<body>

    <div class="result-card">

        <div class="icon">✓</div>

        <div class="status-badge">SUCCESSFUL OPERATION</div>

        <h2>${code} - ${message}</h2>

        <p class="subtitle">
            Your request has been successfully processed.
            Everything worked as expected.
        </p>

        <a href="${pageContext.request.contextPath}/home" class="btn">
            ← Back to Dashboard
        </a>

        <div class="footer">
            SecurityApp · Spring Security Demonstration
        </div>

    </div>

</body>
</html>
