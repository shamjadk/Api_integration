import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_test/provider/api_provider.dart';
import 'package:screl_test/view/profile_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  get icon => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  )),
              icon: const Icon(Icons.person))
        ],
      ),
      body: ref.watch(apiProvider).isRefreshing
          ? const Center(child: CircularProgressIndicator())
          : ref.watch(apiProvider).when(
                data: (data) => ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      data[index].title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      data[index].body,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                error: (error, stackTrace) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('An error occured($error)'),
                    TextButton(
                        onPressed: () {
                          ref.invalidate(apiProvider);
                        },
                        child: const Text('Retry'))
                  ],
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
    );
  }
}
