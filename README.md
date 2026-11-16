## MyPortfolio Mobile

Aplikasi portofolio berbasis Flutter yang dibuat untuk memenuhi Proyek Akhir Individu pada mata kuliah Pemrograman Berbasis Platform (PBP).

Aplikasi ini menampilkan informasi identitas mahasiswa dan beberapa tombol interaktif yang merepresentasikan fitur portofolio.

Identitas Mahasiswa (Creator)

- Nama: Annisa Saskya Aulia
- NPM: 2506537915
- Kelas: PBP C

## Deskripsi Aplikasi

MyPortfolio Mobile merupakan aplikasi sederhana yang dikembangkan menggunakan Flutter. Halaman utama aplikasi menampilkan informasi NPM, nama, dan kelas mahasiswa dalam bentuk kartu informasi (InfoCard).

Aplikasi juga memiliki tiga tombol utama:

- Lihat Proyek: merepresentasikan fitur untuk melihat daftar proyek.
- Tambah Proyek: merepresentasikan fitur untuk menambahkan proyek.
- Logout: merepresentasikan tombol keluar.

Setiap tombol memiliki ikon dan warna latar yang beragam. Ketika tombol ditekan, aplikasi menampilkan pesan konfirmasi menggunakan SnackBar.

## Teknologi yang Digunakan

- Flutter
- Dart
- Material Design

## Struktur Proyek

myportofolio_mobile/
├── lib/
│   ├── main.dart
│   └── menu.dart
├── pubspec.yaml
└── README.md

- "main.dart": berisi fungsi utama untuk menjalankan aplikasi dan konfigurasi "MaterialApp".
- "menu.dart": berisi implementasi halaman utama, kartu informasi, serta tombol-tombol interaktif.

## Cara Menjalankan Aplikasi

Pastikan Flutter SDK telah terpasang dan perangkat atau emulator telah tersedia.

1. Clone repository ini. (https://github.com/annisasaskya3-art/myportofolio_mobile.git)

2. Buka direktori proyek.

3. Jalankan perintah berikut untuk mengunduh dependensi:
   
   flutter pub get

4. Jalankan aplikasi:
   
   flutter run

5. Untuk memeriksa kode menggunakan analyzer:
   
   flutter analyze

---

## Individual Assignment 7

1. Bagaimana struktur widget tree dari aplikasi ini? Jelaskan hubungan parent dan child.

Widget tree merupakan susunan hierarki widget dalam Flutter yang menunjukkan hubungan antara widget induk (parent) dan widget anak (child).

Pada aplikasi ini, struktur widget tree secara sederhana adalah:

MyApp
└── MaterialApp
    └── MyHomePage
        └── Scaffold
            ├── AppBar
            │   └── Text
            └── SingleChildScrollView
                └── Column
                    ├── Row
                    │   ├── InfoCard (NPM)
                    │   ├── InfoCard (Name)
                    │   └── InfoCard (Class)
                    ├── SizedBox
                    ├── Text (Selamat Datang)
                    ├── SizedBox
                    └── GridView.count
                        ├── ItemCard (Lihat Proyek)
                        ├── ItemCard (Tambah Proyek)
                        └── ItemCard (Logout)

Hubungan parent dan child menunjukkan bahwa sebuah widget dapat menjadi induk bagi widget lain. Contohnya, "Scaffold" menjadi parent dari "AppBar" dan "SingleChildScrollView". Sementara itu, "Column" menjadi parent dari beberapa widget yang disusun secara vertikal.

Dengan struktur ini, tampilan aplikasi dapat dibangun secara bertingkat dan setiap widget memiliki tanggung jawab masing-masing.

2. Apa saja widget yang digunakan pada proyek ini dan apa fungsinya?

Beberapa widget yang digunakan dalam aplikasi MyPortfolio Mobile ini adalah:

- MaterialApp: Menjadi konfigurasi utama aplikasi berbasis Material Design.
- Scaffold: Menyediakan struktur dasar halaman, seperti AppBar dan body.
- AppBar: Menampilkan judul aplikasi pada bagian atas halaman.
- SingleChildScrollView: Memungkinkan konten halaman dapat digulir apabila ukurannya melebihi layar.
- Column: Menyusun widget secara vertikal.
- Row: Menyusun kartu informasi secara horizontal.
- Expanded: Memberikan ruang yang tersedia secara proporsional kepada kartu informasi.
- Card: Menampilkan informasi dalam bentuk kartu.
- Padding: Memberikan jarak di bagian dalam widget.
- Text: Menampilkan teks, seperti identitas mahasiswa dan pesan selamat datang.
- SizedBox: Memberikan jarak antarwidget.
- GridView.count: Menyusun tombol-tombol dalam bentuk grid.
- Material: Menyediakan permukaan dengan warna dan bentuk tertentu untuk tombol.
- InkWell: Memberikan interaksi ketika pengguna menekan tombol.
- Icon: Menampilkan ikon yang merepresentasikan setiap tombol.
- SnackBar: Menampilkan pesan singkat setelah tombol ditekan.
- ScaffoldMessenger: Mengatur dan menampilkan SnackBar pada Scaffold.

Selain widget bawaan Flutter, terdapat tiga class yang dibuat untuk menyusun komponen aplikasi, yaitu "MyHomePage", "InfoCard", "ItemHomepage", dan "ItemCard".

3. Apa fungsi dari "MaterialApp" dalam proyek Flutter?

"MaterialApp" merupakan widget utama yang menyediakan konfigurasi dasar aplikasi Flutter dengan desain Material Design.

Dalam proyek ini, "MaterialApp" digunakan untuk mengatur judul aplikasi, tema melalui "ThemeData", skema warna melalui "ColorScheme.fromSeed", serta menentukan halaman utama aplikasi melalui properti "home".

Dengan demikian, "MaterialApp" menjadi fondasi yang mengatur tampilan dan navigasi dasar aplikasi.

4. Apa perbedaan antara "StatelessWidget" dan "StatefulWidget"? Kapan sebaiknya menggunakan masing-masing?

"StatelessWidget" adalah widget yang tidak memiliki state internal yang dapat berubah selama widget tersebut digunakan. Tampilan yang dihasilkan bergantung pada konfigurasi atau data yang diterima.

Sementara itu, "StatefulWidget" adalah widget yang memiliki state yang dapat berubah selama aplikasi berjalan. Ketika state berubah, Flutter dapat membangun ulang tampilan melalui mekanisme "setState()".

"StatelessWidget" cocok digunakan untuk komponen yang tampilannya relatif tetap, seperti kartu informasi dan halaman utama pada proyek ini.

Sebaliknya, "StatefulWidget" lebih sesuai untuk komponen yang membutuhkan perubahan tampilan berdasarkan interaksi atau kondisi tertentu, misalnya formulir dengan input pengguna, penghitung, atau tombol yang mengubah status tampilan.

5. Apa yang dimaksud dengan "BuildContext" dan apa fungsinya?

"BuildContext" merupakan referensi terhadap posisi suatu widget dalam widget tree.

"BuildContext" memungkinkan sebuah widget mengakses informasi atau layanan yang disediakan oleh widget induknya maupun widget lain dalam hierarki yang sesuai.

Pada proyek ini, "BuildContext" digunakan dalam method "build(BuildContext context)" untuk mengakses tema aplikasi melalui "Theme.of(context)". Selain itu, context juga digunakan untuk mengakses "ScaffoldMessenger" sehingga aplikasi dapat menampilkan "SnackBar" ketika tombol ditekan.

6. Apa perbedaan antara hot reload dan hot restart? Kapan sebaiknya menggunakan hot reload dibandingkan hot restart?

Hot reload merupakan fitur Flutter yang memungkinkan perubahan kode diterapkan ke aplikasi yang sedang berjalan tanpa memulai ulang aplikasi dari awal. Fitur ini mempertahankan state aplikasi yang sedang berjalan sehingga proses pengembangan menjadi lebih cepat.

Hot restart memulai ulang aplikasi dari awal dan menginisialisasi ulang state aplikasi. Oleh karena itu, hot restart membutuhkan waktu lebih lama dibandingkan hot reload.

Hot reload sebaiknya digunakan ketika melakukan perubahan pada tampilan atau kode yang tidak membutuhkan inisialisasi ulang state aplikasi.

Sementara itu, hot restart diperlukan ketika perubahan kode memengaruhi inisialisasi awal aplikasi atau ketika perubahan tidak dapat diterapkan dengan baik melalui hot reload.

---

## Penggunaan Artificial Intelligence (AI)

Dalam pengerjaan tugas ini, saya menggunakan ChatGPT sebagai alat bantu untuk memahami instruksi tugas, mempelajari konsep dan struktur widget Flutter, serta memperoleh saran dalam implementasi kode dan penyusunan dokumentasi.

Bantuan AI digunakan untuk:

1. Membantu memahami fungsi widget dan hubungan antarwidget dalam Flutter.
2. Memberikan arahan dalam menyesuaikan komponen "ItemHomepage" dan "ItemCard", termasuk penerapan warna yang berbeda pada setiap tombol.
3. Membantu memeriksa apakah penjelasan konsep Flutter dan jawaban refleksi pada Individual Assignment 7 sudah menjelaskan seluruh poin.

Seluruh hasil bantuan AI ditinjau kembali dan disesuaikan dengan struktur serta kebutuhan proyek. Saya bertanggung jawab atas pemeriksaan, pemahaman, dan pengumpulan hasil akhir tugas ini.
