import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_master/notifierprovider/changenotifier_page.dart';
import 'package:riverpod_master/notifierprovider/notifier_page.dart';
import 'package:riverpod_master/notifierprovider/statenotifier_page.dart';
import 'package:riverpod_master/provider/futureprovider_page.dart';
import 'package:riverpod_master/provider/provider.dart';
import 'package:riverpod_master/provider/stateprovider_page.dart';
import 'package:riverpod_master/provider/streamprovider_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/riverpod.png',
              width: 150,
              height: 50,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text('Pro'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            ItemCard(
                page: FutureproviderPage(), title: 'FutureProvider', index: 1),
            ItemCard(
                page: StreamproviderPage(), title: 'StreamProvider', index: 2),
            ItemCard(
                page: StateproviderPage(), title: 'StateProvider', index: 3),
            ItemCard(page: ProviderPage(), title: 'Provider', index: 4),
            ItemCard(page: NotifierPage(), title: 'Notifier', index: 5),
            ItemCard(
                page: ChangenotifierPage(), title: 'ChangeNotifier', index: 6),
            ItemCard(
                page: StatenotifierPage(), title: 'StateNotifier', index: 7),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Widget page;
  final String title;
  final int index;

  const ItemCard(
      {super.key,
      required this.page,
      required this.title,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(index.toString())),
      title: Text(title),
      trailing: Image.asset(
        'assets/logo.png',
        width: 150,
        height: 40,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
