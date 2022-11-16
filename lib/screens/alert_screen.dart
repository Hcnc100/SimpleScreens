import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ButtonShowDialog(launchDialog: () => _showDialog(context)),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(Icons.close)),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Platform.isAndroid
            ? const _SimpleAndroidDialog()
            : const _SimpleIOSDialog(),
        barrierDismissible: true);
  }
}

class _SimpleIOSDialog extends StatelessWidget {
  const _SimpleIOSDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Generic Title"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("Generic Content"),
          SizedBox(height: 20),
          FlutterLogo(size: 100)
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.red))),
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text("OK"))
      ],
    );
  }
}

class _SimpleAndroidDialog extends StatelessWidget {
  const _SimpleAndroidDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      title: const Text("Generic Title Android"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("Generic Content Android"),
          SizedBox(height: 20),
          FlutterLogo(size: 100)
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Ok"),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))))
      ],
    );
  }
}

class _ButtonShowDialog extends StatelessWidget {
  const _ButtonShowDialog({
    Key? key,
    required this.launchDialog,
  }) : super(key: key);

  final Function launchDialog;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () => launchDialog(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Show Alert", style: TextStyle(fontSize: 20)),
            )));
  }
}
