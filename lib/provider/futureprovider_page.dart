import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<int> fetchApi() async {
  await Future.delayed(const Duration(seconds: 3));
  return 200;
}

final futureProvider = FutureProvider.autoDispose<int>((ref) => fetchApi());

class FutureproviderPage extends ConsumerWidget {
  const FutureproviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
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
              '"final futureProvider = FutureProvider.autoDispose<int>((ref) => fetchApi());"',
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(
              height: 10,
            ),
            provider.when(
              data: (data) => Text(data.toString()),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
