// ignore: file_names
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(68, 0, 0, 0),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.location_city),
                  ),
                  const Text(
                    "Set Delivery Location",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(68, 0, 0, 0),
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(Icons.close),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(18, 0, 0, 0)),
            child: const Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 10),
                Expanded(
                    child: SizedBox(
                  height: 30,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "search location this here",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(187, 0, 0, 0)),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ))
              ],
            ),
          ),
          lineBetween(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(177, 0, 0, 0))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    Text(
                      "Use Your Current Location",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
          ),
          lineBetween(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.search),
                ),
                Text(
                  "Ninh kieu, Can tho",
                  style: TextStyle(color: Color.fromARGB(154, 0, 0, 0)),
                )
              ],
            ),
          ),
          lineBetween()
        ],
      ),
    );
  }

  Container lineBetween() {
    return Container(
      height: 2,
      width: double.infinity,
      color: Color.fromARGB(19, 0, 0, 0),
    );
  }
}
