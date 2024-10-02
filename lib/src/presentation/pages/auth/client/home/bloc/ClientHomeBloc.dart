import 'package:demo_view_shopify/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/client/home/bloc/ClientHomeEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/client/home/bloc/ClientHomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  AuthUseCases authUseCase;

  ClientHomeBloc(this.authUseCase) : super(ClientHomeState()) {
    on<ClientLogout>(_onClientLogout);
    on<ClientChangeDrawerPage>(_onClientChange);
  }

  Future<void> _onClientLogout(
      ClientLogout event, Emitter<ClientHomeState> emit) async {
    await authUseCase.logout.run();
  }

  Future<void> _onClientChange(
      ClientChangeDrawerPage event, Emitter<ClientHomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }
}
