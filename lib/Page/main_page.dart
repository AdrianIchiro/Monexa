import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monexa/Page/category_page.dart';
import 'package:monexa/Page/home_page.dart';
import 'package:monexa/Page/transcation_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), CategoryPage()];
  int currentIndex = 0;

  void tapIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0)
          ? CalendarAppBar(
              accent: Colors.green,
              locale: 'id',
              backButton: false,
              onDateChanged: (value) => print(value),
              firstDate: DateTime.now().subtract(Duration(days: 140)),
              lastDate: DateTime.now(),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Container(
                child: Text(
                  "Category",
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
                padding: EdgeInsets.symmetric(vertical: 36, horizontal: 16),
              ),
            ),
      body: _children[currentIndex],
      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
                    MaterialPageRoute(builder: (context) => TranscationPage()))
                .then((onvalue) {
              setState(() {});
            });
          },
          backgroundColor: Colors.green,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  tapIndex(0);
                },
                icon: Icon(Icons.home)),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  tapIndex(1);
                },
                icon: Icon(Icons.list))
          ],
        ),
      ),
    );
  }
}
