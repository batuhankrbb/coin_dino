// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_alert_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScreenAlertViewModel on _ScreenAlertViewModelBase, Store {
  final _$alertResultAtom = Atom(name: '_ScreenAlertViewModelBase.alertResult');

  @override
  StateResult<List<AlertEntity>> get alertResult {
    _$alertResultAtom.reportRead();
    return super.alertResult;
  }

  @override
  set alertResult(StateResult<List<AlertEntity>> value) {
    _$alertResultAtom.reportWrite(value, super.alertResult, () {
      super.alertResult = value;
    });
  }

  final _$alertListToShowAtom =
      Atom(name: '_ScreenAlertViewModelBase.alertListToShow');

  @override
  ObservableList<AlertEntity> get alertListToShow {
    _$alertListToShowAtom.reportRead();
    return super.alertListToShow;
  }

  @override
  set alertListToShow(ObservableList<AlertEntity> value) {
    _$alertListToShowAtom.reportWrite(value, super.alertListToShow, () {
      super.alertListToShow = value;
    });
  }

  final _$textEditingControllerAtom =
      Atom(name: '_ScreenAlertViewModelBase.textEditingController');

  @override
  TextEditingController get textEditingController {
    _$textEditingControllerAtom.reportRead();
    return super.textEditingController;
  }

  @override
  set textEditingController(TextEditingController value) {
    _$textEditingControllerAtom.reportWrite(value, super.textEditingController,
        () {
      super.textEditingController = value;
    });
  }

  final _$checkAlertPermissionsAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.checkAlertPermissions');

  @override
  Future<bool> checkAlertPermissions({required bool withRequest}) {
    return _$checkAlertPermissionsAsyncAction
        .run(() => super.checkAlertPermissions(withRequest: withRequest));
  }

  final _$addAlertAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.addAlert');

  @override
  Future<void> addAlert({required AlertEntity entity}) {
    return _$addAlertAsyncAction.run(() => super.addAlert(entity: entity));
  }

  final _$updateAlertAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.updateAlert');

  @override
  Future<void> updateAlert({required AlertEntity entity}) {
    return _$updateAlertAsyncAction
        .run(() => super.updateAlert(entity: entity));
  }

  final _$getAllAlertsAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.getAllAlerts');

  @override
  Future<void> getAllAlerts() {
    return _$getAllAlertsAsyncAction.run(() => super.getAllAlerts());
  }

  final _$deleteAlertAsyncAction =
      AsyncAction('_ScreenAlertViewModelBase.deleteAlert');

  @override
  Future<void> deleteAlert({required AlertEntity entity}) {
    return _$deleteAlertAsyncAction
        .run(() => super.deleteAlert(entity: entity));
  }

  @override
  String toString() {
    return '''
alertResult: ${alertResult},
alertListToShow: ${alertListToShow},
textEditingController: ${textEditingController}
    ''';
  }
}
