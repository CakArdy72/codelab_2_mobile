import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models/welcome_model.dart';
import 'webview_page.dart';  // Import WebViewPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Welcome> apiData;

  @override
  void initState() {
    super.initState();
    apiData = ApiService().fetchData();  // Panggil API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Data')),
      body: FutureBuilder<Welcome>(
        future: apiData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());  // Loading spinner
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));  // Error handling
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder: (context, index) {
                final article = data.articles[index];
                return ListTile(
                  title: Text(article.title),  // Menampilkan judul artikel
                  subtitle: Text(article.description),  // Menampilkan deskripsi
                  leading: Image.network(article.urlToImage),  // Menampilkan gambar dari URL
                  onTap: () {
                    // Arahkan ke WebViewPage saat artikel diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(url: 'https://aws.amazon.com/id/what-is/java/'),  // Kirim URL dari artikel ke WebViewPage
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
