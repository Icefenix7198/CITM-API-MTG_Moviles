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

class _TabBarCardsState extends State<TabBarCards> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 3, color: Colors.red),
      ),
      indicatorColor: Colors.red,
      tabs: widget.tabs,
    );
  }
}
