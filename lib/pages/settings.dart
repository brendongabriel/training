import 'package:flutter/material.dart';
import 'package:training/pages/home.dart';
import 'package:training/pages/calendar.dart';

class SettingsPage extends StatelessWidget {
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
                      MaterialPageRoute(builder: (context) => HomePage()),
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
                      MaterialPageRoute(builder: (context) => HomePage()),
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
                padding: EdgeInsets.only(
                  top: 20,
                  left: 40,
                  right: 40,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 80,
                      child: Align(
                        child: Text(
                          "Nome do usuario",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      child: ListView(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue, // Cor da borda
                                  width: 2.0, // Largura da borda
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 25),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 55),
                                    child: Icon(Icons.home, size: 50),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 120),
                                    child: Text(
                                      "Endereço",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue, // Cor da borda
                                  width: 2.0, // Largura da borda
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 25),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 55),
                                    child: Icon(Icons.person, size: 50),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 120),
                                    child: Text(
                                      "Perfil",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue, // Cor da borda
                                  width: 2.0, // Largura da borda
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 25),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 55),
                                    child:
                                        Icon(Icons.notification_add, size: 50),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 120),
                                    child: Text(
                                      "Notificação",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue, // Cor da borda
                                  width: 2.0, // Largura da borda
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 25),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 55),
                                    child: Icon(Icons.email, size: 50),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 120),
                                    child: Text(
                                      "E-mail",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue, // Cor da borda
                                  width: 2.0, // Largura da borda
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 25),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 55),
                                    child: Icon(Icons.settings_applications,
                                        size: 50),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 120),
                                    child: Text(
                                      "Ajustes",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
