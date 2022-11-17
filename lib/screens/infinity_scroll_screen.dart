import 'package:flutter/material.dart';
import 'package:screens/theme/app_theme.dart';

class InfinityScrollScreen extends StatefulWidget {
  const InfinityScrollScreen({Key? key}) : super(key: key);

  @override
  State<InfinityScrollScreen> createState() => _InfinityScrollScreenState();
}

class _InfinityScrollScreenState extends State<InfinityScrollScreen> {
  final List<int> listImgIndex = List.generate(10, (index) => index);
  final ScrollController scrollController = ScrollController();
  bool _isConcatenateData = false;

  double get currentScrollPosition => scrollController.position.pixels;
  double get maxScrollPosition => scrollController.position.maxScrollExtent;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() => _addNewImages(tolerancia: 500));
  }

  Future<void> _addNewImages({double tolerancia = 0}) async {
    if (currentScrollPosition >= maxScrollPosition - tolerancia &&
        !_isConcatenateData) {
      _isConcatenateData = true;
      setState(() {});
      await _concatenateNewImages();
      setState(() {});
      _isConcatenateData = false;
      setState(() {});

      // ! this is important for only animate if the user is in the last image
      if (currentScrollPosition >= (maxScrollPosition - 100)) {
        scrollController.animateTo(currentScrollPosition + 100,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);
      }
    }
  }

  Future<void> _concatenateNewImages({int numberAdd = 10}) async {
    final lastId = listImgIndex.last;
    final newListIds = List.generate(numberAdd, (index) => lastId + index + 1);
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    listImgIndex.addAll(newListIds);
  }

  Future<void> onRefresh() async {
    final lastId = listImgIndex.last;
    listImgIndex.clear();
    listImgIndex.add(lastId);
    await _concatenateNewImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: onRefresh,
              color: AppTheme.primaryColor,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: listImgIndex.length,
                itemBuilder: (_, index) =>
                    ImageRandom(index: listImgIndex[index]),
              ),
            ),
            if (_isConcatenateData) const ProgressIndicator()
          ],
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    const sizeProgress = 50.0;
    return Positioned(
      bottom: 20,
      left: widthScreen * 0.5 - (sizeProgress / 2),
      child: Container(
        width: sizeProgress,
        height: sizeProgress,
        padding: const EdgeInsets.all(10),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}

class ImageRandom extends StatelessWidget {
  const ImageRandom({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage("assets/jar-loading.gif"),
      image: NetworkImage("https://picsum.photos/500/300?image=$index"),
      height: 300,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
