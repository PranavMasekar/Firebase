import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object?> get props => [];
}

class LogIn extends AuthenticationEvent {
  @override
  String toString() => 'LoggedIn';
  @override
  List<Object?> get props => [];
}

class LogOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
  @override
  List<Object?> get props => [];
}
