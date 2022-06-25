import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super();
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Authenticated extends AuthenticationState {
  final User currentUser;

  Authenticated({required this.currentUser});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
  @override
  List<Object?> get props => [];
}
