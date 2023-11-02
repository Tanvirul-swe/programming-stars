part of 'sign_up_bloc.dart';

 class SignUpState extends Equatable {
  const SignUpState();
  
  @override
  List<Object> get props => [];
}

class SignUpInitialState extends SignUpState {}
class SignUpLoadingState extends SignUpState {}
class SignUpSuccessState extends SignUpState {}
class SignUpErrorState extends SignUpState {
  final String errorMessage;

  const SignUpErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}