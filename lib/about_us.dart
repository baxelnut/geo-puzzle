// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geopuzzle/variables.dart';

class About_Us extends StatelessWidget {
  const About_Us({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: const ABC_Group(),
    );
  }
}

BoxDecoration _darkBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover));
BoxDecoration _lightBackground = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/bg2.png"), fit: BoxFit.cover));

TextStyle _darkFontBody = const TextStyle(color: Colors.white, fontSize: 16);
TextStyle _lightFontBody = const TextStyle(
    color: Colors.white,
    // foreground: Paint()
    //   ..shader = ui.Gradient.linear(
    //     const Offset(0, 20),
    //     const Offset(150, 20),
    //     <Color>[
    //       Colors.indigoAccent,
    //       Colors.white,
    //     ],
    //   ),
    fontSize: 16);

TextStyle _darkFontHeader = const TextStyle(color: Colors.white, fontSize: 23);
TextStyle _lightFontHeader = const TextStyle(
    color: Colors.white,
    // foreground: Paint()
    //   ..shader = ui.Gradient.linear(
    //     const Offset(0, 20),
    //     const Offset(150, 20),
    //     <Color>[
    //       Colors.indigoAccent,
    //       Colors.white,
    //     ],
    //   ),
    fontSize: 23);

class ABC_Group extends StatefulWidget {
  const ABC_Group({super.key});

  @override
  State<ABC_Group> createState() => _ABC_GroupState();
}

class _ABC_GroupState extends State<ABC_Group> {
  List<String> gambar = [
    "assets/images/akas.png",
    "assets/images/calvin.png",
    "assets/images/basil.png",
  ];

  List<String> nama = [
    "Satria Pamungkas",
    "Calvin Immanuel Siringoringo",
    "Basilius Tengang",
  ];

  List<String> nim = [
    "082111633027",
    "082111633037",
    "082111633068",
  ];

  Color tidakcolorful = const Color.fromARGB(196, 30, 39, 66);
  Color colorfulBGTZ = const Color.fromRGBO(137, 56, 252, 100);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
        home: Scaffold(
          backgroundColor: statusSwitchMode ? tidakcolorful : colorfulBGTZ,
          appBar: AppBar(
            title: const Text("About Us"),
            backgroundColor: const Color.fromARGB(37, 255, 255, 255),
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 25),
            decoration: statusSwitchMode ? _darkBackground : _lightBackground,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return indetitas(
                  foto: gambar[index],
                  nama: nama[index],
                  nim: nim[index],
                );
              },
            ),
          ),
        ));
  }
}

class indetitas extends StatefulWidget {
  final String foto;
  final String nama;
  final String nim;

  const indetitas(
      {super.key, required this.foto, required this.nama, required this.nim});

  @override
  State<indetitas> createState() => _indetitasState();
}

class _indetitasState extends State<indetitas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 25,
      ),
      child: Column(
        children: [
          SizedBox.fromSize(
            size: const Size.fromHeight(140),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color.fromARGB(21, 255, 255, 255),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                title: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    widget.nama,
                    style:
                        statusSwitchMode ? _darkFontHeader : _lightFontHeader,
                    textAlign: TextAlign.center,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.nim,
                    style: statusSwitchMode ? _darkFontBody : _lightFontBody,
                    textAlign: TextAlign.center,
                  ),
                ),
                trailing: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(widget.foto),
                  backgroundColor: Colors.transparent,
                  child: GestureDetector(onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (_) => Dialog(
                              child: Container(
                                color: Colors.black,
                                child: Image(
                                  image: AssetImage(widget.foto),
                                ),
                              ),
                            ));
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
