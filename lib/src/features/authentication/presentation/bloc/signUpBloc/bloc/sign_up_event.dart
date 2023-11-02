part of 'sign_up_bloc.dart';

 class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpEvent {}
class SignUpRequest extends SignUpEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
      ];
}
