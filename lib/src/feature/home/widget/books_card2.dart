import 'package:flutter/material.dart';

class QbooksCard2 extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Map data;
  const QbooksCard2({Key? key, this.margin, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hargaAwal = double.parse(data['price'].toString());
    double diskon = double.parse(data['discount']);
    double hargaDiscount = hargaAwal - (hargaAwal * (diskon / 100));
    int potonganHarga = hargaDiscount.toInt();

    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      margin: margin,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 160.0,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          data['cover'],
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 12,
                    child: Icon(
                      Icons.favorite,
                      size: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      data['type'],
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star,
                      size: 15.0,
                      color: Colors.yellow,
                    ),
                    const Text(
                      "4.4",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Text(
                  data['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data['synopsis'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Rp. $potonganHarga",
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "${data['price']}",
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                        fontSize: 16.0,
                        color: Colors.red,
                      ),
                    )
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
