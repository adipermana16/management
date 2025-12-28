import 'package:flutter/material.dart';
import 'review_page.dart'; // Import the review page

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  
  // Sample questions data - you can expand this with more questions
  final List<Map<String, dynamic>> questions = [
    {
      "question": "Dalam perancangan web yang baik, untuk teks yang menampilkan isi konten digunakan font sebagai berikut?",
      "options": [
        "Loop",
        "Branch",
        "Selection",
        "Riwayat Pendidikan",
        "Umur",
      ]
    },
    {
      "question": "Apa fungsi dari UI Design dalam pengembangan aplikasi?",
      "options": [
        "Membangun logika aplikasi",
        "Membuat tampilan antarmuka",
        "Mengelola database",
        "Mengatur server",
        "Mengembangkan algoritma"
      ]
    },
    {
      "question": "Apa yang dimaksud dengan UX Design?",
      "options": [
        "User Experience Design",
        "User Execution Design",
        "User Excellence Design",
        "User Expression Design",
        "User Expansion Design"
      ]
    },
    {
      "question": "Apa yang menjadi fokus utama dalam UI Design?",
      "options": [
        "Fungsionalitas aplikasi",
        "Tampilan visual dan interaksi",
        "Performa aplikasi",
        "Keamanan data",
        "Manajemen server"
      ]
    },
    {
      "question": "Apa manfaat dari membuat wireframe dalam proses desain?",
      "options": [
        "Mengurangi biaya pengembangan",
        "Menentukan warna aplikasi",
        "Merancang struktur dan tata letak",
        "Mengatur animasi aplikasi",
        "Menyimpan data pengguna"
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text("Quiz Review ${currentQuestionIndex + 1}"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(Icons.timer, size: 18, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  "10:00", 
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// PROGRESS SOAL - showing progress indicators
            Row(
              children: List.generate(questions.length, (index) {
                return Container(
                  margin: const EdgeInsets.only(right: 6),
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index <= currentQuestionIndex ? Colors.green : Colors.grey[300],
                  ),
                );
              }),
            ),

            const SizedBox(height: 16),

            Text(
              "Soal Nomor ${currentQuestionIndex + 1} / ${questions.length}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(
              questions[currentQuestionIndex]["question"],
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 16),

            /// PILIHAN JAWABAN
            ...questions[currentQuestionIndex]["options"].map<Widget>((option) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: selectedAnswer == option
                      ? Colors.red[300]
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RadioListTile<String>(
                  value: option,
                  groupValue: selectedAnswer,
                  title: Text(option),
                  onChanged: (value) {
                    setState(() {
                      selectedAnswer = value;
                    });
                  },
                ),
              );
            }).toList(),

            const Spacer(),

            /// TOMBOL NEXT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous button only appears if not on first question
                if (currentQuestionIndex > 0)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex--;
                        selectedAnswer = null; // Reset selection for previous question
                      });
                    },
                    child: const Text("← Soal Sebelumnya"),
                  ),
                
                // Next/Submit button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnswer != null ? Colors.green : Colors.grey[400],
                  ),
                  onPressed: selectedAnswer == null ? null : () {
                    if (currentQuestionIndex < questions.length - 1) {
                      // Move to next question
                      setState(() {
                        currentQuestionIndex++;
                        selectedAnswer = null; // Reset selection for next question
                      });
                    } else {
                      // All questions completed, navigate to review page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewPage(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    currentQuestionIndex < questions.length - 1 
                      ? "Soal Selanjutnya →" 
                      : "Submit",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}