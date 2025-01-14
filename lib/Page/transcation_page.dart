import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TranscationPage extends StatefulWidget {
  const TranscationPage({super.key});

  @override
  State<TranscationPage> createState() => _TranscationPageState();
}

class _TranscationPageState extends State<TranscationPage> {
  bool isExpense = false;

  List<String> list = ['Pekerjaan', 'Investasi', 'Hoby'];

  late String dropDownValue = list.first;

  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Transaction",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Switch(
                      value: isExpense,
                      onChanged: (bool value) {
                        setState(() {
                          isExpense = value;
                        });
                      },
                      inactiveTrackColor: Colors.green[200],
                      inactiveThumbColor: Colors.green,
                      activeColor: Colors.red,
                    ),
                    Text(
                      (isExpense) ? "Expense" : "Income",
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hoverColor: Colors.green,
                    labelText: "Amount",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Category',
                  style: GoogleFonts.montserrat(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropDownValue,
                    icon: Icon(Icons.arrow_downward),
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String? value) {}),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: "Enter Date",
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099));
                    if (picked != null) {
                      String dateFormat =
                          DateFormat('yyyy-MM-dd').format(picked);

                      dateController.text = dateFormat;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
