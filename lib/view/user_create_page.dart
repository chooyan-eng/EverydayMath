import 'package:flutter/material.dart';
import 'package:math_everyday/bloc/user_bloc.dart';
import 'package:math_everyday/bloc/user_create_bloc.dart';
import 'package:math_everyday/view/widget/crop_image_page.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class UserCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserCreateBloc>(
      builder: (context, bloc, child) {
        return bloc.tempImageFile == null ? SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 60),
                Text('おなまえ', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                TextField(
                  controller: bloc.nameController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(height: 32),
                Text('テーマカラー', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Center(
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: <Widget>[
                      _buildIconColor(bloc, Colors.blue),
                      _buildIconColor(bloc, Colors.yellow),
                      _buildIconColor(bloc, Colors.pink),
                      _buildIconColor(bloc, Colors.black),
                      _buildIconColor(bloc, Colors.brown),
                      _buildIconColor(bloc, Colors.purple),
                      _buildIconColor(bloc, Colors.greenAccent),
                      _buildIconColor(bloc, Colors.indigo),
                      _buildIconColor(bloc, Colors.amber),
                      _buildIconColor(bloc, Colors.deepOrange),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text('アイコン', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: _buildTempIcon(bloc),
                    ),
                    SizedBox(width: 32),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: <Widget>[
                              _buildIconSelection(bloc, Icons.ac_unit),
                              _buildIconSelection(bloc, Icons.accessibility_new),
                              _buildIconSelection(bloc, Icons.adb),
                              _buildIconSelection(bloc, Icons.airplanemode_active),
                              _buildIconSelection(bloc, Icons.airport_shuttle),
                              _buildIconSelection(bloc, Icons.beach_access),
                              _buildIconSelection(bloc, Icons.directions_boat),
                              _buildIconSelection(bloc, Icons.cake),
                              _buildIconSelection(bloc, Icons.child_care),
                            ],
                          ),
                          SizedBox(height: 16),
                          InkWell(
                            onTap: bloc.pickupImage,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('写真から選ぶ'),
                                  const SizedBox(width: 16),
                                  Icon(Icons.photo_camera, color: Colors.black54,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Center(
                  child: RaisedButton(
                    onPressed: () async {
                      final user = await bloc.save();
                      if (user.id != null) {
                        Toast.show('${user.name}を追加しました！', context);
                        await Provider.of<UserBloc>(context, listen: false).load();
                        Navigator.pop(context);
                      } else {
                        Toast.show('${user.name}を追加できませんでした、、', context);
                      }
                    },
                    padding: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Container(
                      width: 128,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: bloc.color,
                      ),
                      child: Center(
                        child: Text(
                          'これでOK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ) : CropImagePage(
          originalImageFile: bloc.tempImageFile,
          onCropped: (image) {
            bloc.tempImageFile = null;
            bloc.saveFile = image;
          },
        );
      },
    );
  }

  Widget _buildTempIcon(UserCreateBloc bloc) {
    if (bloc.saveFile != null) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: FileImage(
              bloc.saveFile,
            ),
          ),
        ),
      );
    } else if (bloc.tempIconData != null) {
      return Container(
        width: 100,
        height: 100,
        child: Center(
          child: Icon(
            bloc.tempIconData,
            size: 60,
            color: bloc.color
          ),
        ),
      );
    } else {
      return Container(
        width: 100,
        height: 100,
        color: Colors.black12,
      );
    }
  }

  Widget _buildIconSelection(UserCreateBloc bloc, IconData iconData) {
    return InkWell(
      onTap: () {
        bloc.tempIconData = iconData;
        bloc.saveFile = null;
      },
      child: Icon(iconData, color: bloc.color),
    );
  }

  Widget _buildIconColor(UserCreateBloc bloc, Color color) {
    return InkWell(
      onTap: () => bloc.color = color,
      child: Container(
        width: 32,
        height: 32,
        color: color,
      ),
    );
  }
}