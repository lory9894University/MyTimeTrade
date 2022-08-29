import 'package:firebase_database/firebase_database.dart';

class Transaction {
  late DateTime timestamp;
  late int ore;
  late String description,
      supplier_name,
      supplier,
      client,
      client_name,
      status,
      date;

  Transaction(this.ore, this.description, this.supplier, this.supplier_name,
      this.client, this.client_name) {
    status = "pending";
    timestamp = DateTime.now();
    date = DateTime.now().toString().substring(0, 10);
  }

  toMap() {
    return {
      'ore': ore.toString(),
      'description': description,
      'supplier': supplier,
      'supplier_name': supplier_name,
      'client': client,
      'client_name': client_name,
      'status': status,
      'date': date,
      'timestamp': timestamp.toString()
    };
  }

  TransactionSend() {
    final Map<String, Map> updates = {};
    updates['/transactions/${timestamp.toString()}'] = {
      "ore": ore,
      "timestamp": timestamp.toString(),
      "client": client,
      "supplier": supplier,
      "status": "pending",
      "description": description,
      "supplier_name": supplier_name,
      "client_name": client_name,
    };
    DatabaseReference clientRef = FirebaseDatabase.instance
        .ref()
        .child("users/${supplier}/transactions/");
    final clientKey = clientRef.push().key;
    DatabaseReference serverRef =
        FirebaseDatabase.instance.ref().child("users/${client}/transactions/");
    final serverKey = serverRef.push().key;

    FirebaseDatabase.instance.ref().update(updates);
    clientRef.child(clientKey!).set(timestamp.toString());
    serverRef.child(serverKey!).set(timestamp.toString());
  }
}
