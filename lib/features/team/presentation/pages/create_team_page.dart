import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:volleyaxis/features/team/data/models/team.dart';
import 'package:volleyaxis/features/team/presentation/providers/team_provider.dart';

class CreateTeamPage extends ConsumerStatefulWidget {
  const CreateTeamPage({super.key});

  @override
  ConsumerState<CreateTeamPage> createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends ConsumerState<CreateTeamPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _coachNameController = TextEditingController();

  final Uuid _uuid = const Uuid();

  String _selectedGender = 'Male';
  String _selectedAgeCategory = 'Senior';

  @override
  void dispose() {
    _teamNameController.dispose();
    _coachNameController.dispose();
    super.dispose();
  }

  void _saveTeam() {
    if (!_formKey.currentState!.validate()) return;

    final team = Team(
      id: _uuid.v4(),
      name: _teamNameController.text.trim(),
      coach: _coachNameController.text.trim(),
      ageCategory: _selectedAgeCategory,
      gender: _selectedGender,
      createdAt: DateTime.now(),
    );

    ref.read(teamProvider.notifier).addTeam(team);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Team created successfully!')));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Team')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Team Information',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 24),

                TextFormField(
                  controller: _teamNameController,
                  decoration: const InputDecoration(
                    labelText: 'Team Name',
                    hintText: 'Enter team name',
                    prefixIcon: Icon(Icons.groups),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a team name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _coachNameController,
                  decoration: const InputDecoration(
                    labelText: 'Coach Name',
                    hintText: 'Enter coach name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  initialValue: _selectedGender,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                    DropdownMenuItem(value: 'Mixed', child: Text('Mixed')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedGender = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  initialValue: _selectedAgeCategory,
                  decoration: const InputDecoration(
                    labelText: 'Age Category',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Senior', child: Text('Senior')),
                    DropdownMenuItem(value: 'U21', child: Text('U21')),
                    DropdownMenuItem(value: 'U18', child: Text('U18')),
                    DropdownMenuItem(value: 'U16', child: Text('U16')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedAgeCategory = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _saveTeam,
                    icon: const Icon(Icons.save),
                    label: const Text('Save Team'),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    label: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
