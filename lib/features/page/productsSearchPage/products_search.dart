import 'package:clone_shoppe/features/page/searchPage/search_page.dart';
import 'package:clone_shoppe/models/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../common/widgets/product_view.dart';
import '../../../constants/global_variables.dart';
import 'resources/widgets/loading.dart';
import 'view_models/products_search_page_view_model.dart';

class ProductsSearch extends StatefulWidget {
  final List<dynamic>? listIdProductSelected;
  final List? otherSearch;
  final String? nameSearch;
  const ProductsSearch({
    Key? key,
    this.listIdProductSelected,
    this.otherSearch,
    this.nameSearch,
  }) : super(key: key);

  @override
  State<ProductsSearch> createState() => _ProductsSearchState();
}

class _ProductsSearchState extends State<ProductsSearch> {
  final controllerSearchBar = TextEditingController();
  final _focusNode = FocusNode();
  late final Future buidlProduct;
  bool? isSortByPrice;

  List<bool> listIsBorderBottom = [true, false, false, false];
  List<String> listNameTags = [
    'Shoppe Mall',
    'Freeship Xtra',
    'Shop Yêu thích',
    'Miễn phí vận chuyển'
  ];

  final ProductsSearchPageViewModel _viewModel = ProductsSearchPageViewModel();

  void setIsBorderBottom(int index) {
    setState(() {
      listIsBorderBottom[index] = !listIsBorderBottom[index];
      for (int i = 0; i < listIsBorderBottom.length; i++) {
        if (i != index) {
          listIsBorderBottom[i] = false;
        }
      }
    });
  }

  @override
  void initState() {
    controllerSearchBar.text = widget.nameSearch!;
    super.initState();
  }

  @override
  void dispose() {
    controllerSearchBar.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.black12),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 50, left: 2),
              child: Column(
                children: [
                  Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border:
                            Border(bottom: BorderSide(color: Colors.black12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Gap(5),
                          SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      setIsBorderBottom(0);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: listIsBorderBottom[0]
                                                  ? GloblalVariable.hex_f94f2f
                                                  : Colors.black12),
                                        ),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Liên quan',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: listIsBorderBottom[0]
                                              ? GloblalVariable.hex_f94f2f
                                              : Colors.black45,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                                //---line ---
                                Container(
                                  height: 25,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black26)),
                                ),

                                Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      setIsBorderBottom(1);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: listIsBorderBottom[1]
                                                    ? GloblalVariable.hex_f94f2f
                                                    : Colors.black12)),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Mới nhất',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: listIsBorderBottom[1]
                                              ? GloblalVariable.hex_f94f2f
                                              : Colors.black45,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                                //---line ---
                                Container(
                                  height: 25,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black26)),
                                ),

                                Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      setIsBorderBottom(2);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: listIsBorderBottom[2]
                                                    ? GloblalVariable.hex_f94f2f
                                                    : Colors.black12)),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Bán chạy',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: listIsBorderBottom[2]
                                              ? GloblalVariable.hex_f94f2f
                                              : Colors.black45,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                                //---line ---
                                Container(
                                  height: 25,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black26)),
                                ),

                                Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSortByPrice == null
                                            ? isSortByPrice = true
                                            : isSortByPrice == true
                                                ? isSortByPrice = false
                                                : isSortByPrice = true;
                                        //---  ----
                                        listIsBorderBottom[3] = true;
                                        for (int i = 0;
                                            i < listIsBorderBottom.length;
                                            i++) {
                                          if (i != 3) {
                                            listIsBorderBottom[i] = false;
                                          }
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: listIsBorderBottom[3]
                                                    ? GloblalVariable.hex_f94f2f
                                                    : Colors.black12)),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Giá',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: listIsBorderBottom[3]
                                                    ? GloblalVariable.hex_f94f2f
                                                    : Colors.black45,
                                              ),
                                            ),
                                            Icon(
                                              isSortByPrice == null
                                                  ? Icons.unfold_more
                                                  : isSortByPrice == true
                                                      ? Icons.arrow_downward
                                                      : Icons.arrow_upward,
                                              size: 18,
                                              color: isSortByPrice == null
                                                  ? Colors.black45
                                                  : GloblalVariable.hex_f94f2f,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(5),
                          SizedBox(
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listNameTags.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  margin:
                                      const EdgeInsets.only(left: 6, right: 6),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Center(
                                    child: Text(
                                      listNameTags[index],
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Gap(5),
                        ],
                      )),
                  const Gap(8),
                  FutureBuilder<List<Product>>(
                    future: _viewModel.loadProductSearch(
                      widget.listIdProductSelected,
                      widget.otherSearch,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var listProduct = snapshot.data;
                        return Wrap(
                          runSpacing: 10,
                          spacing: 0,
                          children: listProduct!
                              .map((product) => ProductView(
                                    name: product.name,
                                    urlImage: product.image[0],
                                    percentSale: product.percentSale,
                                    price: product.classify.values.first,
                                    quantitySold: product.quantitySold,
                                  ))
                              .toList(),
                        );
                      }
                      return const LoadingScreen();
                    },
                  ),
                ],
              ),
            ),
            //--- header app ---
            Positioned(
              child: Container(
                // padding: const EdgeInsets.only(bottom: 5),
                color: Colors.white,
                height: 45,
                alignment: Alignment.center,
                child: SizedBox(
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
                          controller: controllerSearchBar,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SearchPage()));
                          },
                          onTapOutside: (event) => _focusNode.unfocus(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
