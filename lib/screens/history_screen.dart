import 'package:flutter/material.dart';
import '../models/history_model.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat')),
      body: ListView.builder(
        itemCount: HistoryModel.historyList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(HistoryModel.historyList[index]),
          );
        },
      ),
    );
  }
}
