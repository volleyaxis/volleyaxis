import 'package:flutter/material.dart';
import 'package:volleyaxis/features/dashboard/presentation/widgets/dashboard_header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VolleyAxis'),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(child: Icon(Icons.person)),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const DashboardHeader(),

            const SizedBox(height: 32),

            _dashboardCard(
              icon: Icons.play_circle_fill,
              title: 'New Match',
              subtitle: 'Start tracking a live volleyball match.',
            ),

            const SizedBox(height: 16),

            _dashboardCard(
              icon: Icons.history,
              title: 'Match History',
              subtitle: 'View previous matches and statistics.',
            ),

            const SizedBox(height: 16),

            _dashboardCard(
              icon: Icons.groups,
              title: 'Teams',
              subtitle: 'Manage teams and players.',
            ),

            const SizedBox(height: 16),

            _dashboardCard(
              icon: Icons.bar_chart,
              title: 'Statistics',
              subtitle: 'Analyze team and player performance.',
            ),

            const SizedBox(height: 32),

            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text('No matches yet', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 34),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
