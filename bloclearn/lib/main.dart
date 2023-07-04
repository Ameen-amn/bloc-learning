import 'package:bloclearn/employee_item/bloc2/employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './employee_item/employee_ui/employee_screen.dart';
import './employee_list/list_bloc/list_bloc.dart';
import './employee_list/list_ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmployeeBloc()),
        BlocProvider(
          create: (context) => EmployeeListBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (ctx) => const EmployeeListScreen(),
          EmployeeItemScreen.routeName: (_) => EmployeeItemScreen()
        },
      ),
    );
  }
}
