import 'package:flutter/material.dart';
import 'package:hereis/models/item_model.dart';

class ItemCard extends StatelessWidget {
  final ItemModel model;
  const ItemCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 10),
      height: 150,
      width: width,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xff1B1E23),
                child: Text(model.state),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  model.cep,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.street,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        model.city,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Text(
                      " | ",
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        model.neighborhood,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
