
import 'package:location_app/core/models/chat.dart';
import 'package:location_app/export.dart';
import 'package:chatview/chatview.dart';
import '../../../core/controllers/auth/chat_controller.dart';
import 'theme.dart';
import 'data.dart';
class ChatRoomView extends StatefulWidget {
  const ChatRoomView({Key? key, required this.secondUserID}) : super(key: key);
  final String secondUserID;


  @override
  State<ChatRoomView> createState() => _ChatRoomViewState(this.secondUserID);
}
String profileImage = "https://miro.medium.com/max/1000/0*s7of7kWnf9fDg4XM.jpeg";
/*List<Message> messageList = [
  Message(
    id: '1',
    message: "Hi",
    createdAt: DateTime(2023, 2, 3, 2),
    sendBy: '1',
  ),
  Message(
    id: '2',
    message: "Hello",
    createdAt: DateTime.now(),
    sendBy: '2',
  ),
];*/
class _ChatRoomViewState extends State<ChatRoomView> {


  final String secondUserID;
  _ChatRoomViewState(this.secondUserID);

  AppTheme theme = LightTheme();
  bool isDarkTheme = false;
  final currentUser = ChatUser(
    id: '1',
    name: 'Vianney',
    profilePhoto: Data.profileImage,
  );
  late String secondUserID_ = secondUserID;

  final _chatController = ChatController(
    initialMessageList: Data.messageList,
    scrollController: ScrollController(),
    chatUsers: [
      ChatUser(
          id: '2',
        name: 'Anaelle',
        profilePhoto: Data.profileImage,
      ),
    ],
  );



  void _showHideTypingIndicator() {
    _chatController.setTypingIndicator = !_chatController.showTypingIndicator;
  }



  @override
  Widget build(BuildContext context) {
    //print(Data.messageList[4].createdAt);
    /*sfinal chat_controller = Provider.of<ChatDataController>(context);
    Future<Chat?> chat = chat_controller.viewChat(secondUserID);*/

    Iterable<User_s> secondUserT = myUserList.where((element) => element.userId.compareTo(secondUserID.toString()) == 0);
    //User_s secondUser = secondUserT.elementAt(0);
    return Scaffold(
      body: ChatView(
        currentUser: currentUser,
        chatController: _chatController,
        onSendTap: _onSendTap,
        featureActiveConfig: const FeatureActiveConfig(
            lastSeenAgoBuilderVisibility: true,
            receiptsBuilderVisibility: true),
        chatViewState: ChatViewState.hasMessages,
        chatViewStateConfig: ChatViewStateConfiguration(
          loadingWidgetConfig: ChatViewStateWidgetConfiguration(
            loadingIndicatorColor: theme.outgoingChatBubbleColor,
          ),
          onReloadButtonTap: () {},
        ),
        typeIndicatorConfig: TypeIndicatorConfiguration(
          flashingCircleBrightColor: theme.flashingCircleBrightColor,
          flashingCircleDarkColor: theme.flashingCircleDarkColor,
        ),
        appBar: ChatViewAppBar(
          onProfilPress: (){
            context.push('${AppPage.otherUserProfil.toPath}');
          },
          elevation: theme.elevation,
          backGroundColor: theme.appBarColor,
          profilePicture: Data.profileImage,
          backArrowColor: theme.backArrowColor,
          chatTitle: 'Audrey',
          chatTitleTextStyle: TextStyle(
            color: theme.appBarTitleTextStyle,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.25,
          ),
          userStatus: "En ligne",
          userStatusTextStyle: const TextStyle(color: Colors.grey),
          actions: [
            IconButton(
              onPressed: _onThemeIconTap,
              icon: Icon(
                Icons.more_vert,
                color: theme.themeIconColor,
              ),
            ),
            /*
            IconButton(
              onPressed: _onThemeIconTap,
              icon: Icon(
                isDarkTheme
                    ? Icons.brightness_4_outlined
                    : Icons.dark_mode_outlined,
                color: theme.themeIconColor,
              ),
            ),
            IconButton(
              tooltip: 'Toggle TypingIndicator',
              onPressed: _showHideTypingIndicator,
              icon: Icon(
                Icons.keyboard,
                color: theme.themeIconColor,
              ),
            ),*/
          ],
        ),
        chatBackgroundConfig: ChatBackgroundConfiguration(
          messageTimeIconColor: theme.messageTimeIconColor,
          messageTimeTextStyle: TextStyle(color: theme.messageTimeTextColor),
          defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
            textStyle: TextStyle(
              color: theme.chatHeaderColor,
              fontSize: 17,
            ),
          ),
          backgroundColor: theme.backgroundColor,
        ),
        sendMessageConfig: SendMessageConfiguration(
          imagePickerIconsConfig: ImagePickerIconsConfiguration(
            cameraIconColor: theme.cameraIconColor,
            galleryIconColor: theme.galleryIconColor,
          ),
          replyMessageColor: theme.replyMessageColor,
          defaultSendButtonColor: theme.sendButtonColor,
          replyDialogColor: theme.replyDialogColor,
          replyTitleColor: theme.replyTitleColor,
          textFieldBackgroundColor: theme.textFieldBackgroundColor,
          closeIconColor: theme.closeIconColor,
          allowRecordingVoice: true,
          textFieldConfig: TextFieldConfiguration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            onMessageTyping: (status) {
              /// Do with status
              debugPrint(status.toString());
            },
            compositionThresholdTime: const Duration(seconds: 1),
            textStyle: TextStyle(color: theme.textFieldTextColor, fontFamily:  'Poppins'),
          ),
          micIconColor: theme.replyMicIconColor,
          voiceRecordingConfiguration: VoiceRecordingConfiguration(
            backgroundColor: theme.waveformBackgroundColor,
            recorderIconColor: theme.recordIconColor,
            waveStyle: WaveStyle(
              showMiddleLine: false,
              waveColor: theme.waveColor ?? Colors.white,
              extendWaveform: true,
            ),
          ),
        ),
        chatBubbleConfig: ChatBubbleConfiguration(
          outgoingChatBubbleConfig: ChatBubble(
            textStyle: TextStyle().copyWith(fontFamily: 'Poppins'),
            senderNameTextStyle: TextStyle().copyWith(fontFamily: 'Poppins'),
            borderRadius: BorderRadius.only(topRight: Radius.circular(14), topLeft: Radius.circular(14), bottomLeft: Radius.circular(14)),
            linkPreviewConfig: LinkPreviewConfiguration(
              backgroundColor: theme.linkPreviewOutgoingChatColor,
              bodyStyle: theme.outgoingChatLinkBodyStyle,
              titleStyle: theme.outgoingChatLinkTitleStyle,
            ),
            receiptsWidgetConfig:
            const ReceiptsWidgetConfig(showReceiptsIn: ShowReceiptsIn.all),
            color: theme.outgoingChatBubbleColor,
          ),
          inComingChatBubbleConfig: ChatBubble(
            borderRadius: BorderRadius.only(topRight: Radius.circular(14), topLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
            linkPreviewConfig: LinkPreviewConfiguration(
              linkStyle: TextStyle(
                color: theme.inComingChatBubbleTextColor,
                decoration: TextDecoration.underline,
              ),
              backgroundColor: theme.linkPreviewIncomingChatColor,
              bodyStyle: theme.incomingChatLinkBodyStyle,
              titleStyle: theme.incomingChatLinkTitleStyle,
            ),
            textStyle: TextStyle(color: theme.inComingChatBubbleTextColor, fontFamily: 'Poppins'),
            onMessageRead: (message) {
              /// send your message reciepts to the other client
              debugPrint('Message Read');
            },
            senderNameTextStyle:
            TextStyle(color: theme.inComingChatBubbleTextColor, fontFamily: 'Poppins'),
            color: theme.inComingChatBubbleColor,
          ),
        ),
        replyPopupConfig: ReplyPopupConfiguration(
          backgroundColor: theme.replyPopupColor,
          buttonTextStyle: TextStyle(color: theme.replyPopupButtonColor),
          topBorderColor: theme.replyPopupTopBorderColor,
        ),
        reactionPopupConfig: ReactionPopupConfiguration(
          shadow: BoxShadow(
            color: isDarkTheme ? Colors.black54 : Colors.grey.shade400,
            blurRadius: 20,
          ),
          backgroundColor: theme.reactionPopupColor,
        ),
        messageConfig: MessageConfiguration(
          messageReactionConfig: MessageReactionConfiguration(
            backgroundColor: theme.messageReactionBackGroundColor,
            borderColor: theme.messageReactionBackGroundColor,
            reactedUserCountTextStyle:
            TextStyle(color: theme.inComingChatBubbleTextColor, fontFamily:  'Poppins'),
            reactionCountTextStyle:
            TextStyle(color: theme.inComingChatBubbleTextColor, fontFamily:  'Poppins'),
            reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
              backgroundColor: theme.backgroundColor,
              reactedUserTextStyle: TextStyle(
                color: theme.inComingChatBubbleTextColor,
                  fontFamily:  'Poppins'
              ),
              reactionWidgetDecoration: BoxDecoration(
                color: theme.inComingChatBubbleColor,
                boxShadow: [
                  BoxShadow(
                    color: isDarkTheme ? Colors.black12 : Colors.grey.shade200,
                    offset: const Offset(0, 20),
                    blurRadius: 40,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          imageMessageConfig: ImageMessageConfiguration(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            shareIconConfig: ShareIconConfiguration(
              defaultIconBackgroundColor: theme.shareIconBackgroundColor,
              defaultIconColor: theme.shareIconColor,
            ),
          ),
        ),
        profileCircleConfig: const ProfileCircleConfiguration(
          profileImageUrl: Data.profileImage,
        ),
        repliedMessageConfig: RepliedMessageConfiguration(
          backgroundColor: theme.repliedMessageColor,
          verticalBarColor: theme.verticalBarColor,
          repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
            enableHighlightRepliedMsg: true,
            highlightColor: AppColors.orangeHint,
            highlightScale: 1.1,
          ),
          textStyle: const TextStyle(
            color: AppColors.black2,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.25,
          ),
          replyTitleTextStyle: TextStyle(color: theme.repliedTitleTextColor),
        ),
        swipeToReplyConfig: SwipeToReplyConfiguration(
          animationDuration: Duration(milliseconds: 300),
          replyIconColor: theme.swipeToReplyIconColor,
        ),
      ),
    );
  }

  void _onSendTap(
      String message,
      ReplyMessage replyMessage,
      MessageType messageType,
      ) {
    final id = int.parse(Data.messageList.last.id) + 1;
    _chatController.addMessage(
      Message(
        id: id.toString(),
        createdAt: DateTime.now(),
        message: message,
        sendBy: currentUser.id,
        replyMessage: replyMessage,
        messageType: messageType,
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      _chatController.initialMessageList.last.setStatus =
          MessageStatus.undelivered;
    });
    Future.delayed(const Duration(seconds: 1), () {
      _chatController.initialMessageList.last.setStatus = MessageStatus.read;
    });
  }

  void _onThemeIconTap() {
    setState(() {
      if (isDarkTheme) {
        theme = LightTheme();
        isDarkTheme = false;
      } else {
        theme = DarkTheme();
        isDarkTheme = true;
      }
    });
  }
}


class User_s {
  const User_s(this.userId, this.username) ;
  final String userId;
  final String username;
}

List<User_s> myUserList = [
  User_s('2', 'Anaelle'),
  User_s('3', 'Eliot'),
  User_s('4', 'Kate'),
  User_s('5', 'Hanane'),
  User_s('6', 'Juinor'),
  User_s('6', 'Audrey'),
  User_s('6', 'Marc'),
  User_s('6', 'Papa'),
  User_s('6', 'Maman'),
];