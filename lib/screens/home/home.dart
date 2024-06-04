import 'package:app_rpg/shared/styled_button.dart';
import 'package:app_rpg/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your characters'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const StyledText('Character List...'),
            const StyledHeading('character list'),
            const Expanded(
              child: StyledTitle('character list'),
            ),
            StyledButton(
              child: const StyledHeading('Create new'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
