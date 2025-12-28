import 'package:flutter/material.dart';

class QuizResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Hasil Kuis"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Score Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Score Circle
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green[100],
                        border: Border.all(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "85",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const Text(
                              "/100",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Nilai Anda",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Bagus! Jawaban Anda benar sebanyak 17 dari 20 soal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Question Review Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Review Jawaban",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Questions Review List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5, // Number of questions
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                // Sample data for question review
                final List<Map<String, dynamic>> questions = [
                  {
                    "question": "Radio button dapat digunakan untuk menentukan ?",
                    "userAnswer": "Jenis Kelamin",
                    "correctAnswer": "Jenis Kelamin",
                    "isCorrect": true,
                  },
                  {
                    "question": "Apa fungsi dari checkbox dalam form?",
                    "userAnswer": "Memilih beberapa pilihan",
                    "correctAnswer": "Memilih beberapa pilihan",
                    "isCorrect": true,
                  },
                  {
                    "question": "Apa yang dimaksud dengan UI Design?",
                    "userAnswer": "User Implementation Design",
                    "correctAnswer": "User Interface Design",
                    "isCorrect": false,
                  },
                  {
                    "question": "Apa yang dimaksud dengan UX Design?",
                    "userAnswer": "User Experience Design",
                    "correctAnswer": "User Experience Design",
                    "isCorrect": true,
                  },
                  {
                    "question": "Apa fungsi dari wireframe dalam UI/UX?",
                    "userAnswer": "Merancang struktur dan tata letak",
                    "correctAnswer": "Merancang struktur dan tata letak",
                    "isCorrect": true,
                  },
                ];

                final Map<String, dynamic> question = questions[index];
                final bool isCorrect = question["isCorrect"];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: isCorrect ? Colors.green : Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isCorrect ? Icons.check : Icons.close,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Soal ${index + 1}: ${question["question"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isCorrect ? Colors.green[50] : Colors.red[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jawaban Anda: ${question["userAnswer"]}",
                                style: TextStyle(
                                  color: isCorrect ? Colors.green[700] : Colors.red[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (!isCorrect) ...[
                                const SizedBox(height: 4),
                                Text(
                                  "Jawaban Benar: ${question["correctAnswer"]}",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Buttons
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

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Restart the quiz
                  Navigator.pop(context);
                  // In a real app, you would navigate to the quiz page again
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  foregroundColor: Colors.black,
                ),
                child: const Text("Ulangi Kuis"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}