import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AtelierDistroApp());
}

class AtelierDistroApp extends StatelessWidget {
  const AtelierDistroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atelier Distro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0256D2),
          primary: const Color(0xFF0256D2),
          surface: const Color(0xFFF7F9FF),
          onSurface: const Color(0xFF2B333C),
          surfaceContainerHighest: const Color(0xFFE8EEF7),
          outlineVariant: const Color(0xFFAAB3BD),
        ),
        textTheme: GoogleFonts.interTextTheme(
          const TextTheme(
            displayLarge: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.5,
              color: Color(0xFF2B333C),
            ),
            headlineSmall: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B333C),
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: Color(0xFF2B333C),
            ),
            labelMedium: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF576069),
            ),
          ),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<AppItemData> _apps = [
    AppItemData(
      title: 'Core Infrastructure',
      subtitle: 'v4.2.0 • Stable',
      icon: Icons.settings_input_component,
      action: AppAction.open,
    ),
    AppItemData(
      title: 'Storefront Alpha',
      subtitle: 'Update Available',
      icon: Icons.shopping_cart_outlined,
      action: AppAction.update,
    ),
    AppItemData(
      title: 'Metric Dash',
      subtitle: 'v0.8.0 • New',
      icon: Icons.bar_chart_outlined,
      action: AppAction.open,
    ),
    AppItemData(
      title: 'Device Manager',
      subtitle: 'v2.4.1 • Up to date',
      icon: Icons.monitor_outlined,
      action: AppAction.open,
    ),
    AppItemData(
      title: 'Analytics Hub',
      subtitle: 'v1.0.5',
      icon: Icons.hub_outlined,
      action: AppAction.open,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FF),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.grid_view_rounded, color: Color(0xFF576069)),
                        Text(
                          'ATELIER DISTRO',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                            color: const Color(0xFF2B333C),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFFDAE3EF),
                          child: Icon(Icons.person, size: 20, color: Color(0xFF576069)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Dashboard',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AppCard(data: _apps[index]),
                    );
                  },
                  childCount: _apps.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100), // Space for bottom nav
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xFFDAE3EF).withValues(alpha: 0.8),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.dashboard_outlined, 'Dashboard'),
            _buildNavItem(1, Icons.history, 'Activity'),
            _buildNavItem(2, Icons.person_outline, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF0256D2) : const Color(0xFF576069),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isSelected ? const Color(0xFF0256D2) : const Color(0xFF576069),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
          ),
        ],
      ),
    );
  }
}

enum AppAction { update, open }

class AppItemData {
  final String title;
  final String subtitle;
  final IconData icon;
  final AppAction action;

  AppItemData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.action,
  });
}

class AppCard extends StatelessWidget {
  final AppItemData data;

  const AppCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0256D2).withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF0256D2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              data.icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  data.subtitle,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 13,
                        color: const Color(0xFF576069),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _buildActionButton(data.action),
        ],
      ),
    );
  }

  Widget _buildActionButton(AppAction action) {
    final isUpdate = action == AppAction.update;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isUpdate ? const Color(0xFF1A237E) : const Color(0xFF673AB7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isUpdate ? 'UPDATE' : 'OPEN',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
