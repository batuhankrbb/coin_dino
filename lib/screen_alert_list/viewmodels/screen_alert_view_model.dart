import 'package:coin_dino/core/result_types/state_result.dart';
import 'package:coin_dino/features/alert/data/repository/alert_repository.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:coin_dino/features/alert/domain/repository_contract/i_alert_repository.dart';
import 'package:mobx/mobx.dart';
part 'screen_alert_view_model.g.dart';

class ScreenAlertViewModel = _ScreenAlertViewModelBase
    with _$ScreenAlertViewModel;

abstract class _ScreenAlertViewModelBase with Store {
  final IAlertRepository alertRepository;

  _ScreenAlertViewModelBase({required this.alertRepository});

  @observable
  StateResult<List<AlertEntity>> alertsResult = StateResult.initial();

  @action 
  Future<void> addAlert(AlertEntity alertEntity) async{

  }
}

/*
  Future<Result<List<AlertEntity>>> getAllAlerts();
  Future<Result<void>> addAlert(AlertEntity alertEntity);
  Future<Result<void>> deleteAlert(AlertEntity alertEntity);
  Future<Result<void>> updateAlert(AlertEntity alertEntity);
  Future<Result<void>> checkAlerts();
*/