import 'package:flutter/material.dart';

class ChatPageHeader extends StatelessWidget {
  const ChatPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text("Conversations", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
              height: 30,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.pink[50],),
              child: Row(
                children: const <Widget>[
                  Icon(Icons.add, color: Colors.pink, size: 20,),
                  SizedBox(width: 2,),
                  Text("Add New", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
