import 'package:calculation_app/presentation/state_managment/app_provider.dart';
import 'package:calculation_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Result list screen'),
      body: Consumer<AppProvider>(builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.tasks.length < 10 ? 10 : provider.tasks.length,
          itemBuilder: (context, index) {
            final task =
                index < provider.tasks.length ? provider.tasks[index] : null;

            return ListTile(
              onTap: () {
                if (task != null) {
                  int crossAxisCount = task.field.first.length;
                  int itemCount = task.field.length * crossAxisCount;

                  context.push(
                    '/grid',
                    extra: {
                      "crossAxisCount": crossAxisCount,
                      "itemCount": itemCount,
                      "task": task,
                      "result": provider.results[index],
                    },
                  );
                }
              },
              title: task != null
                  ? Center(
                      child: Text(
                        provider.results[index].result.path,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      height: 40.0,
                      color: Colors.black,
                    ),
              shape: const Border(bottom: BorderSide(color: Colors.grey)),
            );
          },
        );
      }),
    );
  }
}
