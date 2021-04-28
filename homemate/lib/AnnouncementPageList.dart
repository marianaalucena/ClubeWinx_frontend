import 'package:flutter/material.dart';

import 'NewAnnouncementPage.dart';

class AnnouncementPageList extends StatefulWidget {
  @override
  _AnnouncementPageListState createState() => _AnnouncementPageListState();
}

class _AnnouncementPageListState extends State<AnnouncementPageList> {
  @override
  Widget build(BuildContext context) {
    void _clickButton() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewAnnouncementPage()),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      floatingActionButton: FloatingActionButton(
        onPressed: _clickButton,
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      ),
    );
  }
}
