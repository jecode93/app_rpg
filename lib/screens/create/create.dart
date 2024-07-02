import 'package:app_rpg/models/character.dart';
import 'package:app_rpg/models/vocation.dart';
import 'package:app_rpg/screens/create/vocation_card.dart';
import 'package:app_rpg/screens/home/home.dart';
import 'package:app_rpg/shared/styled_button.dart';
import 'package:app_rpg/shared/styled_text.dart';
import 'package:app_rpg/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // Handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // Submit Handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const StyledHeading('Missing character name'),
            content: const StyledText(
                'Every good RPG character need a great name...'),
            actions: [
              StyledButton(
                  child: const StyledHeading('close'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );

      return;
    }

    if (_sloganController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const StyledHeading('Missing slogan'),
            content: const StyledText('Remember to add a catchy slogan...'),
            actions: [
              StyledButton(
                  child: const StyledHeading('close'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );

      return;
    }
    characters.add(Character(
      name: _nameController.text.trim(),
      slogan: _sloganController.text.trim(),
      vocation: selectedVocation,
      id: uuid.v4(),
    ));

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const Home(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Welcome message
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading('Welcome, new player.'),
              ),
              const Center(
                child: StyledText('Create a name & slogan for your character.'),
              ),
              const SizedBox(height: 30),

              // input for name and slogan
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character name'),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character slogan'),
                ),
              ),
              const SizedBox(height: 30),

              // Select vocation title
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading('Choose a vocation.'),
              ),
              const Center(
                child: StyledText('This determines your available skills.'),
              ),
              const SizedBox(height: 30),

              // Vocation cards
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                vocation: Vocation.junkie,
                onTap: updateVocation,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                vocation: Vocation.ninja,
                onTap: updateVocation,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                vocation: Vocation.raider,
                onTap: updateVocation,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                vocation: Vocation.wizard,
                onTap: updateVocation,
              ),

              // Goog luck message
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading('Good Luck.'),
              ),
              const Center(
                child: StyledText('And enjoy the journey....'),
              ),
              const SizedBox(height: 30),

              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading('Create character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
