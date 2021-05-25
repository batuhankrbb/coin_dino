import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/core/result_types/state_result.dart';
import 'package:flutter/material.dart';

class StateResultBuilder<T> extends StatelessWidget {
  StateResultBuilder(
      {Key? key,
      required this.stateResult,
      required this.initialWidget,
      required this.loadingWidget,
      required this.completedWidget,
      required this.failureWidget})
      : super(key: key);

  StateResult<T> stateResult;
  Widget initialWidget;
  Widget loadingWidget;
  Widget Function(T data) completedWidget;
  Widget Function(CustomFailure failure) failureWidget;

  @override
  Widget build(BuildContext context) {
    return stateResult.when(
      initial: () {
        return initialWidget;
      },
      loading: () {
        return loadingWidget;
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
