import 'package:centredeformation/screens/edit_profile.dart';
import 'package:centredeformation/screens/shared/components/components.dart';
import 'package:centredeformation/screens/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

import 'modules/social_app/edit_profile/edit_profile_screen.dart';

class Profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 190.0,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  child: Container(
                    height: 140.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          4.0,
                        ),
                        topRight: Radius.circular(
                          4.0,
                        ),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://namefbcovers.com/images/styles/itm_welcome-to-my-profile_facebook_name_covers2014-06-04_14-47-41_1.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  alignment: AlignmentDirectional.topCenter,
                ),
                CircleAvatar(
                  radius: 64.0,
                  backgroundColor:
                  Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                      'https://i.ibb.co/100PgNw/2.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Eya Gueddes',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Software Engineer',
            style: Theme.of(context).textTheme.caption,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '100',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          'Posts',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '265',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          'Photos',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '10k',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          'Followers',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '64',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          'Followings',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Add Photos',
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              OutlinedButton(
                onPressed: () {
                  navigateTo(
                    context,
                    EditProfile(),
                  );
                },
                child: Icon(
                  Icons.edit,
                  size: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}