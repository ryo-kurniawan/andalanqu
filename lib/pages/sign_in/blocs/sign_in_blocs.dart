import 'package:andalanqu/pages/sign_in/blocs/sign_in_events.dart';
import 'package:andalanqu/pages/sign_in/blocs/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc():super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
      emit(state.copywith(email: event.email));
    }

    void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
      emit(state.copywith(password: event.password));
    }


  }
}