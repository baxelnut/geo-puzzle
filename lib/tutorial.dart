// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geopuzzle/variables.dart';

class learnPage1 extends StatelessWidget {
  const learnPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: const learnPage1(),
    );
  }
}

BoxDecoration _darkBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitHeight));
BoxDecoration _lightBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg2.png"), fit: BoxFit.fitHeight));

TextStyle _darkFont = const TextStyle(
  color: Colors.white,
  // foreground: Paint()
  //   ..shader = ui.Gradient.linear(
  //     const Offset(0, 20),
  //     const Offset(150, 20),
  //     <Color>[
  //       Colors.indigoAccent,
  //       Colors.white,
  //     ],
  //   )
);
TextStyle _lightFont = const TextStyle(color: Colors.white);
Color tidakcolorful = const Color.fromARGB(196, 30, 39, 66);
Color colorfulBGTZ = const Color.fromRGBO(137, 56, 252, 100);

class learnPage extends StatefulWidget {
  const learnPage({super.key});

  @override
  State<learnPage> createState() => _learnPageState();
}

class _learnPageState extends State<learnPage> {
  List<String> piecePicLin = [
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRFtPoC2-1tVcmsKrZ_-fMCWIw45DRWR_HxjCGoAbdNrw37cErr",
    "https://static.wikia.nocookie.net/taylor-swift/images/7/73/Future.jpeg/revision/latest?cb=20230120045457",
    "https://semarak.news/wp-content/uploads/2022/11/1667450857_Rapper-Future-telah-membeli-sebuah-rumah-mewah-senilai-163-juta.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD_fDuMyuRm0kIt8hZbSy1NpDzHwewTT4xkw&usqp=CAU",
  ];

  List<String> piecePicCur = [
    "https://a57.foxnews.com/static.foxnews.com/foxnews.com/content/uploads/2019/05/1200/675/future-getty.jpg?ve=1&tl=1",
    "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2020%2F05%2F18%2FDSC00408.jpg&q=60",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM31tRURkDGmhir1RzskDo9lMbe6xFsWnkhw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmOUxHgc8qrKA_IoweKRTxOiP9VoNnoqdp8yalKoimGEdV3JQWxPfbdCoCwk6CxPfV0Ds&usqp=CAU",
  ];

  List<String> piecePicCir = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1pV_Xuj5a0fTNe2qoootdJky85tXA0lffoQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ37dXfLzNJNqKa-v3_SzoWm1tweRUJgftbtw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZFRXn2oiVg7tPC1Usa4sMDl5eQU7wqRPO9A&usqp=CAU",
    "data:image/jpeg;base64,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",
  ];

  List<String> pieceNameLin = [
    "Basic",
    "Solve",
    "Combine",
    "Study and Grinding"
  ];
  List<String> pieceNameCur = [
    "Basic",
    "Solve",
    "Combine",
    "Study and Grinding"
  ];
  List<String> pieceNameCir = [
    "Basic",
    "Solve",
    "Combine",
    "Study and Grinding"
  ];

  List<String> pieceDescLin = [
    "Level dimana membuat persamaan garis lurus untuk menghubungkan kedua titik. Namun persamaan garis lurus tersebut tidak boleh mengenai rintangan dan halangan yang ada.",
    "1. Perhatikan titik yang harus dituju dan rintangan"
        "\n2. Buat persamaan dalam kotak jawaban"
        "\n3. Persamaannya harus dalam bentuk y=mx+c"
        "\n4. Kemudian klik tombol send"
        "\n5. Bila jawaban benar, maka tombol send akan berubah warna menjadi hijau"
        "\n6. Jika ingin lanjut ke level selanjutnya, klik tombol send yang sudah berubah warna menjadi hijau",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquam convallis fringilla. Vestibulum et ligula convallis, tempor nisi sed, vehicula nisi. Aliquam non velit vitae odio semper facilisis. Donec imperdiet placerat imperdiet. Curabitur egestas metus pulvinar malesuada bibendum. Donec aliquet purus ac enim euismod posuere. Ut ac facilisis nisi, vel ultrices dui. Donec sodales eu purus vel tempus. Maecenas pretium ipsum ac quam scelerisque sollicitudin. Phasellus accumsan suscipit erat convallis vehicula. Nam ac eros fermentum mauris vulputate semper ac facilisis libero. Donec faucibus orci id mi blandit, ac cursus odio dapibus. Morbi finibus, nibh et laoreet commodo, ligula turpis pharetra nulla, ut interdum enim mi ultrices mauris. Mauris gravida dapibus lacus, quis dictum elit venenatis ut",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquam convallis fringilla. Vestibulum et ligula convallis, tempor nisi sed, vehicula nisi. Aliquam non velit vitae odio semper facilisis. Donec imperdiet placerat imperdiet. Curabitur egestas metus pulvinar malesuada bibendum. Donec aliquet purus ac enim euismod posuere. Ut ac facilisis nisi, vel ultrices dui. Donec sodales eu purus vel tempus. Maecenas pretium ipsum ac quam scelerisque sollicitudin. Phasellus accumsan suscipit erat convallis vehicula. Nam ac eros fermentum mauris vulputate semper ac facilisis libero. Donec faucibus orci id mi blandit, ac cursus odio dapibus. Morbi finibus, nibh et laoreet commodo, ligula turpis pharetra nulla, ut interdum enim mi ultrices mauris. Mauris gravida dapibus lacus, quis dictum elit venenatis ut",
  ];
  List<String> pieceDescCur = [
    "Level dimana membuat persamaan yang menghasil garis lengkung untuk mengenai titik yang ada di level itu. Namun level curve ini tidak boleh menggunakan rumus y=mx+c dan tidak boleh mengenai rintangan dan halangan yang ada.",
    "1. Perhatikan titik yang harus dituju dan rintangan"
        "\n2. Buat persamaan dalam kotak jawaban"
        "\n3. Persamaannya akan gagal bila dalam bentuk y=mx+c"
        "\n4. Kemudian klik tombol send"
        "\n5. Bila jawaban benar, maka tombol send akan berubah warna menjadi hijau"
        "\n6. Jika ingin lanjut ke level selanjutnya, klik tombol send yang sudah berubah warna menjadi hijau",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquam convallis fringilla. Vestibulum et ligula convallis, tempor nisi sed, vehicula nisi. Aliquam non velit vitae odio semper facilisis. Donec imperdiet placerat imperdiet. Curabitur egestas metus pulvinar malesuada bibendum. Donec aliquet purus ac enim euismod posuere. Ut ac facilisis nisi, vel ultrices dui. Donec sodales eu purus vel tempus. Maecenas pretium ipsum ac quam scelerisque sollicitudin. Phasellus accumsan suscipit erat convallis vehicula. Nam ac eros fermentum mauris vulputate semper ac facilisis libero. Donec faucibus orci id mi blandit, ac cursus odio dapibus. Morbi finibus, nibh et laoreet commodo, ligula turpis pharetra nulla, ut interdum enim mi ultrices mauris. Mauris gravida dapibus lacus, quis dictum elit venenatis ut",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquam convallis fringilla. Vestibulum et ligula convallis, tempor nisi sed, vehicula nisi. Aliquam non velit vitae odio semper facilisis. Donec imperdiet placerat imperdiet. Curabitur egestas metus pulvinar malesuada bibendum. Donec aliquet purus ac enim euismod posuere. Ut ac facilisis nisi, vel ultrices dui. Donec sodales eu purus vel tempus. Maecenas pretium ipsum ac quam scelerisque sollicitudin. Phasellus accumsan suscipit erat convallis vehicula. Nam ac eros fermentum mauris vulputate semper ac facilisis libero. Donec faucibus orci id mi blandit, ac cursus odio dapibus. Morbi finibus, nibh et laoreet commodo, ligula turpis pharetra nulla, ut interdum enim mi ultrices mauris. Mauris gravida dapibus lacus, quis dictum elit venenatis ut",
  ];
  List<String> pieceDescCir = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquam convallis fringilla. Vestibulum et ligula convallis, tempor nisi sed, vehicula nisi. Aliquam non velit vitae odio semper facilisis. Donec imperdiet placerat imperdiet. Curabitur egestas metus pulvinar malesuada bibendum. Donec aliquet purus ac enim euismod posuere. Ut ac facilisis nisi, vel ultrices dui. Donec sodales eu purus vel tempus. Maecenas pretium ipsum ac quam scelerisque sollicitudin. Phasellus accumsan suscipit erat convallis vehicula. Nam ac eros fermentum mauris vulputate semper ac facilisis libero. Donec faucibus orci id mi blandit, ac cursus odio dapibus. Morbi finibus, nibh et laoreet commodo, ligula turpis pharetra nulla, ut interdum enim mi ultrices mauris. Mauris gravida dapibus lacus, quis dictum elit venenatis ut",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquam convallis fringilla. Vestibulum et ligula convallis, tempor nisi sed, vehicula nisi. Aliquam non velit vitae odio semper facilisis. Donec imperdiet placerat imperdiet. Curabitur egestas metus pulvinar malesuada bibendum. Donec aliquet purus ac enim euismod posuere. Ut ac facilisis nisi, vel ultrices dui. Donec sodales eu purus vel tempus. Maecenas pretium ipsum ac quam scelerisque sollicitudin. Phasellus accumsan suscipit erat convallis vehicula. Nam ac eros fermentum mauris vulputate semper ac facilisis libero. Donec faucibus orci id mi blandit, ac cursus odio dapibus. Morbi finibus, nibh et laoreet commodo, ligula turpis pharetra nulla, ut interdum enim mi ultrices mauris. Mauris gravida dapibus lacus, quis dictum elit venenatis ut",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquam convallis fringilla. Vestibulum et ligula convallis, tempor nisi sed, vehicula nisi. Aliquam non velit vitae odio semper facilisis. Donec imperdiet placerat imperdiet. Curabitur egestas metus pulvinar malesuada bibendum. Donec aliquet purus ac enim euismod posuere. Ut ac facilisis nisi, vel ultrices dui. Donec sodales eu purus vel tempus. Maecenas pretium ipsum ac quam scelerisque sollicitudin. Phasellus accumsan suscipit erat convallis vehicula. Nam ac eros fermentum mauris vulputate semper ac facilisis libero. Donec faucibus orci id mi blandit, ac cursus odio dapibus. Morbi finibus, nibh et laoreet commodo, ligula turpis pharetra nulla, ut interdum enim mi ultrices mauris. Mauris gravida dapibus lacus, quis dictum elit venenatis ut",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquam convallis fringilla. Vestibulum et ligula convallis, tempor nisi sed, vehicula nisi. Aliquam non velit vitae odio semper facilisis. Donec imperdiet placerat imperdiet. Curabitur egestas metus pulvinar malesuada bibendum. Donec aliquet purus ac enim euismod posuere. Ut ac facilisis nisi, vel ultrices dui. Donec sodales eu purus vel tempus. Maecenas pretium ipsum ac quam scelerisque sollicitudin. Phasellus accumsan suscipit erat convallis vehicula. Nam ac eros fermentum mauris vulputate semper ac facilisis libero. Donec faucibus orci id mi blandit, ac cursus odio dapibus. Morbi finibus, nibh et laoreet commodo, ligula turpis pharetra nulla, ut interdum enim mi ultrices mauris. Mauris gravida dapibus lacus, quis dictum elit venenatis ut",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: statusSwitchMode ? tidakcolorful : colorfulBGTZ,
            appBar: AppBar(
              leading: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              bottom: const TabBar(indicatorColor: Colors.white, tabs: [
                Tab(
                  text: "Linear",
                  icon: Icon(Icons.straight_outlined),
                ),
                Tab(
                  text: "Curve",
                  icon: Icon(Icons.swap_calls_outlined),
                ),
                Tab(
                  text: "Circular",
                  icon: Icon(Icons.refresh_outlined),
                ),
              ]),
              title: const Text("Tutorial"),
              backgroundColor: const Color.fromARGB(37, 255, 255, 255),
            ),
            body: TabBarView(children: [
              Container(
                decoration:
                    statusSwitchMode ? _darkBackground : _lightBackground,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.white,
                    );
                  },
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return pieceList(
                      imageURL: piecePicLin[index],
                      title: pieceNameLin[index],
                      subtitle: pieceDescLin[index],
                    );
                  },
                ),
              ),
              Container(
                decoration:
                    statusSwitchMode ? _darkBackground : _lightBackground,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.white,
                    );
                  },
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return pieceList(
                      imageURL: piecePicCur[index],
                      title: pieceNameCur[index],
                      subtitle: pieceDescCur[index],
                    );
                  },
                ),
              ),
              Container(
                decoration:
                    statusSwitchMode ? _darkBackground : _lightBackground,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.white,
                    );
                  },
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return pieceList(
                      imageURL: piecePicCir[index],
                      title: pieceNameCir[index],
                      subtitle: pieceDescCir[index],
                    );
                  },
                ),
              ),
            ]),
          ),
        ));
  }
}

class pieceList extends StatefulWidget {
  final String imageURL;
  final String title;
  final String subtitle;

  const pieceList({
    super.key,
    required this.imageURL,
    required this.subtitle,
    required this.title,
  });

  @override
  State<pieceList> createState() => _pieceListState();
}

class _pieceListState extends State<pieceList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(196, 30, 39, 66),
          backgroundImage: NetworkImage(widget.imageURL)),
      title: Text(
        widget.title,
        style: statusSwitchMode ? _lightFont : _darkFont,
      ),
      subtitle: Text(
        widget.subtitle,
        style: statusSwitchMode ? _lightFont : _darkFont,
      ),
      trailing: TextButton(
        onPressed: null,
        child: Text(
          "more",
          style: statusSwitchMode ? _lightFont : _darkFont,
        ),
      ),
    );
  }
}
