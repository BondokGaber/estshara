import 'package:estshara/consultkind.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

import 'userconsultpro.dart';


class CalenderUI extends StatefulWidget {
  @override
  _CalenderUIState createState() => _CalenderUIState();
}

class _CalenderUIState extends State<CalenderUI> {
  Color _btnCo =Colors.cyan;
DateTime  _selectedDay =DateTime.now();
DateTime  _focusedDay =DateTime.now();

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("حجز الجلسة",style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),
      body: Column(
        children: [
          Container(
            width: sWidth,
            height: sHeight*.52
            ,
            child: TableCalendar(focusedDay: _focusedDay, firstDay: DateTime(2020), lastDay:DateTime(2050)
            ,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  _selectedDay = selectDay;
                  _focusedDay = focusDay;
                });
                print(_focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(_selectedDay, date);
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),

              ),
            ),
          ),
          SizedBox(height: sHeight*.02,),
          Container( width: sWidth,
            height: sHeight*.3,
       child: GridView.builder(
         physics: NeverScrollableScrollPhysics(),
         shrinkWrap: true,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 3,
           crossAxisSpacing: 3.0,
           mainAxisSpacing: 5.0,
           childAspectRatio: sHeight * .004
           ,
         ),
         itemCount: 10,
         itemBuilder: (context, index) {
           return Container(
             height: sHeight * .01,
             width: sWidth * .2,

             decoration: BoxDecoration(
                 color: Colors.red,
                 borderRadius:
                 BorderRadius.all(Radius.circular(30))),
             child: ConstrainedBox(
               constraints: BoxConstraints.tightFor(
                   height: sHeight * .01, width: sWidth * .02),
               child: ElevatedButton(
                 child: Text(
                   '10-5-2021',
                   style: TextStyle(
                     fontFamily: 'Cairo',
                     fontSize: 18,
                     color: const Color(0xffffffff),
                   ),
                 ),
                 style: ElevatedButton.styleFrom(
                   elevation: 20,
                   primary: _btnCo,
                   onPrimary: Colors.orangeAccent,
                   shape: const BeveledRectangleBorder(
                       borderRadius:
                       BorderRadius.all(Radius.circular(5))),
                 ),
                 onPressed: () {

                   Navigator.push(context,MaterialPageRoute(builder: (context)=>UserConsultPro()));
                 },
               ),
             ),
           );
         },
       ),
            ),
        ],
      ),
    );

  }
}
