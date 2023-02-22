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

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  Future<List<TaskModel>> _getTasks() async {
    List<TaskModel> tasks = [];

    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('tasks');
    QuerySnapshot tasksQuerySnapshot = await collectionRef.get();
    List<QueryDocumentSnapshot> tasksDoc = tasksQuerySnapshot.docs;

    for (QueryDocumentSnapshot doc in tasksDoc) {
      var task = doc.data();
      print('task: $task');
      tasks.add(TaskModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              TaskModel task = snapshot.data![index];
              return Column(
                children: [
                  Text(task.title),
                  Text(task.description),
                  Text('${task.done}'),
                ],
              );
            },
          );
        }
        if (snapshot.hasError) {
          return Text('error: ${snapshot.error}');
        }
        return const Text('loading');
      },
    );
  }
}
