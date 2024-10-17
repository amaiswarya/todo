import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/models/to_do_model.dart';

class DatabaseService {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("todos");
  User? user = FirebaseAuth.instance.currentUser;

  //*---------------- Add todo task--------------------
  Future<DocumentReference> addTodoTask(
      String title, String description) async {
    return await todoCollection.add({
      'uid': user!.uid,
      'title': title,
      'description': description,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp()
    });
  }
  //---------------- Add todo task--------------------

  //*----------------Update todo task-----------------

  Future<void> updateTodo(String id, String title, String description) async {
    final updateToDoCollection =
        FirebaseFirestore.instance.collection("todos").doc(id);
    return await updateToDoCollection.update({
      'title': title,
      'description': description,
    });
  }
  //----------------Update todo task-----------------

  //*---------------Update todo status---------------
  Future<void> updateTodoStatus(String id, bool completed) async {
    return await todoCollection.doc(id).update({'completed': completed});
  }

  //---------------Update todo status---------------
  //*---------------Delete todo status---------------
  Future<void> deleteTodoTask(String id) async {
    return await todoCollection.doc(id).delete();
  }

  //---------------Delete todo status---------------
//*---------------Get pending tasks ----------------
  Stream<List<Todo>> get todos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: false)
        .snapshots()
        .map(_todoListFromSnapshot);
  }

//---------------Get pending tasks ----------------
//*---------------Get completed tasks ----------------
  Stream<List<Todo>> get completedtodos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: true)
        .snapshots()
        .map(_todoListFromSnapshot);
  }
  //---------------Get completed tasks ----------------

  List<Todo> _todoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Todo(
          id: doc.id,
          title: doc['title'] ?? "",
          description: doc['description'] ?? "",
          completed: doc['completed'] ?? false,
          timestamp: doc['createdAt'] ?? "");
    }).toList();
  }
}
