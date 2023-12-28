import 'package:flutter/material.dart';
import 'package:project_intern/ui/third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String showName;
  final String selectedUserName;

  SecondScreen({required this.showName, required this.selectedUserName});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _selectedUserName = '';

  @override
  void initState() {
    super.initState();
    _selectedUserName = widget.selectedUserName;
  }

  void _updateSelectedUserName(String selectedUserName) {
    setState(() {
      _selectedUserName = selectedUserName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '${widget.showName}',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Selected User Name: $_selectedUserName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen(updateSelectedUserName: _updateSelectedUserName)),
                );
              },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color(0xFF2B637B),
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text('Choose a User'),
            ),
          ),
        ],
      ),
    );
  }
}

