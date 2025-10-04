import 'package:flutter/material.dart';
import 'package:ystask/widgets/task_card.dart';

class ProfileTasks extends StatelessWidget {
  const ProfileTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return const TaskCard();
        },
        childCount: 5,
      ),
    );
    return Container(
      color: Colors.amberAccent,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const TaskCard();
        },
      ),
    );
  }
}
