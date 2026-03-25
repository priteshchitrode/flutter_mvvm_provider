import 'package:flutter_mvvm_provider/core/base_notifier.dart';
import 'package:flutter_mvvm_provider/data/model/result.dart';
import 'package:flutter_mvvm_provider/data/ui_state/ui_state.dart';
import 'package:flutter_mvvm_provider/features/authentication/api_request/login_api_request.dart';
import 'package:flutter_mvvm_provider/features/authentication/model/login_model.dart';
import 'package:flutter_mvvm_provider/features/authentication/repository/login_repository.dart';

class LoginViewModel extends BaseNotifier {
  final LoginRepository _repository;
  LoginViewModel(this._repository);

  // Login api call
  UIState<LoginModel>? _loginUIState;
  UIState<LoginModel>? get loginUIState => _loginUIState;
  void _setLoginUIState(UIState<LoginModel>? uiState){
    _loginUIState = uiState;
    notifyListeners();
  }
  Future<void> login(LoginApiRequest request) async {
    _setLoginUIState(UIState.loading());
    Result<dynamic> result = await _repository.login(request);
    if (result is Success<LoginModel>) {
      _setLoginUIState(UIState.success(result.value));
    }
    if (result is Error) {
      _setLoginUIState(UIState.error(result.type));
    }
  }


  // Reset UI & Clear data model
  void resetUIStateAndClearData(){
    resetUIState<LoginModel>(_loginUIState);
  }

}