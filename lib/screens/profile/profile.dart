import 'package:app_rpg/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledHeading('Character name'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // Basic info - image, vocation, description
            
            
            // Weapon and ability
            
            
            // Stats & skills
            
            
            // Save button 
          ],
        ),
      ),
    );
  }
}
