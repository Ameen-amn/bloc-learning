import 'package:flutter/material.dart';

class EmployeeItemScreen extends StatefulWidget {
  static const routeName = '/EmployeeItemScreen';
  const EmployeeItemScreen({super.key});

  @override
  State<EmployeeItemScreen> createState() => _EmployeeItemScreenState();
}

class _EmployeeItemScreenState extends State<EmployeeItemScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController joiningDate = TextEditingController();
  TextEditingController retirementDate = TextEditingController();

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
            Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Cleat")),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ElevatedButton(onPressed: () {}, child: Text("Save")),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
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
                        prefixIcon:
                            Icon(Icons.person_2_outlined, color: Colors.blue),
                        hintText: "Employee Name",
                        border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 23),
                    child: TextFormField(
                      controller: position,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          prefixIcon:
                              Icon(Icons.cases_outlined, color: Colors.blue),
                          hintText: "Position",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: position,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              prefixIcon:
                                  Icon(Icons.date_range, color: Colors.blue),
                              hintText: "ToDay",
                              border: OutlineInputBorder()),
                        ),
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
                              prefixIcon:
                                  Icon(Icons.date_range, color: Colors.blue),
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
      ),
    );
  }
}
