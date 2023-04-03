import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/dropdowns_cubit.dart';
import 'cubit/dropdown_state.dart';

void main() {
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica Cubit Bloc Consumer',
      home: BlocProvider(
        create: (context) => DropdownsCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    BlocProvider.of<DropdownsCubit>(context).init();
    return Scaffold(
      appBar: AppBar(
        title: Text("Practica Cubit Bloc Consumer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<DropdownsCubit, DropdownsState>(
              listenWhen: (previous, current) => previous.country_selected != current.country_selected,
              buildWhen: (previous, current) => previous.country_selected != current.country_selected,
              listener: (context, state) {
                print("listener country_selected: ${state.country_selected}");
                state.copyWith(show_states: DropdownsState.states[state.country_selected] ?? []);
              },
              builder: (context,state){
                return DropdownButton<String>(
                  value: state.country_selected,
                  items: state.show_countries.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    BlocProvider.of<DropdownsCubit>(context).countryChanged(value!);
                  },
                );
              }
              ),
            BlocConsumer<DropdownsCubit, DropdownsState>(
              listenWhen: (previous, current) => previous.state_selected != current.state_selected || previous.country_selected != current.country_selected,
              buildWhen: (previous, current) => previous.state_selected != current.state_selected || previous.country_selected != current.country_selected,
              listener: (context, state) {
                print("listener state_selected: ${state.state_selected}");
                state.copyWith(show_cities: DropdownsState.cities[state.state_selected] ?? [], show_states: DropdownsState.states[state.country_selected] ?? []);
              },
              builder: (context,state){
                return DropdownButton<String>(
                  value: state.state_selected,
                  items: state.show_states.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    BlocProvider.of<DropdownsCubit>(context).stateChanged(value!);
                  },
                );
              }
              ),
            BlocConsumer<DropdownsCubit, DropdownsState>(
              listenWhen: (previous, current) => previous.city_selected != current.city_selected || previous.state_selected != current.state_selected || previous.country_selected != current.country_selected,
              buildWhen: (previous, current) => previous.city_selected != current.city_selected || previous.state_selected != current.state_selected || previous.country_selected != current.country_selected,
              listener: (context, state) {
                print("listener city_selected: ${state.city_selected}");
                state.copyWith(show_cities: DropdownsState.cities[state.state_selected] ?? [], show_states: DropdownsState.states[state.country_selected] ?? []);
              },
              builder: (context,state){
                return DropdownButton<String>(
                  value: state.city_selected,
                  items: state.show_cities.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    BlocProvider.of<DropdownsCubit>(context).cityChanged(value!);
                  },
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

