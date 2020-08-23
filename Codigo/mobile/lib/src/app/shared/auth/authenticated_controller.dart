import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authenticated_controller.g.dart';

enum AuthenticatedState { IDLE, LOGADO, DESLOGADO, VISITANTE }

class AuthenticatedController = _AuthenticatedController
    with _$AuthenticatedController;

abstract class _AuthenticatedController with Store {
  _AuthenticatedController() {
    Future.delayed(const Duration(seconds: 1), () {
      this._verificaUsuarioLogado();
    });
  }

  @observable
  AuthenticatedState authenticatedState = AuthenticatedState.IDLE;

  @computed
  bool get isAuthenticated => authenticatedState == AuthenticatedState.LOGADO;

  Future _verificaUsuarioLogado() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String email = prefs.getString("email");
    // String senha = prefs.getString("senha");

    // if (email == null || senha == null) {
    //   authenticatedState = AuthenticatedState.DESLOGADO;
    // } else {
    //   await frwkNetwork
    //       .getToken(email: email, senha: senha)
    //       .then((response) async {
    //     if (response == true) {
    //       await this.getDadosUsuario();
    //       authenticatedState = AuthenticatedState.LOGADO;
    //       frwkNavigator.popNavigate();
    //     } else {
    //       print('Não foi possível buscar o token');
    //       this.deslogar();
    //     }
    //   }).catchError((onError) {
    //     authenticatedState = AuthenticatedState.DESLOGADO;
    //   });
    // }
  }

  @action
  changeAuthenticatedState(AuthenticatedState state) {
    this.authenticatedState = state;
  }

  @action
  getDadosUsuario() async {
    // await frwkNetwork.request(HttpMethod.GET, 'auth/me').then((response) {
    //   print(response);
    //   this.usuarioLogado = Usuario.map(response);
    // }).catchError((onError) {
    //   print(onError);
    // });
  }

  @action
  login(String email, String senha) async {}

  @action
  deslogar() async {
    // await this._clearPrefs();
    // usuarioLogado = null;
    // authenticatedState = AuthenticatedState.DESLOGADO;
  }

  _clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("email");
    await prefs.remove("senha");
    await prefs.remove("token");
    await prefs.clear();
  }
}
