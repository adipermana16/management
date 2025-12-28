import 'package:flutter/material.dart';
import 'quiz_page.dart'; // Import the quiz page

class QuizResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Kuis"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Informasi Kuis
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Silakan kerjakan kuis ini dalam waktu 15 menit\n"
                      "Sebagai nilai pertama komponen kuis\n"
                      "Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.\n\n"
                      "Kerjakan sebelum hari Jumat, 26 Februari 2021 jam 23:59 WIB",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 12),
                    Divider(),
                    Text("Kuis akan ditutup pada Jumat, 26 Februari 2021, 11:59 PM"),
                    Text("Batas Waktu: 15 menit"),
                    Text("Metode Penilaian: Nilai Tertinggi"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Percobaan
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Percobaan Yang Sudah Dilakukan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Selesai", style: TextStyle(color: Colors.white)),
                  Text("85.0 / 100.00",
                      style: TextStyle(color: Colors.white)),
                  Text("Lihat",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Nilai Akhir
            const Text(
              "Nilai Akhir Anda Untuk Kuis Ini Adalah 85.0 / 100.00",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            // Tombol
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the quiz page when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                child: const Text("Ambil Kuis"),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the class page
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                child: const Text("Kembali Ke Kelas"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}