import 'package:calculation_app/presentation/state_managment/app_provider.dart';
import 'package:calculation_app/presentation/widgets/button.dart';
import 'package:calculation_app/presentation/widgets/custom_app_bar.dart';
import 'package:calculation_app/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProcessPage extends StatefulWidget {
  const ProcessPage({super.key});

  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  late AppProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<AppProvider>(context, listen: false);

    if (_provider.tasks.isNotEmpty) {
      _provider.calculateShortestPath();
    } else {
      _provider.errorMessage = 'No tasks found.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Process screen'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'All calculations have finished, you can send your results to server',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Consumer<AppProvider>(
                    builder: (context, provider, child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${(provider.completionPercentage * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(fontSize: 25.0),
                        ),
                      );
                    },
                  ),
                  Consumer<AppProvider>(
                    builder: (context, provider, child) {
                      return CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 6.0,
                        percent: provider.completionPercentage,
                        progressColor: Colors.blueAccent,
                        circularStrokeCap: CircularStrokeCap.round,
                      );
                    },
                  ),
                ],
              ),
            ),
            Consumer<AppProvider>(
              builder: (context, provider, child) {
                return provider.completionPercentage == 1.0
                    ? provider.isLoading
                        ? const CircularProgressIndicator(color: AppColors.blue)
                        : Column(
                            children: [
                              Button(
                                onTap: () async {
                                  provider.isLoading = true;
                                  try {
                                    await provider.postResult();

                                    if (provider.errorMessage.isEmpty &&
                                        context.mounted) {
                                      context.push('/result');
                                    }
                                  } catch (e) {
                                    provider.errorMessage = e.toString();
                                  } finally {
                                    provider.isLoading = false;
                                  }
                                },
                                text: 'Send results to server',
                              ),
                              if (provider.errorMessage.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    provider.errorMessage,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                            ],
                          )
                    : const SizedBox(height: 73.0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
