import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'my_event.dart';
part 'my_state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(MyInitialState()) {
    on<MyInitialEvent>((event, emit) async {
      emit(MyInitialState());
    });
    on<AdminEvent>((event, emit) async {
      emit(AdminState());
    });
    on<BasketEvent>((event, emit) async {
      emit(BasketState());
    });
  }

  List<PizzaData> pizzaMarket = [
    PizzaData('Original', 'assets/images/Original.png', 40, 8),
    PizzaData('Buffalo', 'assets/images/Buffalo.png', 50, 4),
    PizzaData('San Marzano', 'assets/images/SanMarzano.png', 90, 3),
    PizzaData('Pepperoni', 'assets/images/Pepperoni.png', 75, 6),
    PizzaData('Mexican', 'assets/images/Mexican.png', 30, 2),
  ];

  int pizzaCount = 2;
  var allPizza = {
    'Sanjovese': [10, 5],
    'Original': [12, 10],
    'San Marzano': [11, 20],
    'Pepperoni': [20, 15],
    'Mexican': [25, 7],
    'Oregano': [8, 4],
  };

  Map<String, List<int>> basketPizza = {
    'Sanjovese': [10, 5],
    'Original': [12, 10],
    'San Marzano': [11, 20],
    'Pepperoni': [20, 15],
    'Mexican': [25, 7],
    'Oregano': [8, 4],
  };
}

class PizzaData {
  String name;
  String pic;
  int price;
  int quantity;
  PizzaData(this.name, this.pic, this.price, this.quantity);
}
