import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';

class Categories_Pages extends StatefulWidget {
  const Categories_Pages({Key? key}) : super(key: key);

  @override
  State<Categories_Pages> createState() => _Categories_PagesState();
}

class _Categories_PagesState extends State<Categories_Pages> {
  @override
  Widget build(BuildContext context) {
    var search = TextEditingController();
    Timer? debounceTimer;
    const Duration debounceDuration =
        Duration(milliseconds: 1000); // Ubah sesuai kebutuhan
    // Fungsi debouncing
    void _onTextChanged(String newText) {
      // Hapus timer sebelumnya jika ada
      debounceTimer?.cancel();
      // Set timer baru untuk menunggu periode debounce
      debounceTimer = Timer(debounceDuration, () {
        // Eksekusi tindakan setelah debounce
        print('Debounced Text: $newText');
      });
    }

    @override
    void dispose() {
      // Pastikan untuk membatalkan timer jika widget di-dispose
      debounceTimer?.cancel();
      search.dispose();
      super.dispose();
    }

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: null,
                    controller: search,
                    decoration: InputDecoration.collapsed(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: "Cari Kategory Buku?",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                      ),
                      hoverColor: Colors.transparent,
                    ),
                    onFieldSubmitted: (value) {},
                    onChanged: _onTextChanged,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "Categorires",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Builder(builder: (context) {
            List categories = [
              {
                "label": "Sejarah",
                "image":
                    "https://plus.unsplash.com/premium_photo-1661963952208-2db3512ef3de?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2144&q=80",
              },
              {
                "label": "Novel",
                "image":
                    "https://images.unsplash.com/photo-1510058592404-bef4baf70440?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
              },
              {
                "label": "Biografi",
                "image":
                    "https://images.unsplash.com/photo-1603349206295-dde20617cb6a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
              },
              {
                "label": "Psicologi",
                "image":
                    "https://images.unsplash.com/photo-1503525148566-ef5c2b9c93bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
              },
              {
                "label": "Science Fiction",
                "image":
                    "https://images.unsplash.com/photo-1578374173703-71809a1757b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
              },
            ];

            return ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = categories[index];
                return GestureDetector(
                  onTap: () {},
                  child: CachedNetworkImage(
                    imageUrl: item["image"],
                    imageBuilder: (context, imageProvider) => Container(
                      height: 150.0,
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              child: Text(
                                item["label"],
                                style: GoogleFonts.montserrat(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      height: 150.0,
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
