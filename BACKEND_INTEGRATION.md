# QuizBangla Flutter ↔ bdapps Backend Integration

Backend base URL:
`https://bdappsdigitalapps.com/QuizBangla`

Supported Operators: Robi (018) and Circle (016).

Flutter calls only the PHP backend. The bdapps API key remains on the server and is never stored in the app.

## Flow
1. App starts at the subscription gate.
2. Existing saved mobile number is checked with `check_subscription.php`.
3. If status is `REGISTERED`, the app opens Home.
4. Otherwise the user requests OTP via `send_otp.php`.
5. The OTP is verified via `verify_otp.php`.
6. `INITIAL CHARGING PENDING` stays behind the paywall and provides a status refresh button.
7. `REGISTERED` unlocks Home.
8. Settings provides status refresh and `unsubscribe.php`.

## Endpoints used
- `POST /check_subscription.php` → `user_mobile`
- `POST /send_otp.php` → `user_mobile`
- `POST /verify_otp.php` → `Otp`, `referenceNo`
- `POST /unsubscribe.php` → `user_mobile`

## Packages added
- `http`
- `shared_preferences`

Run:
`flutter pub get`

Then:
`flutter run -d <device-id>`
