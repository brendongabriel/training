import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:training/pages/monitoring.dart';
import 'package:training/pages/calendar.dart';
import 'package:training/pages/settings.dart';
import 'package:training/pages/training.dart';
import 'package:training/services/firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();

  void openNoteBox({String? docID, String? name, String? description}) {
    textController1.text = name ?? '';
    textController2.text = description ?? '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller:
                  textController1, // Controlador para o primeiro campo de texto
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller:
                  textController2, // Controlador para o segundo campo de texto
              decoration: InputDecoration(labelText: "Descrição"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID != null) {
                firestoreService.updateTraining(
                    docID, textController1.text, textController2.text);
              } else {
                firestoreService.createTraining(
                    textController1.text, textController2.text);
              }
              textController1.clear(); // Limpar o primeiro campo de texto
              textController2.clear(); // Limpar o segundo campo de texto
              Navigator.of(context).pop(); // Fechar o AlertDialog
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }

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
        title: const Text("Aplicativo academia"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Stack(children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 380, // Largura do quadrado
                height: 200, // Altura do quadrado
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      255, 242, 241, 241), // Cor de fundo do quadrado
                  borderRadius: BorderRadius.circular(
                      15), // Raio da borda (metade da largura ou altura para criar um círculo)
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(
                                255, 242, 241, 241), // Cor de fundo do quadrado
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: CustomPaint(
                            painter: CirclePainter(
                              strokeWidth: 9.0, // Largura da borda do círculo
                              color: Colors.blue, // Cor da borda do círculo
                            ),
                          ),
                        )),
                    Positioned(
                      top: 15,
                      right: 20,
                      child: Container(
                        width: 160,
                        height: 170,
                        color: Color.fromARGB(255, 242, 241, 241),
                        padding: EdgeInsets.only(right: 7),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text("Kcal"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 25),
                              child: Container(
                                width: 200,
                                height: 15,
                                decoration: BoxDecoration(
                                  color:
                                      Colors.blue, // Cor de fundo do quadrado
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 50),
                              child: Container(
                                width: 200,
                                height: 15,
                                decoration: BoxDecoration(
                                  color:
                                      Colors.blue, // Cor de fundo do quadrado
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 75),
                              child: Container(
                                width: 200,
                                height: 15,
                                decoration: BoxDecoration(
                                  color:
                                      Colors.blue, // Cor de fundo do quadrado
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 100),
                              child: Container(
                                width: 200,
                                height: 15,
                                decoration: BoxDecoration(
                                  color:
                                      Colors.blue, // Cor de fundo do quadrado
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 125),
                              child: Container(
                                width: 200,
                                height: 15,
                                decoration: BoxDecoration(
                                  color:
                                      Colors.blue, // Cor de fundo do quadrado
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(left: 20, top: 250),
            child: Stack(
              children: [
                Text("Treinos",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                StreamBuilder<QuerySnapshot>(
                  stream: firestoreService.getTraining(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          String docID = documentSnapshot.id;
                          Map<String, dynamic> task =
                              documentSnapshot.data() as Map<String, dynamic>;
                          return Card(
                            child: ListTile(
                                title: Text(task['name']),
                                subtitle: Text(task['description']),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () =>
                                            openNoteBox(docID: docID, name: task['name'], description: task['description'])),
                                    IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () => firestoreService
                                            .deleteTraining(docID)),
                                  ],
                                )),
                          );
                        },
                      );
                    } else {
                      return Center(child: Text("Sem treinos cadastrados"));
                    }
                  },
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}

class CirclePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;

  CirclePainter({required this.strokeWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
