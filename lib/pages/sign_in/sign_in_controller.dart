import 'package:andalanqu/pages/sign_in/blocs/sign_in_blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type){
    try{
      if(type == "email"){

        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
      }
    }catch(e){

    }
  }
}