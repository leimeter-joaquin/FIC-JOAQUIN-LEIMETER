import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fic_joaquin_leimeter/models/task_model.dart';

class GetTasks {
  static Stream<List<TaskModel>> getTasks() async* {
    /// async* marks this function as a Stream generator, returning a Stream that can be listened to by a StreamBuilder.
    //? Do we need a try catch block if we are handling these states on the StreamBuilder in the build method of the widget? I guess not.

    /// Here we get a Stream from FirebaseFirestore.
    /// We will be iterating over this Stream, in other words iterating through a bunch of Futures
    /// a Future for each time the collection changes or on whatever occasion FirebaseFirestore decides
    ///  it's ok to emit a change event we can listen to.
    Stream<QuerySnapshot> collectionSnapshotsStream =
        FirebaseFirestore.instance.collection('tasks').snapshots();

    /// This await for loop continues iterating until the Stream is closed.
    /// The code inside the for loop is executed each time the stream emits an event.
    /// The "querySnapshot" is the resolution of the Future<QuerySnapshot> as far as I understand it.
    await for (final querySnapshot in collectionSnapshotsStream) {
      List<TaskModel> tasks = [];
      List<QueryDocumentSnapshot<Object?>> tasksSnapshot = querySnapshot.docs;

      for (final task in tasksSnapshot) {
        var taskData = task.data();
        tasks.add(TaskModel.fromJson(taskData as Map<String, dynamic>));
      }

      yield tasks;
    }
  }
}
