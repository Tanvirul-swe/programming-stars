part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInInitialEvent extends SignInEvent {}

class SignInLoadingEvent extends SignInEvent {}

class SignInRequestEvent extends SignInEvent {
  final String email;
  final String password;

  const SignInRequestEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
