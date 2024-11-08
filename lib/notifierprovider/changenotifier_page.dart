import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberChangeNotifier extends ChangeNotifier {
  List<int> _number = [];
  UnmodifiableListView<int> get number => UnmodifiableListView(_number);

  void add(int number) {
    _number.add(number);
    notifyListeners();
  }

  void delete(int index) {
    _number.removeAt(index);
    notifyListeners();
  }
}

final numberProvider = ChangeNotifierProvider<NumberChangeNotifier>(
    (ref) => NumberChangeNotifier());

class ChangenotifierPage extends ConsumerWidget {
  const ChangenotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var number = Random().nextInt(50);
          ref.read(numberProvider.notifier).add(number);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Column(
        children: [
          const Text('Here is code sample'),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '''class NumberChangeNotifier extends ChangeNotifier {
  List<int> _number = [];
  UnmodifiableListView<int> get number => UnmodifiableListView(_number);

  void add(int number) {
    _number.add(number);
    notifyListeners();
  }

  void delete(int index) {
    _number.removeAt(index);
    notifyListeners();
  }
} 

final numberProvider = ChangeNotifierProvider<NumberChangeNotifier>(
    (ref) => NumberChangeNotifier());
''',
              style: TextStyle(fontFamily: 'monospace', fontSize: 14),
            ),
          ),
          const SizedBox(height: 20),

          // List of numbers
          Expanded(
            child: ListView.builder(
              itemCount: provider.number.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(provider.number[index].toString()),
                  trailing: IconButton(
                    onPressed: () {
                      ref.read(numberProvider.notifier).delete(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
