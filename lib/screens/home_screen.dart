import 'package:flutter/material.dart';
import 'assessment_screen.dart';
import 'job_recommendations_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'resources_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Define the screens for navigation
  static List<Widget> _widgetOptions = <Widget>[
    HomeDashboard(),
    AssessmentScreen(),
    JobRecommendationsScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Skill Path',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            tooltip: 'Resources',
            onPressed: () {
              // Navigate to resources or help
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResourcesScreen()),
              );
            },
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Assessment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Track your progress and take action:',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildStatCard('Assessments', '3 Completed', Icons.assessment, Colors.blue),
                  SizedBox(width: 10),
                  _buildStatCard('Jobs Saved', '5', Icons.bookmark, Colors.green),
                  SizedBox(width: 10),
                  _buildStatCard('Notifications', '2 New', Icons.notifications, Colors.redAccent),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Quick Actions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickAction(
                  'Take Assessment',
                  Icons.quiz_outlined,
                  Colors.blueAccent,
                      () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AssessmentScreen()),
                  ),
                ),
                _buildQuickAction(
                  'View Jobs',
                  Icons.work_outline,
                  Colors.green,
                      () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JobRecommendationsScreen()),
                  ),
                ),
                _buildQuickAction(
                  'Notifications',
                  Icons.notifications_active_outlined,
                  Colors.redAccent,
                      () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationsScreen()),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Explore Resources',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.library_books, color: Colors.blueAccent),
                title: Text('Learning Resources'),
                subtitle: Text('Access curated resources for skill enhancement.'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResourcesScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color iconColor) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(16),
        width: 120,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: iconColor),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(String label, IconData icon, Color iconColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, size: 32, color: iconColor),
          ),
          SizedBox(height: 10),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

