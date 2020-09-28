import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDektop(context);

    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: isDesktop ? 5.0 : 0, vertical: isDesktop ? 5.0 : 0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PostHeader(post: post),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(post.caption),
            ),
            post.imageUrl != null
                ? const SizedBox.shrink()
                : const SizedBox(
                    height: 6.0,
                  ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: _PostState(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileAvatar(
        imageUrl: post.user.imageUrl,
        isActive: false,
      ),
      title: Text(
        post.user.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            post.timeAgo,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.fiber_manual_record,
            color: Colors.grey[600],
            size: 6,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.public,
            size: 15,
            color: Colors.grey[600],
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.more_horiz,
          size: 25,
        ),
        onPressed: () => print("More horizontal pressed"),
      ),
    );
  }
}

class _PostState extends StatelessWidget {
  final Post post;

  const _PostState({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} comentarios',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.fiber_manual_record,
              size: 5,
              color: Colors.grey[600],
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${post.shares} veces compartido',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap: () => print('Liked'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comentar',
              onTap: () => print('Comentar'),
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Compartir',
              onTap: () => print('Share'),
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon, SizedBox(width: 4.0), Text(label)],
            ),
          ),
        ),
      ),
    );
  }
}
