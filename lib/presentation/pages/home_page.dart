import 'package:calculation_app/presentation/state_managment/app_provider.dart';
import 'package:calculation_app/presentation/widgets/button.dart';
import 'package:calculation_app/presentation/widgets/custom_app_bar.dart';
import 'package:calculation_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home screen'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Consumer<AppProvider>(builder: (context, provider, child) {
          return Form(
            key: provider.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    const Text('Set valid API base URL in order to continue'),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.compare_arrows),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextFormField(
                            controller: provider.controller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a URL';
                              }
                              if (!RegExp(provider.urlPattern)
                                  .hasMatch(value)) {
                                return 'Please enter a valid URL';
                              }
                              if (provider.errorMessage.isNotEmpty) {
                                return provider.errorMessage;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              hintText: 'Please enter a URL',
                            ),
                            cursorColor: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Button(
                  text: 'Start counting process',
                  onTap: () async {
                    bool success = await provider.submitUrl();

                    if (success) {
                      if (context.mounted) {
                        context.push('/process');
                      }
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
