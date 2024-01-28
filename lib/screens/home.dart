import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/providers/counter_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Hey counter screen building...");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have clicked the button this many times"),
            Consumer(builder: (context, WidgetRef ref, Widget? child) {
              final counter = ref.watch(counterProvider);
              return Text(
                counter.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              );
            }),
            ElevatedButton(
                onPressed: () => {
                      ref.read(counterProvider.notifier).decrement(),
                    },
                child: const Icon(Icons.remove))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          ref.read(counterProvider.notifier).increament(),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
