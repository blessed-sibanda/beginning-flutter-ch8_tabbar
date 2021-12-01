import 'package:ch8_tabbar/pages/birthdays.dart';
import 'package:ch8_tabbar/pages/gratitude.dart';
import 'package:ch8_tabbar/pages/reminders.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabChanged);
  }

  void _tabChanged() {
    // Check if Tab Controller index is changing, otherwise we get the notice twice
    if (_tabController.indexIsChanging) {
      print('tabChanged: ${_tabController.index}');
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [Birthdays(), Gratitude(), Reminders()],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black54,
          unselectedLabelColor: Colors.black38,
          tabs: const [
            Tab(icon: Icon(Icons.cake), text: 'Birthdays'),
            Tab(icon: Icon(Icons.sentiment_satisfied), text: 'Gratitude'),
            Tab(icon: Icon(Icons.access_alarm), text: 'Reminders'),
          ],
        ),
      ),
    );
  }
}
