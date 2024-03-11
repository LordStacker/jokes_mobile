import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_source.dart';
import 'joke_dto.dart';
import 'avatar.dart';

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  JokeDto? joke;

  @override
  void initState() {
    super.initState();
    _loadJoke();
  }

  _loadJoke() async {
    setState(() {
      joke = null;
    });
    final newJoke = await context.read<DataSource>().getJoke();
    setState(() {
      joke = newJoke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meow Joker")),
      body: Center(
        child:
          joke != null
              ? Stack(
            children: [
              ListView(children: [
                Avatar(id: "${joke?.id}"),
                const SizedBox(height: 8),
                if (joke?.joke != null) Text(joke!.joke!, textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
                if (joke?.setup != null) Text(joke!.setup!, textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
                if (joke?.delivery != null) Text(joke!.delivery!, textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
                const SizedBox(height: 8)
              ]),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: _loadJoke,
                  child: const Text(
                    "Meow",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              )
            ],
          )
              : const CircularProgressIndicator(),
      ),
    );
  }
}
