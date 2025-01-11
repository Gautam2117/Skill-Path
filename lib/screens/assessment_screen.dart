import 'package:flutter/material.dart';

class AssessmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Skill Assessment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assess Your Skills',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Take interactive assessments to identify your strengths and areas for improvement.',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              _buildAssessmentTile(
                context,
                'Technical Skills',
                'Evaluate your technical expertise in coding, debugging, and more.',
                Icons.computer,
                Colors.blue,
                    () {
                  // Navigate to the technical skills assessment
                },
              ),
              SizedBox(height: 20),
              _buildAssessmentTile(
                context,
                'Communication Skills',
                'Assess your communication and interpersonal skills.',
                Icons.message,
                Colors.green,
                    () {
                  // Navigate to the communication skills assessment
                },
              ),
              SizedBox(height: 20),
              _buildAssessmentTile(
                context,
                'Leadership Skills',
                'Measure your ability to lead and manage teams effectively.',
                Icons.leaderboard,
                Colors.orange,
                    () {
                  // Navigate to the leadership skills assessment
                },
              ),
              SizedBox(height: 30),
              Text(
                'Your Progress',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildProgressBar(
                context,
                'Technical Skills',
                0.75, // Example progress (75%)
                Colors.blue,
              ),
              SizedBox(height: 10),
              _buildProgressBar(
                context,
                'Communication Skills',
                0.5, // Example progress (50%)
                Colors.green,
              ),
              SizedBox(height: 10),
              _buildProgressBar(
                context,
                'Leadership Skills',
                0.3, // Example progress (30%)
                Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAssessmentTile(
      BuildContext context,
      String title,
      String description,
      IconData icon,
      Color iconColor,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: iconColor.withOpacity(0.1),
                child: Icon(icon, color: iconColor, size: 30),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar(
      BuildContext context,
      String skill,
      double progress,
      Color color,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: progress,
          color: color,
          backgroundColor: color.withOpacity(0.2),
          minHeight: 8,
        ),
      ],
    );
  }
}
