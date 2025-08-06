import 'package:flutter/material.dart';
import 'settings_page.dart'; // make sure this file exists and is imported correctly

class DoctorOptions extends StatelessWidget {
  const DoctorOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // VIP Banner
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF0D1A1F),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "VIP",
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "WITH 10 PRIVILEGES",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("See Who", style: TextStyle(color: Colors.white, fontSize: 13)),
                            Text("Follows you", style: TextStyle(color: Colors.white, fontSize: 13)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Send Messages", style: TextStyle(color: Colors.white, fontSize: 13)),
                            Text("To Anyone", style: TextStyle(color: Colors.white, fontSize: 13)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("GET NOW"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Icon Menu Bar
            Container(
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _TopIconMenu(title: "Charmers", icon: Icons.star),
                  _TopIconMenu(title: "Boosting", icon: Icons.flash_on),
                  _TopIconMenu(title: "Coins", icon: Icons.monetization_on),
                  _TopIconMenu(title: "Visitors", icon: Icons.person_outline),
                ],
              ),
            ),

            // Vertical Menu List
            Expanded(
              child: ListView(
                children: [
                  const _ListMenuItem(title: "People in Review", icon: Icons.people),
                  const _ListMenuItem(title: "Coins Discount", icon: Icons.local_offer),
                  const _ListMenuItem(title: "Lucky Spin", icon: Icons.casino),
                  const _ListMenuItem(title: "Moments", icon: Icons.access_time),
                  const _ListMenuItem(title: "Ambassadors", icon: Icons.emoji_events),
                  const _ListMenuItem(title: "FAQ", icon: Icons.help_outline),
                  const _ListMenuItem(title: "Guidelines", icon: Icons.rule),

                  // SETTINGS with navigation
                  _ListMenuItem(
                    title: "Settings",
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SettingsPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopIconMenu extends StatelessWidget {
  final String title;
  final IconData icon;

  const _TopIconMenu({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.black),
          const SizedBox(height: 4),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _ListMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const _ListMenuItem({required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
