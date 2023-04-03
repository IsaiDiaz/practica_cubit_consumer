class DropdownsState {
  
  static const countries = ["India", "USA", "UK", "Canada"];

  static final states = {
    "India": ["Karnataka", "Tamil Nadu", "Kerala", "Andhra Pradesh"],
    "USA": ["California", "Texas", "Florida", "New York"],
    "UK": ["England", "Scotland", "Wales", "Northern Ireland"],
    "Canada": ["Ontario", "Quebec", "Nova Scotia", "New Brunswick"]
  };

  static final cities = {
    "Karnataka": ["Bangalore", "Mysore", "Hubli", "Belgaum"],
    "Tamil Nadu": ["Chennai", "Coimbatore", "Madurai", "Tiruchirappalli"],
    "Kerala": ["Thiruvananthapuram", "Kochi", "Kozhikode", "Kollam"],
    "Andhra Pradesh": ["Visakhapatnam", "Vijayawada", "Guntur", "Nellore"],
    "California": ["Los Angeles", "San Diego", "San Jose", "San Francisco"],
    "Texas": ["Houston", "San Antonio", "Dallas", "Austin"],
    "Florida": ["Jacksonville", "Miami", "Tampa", "Orlando"],
    "New York": ["New York", "Buffalo", "Rochester", "Yonkers"],
    "England": ["London", "Birmingham", "Leeds", "Glasgow"],
    "Scotland": ["Edinburgh", "Glasgow", "Aberdeen", "Dundee"],
    "Wales": ["Cardiff", "Swansea", "Newport", "St. Albans"],
    "Northern Ireland": ["Belfast", "Newry", "Lisburn", "Derry"],
    "Ontario": ["Toronto", "Ottawa", "Hamilton", "London"],
    "Quebec": ["Montreal", "Quebec City", "Laval", "Gatineau"],
    "Nova Scotia": ["Halifax", "Dartmouth", "Sydney", "Kentville"],
    "New Brunswick": ["Fredericton", "Moncton", "Saint John", "Miramichi"]
  };

  String country_selected; 
  String state_selected;
  String city_selected;

  List<String> show_countries = [];
  List<String> show_states = [];
  List<String> show_cities = [];

  DropdownsState({this.country_selected = "" ,this.state_selected = "",this.city_selected = "", this.show_countries = const [], this.show_states = const [], this.show_cities = const []});

  DropdownsState copyWith({String? country_selected, String? state_selected, String? city_selected, List<String>? show_countries, List<String>? show_states, List<String>? show_cities}) {
    return DropdownsState(
      country_selected: country_selected ?? this.country_selected,
      state_selected: state_selected ?? this.state_selected,
      city_selected: city_selected ?? this.city_selected,
      show_countries: show_countries ?? this.show_countries,
      show_states: show_states ?? this.show_states,
      show_cities: show_cities ?? this.show_cities
    );
  }

}