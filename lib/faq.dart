import 'package:flutter/material.dart';

class ExpansionFAQ extends StatelessWidget {
  const ExpansionFAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // General information section
        const ExpansionTile(
          leading: Icon(Icons.home),
          title: Text('General information'),
          children: [
            ListTile(
              title: Text('What is this product/service?'),
              subtitle: Text('This is a product/service that does X, Y, and Z.'),
            ),
            ListTile(
              title: Text('How does it work?'),
              subtitle: Text('It works by doing A, B, and C.'),
            ),
          ],
        ),
        // Troubleshooting and problem-solving section
        const ExpansionTile(
          leading: Icon(Icons.home),
          title: Text('Troubleshooting and problem-solving'),
          children: [
            ListTile(
              title: Text('I am having trouble logging in.'),
              subtitle: Text('Try resetting your password or contacting customer support for assistance.'),
            ),
            ListTile(
              title: Text('The app is crashing.'),
              subtitle: Text('Try closing and reopening the app, or contacting customer support for assistance.'),
            ),
          ],
        ),
        // Customer support and contact information section
        Card(
          child: Column(
            children: const [
              ListTile(
                title: Text('Customer support and contact information'),
                subtitle: Text('For assistance, you can contact us at the following numbers and email addresses:'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone number 1'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone number 2'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email address 1'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email address 2'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
