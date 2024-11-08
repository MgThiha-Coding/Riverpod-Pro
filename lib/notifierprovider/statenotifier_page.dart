import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppNotifier extends StateNotifier<List<int>> {
  AppNotifier() : super([10]);

  void add(int number) {
    state = [...state, number];
  }

  void removeAt(int index) {
    state.removeAt(index);
    state = [...state];
  }
}

final intListProvider =
    StateNotifierProvider<AppNotifier, List<int>>((ref) => AppNotifier());

class StatenotifierPage extends ConsumerStatefulWidget {
  const StatenotifierPage({super.key});

  @override
  ConsumerState<StatenotifierPage> createState() => _StatenotifierPageState();
}

class _StatenotifierPageState extends ConsumerState<StatenotifierPage> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(intListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '''class AppNotifier extends StateNotifier<List<int>> {
  AppNotifier() : super([10]);

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
    StateNotifierProvider<AppNotifier, List<int>>((ref) => AppNotifier());
''',
              style: TextStyle(fontFamily: 'monospace', fontSize: 14),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].toString()),
                  trailing: IconButton(
                    onPressed: () {
                      ref.read(intListProvider.notifier).removeAt(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final random = Random().nextInt(40);
          ref.read(intListProvider.notifier).add(random);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
