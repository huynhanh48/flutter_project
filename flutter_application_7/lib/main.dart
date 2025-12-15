import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ================= APP ROOT =================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer + Pages',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Drawer Navigation'),
    );
  }
}

/// ================= HOME PAGE =================
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // page index
  int _selectedIndex = 0;

  // pages
  final List<Widget> _pages = const [HomePage(), SettingsPage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      /// -------- DRAWER --------
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40),
              ),
              accountName: const Text("Anh Developer"),
              accountEmail: const Text("anh@example.com"),
            ),

            _drawerItem(
              icon: Icons.home,
              text: "Home",
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context);
              },
            ),

            _drawerItem(
              icon: Icons.settings,
              text: "Settings",
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),

            _drawerItem(
              icon: Icons.info,
              text: "About",
              onTap: () {
                setState(() => _selectedIndex = 2);
                Navigator.pop(context);
              },
            ),

            const Spacer(),
            const Divider(),

            _drawerItem(
              icon: Icons.logout,
              text: "Logout",
              color: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),

      /// -------- BODY --------
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
    );
  }
}

/// ================= DRAWER ITEM =================
Widget _drawerItem({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
  Color color = Colors.black,
}) {
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color, fontSize: 16)),
    onTap: onTap,
  );
}

/// ================= HOME PAGE =================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _centerContent(
      icon: Icons.home,
      title: "HOME",
      subtitle: "Đây là trang Home",
    );
  }
}

/// ================= SETTINGS PAGE =================
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;
  bool notification = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "SETTINGS",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        Card(
          child: SwitchListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Bật giao diện tối"),
            value: darkMode,
            onChanged: (v) => setState(() => darkMode = v),
          ),
        ),

        Card(
          child: SwitchListTile(
            title: const Text("Notification"),
            subtitle: const Text("Bật thông báo"),
            value: notification,
            onChanged: (v) => setState(() => notification = v),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Account"),
            subtitle: const Text("Thông tin tài khoản"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Account clicked")));
            },
          ),
        ),

        const SizedBox(height: 30),
        const Center(
          child: Text("Version 1.0.0", style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}

/// ================= ABOUT PAGE =================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _centerContent(
      icon: Icons.info,
      title: "ABOUT",
      subtitle: "Ứng dụng Flutter Drawer Demo",
    );
  }
}

/// ================= COMMON UI =================
Widget _centerContent({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: Colors.deepPurple),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(subtitle, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}
