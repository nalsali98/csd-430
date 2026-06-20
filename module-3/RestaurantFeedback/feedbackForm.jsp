<%--
    Name: Noor El-din Al salihi
    Course: CSD430-340A Server Side Development
    Module: 3.2 Programming Assignment
    File: feedbackForm.jsp
    Description: This JSP page displays a restaurant feedback form.
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Feedback Form</title>
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
            padding: 38px 40px 40px;
        }

        .field {
            margin-bottom: 26px;
        }

        label {
            display: block;
            font-size: 13.5px;
            font-weight: 600;
            color: var(--maroon-dark);
            margin-bottom: 8px;
            letter-spacing: 0.2px;
        }

        .hint {
            font-size: 12px;
            color: #948b80;
            font-weight: 400;
            margin-left: 6px;
        }

        input[type="text"],
        input[type="email"],
        select,
        textarea {
            width: 100%;
            padding: 12px 14px;
            font-size: 14.5px;
            font-family: 'Inter', sans-serif;
            color: var(--ink);
            border: 1.5px solid var(--line);
            border-radius: 8px;
            background-color: #fdfcfa;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: var(--maroon);
            box-shadow: 0 0 0 3px rgba(107, 31, 42, 0.10);
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='14' height='9' viewBox='0 0 14 9'><path d='M1 1l6 6 6-6' stroke='%236b1f2a' stroke-width='1.6' fill='none' stroke-linecap='round' stroke-linejoin='round'/></svg>");
            background-repeat: no-repeat;
            background-position: right 14px center;
            padding-right: 36px;
            cursor: pointer;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
            line-height: 1.5;
        }

        .radio-group {
            display: flex;
            gap: 28px;
            padding: 4px 2px;
        }

        .radio-option {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14.5px;
            color: var(--ink);
            cursor: pointer;
        }

        .radio-option input[type="radio"] {
            width: 18px;
            height: 18px;
            accent-color: var(--maroon);
            cursor: pointer;
        }

        .divider {
            border: none;
            border-top: 1px solid var(--line);
            margin: 32px 0 30px;
        }

        .submit-btn {
            width: 100%;
            background: linear-gradient(135deg, var(--maroon) 0%, var(--maroon-dark) 100%);
            color: #fff;
            border: none;
            padding: 15px 0;
            font-size: 15px;
            font-weight: 600;
            letter-spacing: 0.4px;
            border-radius: 9px;
            cursor: pointer;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
            box-shadow: 0 8px 18px rgba(107, 31, 42, 0.25);
        }

        .submit-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 10px 22px rgba(107, 31, 42, 0.32);
        }

        .submit-btn:active {
            transform: translateY(0);
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
            <div class="eyebrow">Customer Experience</div>
            <h1>Restaurant Experience Feedback Form</h1>
            <p class="subtext">
                This form collects customer feedback about their restaurant meal and service experience.
            </p>
        </div>

        <div class="card-body">
            <form action="displayFeedback.jsp" method="post">

                <div class="field">
                    <label for="customerName">Customer Name</label>
                    <input type="text" id="customerName" name="customerName" placeholder="e.g. Jane Doe" required>
                </div>

                <div class="field">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="e.g. jane.doe@email.com" required>
                </div>

                <div class="field">
                    <label for="mealOrdered">Meal Ordered</label>
                    <input type="text" id="mealOrdered" name="mealOrdered" placeholder="e.g. Grilled Salmon" required>
                </div>

                <div class="field">
                    <label for="serviceRating">Service Rating</label>
                    <select id="serviceRating" name="serviceRating">
                        <option value="Excellent">Excellent</option>
                        <option value="Good">Good</option>
                        <option value="Average">Average</option>
                        <option value="Poor">Poor</option>
                    </select>
                </div>

                <div class="field">
                    <label>Would you recommend this restaurant?</label>
                    <div class="radio-group">
                        <label class="radio-option">
                            <input type="radio" name="recommend" value="Yes" required> Yes
                        </label>
                        <label class="radio-option">
                            <input type="radio" name="recommend" value="No"> No
                        </label>
                    </div>
                </div>

                <div class="field">
                    <label for="comments">Additional Comments <span class="hint">(optional)</span></label>
                    <textarea id="comments" name="comments" rows="5" placeholder="Tell us more about your visit..."></textarea>
                </div>

                <hr class="divider">

                <button type="submit" class="submit-btn">Submit Feedback</button>
            </form>
        </div>
    </div>
    <div class="footer-note">Your feedback helps us serve you better.</div>
</div>

</body>
</html>