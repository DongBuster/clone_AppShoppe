import 'dart:io';
import 'package:clone_shoppe/features/page/productsSearchPage/products_search.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constants/global_variables.dart';
import '../productsSearchPage/resources/animation/transition_search_page.dart';
import '../../../common/widgets/loading.dart';
import 'resources/widgets/snack_bar_error.dart';
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

  // final _overlayKey = GlobalKey<OverlayState>();
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
                        if (controllerSearchBar.text == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBarError(context,
                                  'Hãy điền tên sản phẩm bạn cần tìm kiếm'));
                          return;
                        }

                        // print(listIdProductSearch);

                        Navigator.push(
                          context,
                          goRouteProductSearchPage(
                            listIdProductSearch,
                            null,
                            controllerSearchBar.text,
                          ),
                        );
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
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 2.0),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3),
                            bottomLeft: Radius.circular(3),
                          ),
                          borderSide: BorderSide(
                            color: GloblalVariable.hex_f94f2f,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3),
                            bottomLeft: Radius.circular(3),
                          ),
                          borderSide: BorderSide(
                            color: GloblalVariable.hex_f94f2f,
                          ),
                        ),
                        hintText: 'BÀN CHẢI ĐIỆN GIẢM 50%',
                        hintStyle: const TextStyle(
                          color: GloblalVariable.hex_9c9c9c,
                          fontSize: 12,
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 0),
                              onPressed: () async {
                                _focusNode.unfocus();
                                OverlayState? overlayState =
                                    Overlay.of(context);
                                OverlayEntry overlayEntry =
                                    OverlayEntry(builder: (context) {
                                  return const Loading();
                                });
                                File? imagePick = await _viewModel
                                    .pickImage(ImageSource.camera);
                                if (imagePick == null) return;

                                overlayState.insert(overlayEntry);

                                String? nameSearch =
                                    await _viewModel.generateAi(imagePick);
                                if (nameSearch == null ||
                                    nameSearch.startsWith('null')) {
                                  overlayEntry.remove();

                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        snackBarError(context,
                                            'Không tìm được sản phẩm trong ảnh'));
                                  }
                                  return;
                                }
                                overlayEntry.remove();

                                // print(nameSearch);
                                _viewModel
                                    .searchWithCameraAndGallery(nameSearch)
                                    .then(
                                  (listIdProduct) {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    Navigator.push(
                                      context,
                                      goRouteProductSearchPage(
                                        listIdProductSearch,
                                        null,
                                        nameSearch,
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.camera_alt_outlined),
                              iconSize: 18,
                              color: Colors.blue,
                            ),
                            IconButton(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              onPressed: () async {
                                _focusNode.unfocus();
                                OverlayState? overlayState =
                                    Overlay.of(context);
                                OverlayEntry overlayEntry =
                                    OverlayEntry(builder: (context) {
                                  return const Loading();
                                });
                                File? imagePick = await _viewModel
                                    .pickImage(ImageSource.gallery);
                                if (imagePick == null) return;

                                overlayState.insert(overlayEntry);

                                String? nameSearch =
                                    await _viewModel.generateAi(imagePick);
                                if (nameSearch == null ||
                                    nameSearch.startsWith('null')) {
                                  overlayEntry.remove();

                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        snackBarError(context,
                                            'Không tìm được sản phẩm trong ảnh'));
                                  }
                                  return;
                                }
                                overlayEntry.remove();

                                // print(nameSearch);
                                _viewModel
                                    .searchWithCameraAndGallery(nameSearch)
                                    .then(
                                  (listIdProduct) {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    Navigator.push(
                                      context,
                                      goRouteProductSearchPage(
                                        listIdProductSearch,
                                        null,
                                        nameSearch,
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.collections_rounded),
                              iconSize: 18,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          size: 20,
                          color: GloblalVariable.hex_9c9c9c,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controllerSearchBar.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            snackBarError(context,
                                'Hãy điền tên sản phẩm bạn cần tìm kiếm'));
                        return;
                      }
                      Navigator.push(
                        context,
                        goRouteProductSearchPage(
                          listIdProductSearch,
                          null,
                          controllerSearchBar.text,
                        ),
                      );
                    },
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
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: const Offset(0, 3),
                )
              ]),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: FutureBuilder(
                  future: _viewModel.search(controllerSearchBar.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<List<dynamic>> list = [];
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        list.add(snapshot.data![i].values.first);
                      }
                      // print(list);
                      listIdProductSearch =
                          list.expand((element) => element).toSet().toList();
                      //---- -----
                      return Column(
                        children: List.generate(snapshot.data!.length, (index) {
                          // print(listIdProductSearch);
                          return GestureDetector(
                            onTap: () {
                              // listIdSelected = [id1,id2]
                              List<dynamic> listIdSelected =
                                  snapshot.data![index].values.first;

                              for (int i = 0; i < listIdSelected.length; i++) {
                                listIdProductSearch.remove(listIdSelected[i]);
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return ProductsSearch(
                                      listIdProductSelected:
                                          snapshot.data![index].values.first,
                                      otherSearch: listIdProductSearch,
                                      nameSearch:
                                          snapshot.data![index].keys.first,
                                    );
                                  },
                                ),
                              );
                            },
                            child: ListTile(
                              title: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: snapshot.data![index].keys.first[0],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: snapshot.data![index].keys.first
                                          .substring(1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
