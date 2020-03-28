import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

// ignore: must_be_immutable
class AuthenticatedState extends AuthState {
  FirebaseUser user;

  AuthenticatedState({
    @required this.user
  });

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class UNAuthenticatedState extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
