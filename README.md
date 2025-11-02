📝 README.md
🧾 To-Do List App (Provider Version)

Aplikasi Flutter sederhana untuk mencatat daftar kegiatan harian dengan state management menggunakan Provider.
Dibuat untuk memenuhi Tugas Minggu 07 mata kuliah Pemrograman Mobile.


👨‍💻 Identitas
Muhammad Syafir	 NIM 231012002


🎯 Tujuan Tugas
Membuat aplikasi Flutter dengan fitur:
Input teks untuk menambah data.
Menampilkan data di bawah input dalam bentuk list.
Menggunakan Provider untuk mengelola state (tanpa setState()).
Saat tombol tambah ditekan, data langsung muncul di list (data binding aktif).


⚙️ Teknologi yang Digunakan
Flutter SDK 3.35.6
Dart 3.9+
Provider Package 6.1.2
Visual Studio Code
Chrome / Edge Browser (untuk testing aplikasi)


🧩 Struktur Project
lib/
 ├─ main.dart
 ├─ providers/
 │    └─ todo_provider.dart
 └─ screens/
      └─ todo_screen.dart


🧠 Penjelasan Singkat Logika Aplikasi
Aplikasi menggunakan Provider sebagai pengganti setState() untuk mengatur data.
Alurnya seperti ini:
TodoProvider menyimpan daftar kegiatan (List<String>).
Saat pengguna mengetik dan menekan tombol Tambah, fungsi addTodo() dijalankan.
Fungsi tersebut memanggil notifyListeners(), memberi tahu widget bahwa data berubah.
UI (ListView) otomatis rebuild tanpa harus memanggil setState().
Dengan cara ini, aplikasi tetap ringan, efisien, dan mudah dikembangkan ke fitur lain seperti penyimpanan data atau kategori.

📱 Fitur Utama
➕ Tambah kegiatan dengan TextField + tombol Tambah.
📋 Daftar kegiatan ditampilkan secara otomatis di bawah input.
🗑️ Hapus item dengan tombol Delete atau gesture swipe.
🧠 Data binding aktif (UI otomatis update saat data berubah).
🎨 Tampilan rapi dengan Card & Material Design.
💡 Contoh Screenshot
Tampilan Input	Tampilan Daftar
(Ganti dengan screenshot kamu sendiri dari hasil run di browser/emulator.)


🚀 Cara Menjalankan Aplikasi
Pastikan Flutter sudah terinstall dan environment sudah diset.

Clone repo ini:
git clone https://github.com/syaafiir/todo_provider_app.git

Masuk ke folder project:
cd todo_provider_app

Install dependency:
flutter pub get

Jalankan aplikasi:
flutter run -d chrome
(atau ganti chrome dengan emulator/Edge)


📚 Konsep yang Dipelajari
State management dengan ChangeNotifierProvider
Penggunaan notifyListeners()
Data binding antara provider dan widget
Struktur file modular (providers & screens)
UI Flutter dengan ListView, Card, dan TextField


🧩 Kesimpulan
Aplikasi ini menunjukkan bagaimana state management Provider dapat menggantikan setState() untuk membuat aplikasi yang lebih efisien, reaktif, dan terstruktur.
Konsep ini juga menjadi dasar untuk pengembangan aplikasi Flutter berskala besar di industri IT modern.