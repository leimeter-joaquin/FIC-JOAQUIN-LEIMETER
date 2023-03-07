import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fic_joaquin_leimeter/models/task_model.dart';
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

  /// Esto es una porquería hay que ver de mejorarlo. TODO: Aprender a usar Streams.
  Stream<List<TaskModel>> _getTasks() async* {
    // Get a Stream from FirebaseFirestore
    Stream<QuerySnapshot<Map<String, dynamic>>> collectionSnapshotsStream =
        FirebaseFirestore.instance.collection('tasks').snapshots();

    await for (final QuerySnapshot querySnapshot in collectionSnapshotsStream) {
      List<TaskModel> tasks = [];
      List<QueryDocumentSnapshot<Object?>> tasksSnapshot = querySnapshot.docs;
      for (final task in tasksSnapshot) {
        var taskData = task.data();
        tasks.add(TaskModel.fromJson(taskData as Map<String, dynamic>));
      }
      yield tasks;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _getTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
