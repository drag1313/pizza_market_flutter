import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_market/bloc/my_bloc.dart';
import 'package:pizza_market/screens/adminPanel.dart';
import 'package:pizza_market/screens/basketScreen.dart';
import 'package:pizza_market/screens/marketScreenWidget.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyBloc bloc = context.read<MyBloc>();
    return Scaffold(
        body: BlocBuilder<MyBloc, MyState>(builder: (context, state) {
      if (state is BasketState) {
        return Basket();
      }

      if (state is AdminState) {
        return const adminPanel();
      }
      if (state is MyInitialState) {
        return MarketScreenWidget(
          pizzaMarket: bloc.pizzaMarket,
        );
      } else {
        return const Center(
          child: Text('Alarma!!!'),
        );
      }
    }));
  }
}



/*
class marketScreenWidget extends StatelessWidget {
  const marketScreenWidget({
    Key? key,
    required this.bloc,
    required this.keys,
    required this.val,
  }) : super(key: key);

  final MyBloc bloc;
  final List<String> keys;
  final List<List<int>> val;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 75.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Pizza Market', style: TextStyle(fontSize: 30.0)),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shadowColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      bloc.add(BasketEvent());
                    },
                    child: const Icon(
                      Icons.shopping_basket,
                      color: Color(0xfff43f5e),
                      size: 30,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 35.0),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shadowColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      bloc.add(AdminEvent());
                    },
                    child: const Icon(
                      Icons.person,
                      color: Color(0xfff43f5e),
                      size: 30,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 35.0),
                  ),
                ],
              )
            ],
          ),
          Flexible(
              child: ListView.builder(
            itemBuilder: (_, int index) =>
                ListItem(keys[index], val[index].first, index),
            itemCount: bloc.allPizza.length,
          ))
        ]));
  }
}

class ListItem extends StatelessWidget {
  int index;
  final String langname;
  int? price;
  ListItem(this.langname, this.price, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        child: Image.asset("assets/Buffalo.png"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 25.0),
                      ),
                      Text(
                        langname,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  Text('\$ $price',
                      style: const TextStyle(
                          fontSize: 25.0, color: Color(0xfff43f5e))),
                ],
              ),
            )));
  }
}
*/