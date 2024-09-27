import 'dart:async';

import 'package:calculation_app/API/task_api.dart';
import 'package:calculation_app/models/coordinates_mode/coordinates_model.dart';
import 'package:calculation_app/models/data_model/data_model.dart';
import 'package:calculation_app/models/result_model/result_model.dart';
import 'package:calculation_app/services/path_calculation.dart';
import 'package:calculation_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  final DataService _dataService = DataService();
  static const String _urlPattern =
      r"^(https?:\/\/)?([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,}(\/.*)?$";

  List<DataModel?> _tasks = [];
  late PathCalculation _grid;
  final List<ResultModel> _results = [];
  bool _isLoading = false;
  double _completionPercentage = 0.0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String _errorMessage = '';
  String? _savedUrl;

  List<DataModel?> get tasks => _tasks;
  PathCalculation get grid => _grid;
  List<ResultModel> get results => _results;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get controller => _controller;

  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  String? get savedUrl => _savedUrl;
  String get urlPattern => _urlPattern;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  double get completionPercentage => _completionPercentage;

  void setCompletionPercentage(double percentage) {
    _completionPercentage = percentage.clamp(0.0, 1.0);
    notifyListeners();
  }

  void calculateShortestPath() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_completionPercentage < 1.0) {
        setCompletionPercentage(_completionPercentage + 0.01);
      } else {
        timer.cancel();
      }
    });

    for (var task in tasks) {
      if (task != null) {
        _grid = PathCalculation(task.field, task.start, task.end);
        List<CoordinatesModel>? path = _grid.bfs();

        if (path != null) {
          List<CoordinatesModel> steps = path
              .map((step) => CoordinatesModel(x: step.x, y: step.y))
              .toList();

          String pathString =
              steps.map((coord) => '(${coord.x},${coord.y})').join('->');

          ResultData resultData = ResultData(
            steps: steps,
            path: pathString,
          );

          ResultModel result = ResultModel(
            id: task.id,
            result: resultData,
          );

          _results.add(result);
        } else {
          print('No path found');
        }
      }
    }

    print('Calculated Results: $_results');
  }

  Future<bool> submitUrl() async {
    _errorMessage = '';
    notifyListeners();
    if (_formKey.currentState!.validate()) {
      try {
        String url = _controller.text;
        await _saveUrl(url);
        await _getTasks(url);
        _errorMessage = '';
        notifyListeners();
        return true;
      } catch (e) {
        _errorMessage = "Error accessing URL: $e";
        print(_errorMessage);
        notifyListeners();
        return false;
      }
    }

    _errorMessage = "Invalid URL";
    notifyListeners();
    return false;
  }

  Future<void> _getTasks(String url) async {
    try {
      _tasks = await _dataService.fetchData(url);
    } catch (error) {
      _errorMessage = 'Error fetching data: $error';
      print(_errorMessage);
    }
    notifyListeners();
  }

  Future<void> postResult() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _dataService.postData(_controller.text, _results);
      _errorMessage = '';
    } catch (error) {
      _errorMessage = 'Error posting data: $error';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _saveUrl(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('api_url', url);
  }

  Future<void> loadSavedUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedUrl = prefs.getString('api_url');
    if (_savedUrl != null) {
      _controller.text = _savedUrl!;
      await _getTasks(_savedUrl!);
    }
  }

  Color getCellColor(
      int x, int y, DataModel currentTask, ResultModel currentResult) {
    if (x == currentTask.start.x && y == currentTask.start.y) {
      return AppColors.start;
    } else if (x == currentTask.end.x && y == currentTask.end.y) {
      return AppColors.end;
    }

    if (currentResult.result.steps
        .any((element) => element.x == x && element.y == y)) {
      return AppColors.path;
    }

    return AppColors.white;
  }

  void reset() {
    _errorMessage = '';
    _controller.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
