import 'package:andalanqu/app_blocs.dart';
import 'package:andalanqu/app_events.dart';
import 'package:andalanqu/app_states.dart';
import 'package:andalanqu/pages/sign_in/sign_in.dart';
import 'package:andalanqu/pages/welcome/bloc/welcome_blocs.dart';
import 'package:andalanqu/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            // lazy: false,
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            // lazy: false,
            create: (context) =>AppBlocs(),
          ),
        ],
        child: ScreenUtilInit(
            builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.white
                )
              ),
              home: const Welcome(),
              routes: {
                "myHomePage":(context)=>const MyHomePage(),
                "signIn":(context)=>const SignIn()
              },
            )),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Home Page"),
        ),
        body: Center(
            child: BlocBuilder<AppBlocs, AppStates>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${BlocProvider.of<AppBlocs>(context).state.counter}",
                    style: Theme.of(context).textTheme.headlineMedium,)
                  ],
                );
              },
            )
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: "heroTag1",
              onPressed: () =>
                  BlocProvider.of<AppBlocs>(context).add(Increment()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "heroTag2",
              onPressed: () =>
                  BlocProvider.of<AppBlocs>(context).add(Decrement()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
