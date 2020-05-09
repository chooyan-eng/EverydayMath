import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';

class CropImagePage extends StatelessWidget {
  final File originalImageFile;
  final ValueChanged<File> onCropped;

  final _cropKey = GlobalKey<CropState>();

  CropImagePage({
    Key key,
    this.originalImageFile,
    this.onCropped,
  }) : super(key: key);

  Future<void> _execCrop() async {
    final crop = _cropKey.currentState;

    final sampleFile = await ImageCrop.sampleImage(
      file: originalImageFile,
      preferredWidth: 512,
      preferredHeight: 512,
    );

    final croppedFile = await ImageCrop.cropImage(
      file: sampleFile,
      area: crop.area,
      scale: crop.scale,
    );

    onCropped(croppedFile);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Crop(
            key: _cropKey,
            image: FileImage(originalImageFile),
            aspectRatio: 1,
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _execCrop,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 64,
                      child: Center(
                        child: Text(
                          '切り取る',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
