import 'package:dictionary/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final DataController dataController = Get.put(DataController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => dataController.dictionary.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    const Center(child: CircularProgressIndicator()),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: TextField(
                                  controller: searchController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    // Other decoration properties if needed
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (searchController.text.isEmpty) {
                                    Get.snackbar("Word cannot be empty",
                                        "Invalid Response");
                                  } else {
                                    debugPrint(
                                        "search text is ${searchController.text}");
                                    dataController.searchedword.clear();
                                    dataController
                                        .binarySearch(searchController.text);
                                    if (dataController.exactsearch.isEmpty) {
                                      Get.snackbar("Word Not Found",
                                          "Please try a different word");
                                    }
                                  }
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => dataController.searchedword.isEmpty &&
                              dataController.exactsearch.isEmpty
                          ? dataController.i.value == 0
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                      ),
                                      Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(21)),
                                          ),
                                          child: ListTile(
                                            title: const Center(
                                                child: Text(
                                              "Did You Know?\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            )),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              '${dataController.dictionary[dataController.random.value]['english']}',
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' means ${dataController.dictionary[dataController.random.value]['hindi']}\n',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey.shade800,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Center(
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: "Only ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                '${dataController.dictionary[dataController.random.value]['type']}',
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors.red,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                ' students know that!',
                                                            style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade800,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  // Text("Only ${dataController.dictionary[dataController.random.value]['type']} students know that!",style: TextStyle(
                                                  //     fontSize: 18,
                                                  //     fontWeight: FontWeight.w500
                                                  // ),)
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              // Do something when the ListTile is tapped
                                            },
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                      ),
                                      Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(21)),
                                          ),
                                          child: ListTile(
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    " Sorry,Word Not Found",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  )
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              // Do something when the ListTile is tapped
                                            },
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Column(
                                children: [
                                  dataController.exactsearch.isEmpty
                                      ? const SizedBox()
                                      : Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 8.0,
                                                                    left: 35),
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                dataController
                                                                        .exactsearch[
                                                                    'english']!,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        IconButton(
                                                          icon: const Icon(
                                                            Icons.copy,
                                                            color: Colors.black,
                                                          ),
                                                          onPressed: () {
                                                            copyToClipboard(
                                                                "${dataController.exactsearch['english']!} ${convertToHin(dataController.exactsearch['hindi']!)}");
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 8),
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  convertToHin(
                                                                      dataController
                                                                              .exactsearch[
                                                                          'hindi']!),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black,
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Column(
                                                  children: [
                                                    dataController
                                                            .exactsearch[
                                                                'type']!
                                                            .isEmpty
                                                        ? const SizedBox()
                                                        : InkWell(
                                                            onTap: () {
                                                              dataController.secondarysearch(
                                                                  dataController
                                                                          .exactsearch[
                                                                      'type']!);
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          18.0,
                                                                      top: 10),
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Text(
                                                                  dataController
                                                                          .exactsearch[
                                                                      'type']!,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Text(convertToHin2(
                                                          dataController
                                                                  .exactsearch[
                                                              'hindi']!)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  dataController.searchedword.isEmpty
                                      ? const SizedBox()
                                      : Text(
                                          "${dataController.toshow.value} ->"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        dataController.searchedword.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(21)),
                                          ),
                                          child: ListTile(
                                            title: RichText(
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        '${dataController.searchedword[index]['english']}',
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20
                                                        // Other text styles can be added here
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' ${dataController.searchedword[index]['type']!.isEmpty ? "" : "(${dataController.searchedword[index]['type']})"}\n${dataController.searchedword[index]['hindi']}',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.8),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500

                                                        // Add your other styles here
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            trailing: IconButton(
                                              icon: const Icon(
                                                Icons.copy,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                copyToClipboard(
                                                    "${dataController.searchedword[index]['english']!} ${dataController.searchedword[index]['hindi']!}");
                                              },
                                            ),
                                            onTap: () {
                                              // Do something when the ListTile is tapped
                                              print(
                                                  'Tapped on ${dataController.searchedword[index]}');
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )),
                            ),
                    )
                  ],
                )),
        ),
      ),
    );
  }

  String convertToHin(String mean) {
    String result = '';
    RegExp pattern = RegExp(
        r'(?<=[a-zA-Z0-9])[, -]+(?=[a-zA-Z0-9])'); // Matches , - or spaces between English letters

    String cleanedString = mean.replaceAllMapped(pattern, (match) {
      return ''; // Replace matched characters with an empty string
    });
    RegExp pattern2 =
        RegExp(r'[^, \-\u0900-\u097F]+'); // Matches characters to be removed

    result = cleanedString.replaceAll(pattern2, '');

    result = result.replaceAll(RegExp(r'\s+'), ' ');

    // Remove extra commas between words
    result = result.replaceAll(RegExp(r',+,+'), ',');

    // Remove leading and trailing commas
    result = result.replaceAll(RegExp(r'^,+|,+$'), '');

    // Remove leading and trailing spaces
    result = result.trim();
    result = result.replaceAll(RegExp(r',\s+'), ',');
    result = result.replaceAll(RegExp(r',{2,}'), ',');

    return result;
  }

  String convertToHin2(String mean) {
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < mean.length - 1; i++) {
      if (mean[i].contains(RegExp(r'[0-9]')) && mean[i + 1].contains('.')) {
        buffer.write('\n');
      }
      buffer.write(mean[i]);
    }
    return buffer.toString();
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text))
        .then((_) => print('Copied to clipboard: $text'))
        .catchError((e) => print('Error copying to clipboard: $e'));
  }
}
