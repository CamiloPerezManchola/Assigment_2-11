<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Error</title>

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

        .error-card {
            background: white;
            width: 100%;
            max-width: 470px;
            padding: 45px 40px;
            border-radius: 20px;
            text-align: center;
            border: 1px solid #fee2e2;
            box-shadow: 0 15px 40px rgba(15,23,42,0.07);
        }

        .error-icon {
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fef2f2;
            color: #dc2626;
            border-radius: 22px;
            font-size: 38px;
            margin: 0 auto 25px;
        }

        .error-badge {
            display: inline-block;
            background: #fef2f2;
            color: #dc2626;
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 800;
            margin-bottom: 20px;
        }

        h2 {
            color: #b91c1c;
            font-size: 27px;
            font-weight: 800;
            margin-bottom: 15px;
        }

        .description {
            color: #64748b;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 28px;
        }

        .error-details {
            background: #fff7f7;
            border: 1px solid #fecaca;
            padding: 17px;
            border-radius: 10px;
            color: #991b1b;
            font-size: 13px;
            margin-bottom: 28px;
            word-break: break-word;
        }

        .error-details strong {
            display: block;
            margin-bottom: 7px;
            font-size: 11px;
            color: #b91c1c;
            text-transform: uppercase;
        }

        .btn {
            display: block;
            padding: 14px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 10px;
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
            color: #94a3b8;
            font-size: 11px;
        }
    </style>
</head>

<body>

    <div class="error-card">

        <div class="error-icon">⚠</div>

        <div class="error-badge">APPLICATION ERROR</div>

        <h2>Error ${code}</h2>

        <p class="description">
            Something went wrong while processing your request.
            The application could not complete the operation.
        </p>

        <div class="error-details">
            <strong>Error details</strong>
            ${message}
        </div>

        <a href="${pageContext.request.contextPath}/home" class="btn">
            ← Back to Dashboard
        </a>

        <div class="footer">
            SecurityApp · Error Handling
        </div>

    </div>

</body>
</html>
