<%--
    Name: Noor El-din Al salihi
    Course: CSD430-340A Server Side Development
    Module: 3.2 Programming Assignment
    File: displayFeedback.jsp
    Description: This JSP page receives form data and displays it in an HTML table.
--%>

<%
    String customerName = request.getParameter("customerName");
    String email = request.getParameter("email");
    String mealOrdered = request.getParameter("mealOrdered");
    String serviceRating = request.getParameter("serviceRating");
    String recommend = request.getParameter("recommend");
    String comments = request.getParameter("comments");

    if (comments == null || comments.trim().isEmpty()) {
        comments = "No additional comments provided.";
    }

    String ratingColor = "#6b1f2a";
    if ("Excellent".equalsIgnoreCase(serviceRating)) ratingColor = "#3f7d4f";
    else if ("Good".equalsIgnoreCase(serviceRating)) ratingColor = "#4d7fae";
    else if ("Average".equalsIgnoreCase(serviceRating)) ratingColor = "#c9a25c";
    else if ("Poor".equalsIgnoreCase(serviceRating)) ratingColor = "#a23b3b";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Feedback Results</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --maroon: #6b1f2a;
            --maroon-dark: #4d1620;
            --gold: #c9a25c;
            --cream: #faf6f0;
            --ink: #2b2420;
            --line: #e4dbcd;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: var(--cream);
            background-image:
                radial-gradient(circle at 10% 10%, rgba(107, 31, 42, 0.04), transparent 40%),
                radial-gradient(circle at 90% 90%, rgba(201, 162, 92, 0.06), transparent 40%);
            color: var(--ink);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .page {
            max-width: 720px;
            margin: 0 auto;
        }

        .card {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 12px 35px rgba(43, 36, 32, 0.10);
            overflow: hidden;
            border: 1px solid var(--line);
        }

        .card-header {
            background: linear-gradient(135deg, var(--maroon) 0%, var(--maroon-dark) 100%);
            padding: 38px 40px 32px;
            color: #fff;
            position: relative;
        }

        .card-header::after {
            content: "";
            position: absolute;
            bottom: 0; left: 0; right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--gold), transparent);
        }

        .check-badge {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: rgba(255,255,255,0.15);
            border: 1.5px solid var(--gold);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 14px;
        }

        .check-badge svg {
            width: 20px;
            height: 20px;
        }

        .eyebrow {
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 12px;
            font-weight: 600;
            color: var(--gold);
            margin-bottom: 10px;
        }

        h1 {
            font-family: 'Playfair Display', serif;
            font-size: 30px;
            margin: 0 0 10px;
            font-weight: 700;
        }

        .subtext {
            font-size: 14.5px;
            line-height: 1.6;
            color: rgba(255,255,255,0.85);
            margin: 0;
            max-width: 480px;
        }

        .card-body {
            padding: 30px 40px 40px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 0;
            border-bottom: 1px solid var(--line);
        }

        .summary-row:last-of-type {
            border-bottom: none;
        }

        .summary-row .field-label {
            font-size: 12.5px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
            color: #948b80;
        }

        .summary-row .field-value {
            font-size: 15.5px;
            font-weight: 500;
            color: var(--ink);
            text-align: right;
            max-width: 60%;
        }

        .pill {
            display: inline-block;
            padding: 5px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            color: #fff;
        }

        .recommend-yes {
            color: #3f7d4f;
            font-weight: 600;
        }

        .recommend-no {
            color: #a23b3b;
            font-weight: 600;
        }

        .comments-block {
            margin-top: 24px;
            background-color: var(--cream);
            border: 1px solid var(--line);
            border-radius: 10px;
            padding: 18px 20px;
        }

        .comments-block .field-label {
            font-size: 12.5px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
            color: #948b80;
            margin-bottom: 8px;
        }

        .comments-block p {
            margin: 0;
            font-size: 14.5px;
            line-height: 1.6;
            color: var(--ink);
            font-style: italic;
        }

        .divider {
            border: none;
            border-top: 1px solid var(--line);
            margin: 30px 0 26px;
        }

        .back-btn {
            display: inline-block;
            width: 100%;
            text-align: center;
            background: #fff;
            color: var(--maroon);
            border: 1.5px solid var(--maroon);
            padding: 13px 0;
            font-size: 14.5px;
            font-weight: 600;
            letter-spacing: 0.3px;
            border-radius: 9px;
            text-decoration: none;
            transition: background-color 0.15s ease, color 0.15s ease;
        }

        .back-btn:hover {
            background: var(--maroon);
            color: #fff;
        }

        .footer-note {
            text-align: center;
            font-size: 12.5px;
            color: #a89c8d;
            margin-top: 22px;
        }
    </style>
</head>
<body>

<div class="page">
    <div class="card">
        <div class="card-header">
            <div class="check-badge">
                <svg viewBox="0 0 24 24" fill="none" stroke="#c9a25c" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="20 6 9 17 4 12"></polyline>
                </svg>
            </div>
            <div class="eyebrow">Submission Received</div>
            <h1>Thank You for Your Feedback</h1>
            <p class="subtext">
                The summary below reflects the information you submitted.
            </p>
        </div>

        <div class="card-body">

            <div class="summary-row">
                <span class="field-label">Customer Name</span>
                <span class="field-value"><%= customerName %></span>
            </div>

            <div class="summary-row">
                <span class="field-label">Email Address</span>
                <span class="field-value"><%= email %></span>
            </div>

            <div class="summary-row">
                <span class="field-label">Meal Ordered</span>
                <span class="field-value"><%= mealOrdered %></span>
            </div>

            <div class="summary-row">
                <span class="field-label">Service Rating</span>
                <span class="field-value">
                    <span class="pill" style="background-color: <%= ratingColor %>;"><%= serviceRating %></span>
                </span>
            </div>

            <div class="summary-row">
                <span class="field-label">Recommendation</span>
                <span class="field-value <%= "Yes".equalsIgnoreCase(recommend) ? "recommend-yes" : "recommend-no" %>">
                    <%= recommend %>
                </span>
            </div>

            <div class="comments-block">
                <div class="field-label">Additional Comments</div>
                <p><%= comments %></p>
            </div>

            <hr class="divider">

            <a href="feedbackForm.jsp" class="back-btn">Return to Feedback Form</a>
        </div>
    </div>
    <div class="footer-note">We appreciate you taking the time to share your experience.</div>
</div>

</body>
</html>
