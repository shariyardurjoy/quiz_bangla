import 'dart:convert';

import 'package:http/http.dart' as http;

class BdappsService {
  static const String _baseUrl =
      'https://bdappsdigitalapps.com/QuizBangla';

  static Future<Map<String, dynamic>> checkSubscription(String mobile) {
    return _post('check_subscription.php', {'user_mobile': mobile});
  }

  static Future<Map<String, dynamic>> sendOtp(String mobile) {
    return _post('send_otp.php', {'user_mobile': mobile});
  }

  static Future<Map<String, dynamic>> verifyOtp({
    required String otp,
    required String referenceNo,
  }) {
    return _post('verify_otp.php', {
      'Otp': otp,
      'referenceNo': referenceNo,
    });
  }

  static Future<Map<String, dynamic>> unsubscribe(String mobile) {
    return _post('unsubscribe.php', {'user_mobile': mobile});
  }

  static Future<Map<String, dynamic>> _post(
    String endpoint,
    Map<String, String> body,
  ) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/$endpoint'),
            headers: const {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: body,
          )
          .timeout(const Duration(seconds: 25));

      final dynamic decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }

      return {
        'statusCode': 'INVALID_RESPONSE',
        'statusDetail': 'The server returned an unexpected response.',
      };
    } catch (e) {
      return {
        'statusCode': 'NETWORK_ERROR',
        'statusDetail': 'Could not connect to QuizBangla server.',
      };
    }
  }

  static bool isRegistered(Map<String, dynamic> response) {
    return (response['subscriptionStatus'] ?? '')
            .toString()
            .trim()
            .toUpperCase() ==
        'REGISTERED';
  }

  static String status(Map<String, dynamic> response) {
    final value = (response['subscriptionStatus'] ?? '').toString().trim();
    if (value.isNotEmpty) return value.toUpperCase();

    final code = (response['statusCode'] ?? '').toString().trim();
    if (code == 'E1951') return 'UNREGISTERED';
    return 'UNKNOWN';
  }

  static String detail(Map<String, dynamic> response) {
    return (response['statusDetail'] ??
            response['message'] ??
            'Something went wrong.')
        .toString();
  }
}
