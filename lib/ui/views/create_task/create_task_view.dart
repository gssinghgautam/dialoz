import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'create_task_viewmodel.dart';

class CreateTaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateTaskViewModel>.reactive(
      viewModelBuilder: () => CreateTaskViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
