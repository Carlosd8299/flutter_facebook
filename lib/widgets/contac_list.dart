import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/user_card.dart';

class ContacList extends StatelessWidget {
  final List<User> users;

  const ContacList({Key key, @required this.users}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contactos',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.grey[600],
                onPressed: () {},
              ),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                color: Colors.grey[600],
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final User user = users[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: user),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
