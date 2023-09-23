import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  // Sample list of contacts (you can replace this with your own data)
  final List<String> contacts = [
    '1. Vandrevala Foundation (Mental Health): 1860-2662-345 or 1800-2333-330',
    '2. Roshni Helpline: +91-40-6620-2000',
    '3. Cyber Crime Helpline (For Reporting Cyberbullying): 155260',
    '4. Cyber Peace Foundation (Cyberbullying and Online Safety): Email: info@cyberpeace.org',
    '5. Snehi (Mental Health): Helpline: +91-22-2772-6770 / +91-22-2772-6771'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactBox(contactName: contacts[index]);
        },
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  final String contactName;

  ContactBox({required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: const Color.fromARGB(255, 77, 79, 80), // Change the box color to blue (you can choose a different color)
      child: ListTile(
        title: Text(
          contactName,
          style: TextStyle(
            color: Colors.white, // Set text color to white
            fontSize: 30.0, // Increase the text size
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
        // You can add more contact details or actions here if needed
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ContactList()));
}
