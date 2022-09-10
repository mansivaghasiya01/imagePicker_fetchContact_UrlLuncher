import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class ShareAppView extends StatefulWidget {
  const ShareAppView({Key? key}) : super(key: key);

  @override
  State<ShareAppView> createState() => _ShareAppViewState();
}

class _ShareAppViewState extends State<ShareAppView> {
  TextEditingController textdata = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textdata,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Message'),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Share Text'),
              onPressed: () async {
                if (textdata.value.text.isNotEmpty) {
                  await Share.share(textdata.value.text);
                }
              },
            ),
            Row(
              children: [
                const Text(
                  "Share from galary : ",
                  style: TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                  child: const Text('click here'),
                  onPressed: () async {
                    //pick image from Galery
                    final imagepick = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (imagepick == null) {
                      return;
                    }
                    await Share.shareFiles(
                      [imagepick.path],
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Share from camera : ",
                  style: TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                  child: const Text('click here'),
                  onPressed: () async {
                    //pick image from Camera
                    final imagepick = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (imagepick == null) {
                      return;
                    }
                    await Share.shareFiles(
                      [imagepick.path],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
