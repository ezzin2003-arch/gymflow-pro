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
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';
void saveMember() async {
  final db = AppDatabase();
  final uuid = const Uuid().v4();

  if (nameController.text.isEmpty || phoneController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Fill required fields")),
    );
    return;
  }

  await db.insertMember(
    MembersCompanion.insert(
      id: uuid,
      import 'package:flutter/material.dart';
import '../../../../core/database/app_database.dart';
import 'add_member_page.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final db = AppDatabase();
  List<Member> members = [];

  @override
  void initState() {
    super.initState();
    loadMembers();
  }

  Future<void> loadMembers() async {
    final data = await db.getAllMembers();
    setState(() {
      members = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Members"),
      ),

      body: members.isEmpty
          ? const Center(
              child: Text("No members yet"),
            )
          : ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                final m = members[index];

                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(m.fullName),
                  subtitle: Text(m.phone),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddMemberPage(),
            ),
          );

          loadMembers();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
      fullName: nameController.text,
      phone: phoneController.text,
      age: int.parse(ageController.text),
      weight: double.parse(weightController.text),
      height: double.parse(heightController.text),
      createdAt: DateTime.now(),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Member saved successfully")),
  );

  Navigator.pop(context);
}
