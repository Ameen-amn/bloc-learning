import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthIntialize extends AuthEvent {
  const AuthIntialize();
}

class AuthLoggIn extends AuthEvent {
  final String email;
  final String password;
  const AuthLoggIn(this.email, this.password);
}

class AuthLoggOut extends AuthEvent {
  const AuthLoggOut();
}
