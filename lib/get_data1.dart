import 'package:flutter/material.dart';
import 'api_service.dart';

class Test extends StatelessWidget {
  const Test({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Doank')),
      body: const Card(
        child: PostList(),
      ),
    );
  }
}

class PostList extends StatefulWidget {
  const PostList({Key? key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late Future<List<dynamic>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = ServisAPI().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return Card(
                child: ListTile(
                  leading: Image.network(item['thumbnailUrl']),
                  title: Text(item['title']),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return const Center(
            child: CircularProgressIndicator(color: Colors.black));
      },
    );
  }
}
