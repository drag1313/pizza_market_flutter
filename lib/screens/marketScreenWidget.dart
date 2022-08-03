import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_market/bloc/my_bloc.dart';

class MarketScreenWidget extends StatelessWidget {
  final List<PizzaData> pizzaMarket;

  const MarketScreenWidget({Key? key, required this.pizzaMarket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TopMenu(),
          ...pizzaMarket.map((data) => _PizzaRow(data: data)).toList(),
        ],
      ),
    );

    /*
    ListView(
      children: pizzaMarket.map((data) => _PizzaRow(data: data)).toList(),
    );*/
  }
}

class TopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyBloc bloc = context.read<MyBloc>();
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
        ]));
  }
}

class _PizzaRow extends StatelessWidget {
  final PizzaData data;
  const _PizzaRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                child: Image.asset(data.pic),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 25.0),
              ),
              Text(
                data.name,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          Text('\$' + data.price.toString(),
              style: const TextStyle(fontSize: 25.0, color: Color(0xfff43f5e))),
        ],
      ),
    );
  }
}
