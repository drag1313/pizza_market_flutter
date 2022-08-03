import 'package:flutter/material.dart';
import 'package:pizza_market/bloc/my_bloc.dart';
import 'package:provider/src/provider.dart';

class adminPanel extends StatelessWidget {
  const adminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyBloc bloc = context.read<MyBloc>();
    // var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 50),
                      child: ElevatedButton(
                        child:
                            const Icon(Icons.arrow_back_ios, color: Colors.red),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.red[50]), //all(Colors.redAccent),
                        ),
                        onPressed: () {
                          bloc.add(MyInitialEvent());
                        },
                      )),
                  const Text('Add Pizza', style: TextStyle(fontSize: 22.0)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // fixedSize: const Size(20.0, 20.0),
                  primary: const Color(0xfff43f5e),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // <-- Radius
                  ),
                ),
                child: Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 218,
                width: 380,
                padding: const EdgeInsets.only(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: Image.asset("assets/Buffalo.png"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Name'),
                        SizedBox(
                          height: 32,
                          width: 128,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {}),
                        ),
                        const Text('Price'),
                        SizedBox(
                          height: 32,
                          width: 128,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {}),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            child: ElevatedButton(
                              child: const Icon(Icons.remove,
                                  color: const Color(0xfff43f5e)),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.red[50]), //all(Colors.redAccent),
                              ),
                              onPressed: () {},
                            )),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          child: Text(MyBloc().pizzaCount.toString(),
                              style: const TextStyle(fontSize: 18.0)),
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            child: Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  child: const Icon(Icons.add,
                                      color: Colors.white),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(
                                            0xfff43f5e)), //all(Colors.redAccent),
                                  ),
                                  onPressed: () {},
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 218,
                width: 380,
                padding: const EdgeInsets.only(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: Image.asset("assets/Buffalo.png"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Name'),
                        SizedBox(
                          height: 32,
                          width: 128,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {}),
                        ),
                        const Text('Price'),
                        SizedBox(
                          height: 32,
                          width: 128,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {}),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            child: ElevatedButton(
                              child: const Icon(
                                Icons.remove,
                                color: Color(0xfff43f5e),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.red[50]), //all(Colors.redAccent),
                              ),
                              onPressed: () {},
                            )),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          child: Text(MyBloc().pizzaCount.toString(),
                              style: const TextStyle(fontSize: 18.0)),
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            child: Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  child: const Icon(Icons.add,
                                      color: Colors.white),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xfff43f5e),
                                    ), //all(Colors.redAccent),
                                  ),
                                  onPressed: () {},
                                ))

                            // Text('+',
                            //    style: TextStyle(fontSize: 21.0, color: Colors.red)),
                            ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              // alignment: Alignment.center,
              //  decoration: BoxDecoration(
              //    color: Colors.red, borderRadius: BorderRadius.circular(30)),
              height: 75,
              width: 385,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xfff43f5e),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 21.0, color: Colors.white),
                ),
                onPressed: () {},
              )),
        ])));
  }
}
