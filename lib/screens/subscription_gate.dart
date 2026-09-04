import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/bdapps_service.dart';

class SubscriptionGate extends StatefulWidget {
  const SubscriptionGate({super.key});

  @override
  State<SubscriptionGate> createState() => _SubscriptionGateState();
}

class _SubscriptionGateState extends State<SubscriptionGate> {
  final _mobileController = TextEditingController();
  final _otpController = TextEditingController();

  bool _loading = true;
  bool _otpRequested = false;
  String? _referenceNo;
  String _status = 'UNREGISTERED';
  String? _message;

  @override
  void initState() {
    super.initState();
    _restoreAndCheck();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _restoreAndCheck() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMobile = prefs.getString('quizbangla_mobile') ?? '';

    if (savedMobile.isEmpty) {
      if (mounted) setState(() => _loading = false);
      return;
    }

    _mobileController.text = savedMobile;
    final response = await BdappsService.checkSubscription(savedMobile);

    if (!mounted) return;
    if (BdappsService.isRegistered(response)) {
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }

    setState(() {
      _loading = false;
      _status = BdappsService.status(response);
      if (_status == 'INITIAL CHARGING PENDING') {
        _message = 'Subscription confirmation succeeded. Initial charging is still pending. Keep balance in the SIM and tap Check status.';
      }
    });
  }

  String? _validateMobile() {
    final digits = _mobileController.text.replaceAll(RegExp(r'\D'), '');
    if (!RegExp(r'^01[3-9][0-9]{8}$').hasMatch(digits)) {
      return 'Enter a valid Bangladesh mobile number (01XXXXXXXXX).';
    }
    return null;
  }

  String get _mobile =>
      _mobileController.text.replaceAll(RegExp(r'\D'), '');

  Future<void> _checkStatus() async {
    final validation = _validateMobile();
    if (validation != null) {
      setState(() => _message = validation);
      return;
    }

    setState(() {
      _loading = true;
      _message = null;
    });

    final response = await BdappsService.checkSubscription(_mobile);
    if (!mounted) return;

    final status = BdappsService.status(response);
    if (BdappsService.isRegistered(response)) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('quizbangla_mobile', _mobile);
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }

    setState(() {
      _loading = false;
      _status = status;
      _message = status == 'INITIAL CHARGING PENDING'
          ? 'Initial charging is pending. Keep enough balance in the SIM and check again shortly.'
          : 'No active QuizBangla subscription found. Subscribe with OTP to continue.';
    });
  }

  Future<void> _sendOtp() async {
    final validation = _validateMobile();
    if (validation != null) {
      setState(() => _message = validation);
      return;
    }

    setState(() {
      _loading = true;
      _message = null;
    });

    final response = await BdappsService.sendOtp(_mobile);
    if (!mounted) return;

    final referenceNo = (response['referenceNo'] ?? '').toString().trim();
    final success = response['success'] == true && referenceNo.isNotEmpty;

    setState(() {
      _loading = false;
      if (success) {
        _referenceNo = referenceNo;
        _otpRequested = true;
        _message = 'OTP sent. Enter the code received on your phone.';
      } else {
        _message = BdappsService.detail(response);
      }
    });
  }

  Future<void> _verifyOtp() async {
    final otp = _otpController.text.trim();
    if (!RegExp(r'^\d{4,8}$').hasMatch(otp) || _referenceNo == null) {
      setState(() => _message = 'Enter the OTP sent to your phone.');
      return;
    }

    setState(() {
      _loading = true;
      _message = null;
    });

    final response = await BdappsService.verifyOtp(
      otp: otp,
      referenceNo: _referenceNo!,
    );
    if (!mounted) return;

    final status = BdappsService.status(response);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('quizbangla_mobile', _mobile);

    if (BdappsService.isRegistered(response)) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }

    setState(() {
      _loading = false;
      _status = status;
      _otpRequested = false;
      _otpController.clear();
      _message = status == 'INITIAL CHARGING PENDING'
          ? 'OTP verified. Initial charging is pending. Keep balance in the SIM and tap Check status.'
          : BdappsService.detail(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: scheme.primary,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(
                      Icons.lightbulb_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    'QuizBangla',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Subscribe to unlock the clue challenge.',
                    style: TextStyle(color: scheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 28),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: _mobileController,
                            keyboardType: TextInputType.phone,
                            enabled: !_otpRequested && !_loading,
                            maxLength: 11,
                            decoration: const InputDecoration(
                              labelText: 'Mobile number',
                              hintText: '01XXXXXXXXX',
                              prefixIcon: Icon(Icons.phone_android_rounded),
                              border: OutlineInputBorder(),
                              counterText: '',
                            ),
                          ),
                          if (_otpRequested) ...[
                            const SizedBox(height: 14),
                            TextField(
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              decoration: const InputDecoration(
                                labelText: 'OTP',
                                hintText: 'Enter OTP',
                                prefixIcon: Icon(Icons.lock_outline_rounded),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                          if (_message != null) ...[
                            const SizedBox(height: 14),
                            Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                color: scheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(_message!),
                            ),
                          ],
                          const SizedBox(height: 18),
                          if (_loading)
                            const Center(child: CircularProgressIndicator())
                          else if (_otpRequested)
                            FilledButton.icon(
                              onPressed: _verifyOtp,
                              icon: const Icon(Icons.verified_user_rounded),
                              label: const Text('Verify & Subscribe'),
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                            )
                          else ...[
                            FilledButton.icon(
                              onPressed: _sendOtp,
                              icon: const Icon(Icons.sms_rounded),
                              label: const Text('Subscribe with OTP'),
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                            const SizedBox(height: 10),
                            OutlinedButton.icon(
                              onPressed: _checkStatus,
                              icon: const Icon(Icons.refresh_rounded),
                              label: Text(
                                _status == 'INITIAL CHARGING PENDING'
                                    ? 'Check charging status'
                                    : 'Already subscribed? Check status',
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Robi and Circle subscribers only. Robi (018) or Circle (016). BDT 2.78/day including VAT, SD and SC. Automatic daily renewal until unsubscribe. You can unsubscribe anytime from Settings.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
