import 'package:flutter/material.dart';
import 'mainViewBody.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currintindex,
  });

  final int currintindex;

  @override
  Widget build(BuildContext context) {
    return MainviewBody(currintindex: currintindex);
  }
}
