// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/home/blocs/tipe_book/tipe_book_cubit.dart';

import '../blocs/type/type_books_cubit.dart';
import '../widget/books_card2.dart';
import '../widget/qnodata.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  void initState() {
    super.initState();
    context.read<TypeBooksCubit>().getData();
    context.read<TipeBookCubit>().getData();
  }

  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<TypeBooksCubit, TypeBooksState>(
      listener: (context, state) {},
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Type Books"),
            actions: const [],
          ),
          body: ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: BlocBuilder<TipeBookCubit, TipeBookState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      orElse: () {
                        return SizedBox(
                          height: 32,
                          child: Row(
                            children: List.generate(8, (index) {
                              return Container(
                                height: 32,
                                margin: const EdgeInsets.only(
                                  left: 10.0,
                                ),
                                width: MediaQuery.of(context).size.width / 6,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                      success: (value) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          height: 32.0,
                          child: ListView.builder(
                            itemCount: value.data.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            controller: controller,
                            itemBuilder: (context, index) {
                              var item = value.data[index];
                              bool selected = item['name'] == value.selected;

                              return InkWell(
                                onTap: () {
                                  context.read<TipeBookCubit>().changeSelected(
                                      newSelected: item['name']);
                                  context
                                      .read<TypeBooksCubit>()
                                      .changeTypeBooks(typeId: item['id']);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  margin: const EdgeInsets.only(right: 10.0),
                                  decoration: BoxDecoration(
                                    color:
                                        selected ? Colors.orange : Colors.grey,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${item['name']}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              BlocBuilder<TypeBooksCubit, TypeBooksState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: const QNodata(),
                      );
                    },
                    loading: (value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    success: (value) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.builder(
                          itemCount: value.data.length,
                          itemBuilder: (context, index) {
                            var item = value.data[index];
                            return QbooksCard2(
                              margin: const EdgeInsets.only(
                                bottom: 20.0,
                              ),
                              data: {
                                'cover': item['cover'],
                                'title': item['title'],
                                'type': item['type'],
                                'price': item['price'],
                                'year': item['year'],
                                'discount': item['discount'],
                                'synopsis': item['synopsis']
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          )),
    );
  }
}
