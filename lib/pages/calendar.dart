import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:training/pages/monitoring.dart';
import 'package:training/pages/home.dart';
import 'package:training/pages/settings.dart';
import 'package:training/pages/training.dart';

import 'package:training/services/firestore.dart';
import 'package:table_calendar/table_calendar.dart';

var now = DateTime.now();
var firstDay = DateTime(now.year, now.month - 3, now.day);
var lastDay = DateTime(now.year, now.month + 3, now.day);

class CalendarPage extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();
  DateTime? _selectedDay = DateTime.now(); // Inicializa com a data atual
  CalendarFormat _calendarFormat = CalendarFormat.month;
  int _opcaoSelecionada = 0;

  CalendarFormat format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    buscarTreinos(_selectedDay);
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
              title: Text("Training"),
            ),
            body: Container(
                child: Column(
              children: [
                TableCalendar(
                  focusedDay: now,
                  firstDay: firstDay,
                  lastDay: lastDay,
                  calendarFormat: _calendarFormat,
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
                  onDaySelected: (selectedDay, focusedDay) {
                    _selectedDay = selectedDay;
                    buscarTreinos(_selectedDay);
                  },
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
                Expanded(
                  child: StreamBuilder<Stream<QuerySnapshot>>(
                    stream: trainingStreamController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return StreamBuilder<QuerySnapshot>(
                          stream: snapshot.data,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot documentSnapshot =
                                      snapshot.data!.docs[index];
                                  String docID = documentSnapshot.id;
                                  Map<String, dynamic> task = documentSnapshot
                                      .data() as Map<String, dynamic>;
                                  return ListTile(
                                    title: Text(task['name']),
                                    subtitle: Text(task['description']),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                    onTap: () {},
                                  );
                                },
                              );
                            } else {
                              return Center(
                                  child: Text("Sem treinos cadastrados"));
                            }
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ))));
  }

  void buscarTreinos(DateTime? selectedDay) {
    // Verifica se o _selectedDay é nulo, caso seja, use o DateTime.now()
    DateTime dayToQuery = selectedDay ?? DateTime.now();

    // Chame a função getTrainingPerDay do seu serviço Firestore
    Stream<QuerySnapshot> trainingStream =
        firestoreService.getTrainingPerDay(dayToQuery);

    // Atualize o StreamBuilder com o novo Stream
    // Isso fará com que a interface do usuário seja reconstruída automaticamente quando houver alterações nos dados
    trainingStreamController.add(trainingStream);
  }

// Declaração de um StreamController para gerenciar o Stream dentro do StreamBuilder
  final trainingStreamController = StreamController<Stream<QuerySnapshot>>();
}
