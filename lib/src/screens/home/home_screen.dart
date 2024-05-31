import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_55_maadi_state_management/src/controllers/counter/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // counter++;
                // setState(() {});
                CounterCubit.get(context).add();
              },
              icon: const Icon(Icons.add, size: 100),
            ),
            BlocListener<CounterCubit, CounterState>(
              listener: (context, state) {
                // call functions
                
              },
              child: Text("lisstner"),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                // if (state is loading) {
                // return loading;
                // }
                print(state);
                return Text(CounterCubit.get(context).counter.toString(),
                    style: TextStyle(
                        color: state is SubState ? Colors.red : Colors.green,
                        fontSize: 50));
              },
            ),
            IconButton(
              onPressed: () {
                // counter--;
                // setState(() {});
                CounterCubit.get(context).sub();
              },
              icon: const Icon(Icons.minimize, size: 100),
            ),
          ],
        ),
      ),
    );
  }
}
