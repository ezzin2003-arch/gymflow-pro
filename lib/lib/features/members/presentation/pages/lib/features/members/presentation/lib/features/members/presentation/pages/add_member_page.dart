import 'package:flutter/material.dart';
import '../../../../shared/widgets/gym_button.dart';
import '../../../../shared/widgets/gym_text_field.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  void saveMember() {
    final name = nameController.text;
    final phone = phoneController.text;

    if (name.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fill required fields")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Member saved (mock)")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Member"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            GymTextField(label: "Full Name"),
            const SizedBox(height: 10),

            GymTextField(label: "Phone"),
            const SizedBox(height: 10),

            GymTextField(label: "Age"),
            const SizedBox(height: 10),

            GymTextField(label: "Weight"),
            const SizedBox(height: 10),

            GymTextField(label: "Height"),
            const SizedBox(height: 20),

            GymButton(
              text: "Save Member",
              onPressed: saveMember,
            ),
          ],
        ),
      ),
    );
  }
}
