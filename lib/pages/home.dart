import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FCF5E5"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildSection(
                context: context,
                title: "Devam Et",
                itemCount: 10,
              ),
              _buildSection(
                context: context,
                title: "Bitenler",
                itemCount: 10,
              ),
              _buildSection(
                context: context,
                title: "Puanlamak İsteyebilirsiniz",
                itemCount: 10,
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required BuildContext context, required String title, required int itemCount}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    alignment: Alignment.center, //title'lar ortada değil de başta olsun dersek de bunu kaldırırız
                    width: MediaQuery.of(context).size.width* .50, //Title'ların aynı uzunlukta olmasını sağladı
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      //color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 46),
                          blurRadius: 30,
                          color: const Color.fromARGB(255, 133, 132, 132).withOpacity(.11),
                        )
                      ]
                    ),
                    
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              itemCount: itemCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                 height: 230,
                 width: 150,
                margin: const EdgeInsets.all(10),
                color: Colors.white,
                child: Center(child: Text("Card $index")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

    


