import 'package:flutter/material.dart';
import 'package:training/pages/home.dart';
import 'package:training/pages/calendar.dart';
import 'package:training/pages/settings.dart';
import 'package:training/pages/monitoring.dart';

class TrainingPage extends StatelessWidget {
  int _opcaoSelecionada = 0;

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
              child: Center(child: Text("Tela de treinos")),
            )));
  }
}
