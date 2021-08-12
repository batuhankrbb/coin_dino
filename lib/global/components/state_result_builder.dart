import 'package:flutter/material.dart';

import '../../core/error_handling/custom_failure.dart';
import '../../core/result_types/state_result.dart';
import 'loading_screen.dart';

class StateResultBuilder<T> extends StatelessWidget {
  StateResultBuilder(
      {Key? key,
      required this.stateResult,
      this.initialWidget,
      this.loadingWidget,
      required this.completedWidget,
      required this.failureWidget})
      : super(key: key);

  final StateResult<T> stateResult;
  final Widget? initialWidget;
  final Widget? loadingWidget;
  final Widget Function(T data) completedWidget;
  final Widget Function(CustomFailure failure) failureWidget;

  @override
  Widget build(BuildContext context) {
    return stateResult.when(
      initial: () {
        return initialWidget ?? LoadingScreen();
      },
      loading: () {
        return loadingWidget ?? LoadingScreen();
      },
      completed: (data) {
        return completedWidget(data);
      },
      failed: (failure) {
        return failureWidget(failure);
      },
    );
  }
}
