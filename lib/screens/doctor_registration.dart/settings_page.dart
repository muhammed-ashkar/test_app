import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.amber),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          // Email Row
          ListTile(
            title: const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.verified, color: Colors.green, size: 18),
                SizedBox(width: 4),
                Text('rahuljaicsam@gmail.com'),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
              ],
            ),
          ),

          // Shaded description under email
          Container(
            width: double.infinity,
            color: const Color(0xFFF5F5F5),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: const Text(
              'Verify an Email to help secure your account.',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),

          const Divider(),

          // Settings Options
          const _SettingsTile(title: "Notifications"),
          const _SettingsTile(title: "Privacy"),
          const _SettingsTile(title: "Feedback"),
          const _SettingsTile(title: "Version 6.18.5", showArrow: false),

          const Divider(),

          const _SettingsTile(title: "Follow Us"),
          const _SettingsTile(title: "Promo Code"),
          const _SettingsTile(title: "Disable Your Account"),

          const Divider(),

          // Log Out
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const Placeholder()),
                        (route) => false,
                  );
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final bool showArrow;

  const _SettingsTile({required this.title, this.showArrow = true});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing:
      showArrow ? const Icon(Icons.arrow_forward_ios, size: 16) : null,
      onTap: () {
        // Add logic if needed
      },
    );
  }
}
