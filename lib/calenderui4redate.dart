
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Repo/repository.dart';
import 'model/UserModels/getappointmentm.dart';



class CalenderUiDate extends StatefulWidget {
  String reserveId;
  int consultant_id;
  CalenderUiDate({Key key,this.reserveId,this.consultant_id}) : super(key: key);

  @override
  _CalenderUiDateState createState() => _CalenderUiDateState();
}

class _CalenderUiDateState extends State<CalenderUiDate> {
  Color _btnCo =Colors.grey;
  String date_only=DateTime.now().toString().substring(0,10);
  DateTime  _selectedDay =DateTime.now();
  DateTime  _focusedDay =DateTime.now();
  Repository _repo = Repository();
  showAlertDialog(BuildContext context) {

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("أنتبه"),
      content: Text(
        "لقد قمت باختيار موعد مجوز مسبقا من فضلك اختر موعد اخر من فضلك اختر الموعد المتاح المظلل باللون الازرق ",
        textDirection: TextDirection.rtl,
      ),

    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog2(BuildContext context) {

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("تمت بنجاح"),
      content: Text(
        "تم اعادة جدولة الاستشارة بنجاح",
        textDirection: TextDirection.rtl,
      ),

    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  int appointment_id = 0;
  String appointment_date ="";
  @override
  void initState() {
    print(widget.reserveId);// TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String dateFormatter(DateTime date) {
      dynamic dayData =
          '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thu", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

      dynamic monthData =
          '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';
      return json.decode(dayData)['${date.weekday}'] +
          ", " +
          date.day.toString() +
          " " +
          json.decode(monthData)['${date.month}'] +
          " " +
          date.year.toString();
    }
    String day='';

    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("حجز الجلسة",style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: sWidth,
              height: sHeight*.52
              ,
              child: TableCalendar(focusedDay: _focusedDay, firstDay: DateTime(2005), lastDay:DateTime(2050)
                ,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,

                //Day Changed
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    _selectedDay = selectDay;
                    _focusedDay = focusDay;
                    day=   dateFormatter(_focusedDay);
                    date_only =_focusedDay.toString().substring(0,10);
                    print(day.substring(0,3));

                  });
                  print(_focusedDay.toString().substring(0,10));
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
            SizedBox(height: sHeight*.015,),
            Container( width: sWidth,
              height: sHeight*.29,
              child: StreamBuilder<GetAppointmentM>(
                  stream:
                  _repo.get_appointment(consultant_id: widget.consultant_id, date: date_only).asStream(),
                  builder: (context, snapshot) {
                    if(snapshot.data!=null)
                    { return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: sHeight * .004,
                      ),
                      itemCount:snapshot.data.appointments.length,
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
                              child:Text("${snapshot.data.appointments[index].date.toString().substring(11,16)}",
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 20,
                                primary: snapshot.data.appointments[index].status=="active"
                                    ?  Colors.grey//Colors.grey
                                    :Colors.redAccent,
                                onPrimary: Colors.cyan,
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                              ),
                              onPressed: () {
                                setState(() {
                                  if(snapshot.data.appointments[index].status=="active")
                                  {
                                    _btnCo=Colors.cyanAccent;
                                    appointment_id = snapshot.data.appointments[index].id;
                                    appointment_date = snapshot.data.appointments[index].date.toString();
                                    print(appointment_id);
                                  }
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );}
                    else{return Center(child: CircularProgressIndicator(),);}
                  }
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: sHeight * .07,
                width: sWidth * .72,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(30))),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      height: sHeight * 1, width: sWidth * 1),
                  child: ElevatedButton(
                    child: Text(
                      'التالي',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 20,
                      primary: Colors.cyan,
                      onPrimary: Colors.orangeAccent,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(30))),
                    ),
                    onPressed: () {
                      if(appointment_id!=0) {
                        _repo.updateReserve(reservation_id: widget.reserveId, date: appointment_date);
                        showAlertDialog2(context);
                      }else {showAlertDialog(context);}
                    }
                    ,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }}
