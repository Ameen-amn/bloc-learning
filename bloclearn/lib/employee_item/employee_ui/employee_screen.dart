import 'package:bloclearn/employee_item/bloc2/employee_bloc.dart';
import 'package:bloclearn/employee_item/bloc2/employee_events.dart';
import 'package:bloclearn/employee_item/bloc2/employee_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeItemScreen extends StatefulWidget {
  static const routeName = '/EmployeeItemScreen';

  EmployeeItemScreen({super.key});

  @override
  State<EmployeeItemScreen> createState() => _EmployeeItemScreenState();
}

class _EmployeeItemScreenState extends State<EmployeeItemScreen> {
  final _formKey = GlobalKey<FormState>();
  EmployeeBloc employeeBloc = EmployeeBloc();
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController retirementDate = TextEditingController();

  @override
  void initState() {
    employeeBloc.add(EmployeeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee Detail"),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text(
                      "Clear",
                      style: TextStyle(color: Colors.blue),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ElevatedButton(
                      onPressed: () {
                        print("save new employee");

                        employeeBloc.add(EmployeeSaveEvent());
                      },
                      child: Text("Save")),
                ),
              ],
            ),
          ],
        ),
      ),
      body: BlocConsumer<EmployeeBloc, EmployeeState>(
        bloc: EmployeeBloc(),
        listener: (context, state) {
          // TODO: implement listener
        },
        listenWhen: (previous, current) => current is EmployeeActioSatate,
        buildWhen: (previous, current) => current is! EmployeeActioSatate,
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            prefixIcon: Icon(Icons.person_2_outlined,
                                color: Colors.blue),
                            hintText: "Employee Name",
                            border: OutlineInputBorder()),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 23),
                        child: TextFormField(
                          controller: position,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              prefixIcon: Icon(Icons.cases_outlined,
                                  color: Colors.blue),
                              hintText: "Position",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDatePicker(
                                     // builder: (context,child)=>Theme(data: ThemeData().co, child: child),
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2050));
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.date_range),
                                    Text('To Day'),
                                  ],
                                )),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: position,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  prefixIcon: Icon(Icons.date_range,
                                      color: Colors.blue),
                                  hintText: "No date",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
