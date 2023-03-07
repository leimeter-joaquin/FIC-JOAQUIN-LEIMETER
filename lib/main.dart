import 'package:fic_joaquin_leimeter/models/task_model.dart';
import 'package:fic_joaquin_leimeter/utils/get_tasks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _firebaseApp = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter full course')),
        body: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MyList();
            }
            if (snapshot.hasError) {
              return Text('error: ${snapshot.error}');
            }
            return const Text('loading');
          },
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GetTasks.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) return const Text("There are no Tasks");

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              TaskModel task = snapshot.data![index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(task.title),
                        Text(task.description),
                        Text('${task.done}'),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }
        if (snapshot.hasError) {
          return Text('error: ${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
