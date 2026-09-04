import os
import subprocess

def create_dirs():
    os.makedirs('server_upload/QuizBangla/downloads', exist_ok=True)
    os.makedirs('server_upload/QuizBangla/documents', exist_ok=True)

def write_html(filename, content):
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(content)

def generate_pdf(html_path, pdf_path):
    abs_html = os.path.abspath(html_path)
    abs_pdf = os.path.abspath(pdf_path)
    # Using msedge to print to PDF
    cmd = [
        "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe",
        "--headless",
        "--disable-gpu",
        f"--print-to-pdf={abs_pdf}",
        f"file:///{abs_html.replace('\\', '/')}"
    ]
    subprocess.run(cmd, check=True)
    print(f"Generated {pdf_path}")

def main():
    create_dirs()
    
    # 1. index.html (Landing Page)
    index_html = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuizBangla</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #F7F9F8; color: #333; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { max-width: 600px; background: white; padding: 40px; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); text-align: center; }
        .icon { width: 120px; height: 120px; background-color: #5B4AE8; border-radius: 25px; margin: 0 auto 20px; display: flex; justify-content: center; align-items: center; color: white; font-size: 60px; font-weight: bold; }
        h1 { color: #5B4AE8; margin: 0 0 10px; font-weight: 900; }
        .description { font-size: 18px; color: #555; margin-bottom: 20px; }
        .details { background: #F7F9F8; padding: 15px; border-radius: 12px; margin-bottom: 20px; font-size: 14px; text-align: left; }
        .details ul { margin: 10px 0 0; padding-left: 20px; }
        .btn { display: inline-block; background-color: #5B4AE8; color: white; text-decoration: none; padding: 15px 30px; border-radius: 12px; font-size: 16px; font-weight: bold; margin-bottom: 20px; transition: background 0.3s; }
        .btn:hover { background-color: #4A3AD1; }
        .links { font-size: 14px; margin-top: 20px; border-top: 1px solid #EEE; padding-top: 20px; }
        .links a { color: #5B4AE8; text-decoration: none; margin: 0 10px; }
        .links a:hover { text-decoration: underline; }
        .contact { margin-top: 20px; font-size: 12px; color: #888; }
    </style>
</head>
<body>
    <div class="container">
        <div class="icon">Q</div>
        <h1>QuizBangla</h1>
        <div class="description">A clue-based Bangladesh trivia challenge app. Reveal fewer clues to earn more points!</div>
        
        <div class="details">
            <strong>Subscription Info:</strong>
            <ul>
                <li>Platform: Android</li>
                <li>Robi and Circle subscribers only. Robi (018) or Circle (016).</li>
                <li>Charge: BDT 2.78/day (including VAT, SD and SC).</li>
                <li>Automatic daily renewal until unsubscribe.</li>
                <li>Steps: Enter number &rarr; OTP &rarr; Wait for REGISTERED &rarr; Play!</li>
                <li>To Unsubscribe: Go to Settings in the app &rarr; Unsubscribe.</li>
            </ul>
        </div>
        
        <a href="downloads/QuizBangla-v1.0.0.apk" class="btn">Download APK</a>
        
        <div class="links">
            <a href="documents/APP_139882_FAQ.pdf">FAQ</a>
            <a href="documents/APP_139882_User_Guideline.pdf">User Guideline</a>
        </div>
        <div class="contact">
            Support: shariyarhossaindurjoy@gmail.com
        </div>
    </div>
</body>
</html>"""
    write_html('server_upload/QuizBangla/index.html', index_html)

    # 2. FAQ PDF
    faq_html = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>QuizBangla FAQ</title>
    <style>body { font-family: Arial, sans-serif; margin: 40px; color: #333; line-height: 1.6; } h1 { color: #5B4AE8; } h2 { color: #444; font-size: 18px; margin-top: 30px; } p { margin-bottom: 20px; }</style>
</head>
<body>
    <h1>QuizBangla - FAQ (APP_139882)</h1>
    
    <h2>1. What is QuizBangla?</h2>
    <p>QuizBangla is a trivia challenge app where you solve mysteries about Bangladesh using up to 3 clues. The fewer clues you reveal, the more points you score.</p>
    
    <h2>2. Who can subscribe?</h2>
    <p>Currently, the service is exclusively available for Robi and Circle subscribers in Bangladesh. Enter a valid Robi (018) or Circle (016) number to subscribe.</p>
    
    <h2>3. What is the subscription charge?</h2>
    <p>The daily subscription fee is BDT 2.78 per day. This charge is inclusive of all taxes (VAT, SD, and SC).</p>
    
    <h2>4. How do I subscribe?</h2>
    <p>Open the app, enter your Robi or Circle mobile number, and tap "Subscribe with OTP". Enter the OTP received via SMS. Once charging is successful, you will be REGISTERED and can access the clue challenge.</p>
    
    <h2>5. Does the subscription renew automatically?</h2>
    <p>Yes. The subscription has an automatic daily renewal feature. You will be charged daily until you choose to unsubscribe.</p>
    
    <h2>6. How do I unsubscribe?</h2>
    <p>To stop the service, open the QuizBangla app, go to Settings, and tap "Unsubscribe". Your premium access will stop once the unsubscribe request is successful.</p>
    
    <h2>7. Who handles the charging?</h2>
    <p>Subscription and charging are handled securely by bdapps.</p>
    
    <h2>8. How do I get support?</h2>
    <p>If you face any issues, please email us at: shariyarhossaindurjoy@gmail.com</p>
</body>
</html>"""
    write_html('faq_temp.html', faq_html)
    generate_pdf('faq_temp.html', 'server_upload/QuizBangla/documents/APP_139882_FAQ.pdf')
    
    # 3. User Guideline PDF
    guide_html = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>QuizBangla User Guideline</title>
    <style>body { font-family: Arial, sans-serif; margin: 40px; color: #333; line-height: 1.6; } h1 { color: #5B4AE8; } h2 { color: #444; font-size: 18px; margin-top: 20px; border-bottom: 1px solid #CCC; padding-bottom: 5px; } ol { margin-top: 10px; }</style>
</head>
<body>
    <h1>QuizBangla - User Guideline (APP_139882)</h1>
    <p>Welcome to QuizBangla! Follow these steps to install, subscribe, and play.</p>
    
    <h2>1. Installation</h2>
    <ol>
        <li>Download the latest APK file (QuizBangla-v1.0.0.apk) from the official link.</li>
        <li>Open the file on your Android device. If prompted, allow installation from unknown sources in your settings.</li>
        <li>Tap "Install" and wait for the process to complete.</li>
        <li>Open "QuizBangla" from your app launcher.</li>
    </ol>
    
    <h2>2. Subscription & Access</h2>
    <ol>
        <li>Upon opening the app, you will see the subscription screen.</li>
        <li>Enter your Robi (018) or Circle (016) mobile number.</li>
        <li>Tap "Subscribe with OTP" and wait for the SMS.</li>
        <li>Enter the OTP. The system will process your initial charging (BDT 2.78/day incl. VAT/SD/SC).</li>
        <li>Once successful, your status will become REGISTERED and you can access the Home screen.</li>
    </ol>
    
    <h2>3. Playing the Game</h2>
    <ol>
        <li>From the Home screen, select a category (e.g., Bangladesh Places, Food & Culture) or "Mystery Mix".</li>
        <li>Read Clue 1. If you know the answer, select one of the four options to earn 100 points!</li>
        <li>If unsure, tap "Reveal next clue". Earning points will drop to 75. A third clue drops it to 50 points.</li>
        <li>Answer all 10 mysteries to complete the challenge.</li>
        <li>View your total score and tap "Play Again" for a new round.</li>
    </ol>
    
    <h2>4. Managing Subscription</h2>
    <ol>
        <li>Go to the Settings screen by tapping the gear icon on the Home screen.</li>
        <li>Here you can view your currently active mobile number and check your subscription status.</li>
        <li>If you wish to stop the service, tap "Unsubscribe" and confirm.</li>
    </ol>
</body>
</html>"""
    write_html('guide_temp.html', guide_html)
    generate_pdf('guide_temp.html', 'server_upload/QuizBangla/documents/APP_139882_User_Guideline.pdf')
    
    # Cleanup temps
    os.remove('faq_temp.html')
    os.remove('guide_temp.html')
    print("All server files prepared successfully!")

if __name__ == '__main__':
    main()
