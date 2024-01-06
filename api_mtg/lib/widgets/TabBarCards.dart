import 'package:flutter/material.dart';

class TabBarCards extends StatefulWidget {
   TabBarCards({
    super.key,
    required this.tabs,
    required this.tabController,
  });

  final List<Tab> tabs;
  var tabController; 

  @override
  State<TabBarCards> createState() => _TabBarCardsState();
}

class _TabBarCardsState extends State<TabBarCards> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 3, color: Colors.red),
      ),
      indicatorColor: Colors.red,
      controller: widget.tabController,
      tabs: widget.tabs,
    );
  }
}
