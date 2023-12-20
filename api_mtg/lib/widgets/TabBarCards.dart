import 'package:flutter/material.dart';

class TabBarCards extends StatefulWidget {
  const TabBarCards({
    super.key,
    required this.tabs,
  });

  final List<Tab> tabs;

  @override
  State<TabBarCards> createState() => _TabBarCardsState();
}

class _TabBarCardsState extends State<TabBarCards>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.red,
      controller: _tabController,
      tabs: widget.tabs,
    );
  }
}