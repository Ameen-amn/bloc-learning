import 'package:flutter/material.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateLoggedIn extends AuthState {
  final String user;
  const AuthStateLoggedIn(this.user);
}

class AuthStateLoggingFailure extends AuthState {
  final Exception exception;
  const AuthStateLoggingFailure(this.exception);
}
