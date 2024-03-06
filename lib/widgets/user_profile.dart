import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, 'Избранное'),
    MenuRowData(Icons.call, 'Звонки'),
    MenuRowData(Icons.computer, 'Устроиство'),
    MenuRowData(Icons.folder, 'Папка с чатами'),
  ];

  List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Уведомление и звуки'),
    MenuRowData(Icons.privacy_tip, 'Конфеденциальность'),
    MenuRowData(Icons.date_range, 'Данные и память'),
    MenuRowData(Icons.brush, 'Оформление '),
    MenuRowData(Icons.language, 'Язык '),
  ];

  List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.lock_clock, 'Apple Watch'),
  ];

  List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.help, 'Помощь'),
    MenuRowData(Icons.question_answer, 'Вопросы о Telegram'),
  ];

  UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Настроики',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            _UserInfo(),
            SizedBox(height: 20),
            _MenuWidget(menuRow: firstMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: secondMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: thirdMenuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: fourthMenuRow),
          ],
        ),
      ),
    );
  }
}

//menu row data
class MenuRowData {
  final IconData iconD;
  final String text;

  MenuRowData(this.iconD, this.text);
}

//menu block
class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;

  const _MenuWidget({Key? key, required this.menuRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

//menu widget row
class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(data.iconD),
          const SizedBox(width: 15),
          Expanded(child: Text(data.text)),
          const Icon(Icons.chevron_right_sharp),
        ],
      ),
    );
  }
}

//user info
class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          child: const Column(
            children: [
              SizedBox(height: 20),
              _AvatarWidget(),
              SizedBox(height: 20),
              _NameWidget(),
              SizedBox(height: 10),
              _PhoneWidget(),
              SizedBox(height: 10),
              _NickWidget(),
            ],
          ),
        ),
        const Positioned(
          top: 25.0,
          right: 25.0,
          child: Text('Изм.', style: TextStyle(color: Colors.blue, fontSize: 17),),
        ),
      ],
    );
  }
}

//nick
class _NickWidget extends StatelessWidget {
  const _NickWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '@argin',
      style: TextStyle(color: Colors.grey, fontSize: 17),
    );
  }
}

//phone
class _PhoneWidget extends StatelessWidget {
  const _PhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '+7 777 777 7777',
      style: TextStyle(color: Colors.grey, fontSize: 15),
    );
  }
}

//name
class _NameWidget extends StatelessWidget {
  const _NameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Arman <2a.k> Abdullin',
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

//avatar
class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Placeholder(),
    );
  }
}
