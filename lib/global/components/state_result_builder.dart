import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/core/result_types/state_result.dart';
import 'package:coin_dino/global/components/loading_screen_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
