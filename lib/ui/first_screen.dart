import 'package:flutter/material.dart';
import 'package:project_intern/ui/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late TextEditingController nameController;
  late TextEditingController sentenceController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    sentenceController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    sentenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/ic_photo.png'),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((15))),
                    hintText: 'Name'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: sentenceController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((15))),
                    hintText: 'Palindrome'),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  bool isPalindrome = checkPalindrome(sentenceController.text);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Palindrome Check'),
                        content: Text(
                            isPalindrome ? 'Palindrome' : 'Not Palindrome'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: FilledButton.styleFrom(
                  // side:BorderSide(width: 1, color: Color(0xFF2B637B),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFF2B637B),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text('CHECK'),
              ),
              SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(
                              showName: nameController.text,
                              selectedUserName: '',
                            )),
                  );
                },
                style: FilledButton.styleFrom(
                  // side:BorderSide(width: 1, color: Color(0xFF2B637B),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFF2B637B),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text('NEXT'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkPalindrome(String text) {
    String cleanText = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    String reversedText = cleanText.split('').reversed.join('');
    return cleanText == reversedText;
  }
}
