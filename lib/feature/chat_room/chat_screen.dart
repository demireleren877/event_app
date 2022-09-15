import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/components/centered_progress.dart';
import 'components/input_field.dart';
import 'components/message_card.dart';
import 'viewmodel/chat_viewmodel.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key,
      required this.currentLecture,
      required this.currentUser,
      required this.stream,
      required this.messagePath,
      this.dmPath,
      required this.isDM,
      required this.lmPath,
      this.lmdPath})
      : super(key: key);
  final String? currentLecture;
  final String? currentUser;
  final Stream stream;
  final dynamic messagePath;
  final dynamic dmPath;
  final bool isDM;
  final dynamic lmPath;
  final dynamic lmdPath;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatVM _chatVM = ChatVM();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  Column _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: StreamBuilder(
            stream: widget.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              widget.isDM ? _chatVM.seeMsg(widget.currentLecture ?? "") : null;
              return !snapshot.hasData
                  ? const CenteredProgressIndicator()
                  : snapshot.data == null
                      ? const CenteredProgressIndicator()
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount: snapshot.data.docs.length,
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          itemBuilder: (context, index) {
                            return MessageCard(
                              index: index,
                              snapshot: snapshot,
                              isMe: _chatVM.isByMe(snapshot, index),
                            );
                          },
                        );
            },
          ),
        ),
        InputField(
          context: context,
          messageController: _messageController,
          chatVM: _chatVM,
          scrollController: _scrollController,
          widget: widget,
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        widget.currentLecture.toString(),
      ),
    );
  }
}
