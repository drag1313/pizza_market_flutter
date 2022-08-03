import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_market/bloc/my_bloc.dart';

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MainScreen(context));
  }

  Widget MainScreen(BuildContext context) {
    List<PizzaData> pizzaMarketData;

    final MyBloc bloc = context.read<MyBloc>();
    var keys = MyBloc().basketPizza.keys.toList();
    var val = MyBloc().basketPizza.values.toList();
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 75.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 50),
                      child: ElevatedButton(
                        child: const Icon(Icons.arrow_back_ios,
                            color: Color(0xfff43f5e)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.red[50]), //all(Colors.redAccent),
                        ),
                        onPressed: () {
                          bloc.add(MyInitialEvent());
                        },
                      )),
                  const Text('Order details', style: TextStyle(fontSize: 30.0)),
                ],
              ),
              Flexible(
                  child: ListView.builder(
                itemBuilder: (_, int index) =>
                    ListItem(keys[index], val[index].first, index),
                itemCount: MyBloc().basketPizza.length,
              )),
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff43f5e),
                      borderRadius: BorderRadius.circular(30)),
                  height: 125,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                          child: Divider(
                            color: Colors.white,
                            height: 10,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Total',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white)),
                              Text("\$ 200",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white)),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 5, left: 5, top: 10, bottom: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                minimumSize: const Size(350, 50)),
                            child: const Text("Place my order",
                                style: TextStyle(
                                    fontSize: 20.0, color: Color(0xfff43f5e))),
                            onPressed: () {},
                          )),
                    ],
                  ))
            ])));
  }
}

class ListItem extends StatelessWidget {
  int index;
  final String langname;
  int? price;
  ListItem(this.langname, this.price, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
        // onTap: addBasket(index),
        child: Card(
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
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  langname,
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text('\$ $price',
                    style: const TextStyle(fontSize: 17.0, color: Colors.red)),
              ]),
            ],
          ),
          Row(
            children: [
              Container(
                  color: Colors.amber,
                  alignment: Alignment.center,
                  height: 28,
                  width: 28,
                  child: ElevatedButton(
                    child: const Icon(
                      Icons.remove,
                      color: Color(0xfff43f5e),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[50]),
                      //all(Colors.redAccent),
                    ),
                    onPressed: () {},
                  )),
              Container(
                alignment: Alignment.center,
                height: 28,
                width: 28,
                child: const Text('1', style: TextStyle(fontSize: 18.0)),
              ),
              Container(
                  color: const Color(0xfff43f5e),
                  height: 28,
                  width: 28,
                  child: const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ))),
            ],
          ),
        ],
      ),
    )));
  }
}
