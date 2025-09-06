import 'package:flutter/material.dart';
import '../HomeView.dart';

class MainviewBody extends StatelessWidget {
  const MainviewBody({super.key, required this.currintindex});
  final int currintindex;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currintindex,
      children: const [
        Homeview(),
        SizedBox(),
        SizedBox(),
        SizedBox(),

      ],
    );
  }
}
