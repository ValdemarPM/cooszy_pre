import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonFormDialog extends StatefulWidget {
  final Person? person;

  const PersonFormDialog({super.key, this.person});

  @override
  State<PersonFormDialog> createState() => _PersonFormDialogState();
}

class _PersonFormDialogState extends State<PersonFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _surnamesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.person?.name ?? '');
    _surnamesController =
        TextEditingController(text: widget.person?.surnames ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.person == null ? 'Add Person' : 'Edit Person'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name *',
                  hintText: 'Enter name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _surnamesController,
                decoration: const InputDecoration(
                  labelText: 'Surnames',
                  hintText: 'Enter surnames',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final person = Person(
                id: widget.person?.id ?? '',
                name: _nameController.text,
                surnames: _surnamesController.text,
                imageAsset: 'assets/images/default_profile.jpg',
                level: FriendshipLevel.undefined,
                lastInteraction: DateTime.now(),
                dateType: DateType.history,
              );
              Navigator.of(context).pop(person);
            }
          },
          child: Text(widget.person == null ? 'Add' : 'Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnamesController.dispose();
    super.dispose();
  }
}
