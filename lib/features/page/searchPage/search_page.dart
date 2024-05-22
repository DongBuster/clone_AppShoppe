import 'package:clone_shoppe/features/page/productsSearchPage/products_search.dart';
import 'package:flutter/material.dart';
import '../../../constants/global_variables.dart';
import 'view_models/search_page_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controllerSearchBar = TextEditingController();
  final _focusNode = FocusNode();
  List<dynamic> listIdProductSearch = [];

  final SearchPageViewModel _viewModel = SearchPageViewModel();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            //--- header ---
            SizedBox(
              height: 35,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: GloblalVariable.hex_f94f2f,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      controller: controllerSearchBar,
                      onTapOutside: (event) => _focusNode.unfocus(),
                      onSubmitted: (value) {
                        setState(() {
                          controllerSearchBar.text = value;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductsSearch(
                                      listIdProductSelected: null,
                                      otherSearch: listIdProductSearch,
                                      nameSearch: controllerSearchBar.text,
                                    )));
                      },
                      onChanged: (value) {
                        setState(() {
                          controllerSearchBar.text = value;
                        });
                      },
                      focusNode: _focusNode,
                      cursorColor: const Color(0xff9c9c9c),
                      maxLines: 1,
                      style: const TextStyle(color: Colors.black87),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3),
                            bottomLeft: Radius.circular(3),
                          ),
                          borderSide: BorderSide(
                            color: GloblalVariable.hex_f94f2f,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3),
                            bottomLeft: Radius.circular(3),
                          ),
                          borderSide: BorderSide(
                            color: GloblalVariable.hex_f94f2f,
                          ),
                        ),
                        hintText: 'BÀN CHẢI ĐIỆN GIẢM 50%',
                        hintStyle: TextStyle(
                          color: GloblalVariable.hex_9c9c9c,
                          fontSize: 12,
                        ),
                        suffixIcon: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.camera_alt_outlined),
                          iconSize: 18,
                          color: GloblalVariable.hex_9c9c9c,
                        ),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          size: 20,
                          color: GloblalVariable.hex_9c9c9c,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      width: 45,
                      color: GloblalVariable.hex_f94f2f,
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //--- list search ---
            // Container(
            //   height: 300,
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(color: Colors.white, boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.2),
            //       spreadRadius: 2,
            //       blurRadius: 1,
            //       offset: const Offset(0, 3),
            //     )
            //   ]),
            //   child: SingleChildScrollView(
            //     padding: const EdgeInsets.only(left: 12, right: 12),
            //     child: FutureBuilder(
            //       future: _viewModel.search(controllerSearchBar.text),
            //       builder: (context, snapshot) {
            //         if (snapshot.hasData) {
            //           return Column(
            //             children: List.generate(snapshot.data!.length, (index) {
            //               List<List<dynamic>> list = [];
            //               for (int i = 0; i < snapshot.data!.length; i++) {
            //                 if (list.contains(snapshot.data![i].values.first) ==
            //                     false) {
            //                   list.add(snapshot.data![i].values.first);
            //                 }
            //               }
            //               listIdProductSearch = list
            //                   .expand((element) => element)
            //                   .toSet()
            //                   .toList();
            //               // print(listIdProductSearch);
            //               return GestureDetector(
            //                 onTap: () {
            //                   List<dynamic> idSelected =
            //                       snapshot.data![index].values.first;
            //                   for (int i = 0; i < idSelected.length; i++) {
            //                     listIdProductSearch.remove(idSelected[i]);
            //                   }
            //                   Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                       builder: (_) {
            //                         return ProductsSearch(
            //                           listIdProductSelected:
            //                               snapshot.data![index].values.first,
            //                           otherSearch: listIdProductSearch,
            //                           nameSearch:
            //                               snapshot.data![index].keys.first,
            //                         );
            //                       },
            //                     ),
            //                   );
            //                 },
            //                 child: ListTile(
            //                   title: Text(snapshot.data![index].keys.first),
            //                 ),
            //               );
            //             }),
            //           );
            //         }
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
