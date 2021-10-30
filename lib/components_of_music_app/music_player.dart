import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/components_of_music_app/custom_list_tile.dart';
import 'package:myapp2/components_of_music_app/stream.dart';

class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  List musicList = [
    {
      'title': 'Tech House Vibes',
      'singer': 'Alejandro Magana',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-hazy-after-hours-132.mp3',
      'coverUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwPtJZE421feStlyWrdqHACq2XPXff7pTPwg&usqp=CAU',
    },
    {
      'title': 'Hazy After Hours',
      'singer': 'Alejandro Magaña',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-hazy-after-hours-132.mp3',
      'coverUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJAgM68eQCpvD_y6kYZL_yJt868Stc43jz2w&usqp=CAU',
    },
    {
      'title': 'Hip Hop 02',
      'singer': 'Lily J',
      'url': 'https://assets.mixkit.co/music/preview/mixkit-hip-hop-02-738.mp3',
      'coverUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5i5k_GtsD8z9bGSU73a_vzHpKa2LyMdrbgA&usqp=CAU',
    },
    {
      'title': 'Dance with Me',
      'singer': 'Ahjay Stelino',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-dance-with-me-3.mp3',
      'coverUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-A7QfDonKzG8TXQmYftwrqId-4mD3_Tu7Nw&usqp=CAU',
    },
    {
      'title': 'Life is a Dream',
      'singer': 'Michael Ramir C.',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3',
      'coverUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk9IMcNjbHiC2Jpzyv1lMQHvBAZRA7hIs4hw&usqp=CAU',
    },
    {
      'title': 'Driving Ambition',
      'singer': 'Ahjay Stelino',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-driving-ambition-32.mp3',
      'coverUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFiWtc98BlLxg9vNHKhc-Tn0uyjLXelBF8jw&usqp=CAU',
    },
    {
      'title': 'Raising Me Higher',
      'singer': 'Ahjay Stelino',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-raising-me-higher-34.mp3',
      'coverUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx0s-4XsVQgSReyED-7fs43kS3vWIp8tLCgQ&usqp=CAU',
    },
    {
      'title': 'Sun and His Daughter',
      'singer': 'Eugenio Mininni',
      'url':
          'https://assets.mixkit.co/music/preview/mixkit-sun-and-his-daughter-580.mp3',
      'coverUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWOE-NHX_d7W0tna7Y_f9IUlnM_hL52Ci0dw&usqp=CAU',
    },
  ];
  String currentTitle = '';
  String currentCover = '';
  String currentSinger = '';
  IconData btnIcon = Icons.pause;

  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = '';

  Duration duration = const Duration();
  Duration position = const Duration();

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  Color? bgColor;
  late ColorStream colorStream;

  @override
  void initState() {
    colorStream = ColorStream();
    changeColor();
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   audioPlayer.pause();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'My Playlist',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(audioPlayer.pause()),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: musicList.length,
              itemBuilder: (context, index) => customListTile(
                onTap: () {
                  playMusic(musicList[index]['url']);
                  setState(() {
                    currentTitle = musicList[index]['title'];
                    currentCover = musicList[index]['coverUrl'];
                    currentSinger = musicList[index]['singer'];
                  });
                },
                title: musicList[index]['title'],
                singer: musicList[index]['singer'],
                cover: musicList[index]['coverUrl'],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.purple,
              boxShadow: [
                BoxShadow(
                  color: Color(0x55212121),
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Slider.adaptive(
                  value: position.inSeconds.toDouble(),
                  min: 0.0,
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                            image: NetworkImage(currentCover),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentTitle,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              currentSinger,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (isPlaying) {
                            audioPlayer.pause();
                            setState(() {
                              btnIcon = Icons.play_arrow;
                              isPlaying = false;
                            });
                          } else {
                            audioPlayer.resume();
                            setState(() {
                              btnIcon = Icons.pause;
                              isPlaying = true;
                            });
                          }
                        },
                        icon: Icon(btnIcon),
                        iconSize: 42.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  changeColor() async {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }
}
