import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDektop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
          : null,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(
                  imageUrl: currentUser.imageUrl,
                  isActive: false,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: new InputDecoration(
                      hintText: "¿Que esta pasando?",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(25.0)),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () {
                      return print("Live");
                    },
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text("Live"),
                  ),
                  VerticalDivider(),
                  FlatButton.icon(
                    onPressed: () {
                      return print("Foto");
                    },
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text("Foto"),
                  ),
                  VerticalDivider(
                    width: 8,
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      return print("Live");
                    },
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purple,
                    ),
                    label: Text("Sala"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
