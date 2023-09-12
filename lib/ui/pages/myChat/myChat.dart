import 'package:location_app/export.dart';

import '../../../core/provider/bottomNavigation/navigator_provider.dart';

class MyChat extends StatefulWidget {
  const MyChat({Key? key}) : super(key: key);

  @override
  State<MyChat> createState() => _MyChatState();
}



enum Options { search, upload, copy, exit }


class _MyChatState extends State<MyChat> {
  var _popupMenuItemIndex = 0;
  Color _changeColorAccordingToMenuItem = Colors.red;

  var appBarHeight = AppBar().preferredSize.height;
  PopupMenuItem _buildPopupMenuItem(
      String title,  int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title),
        ],
      ),
    );
  }

  _onMenuItemSelected(int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if (value == 0) {
      //_changeColorAccordingToMenuItem = Colors.red;
    } else if (value == 1) {
     // _changeColorAccordingToMenuItem = Colors.green;
    }
  }


  @override
  Widget build(BuildContext context) {
    DashboardProvider returnHome = Provider.of<DashboardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: Colors.white,
        title: Text('Méssages',
          style: AppTypography().medium.copyWith(
              fontSize: 16,
              color: AppColors.black2
          ),),
        shape: const Border(bottom: BorderSide(color: AppColors.brown, width: 0.5)),
        centerTitle: false,
        leading: IconButton(

          highlightColor: AppColors.primaryTwo.withOpacity(0.3),
          onPressed: (){
            returnHome.setIndex(0);
            returnHome.setIsReturn(true);
            returnHome.setEtat(0);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.black2,
            size: 20,
          ),
        ),
        actions: [
          PopupMenuButton(
            elevation: 3,
            color: AppColors.white,
            surfaceTintColor: AppColors.white,
            icon: Container(
              width: 28,
              height: 28,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.primaryTwo.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),

              ),
              child: const Icon(
                Icons.filter_list,
                color: AppColors.primaryTwo,
                size: 20,
              ),
            ),
              onSelected: (value) {
              _onMenuItemSelected(value as int);
            },
            offset: Offset(0.0, appBarHeight),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            itemBuilder: (ctx) => [
              _buildPopupMenuItem('Tous', 0),
              _buildPopupMenuItem('Non lus', 2)

            ],
          ),

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child:  ListView(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.primaryTwo, width: 1),
                                borderRadius: BorderRadius.circular(12),

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('Rechercher un méssage',
                                      style: AppTypography().authText
                                          .copyWith(color: AppColors.hintColor, fontSize: 16)),
                                  ),
                                   Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: InkWell(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                          shape: BoxShape.rectangle,
                                          color: AppColors.primaryTwo,
                                        ),
                                        child: const Icon(
                                          Icons.search_outlined,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      onTap: () {},
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      MessageView(userProfil: $AppAssets.imgs.profil, senderUsername: 'Anaelle', lastMessage: 'Salut je suis interrssé', userID: '2',),
                      MessageView(userProfil: $AppAssets.imgs.profil, senderUsername: 'Eliot', lastMessage: 'Salut je suis interrssé', userID: '3',),
                      MessageView(userProfil: $AppAssets.imgs.profil, senderUsername: 'Kate', lastMessage: 'Salut je suis interrssé', userID: '4',),
                      MessageView(userProfil: $AppAssets.imgs.profil, senderUsername: 'Hanane', lastMessage: 'Salut je suis interrssé', userID: '5',),
                      MessageView(userProfil: $AppAssets.imgs.profil, senderUsername: 'Junior', lastMessage: 'Salut je suis interrssé', userID: '6',),
                      ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class MessageView extends StatelessWidget {
  const MessageView({
    super.key, required this.userProfil, required this.senderUsername, required this.lastMessage, required this.userID,
  });

  final String userID;
  final String userProfil;
  final String senderUsername;
  final String lastMessage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.push('${AppPage.chatRoom.toPath}/$userID');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        // border: Border.all(color: AppColors.brown, width: 1)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(userProfil, fit: BoxFit.cover,))),
                const SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(senderUsername,
                            style: AppTypography().title,),
                          Text('3h',
                            style: AppTypography().subtitle,),
                        ],
                      ),
                      const SizedBox(height: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(lastMessage,
                            style: AppTypography().title.copyWith(fontWeight: FontWeight.w400),),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                                color: AppColors.red
                            ),
                            child: Text('1',
                              style: AppTypography().subtitle.copyWith(color: AppColors.white, fontSize: 8),),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
