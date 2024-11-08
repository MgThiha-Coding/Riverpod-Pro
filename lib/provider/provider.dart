import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = Provider<int>((ref) => 100);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Here's code sample"),
            const SizedBox(height: 10),
            const Text('final provider = Provider<int>((ref) => 100);'),
            const SizedBox(height: 10),
            Text(data.toString()),
          ],
        ),
      ),
    );
  }
}
