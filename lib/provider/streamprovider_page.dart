import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StreamProvider with explicit type
final streamProvider = StreamProvider<int>((ref) => Stream.value(200));

class StreamproviderPage extends ConsumerWidget {
  const StreamproviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Here is code sample'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '"final streamProvider = StreamProvider<int>((ref) => Stream.value(200));"',
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(
              height: 10,
            ),
            provider.when(
              data: (data) => Text(data.toString()),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
