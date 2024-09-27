import 'package:calculation_app/models/data_model/data_model.dart';
import 'package:calculation_app/models/result_model/result_model.dart';
import 'package:calculation_app/presentation/state_managment/app_provider.dart';
import 'package:calculation_app/presentation/widgets/custom_app_bar.dart';
import 'package:calculation_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridPage extends StatelessWidget {
  final int crossAxisCount;
  final int itemCount;
  final DataModel task;
  final ResultModel result;

  const GridPage({
    super.key,
    required this.crossAxisCount,
    required this.itemCount,
    required this.task,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Preview Page'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
              ),
              itemBuilder: (context, index) {
                return Consumer<AppProvider>(
                    builder: (context, provider, child) {
                  int x = index % crossAxisCount;
                  int y = index ~/ crossAxisCount;
                  return Container(
                    decoration: BoxDecoration(
                        color: provider.getCellColor(x, y, task, result),
                        border: Border.all(color: AppColors.black)),
                    child: Center(
                      child: Text(
                        '($x, $y)',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                });
              },
              itemCount: itemCount,
            ),
          ),
          Text(result.result.path),
        ],
      ),
    );
  }
}
