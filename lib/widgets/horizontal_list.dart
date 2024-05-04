import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HorizontalList<T> extends StatefulWidget {
  HorizontalList(
      {super.key,
      required this.categoryName,
      required this.list,
      this.height = 150,
      this.widht = 100});
  List<T> list;
  double widht;
  double height;
  String categoryName;
  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.categoryName),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Stack(children: [
                ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: listItem(index),
                  ),
                  itemCount: widget.list.length,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(.5),
                      child: IconButton(
                          onPressed: () {
                            scrollController.animateTo(
                              scrollController.offset -
                                  widget.widht, // Kaydırma miktarı
                              duration: const Duration(
                                  milliseconds: 500), // Animasyon süresi
                              curve: Curves.ease, // Animasyon eğrisi
                            );
                          },
                          icon: const Icon(
                            Icons.chevron_left_rounded,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(.5),
                      child: IconButton(
                          onPressed: () {
                            scrollController.animateTo(
                              scrollController.offset +
                                  widget.widht, // Kaydırma miktarı
                              duration: const Duration(
                                  milliseconds: 500), // Animasyon süresi
                              curve: Curves.ease, // Animasyon eğrisi
                            );
                          },
                          icon: const Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      width: widget.widht,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(widget.list[index].toString()),
      ),
    );
  }
}
