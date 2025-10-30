import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../base_screen.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _relationController = TextEditingController();
  final _phoneController = TextEditingController();

  List<Map<String, String>> _contacts = [];
  bool _isEditing = false;
  int _editingIndex = -1;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList('emergency_contacts') ?? [];
    setState(() {
      _contacts = raw.map((e) => Map<String, String>.from(Uri.splitQueryString(e))).toList();
    });
  }

  Future<void> _saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = _contacts.map((c) => Uri(queryParameters: c).query).toList();
    await prefs.setStringList('emergency_contacts', encoded);
  }

  void _submitContact() {
    if (_formKey.currentState!.validate()) {
      final newContact = {
        'name': _nameController.text,
        'relation': _relationController.text,
        'phone': _phoneController.text,
      };
      setState(() {
        if (_editingIndex >= 0) {
          _contacts[_editingIndex] = newContact;
        } else {
          _contacts.add(newContact);
        }
        _isEditing = false;
        _editingIndex = -1;
      });
      _saveContacts();
    }
  }

  void _editContact(int index) {
    final contact = _contacts[index];
    _nameController.text = contact['name']!;
    _relationController.text = contact['relation']!;
    _phoneController.text = contact['phone']!;
    setState(() {
      _isEditing = true;
      _editingIndex = index;
    });
  }

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
      _saveContacts();
    });
  }

  void _clearForm() {
    _nameController.clear();
    _relationController.clear();
    _phoneController.clear();
    setState(() {
      _isEditing = false;
      _editingIndex = -1;
    });
  }

  Future<void> _dial911() async {
    final uri = Uri.parse('tel:911');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please dial 911 from your phone')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Emergency Help',
      currentIndex: 3,
      onNavTap: (index) {},
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: _dial911,
                  icon: const Icon(Icons.call),
                  label: const Text('Call 911'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD71920),
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                if (_isEditing)
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(labelText: 'Adult Name'),
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Please enter a name' : null,
                        ),
                        TextFormField(
                          controller: _relationController,
                          decoration: const InputDecoration(labelText: 'Relationship'),
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Please enter relationship' : null,
                        ),
                        TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(labelText: 'Phone Number'),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
                            if (value == null || value.isEmpty) return 'Please enter phone number';
                            if (!phoneRegex.hasMatch(value)) return 'Enter valid phone number';
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: _submitContact,
                              child: const Text('Save Contact'),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: _clearForm,
                              child: const Text('Cancel'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                else ...[
                  Column(
                    children: _contacts.asMap().entries.map((entry) {
                      final i = entry.key;
                      final contact = entry.value;
                      return Card(
                        child: ListTile(
                          title: Text('${contact['name']} (${contact['relation']})'),
                          subtitle: GestureDetector(
                            onTap: () => launchUrl(Uri.parse('tel:${contact['phone']}')),
                            child: Text(contact['phone']!,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                )),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _editContact(i),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _deleteContact(i),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  if (_contacts.length < 3)
                    ElevatedButton(
                      onPressed: () {
                        _clearForm();
                        setState(() => _isEditing = true);
                      },
                      child: const Text('Add Emergency Contact'),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
