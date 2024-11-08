import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Using StateProvider to hold the state (100) that can be modified
final provider = StateProvider<int>((ref) => 100);

class StateproviderPage extends ConsumerWidget {
  const StateproviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Here's code sample"),
            const SizedBox(
              height: 10,
            ),
            const Text('final provider = StateProvider<int>((ref) => 100);'),
            const SizedBox(
              height: 10,
            ),
            Text(data.toString()),
          ],
        ),
      ),
    );
  }
}
