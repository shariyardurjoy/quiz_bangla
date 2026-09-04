import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/bdapps_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _mobile = '';
  String _status = 'Checking...';
  bool _loading = true;
  bool _unsubscribing = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final mobile = prefs.getString('quizbangla_mobile') ?? '';

    if (!mounted) return;
    setState(() => _mobile = mobile);

    if (mobile.isEmpty) {
      setState(() {
        _status = 'UNREGISTERED';
        _loading = false;
      });
      return;
    }

    await _refreshStatus();
  }

  Future<void> _refreshStatus() async {
    if (_mobile.isEmpty) return;
    setState(() => _loading = true);

    final response = await BdappsService.checkSubscription(_mobile);
    if (!mounted) return;
    setState(() {
      _status = BdappsService.status(response);
      _loading = false;
    });
  }

  Future<void> _unsubscribe() async {
    if (_mobile.isEmpty || _unsubscribing) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unsubscribe QuizBangla?'),
        content: const Text(
          'Your premium access will stop after the unsubscribe request succeeds.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Unsubscribe'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _unsubscribing = true);
    final response = await BdappsService.unsubscribe(_mobile);
    if (!mounted) return;

    final success = response['success'] == true ||
        BdappsService.status(response) == 'UNREGISTERED';

    if (success) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('quizbangla_mobile');
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, '/subscribe', (_) => false);
      return;
    }

    setState(() => _unsubscribing = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(BdappsService.detail(response))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'bdapps Subscription',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 16),
                      _InfoRow(
                        label: 'Mobile',
                        value: _mobile.isEmpty ? 'Not saved' : _mobile,
                      ),
                      const SizedBox(height: 10),
                      _InfoRow(
                        label: 'Status',
                        value: _loading ? 'Checking...' : _status,
                      ),
                      const SizedBox(height: 18),
                      OutlinedButton.icon(
                        onPressed: _loading ? null : _refreshStatus,
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Refresh status'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Manage subscription',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'You can stop QuizBangla subscription from here.',
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 16),
                      FilledButton.tonalIcon(
                        onPressed: _unsubscribing ? null : _unsubscribe,
                        icon: _unsubscribing
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.unsubscribe_rounded),
                        label: Text(
                          _unsubscribing ? 'Unsubscribing...' : 'Unsubscribe',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ),
        Expanded(
          child: Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
        ),
      ],
    );
  }
}
