import 'package:app_rpg/models/vocation.dart';
import 'package:app_rpg/shared/styled_text.dart';
import 'package:flutter/material.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({super.key, required this.vocation});

  final Vocation vocation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            // Vocation img
            Image.asset(
              'assets/img/vocations/${vocation.image}',
              width: 80,
              colorBlendMode: BlendMode.color,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading(vocation.title),
                  StyledText(vocation.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
