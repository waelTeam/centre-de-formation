import 'package:centredeformation/screens/layout/centre_app/cubit/cubit.dart';
// import 'package:centredeformation/screens/layout/social_app/cubit/cubit.dart';
import 'package:centredeformation/screens/shared/components/components.dart';
import 'package:centredeformation/screens/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var phoneController;
    return  Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Edit Profile',
        actions: [
          defaultTextButton(
            function: () {
              // SocialCubit.get(context).updateUser(
              //     name: nameController.text,
              //     phone: phoneController.text,
              //     bio: bioController.text);
            },
            text: 'Update',
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // if (state is SocialUserUpdateLoadingState)
              //   LinearProgressIndicator(),
              // if (state is SocialUserUpdateLoadingState)
                SizedBox(
                  height: 10.0,
                ),
              Container(
                height: 190.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
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
                                image: /*coverImage == null
                                    ?*/ NetworkImage(
                                  'https://namefbcovers.com/images/styles/itm_welcome-to-my-profile_facebook_name_covers2014-06-04_14-47-41_1.jpg',
                                )
                                    /*: FileImage(coverImage)*/,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: CircleAvatar(
                              radius: 20.0,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 16.0,
                              ),
                            ),
                            onPressed: () {
                              CentreCubit.get(context).getCoverImage();
                            },
                          ),
                        ],
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 64.0,
                          backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage: //profileImage == null
                                /*?*/ NetworkImage(
                              'https://i.ibb.co/100PgNw/2.png',
                            )
                                /*: FileImage(profileImage)*/,
                          ),
                        ),
                        IconButton(
                          icon: CircleAvatar(
                            radius: 20.0,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 16.0,
                            ),
                          ),
                          onPressed: () {
                            CentreCubit.get(context).getProfileImage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // if (SocialCubit.get(context).profileImage != null ||
              //     SocialCubit.get(context).coverImage != null)
              //   Row(
              //     children: [
              //       if (SocialCubit.get(context).profileImage != null)
              //         Expanded(
              //           child: Column(
              //             children: [
              //               defaultButton(
              //                 function: () {
              //                   SocialCubit.get(context).uploadProfileImage(
              //                     name: 'eya ',//nameController.text,
              //                     phone: '1234', //phoneController.text,
              //                     bio: 'hello',
              //                   );
              //                 },
              //                 text: 'upload profile',
              //               ),
              //               // if (state is SocialUserUpdateLoadingState)
              //               //   SizedBox(
              //               //     height: 5.0,
              //               //   ),
              //               // if (state is SocialUserUpdateLoadingState)
              //                 LinearProgressIndicator(),
              //             ],
              //           ),
              //         ),
              //       SizedBox(
              //         width: 5.0,
              //       ),
              //       if (SocialCubit.get(context).coverImage != null)
              //         Expanded(
              //           child: Column(
              //             children: [
              //               defaultButton(
              //                 function: () {
              //                   SocialCubit.get(context).uploadCoverImage(
              //                     name: 'eya',//nameController.text,
              //                     phone: '123',//phoneController.text,
              //                     bio: 'software',//bioController.text,
              //                   );
              //                 },
              //                 text: 'upload cover',
              //               ),
              //               // if (state is SocialUserUpdateLoadingState)
              //               //   SizedBox(
              //               //     height: 5.0,
              //               //   ),
              //               // if (state is SocialUserUpdateLoadingState)
              //                 LinearProgressIndicator(),
              //             ],
              //           ),
              //         ),
              //     ],
              //   ),
              // if (SocialCubit.get(context).profileImage != null ||
              //     SocialCubit.get(context).coverImage != null)
              //   SizedBox(
              //     height: 20.0,
              //   ),
              defaultFormField(
                //controller: nameController,
                type: TextInputType.name,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'name must not be empty';
                  }

                  return null;
                },
                label: 'Name',
                prefix: IconBroken.User,
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultFormField(
                //controller: bioController,
                type: TextInputType.text,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'bio must not be empty';
                  }

                  return null;
                },
                label: 'Bio',
                prefix: IconBroken.Info_Circle,
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultFormField(
                controller: phoneController,
                type: TextInputType.phone,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'phone number must not be empty';
                  }

                  return null;
                },
                label: 'Phone',
                prefix: IconBroken.Call,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
