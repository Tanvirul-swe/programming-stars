part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;

  const SignInErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
