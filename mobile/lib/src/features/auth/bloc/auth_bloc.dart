import 'dart:developer';

import 'package:arstate/arstate.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fani_wedding/src/network/data/common/http.dart';
import 'package:fani_wedding/src/utils/fetch_state.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final xhttp = XHttp();

  AuthBloc() : super(const AuthState()) {
    on<RegisterEvent>(onRegister);
    on<LoginEvent>(onLogin);
  }
  Future<void> onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    try {
      // send status loding to view
      emit(state.copyWith(
          register: state.register.copyWith(status: FetchingStatus.loading)));

      //setup request body
      final body = {
        "name": event.name,
        "email": event.email,
        "password": event.password,
        "number": event.number,
      };

      // body to api
      final response = await xhttp.post<Map<String, dynamic>>(
        "/register",
        baseUrl: "http://10.0.2.2:8000/api",
        data: body,
        onSuccess: (response) => response.data,
      );

      // mapping response dari api
      response.when(
        success: (data) {
          if (data['message'] == "Failed") {
            emit(state.copyWith(
                register: state.register.copyWith(
                    status: FetchingStatus.failed,
                    error:
                        "Terjadi kesalahan, silahkan ulangi beberapa saat lagi")));
          } else {
            emit(state.copyWith(
                register:
                    state.register.copyWith(status: FetchingStatus.success)));
          }
        },
        failure: (error) {
          emit(state.copyWith(
              register: state.register.copyWith(
                  status: FetchingStatus.failed, error: error.message())));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          register: state.register
              .copyWith(status: FetchingStatus.failed, error: e.toString())));
    }
  }

  Future<void> onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      // send status loding to view
      emit(state.copyWith(
          login: state.login.copyWith(status: FetchingStatus.loading)));

      //setup request body
      final body = {
        "email": event.email,
        "password": event.password,
      };

      // body to api
      final response = await xhttp.post<Map<String, dynamic>>(
        "/login",
        baseUrl: "http://10.0.2.2:8000/api",
        data: body,
        onSuccess: (response) => response.data,
      );

      // mapping response dari api
      response.when(
        success: (data) {
          log("/log/ Failed : ${data['message'] == "Failed"}");
          if (data['message'] == "Failed") {
            throw const NetworkExceptions.badRequest(
                reason: "Email dan password salah");
          } else {
            emit(state.copyWith(
                login: state.login.copyWith(status: FetchingStatus.success)));
          }
        },
        failure: (error) {
          log("/log/ ERROR : $error");
          emit(state.copyWith(
              login: state.login.copyWith(
                  status: FetchingStatus.failed, error: error.message())));
        },
      );
    } on NetworkExceptions catch (e) {
      emit(state.copyWith(
          login: state.login.copyWith(
              status: FetchingStatus.failed,
              error: e.messageDescription().toString())));
    }
  }
}
