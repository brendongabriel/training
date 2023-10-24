import 'package:flutter/material.dart';
import 'package:training/pages/monitoring.dart';
import 'package:training/pages/home.dart';
import 'package:training/pages/settings.dart';
import 'package:training/pages/training.dart';
import 'package:table_calendar/table_calendar.dart';

var now = DateTime.now();
var firstDay = DateTime(now.year, now.month - 3, now.day);
var lastDay = DateTime(now.year, now.month + 3, now.day);

class CalendarPage extends StatelessWidget {
  int _opcaoSelecionada = 0;
  CalendarFormat format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 2,
              onTap: (value) {
          switch (value) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MonitoringPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrainingPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              break;
            default:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
          }
        },
              fixedColor: Colors.blue,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                        width: 25, // Defina a largura desejada
                        height: 25, // Defina a altura desejada
                        child: Image.asset('assets/calendario.png')),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 30, // Defina a largura desejada
                    height: 30, // Defina a altura desejada,
                    child: Image.asset('assets/coracao.png'),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 45, // Defina a largura desejada
                    height: 45, // Defina a altura desejada,
                    child: Image.asset('assets/avatar.png'),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 35, // Defina a largura desejada
                    height: 35, // Defina a altura desejada
                    child: Image.asset('assets/halteres.png'),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 30, // Defina a largura desejada
                    height: 30, // Defina a altura desejada
                    child: Image.asset('assets/contexto.png'),
                  ),
                  label: '',
                ),
              ],
            ),
            appBar: AppBar(
              title: Text("Aplicativo academia"),
            ),
            body: Container(
                child: Column(
              children: [
                TableCalendar(
                  focusedDay: now,
                  firstDay: firstDay,
                  lastDay: lastDay,
                  calendarFormat: format,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month',
                    CalendarFormat.week: 'Week',
                  },
                  headerStyle: HeaderStyle(
                    leftChevronIcon: const Icon(Icons.chevron_left,
                        size: 24, color: Colors.black),
                    rightChevronIcon: const Icon(Icons.chevron_right,
                        size: 24, color: Colors.black),
                    headerPadding: EdgeInsets.zero,
                    formatButtonVisible: false,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    formatButtonTextStyle:
                        TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: TextButton(
                    child: Text(
                      "Lista de treinos",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Container(
                        height: 80,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Stack(
                          children: [
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.fitness_center),
                                title: Text('Treino 1'),
                                subtitle: Text(now.day.toString() +
                                    '/' +
                                    now.month.toString() +
                                    '/' +
                                    now.year.toString()),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text("Treino de pernas",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)))
                          ],
                        )),
                    Container(
                        height: 80,
                        margin: EdgeInsets.only(top: 80),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Stack(
                          children: [
                            Card(
                              child: ListTile(
                                leading: Icon(Icons.fitness_center),
                                title: Text('Treino 2'),
                                subtitle: Text(now.day.toString() +
                                    '/' +
                                    now.month.toString() +
                                    '/' +
                                    now.year.toString()),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text("Treino de ombros",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)))
                          ],
                        )),
                  ],
                ),
              ],
            ))));
  }
}
