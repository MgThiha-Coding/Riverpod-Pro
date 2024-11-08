import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntListNotifier extends Notifier<List<int>> {
  @override
  build() => [10];

  void add(int number) {
    state = [...state, number];
  }

  void deleteEven() {
    state = state.where((element) => element.isOdd).toList();
  }

  void removeAt(int index) {
    state.removeAt(index);
    state = [...state];
  }
}

final intListProvider =
    NotifierProvider<IntListNotifier, List<int>>(IntListNotifier.new);

class NotifierPage extends ConsumerStatefulWidget {
  const NotifierPage({super.key});

  @override
  ConsumerState<NotifierPage> createState() => _NotifierPageState();
}

class _NotifierPageState extends ConsumerState<NotifierPage> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(intListProvider);
    final notifier = ref.read(intListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifier'),
        actions: [
          IconButton(
            onPressed: () {
              notifier.deleteEven();
            },
            icon: const Text('Delete Even'),
            tooltip: 'Delete Even Numbers',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Card(
                    child: ListTile(
                      title: Text(data[index].toString()),
                      trailing: TextButton(
                        onPressed: () {
                          notifier.removeAt(index);
                        },
                        child: const Text('Delete'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var digit = Random().nextInt(40);
          notifier.add(digit);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
