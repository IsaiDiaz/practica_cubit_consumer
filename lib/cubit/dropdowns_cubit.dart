import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dropdown_state.dart';

class DropdownsCubit extends Cubit<DropdownsState> {
  DropdownsCubit() : super(DropdownsState());

  void init() {
    emit(state.copyWith(
        country_selected: DropdownsState.countries[0],
        state_selected: DropdownsState.states[DropdownsState.countries[0]]![0],
        city_selected: DropdownsState.cities[DropdownsState.states[DropdownsState.countries[0]]![0]]![0],
        show_countries: DropdownsState.countries,
        show_states: DropdownsState.states[DropdownsState.countries[0]] ?? [],
        show_cities: DropdownsState.cities[DropdownsState.states[DropdownsState.countries[0]]![0]] ?? []));
    print(state.toString());
  }

  void countryChanged(String country) {
    emit(state.copyWith(
        country_selected: country,
        state_selected: DropdownsState.states[country]![0],
        city_selected: DropdownsState.cities[DropdownsState.states[country]![0]]![0],
        show_states: DropdownsState.states[country] ?? [],
        show_cities: DropdownsState.cities[DropdownsState.states[country]![0]] ?? []
        ),
        );
  }

  void stateChanged(String state_in) {
    emit(state.copyWith(
        state_selected: state_in,
        city_selected: DropdownsState.cities[state_in]![0],
        show_cities: DropdownsState.cities[state_in] ?? []));
  }

  void cityChanged(String city) {
    emit(state.copyWith(city_selected: city));
  }

}