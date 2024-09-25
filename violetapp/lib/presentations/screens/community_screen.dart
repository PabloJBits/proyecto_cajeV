import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class UserComment {
  final String username;
  final String comment;
  
  UserComment({required this.username, required this.comment});
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<UserComment> comments = [
    UserComment(username: "Rosa12", comment: "Me siento mucho mejor desde que empecé a hablar sobre mis problemas."),
    UserComment(username: "Maria23", comment: "La terapia realmente me ha ayudado a enfrentar mis miedos."),
    UserComment(username: "MGraci@3", comment: "A veces solo necesitas a alguien que te escuche."),
    UserComment(username: "Andre4", comment: "Recuerda que no estás solo en esto <3."),
  ];

  final TextEditingController _controller = TextEditingController();

  void _addComment() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        comments.add(UserComment(username: "Usuario${comments.length + 1}", comment: _controller.text));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Módulo de Comunidad'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.purple,
                            child: Icon(Icons.person, size: 24, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comments[index].username,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  comments[index].comment,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Escribe tu opinión...',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => _addComment(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addComment,
              child: Text('Agregar Comentario'),
            ),
          ],
        ),
      ),
    );
  }
}
