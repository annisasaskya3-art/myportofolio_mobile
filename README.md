## MyPortfolio Mobile

Aplikasi portofolio berbasis Flutter yang dibuat untuk memenuhi Proyek Individu pada mata kuliah Pemrograman Berbasis Platform (PBP), Fakultas Ilmu Komputer Universitas Indonesia.

Aplikasi ini menampilkan identitas mahasiswa dan beberapa tombol interaktif yang merepresentasikan fitur portofolio.

### Identitas Mahasiswa

- Nama: Annisa Saskya Aulia
- NPM: 2506537915
- Kelas: PBP C

## Deskripsi Aplikasi

MyPortfolio Mobile adalah aplikasi sederhana yang dikembangkan dengan Flutter. Halaman utama menampilkan NPM, nama, dan kelas dalam bentuk kartu informasi (`InfoCard`).

Aplikasi memiliki tiga tombol aksi (`ItemCard`), masing-masing dengan ikon dan warna latar berbeda:

- **Lihat Proyek** (biru): merepresentasikan fitur melihat daftar proyek.
- **Tambah Proyek** (hijau): merepresentasikan fitur menambah proyek.
- **Logout** (merah): merepresentasikan tombol keluar.

Saat tombol ditekan, aplikasi menampilkan `SnackBar` dengan pesan "Kamu telah menekan tombol [Nama Tombol]!".

## Teknologi yang Digunakan

- Flutter
- Dart
- Material Design

## Struktur Proyek

```
myportofolio_mobile/
├── lib/
│   ├── main.dart
│   └── menu.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml
└── README.md
```

- `main.dart`: titik masuk aplikasi (`main()`) dan konfigurasi `MaterialApp`.
- `menu.dart`: halaman utama `MyHomePage`, komponen `InfoCard` dan `ItemCard`, serta model data `ItemHomepage`.
- `widget_test.dart`: widget test untuk memeriksa identitas, tiga tombol, dan SnackBar.

## Cara Menjalankan Aplikasi

Pastikan Flutter SDK sudah terpasang dan perangkat atau emulator tersedia.

1. Clone repositori ini:

   ```
   git clone https://github.com/annisasaskya3-art/myportofolio_mobile.git
   ```

2. Masuk ke direktori proyek:

   ```
   cd myportofolio_mobile
   ```

3. Unduh dependensi:

   ```
   flutter pub get
   ```

4. Jalankan aplikasi:

   ```
   flutter run
   ```

5. Periksa kode dengan analyzer (hasil yang diharapkan: No issues found):

   ```
   flutter analyze
   ```

6. (Opsional) Jalankan test:

   ```
   flutter test
   ```

---

### Tugas 7

1. **Apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget?**

   Di Flutter, hampir seluruh elemen antarmukanya adalah widget. Widget tree adalah susunan hierarki dari widget-widget di mana satu widget akar (root) bercabang ke widget-widget di bawahnya sampai ke widget paling ujung (leaf), seperti `Text` atau `Icon`.

   Hubungan parent-child bekerja dengan widget induk (parent) yang membungkus dan mengatur widget anak (child) lewat properti `child` atau `children`. Parent menentukan batasan ukuran (constraints) dan posisi bagi child, sedangkan child menentukan ukurannya sendiri di dalam batasan itu. Data seperti tema (`Theme`) juga mengalir turun dari parent ke seluruh keturunannya. Ketika sebuah widget dibangun ulang, widget di bawahnya ikut dibangun ulang.

   Widget tree pada aplikasi ini adalah sebagai berikut:

   ```
   MyApp
   └── MaterialApp
       └── MyHomePage
           └── Scaffold
               ├── AppBar
               │   └── Text ("MyPortfolio")
               └── SingleChildScrollView
                   └── Column
                       ├── Row
                       │   ├── InfoCard (NPM)
                       │   ├── InfoCard (Name)
                       │   └── InfoCard (Class)
                       ├── SizedBox
                       ├── Text (Selamat datang)
                       ├── SizedBox
                       └── GridView.count
                           ├── ItemCard (Lihat Proyek)
                           ├── ItemCard (Tambah Proyek)
                           └── ItemCard (Logout)
   ```

   Contoh Cara Membaca dan memahami: `Scaffold` adalah parent dari `AppBar` dan `SingleChildScrollView`. `Column` adalah parent dari `Row`, `Text`, dan `GridView`, sehingga ketiganya tersusun vertikal. Di dalam `InfoCard` dan `ItemCard` juga ada pohon kecil sendiri (`Card`/`Material` > `Padding` > `Column` > `Text`/`Icon`).

2. **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**

   Widget bawaan Flutter yang dipakai:

   - `MaterialApp`: root aplikasi bergaya Material Design; mengatur judul, tema, dan halaman awal (`home`).
   - `Scaffold`: kerangka dasar halaman (menyediakan `appBar` dan `body`).
   - `AppBar`: bilah judul di bagian atas halaman.
   - `SingleChildScrollView`: membuat konten bisa di-scroll jika melebihi tinggi layar.
   - `Column`: menyusun widget secara vertikal.
   - `Row`: menyusun tiga `InfoCard` secara horizontal.
   - `Expanded`: membagi lebar `Row` secara merata untuk setiap `InfoCard`.
   - `Card`: wadah bergaya kartu dengan bayangan (elevation) untuk `InfoCard`.
   - `Padding`: memberi jarak di bagian dalam widget.
   - `Text`: menampilkan teks (judul, identitas, nama tombol).
   - `SizedBox`: memberi jarak kosong antarwidget.
   - `GridView.count`: menyusun tombol dalam grid 3 kolom.
   - `Material`: permukaan dengan warna dan sudut membulat untuk latar `ItemCard`.
   - `InkWell`: area yang bisa ditekan dengan efek ripple dan menjalankan `onTap`.
   - `Icon`: menampilkan ikon pada tiap tombol.
   - `SnackBar`: pesan singkat di bagian bawah layar saat tombol ditekan.
   - `ScaffoldMessenger`: mengelola dan menampilkan `SnackBar` pada `Scaffold`.
   - `Theme` (lewat `Theme.of(context)`) dan `ThemeData`/`ColorScheme`: mengatur dan mengambil tema warna aplikasi.

   Class buatan sendiri:

   - `MyApp` (`StatelessWidget`): widget root yang membangun `MaterialApp`.
   - `MyHomePage` (`StatelessWidget`): halaman utama.
   - `InfoCard` (`StatelessWidget`): kartu informasi (judul dan isi).
   - `ItemCard` (`StatelessWidget`): kartu tombol aksi dengan warna, ikon, dan SnackBar.
   - `ItemHomepage`: bukan widget, melainkan model data (nama, ikon, warna) agar warna tiap tombol diatur lewat data, bukan if-else.

3. **Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!**

   `MaterialApp` adalah widget yang membungkus aplikasi dengan fondasi Material Design. Fungsinya antara lain mengatur judul aplikasi (`title`), tema global (`theme` dengan `ThemeData` dan `ColorScheme.fromSeed`), halaman awal (`home`), serta menyediakan sistem navigasi (`Navigator` dan `routes`), `ScaffoldMessenger`, `MediaQuery`, dan dukungan lokalisasi.

   Widget ini umumnya menjadi root karena semua layanan tersebut harus tersedia bagi seluruh widget di bawahnya. Contohnya, `Scaffold` dan `SnackBar` bergantung pada `Theme` dan `ScaffoldMessenger` yang disediakan `MaterialApp`, serta `Theme.of(context)` hanya bisa bekerja jika ada `Theme` di atasnya dalam widget tree. Dengan satu root yang mengatur tema dan navigasi, tampilan seluruh aplikasi menjadi konsisten.

4. **Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?**

   `StatelessWidget` adalah widget tanpa state internal yang berubah. Tampilannya hanya ditentukan oleh data yang diterima lewat konstruktor, dan baru dibangun ulang jika parent-nya memberi data baru.

   `StatefulWidget` memiliki objek `State` terpisah yang menyimpan data yang bisa berubah selama aplikasi berjalan. Saat data berubah, kita memanggil `setState()` agar Flutter membangun ulang tampilan. State juga punya siklus hidup (`initState`, `dispose`, dan lainnya).

   Pilih `StatelessWidget` untuk tampilan yang tetap atau hanya bergantung pada data masukan, misalnya `InfoCard`, `ItemCard`, dan `MyHomePage` pada proyek ini. Pilih `StatefulWidget` jika tampilan harus berubah karena interaksi atau waktu, misalnya counter, form dengan input pengguna, checkbox, animasi, atau data yang dimuat secara asinkron.

5. **Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?**

   `BuildContext` adalah referensi ke lokasi sebuah widget di dalam widget tree. Lewat context, sebuah widget dapat "melihat ke atas" pohon untuk mengakses data atau layanan yang disediakan widget leluhurnya, seperti `Theme`, `MediaQuery`, `Navigator`, dan `ScaffoldMessenger`. Setiap widget punya context-nya sendiri, dan Flutter menyediakannya sebagai parameter `build(BuildContext context)`.

   Pada proyek ini, context dipakai pada:

   - `Theme.of(context).colorScheme.primary` di `MyHomePage` untuk mengambil warna tema bagi `AppBar`.
   - `ScaffoldMessenger.of(context)` di `ItemCard` untuk menampilkan `SnackBar` saat tombol ditekan.

6. **Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?**

   **Hot reload** menyuntikkan kode yang baru diubah ke Dart VM yang sedang berjalan, lalu membangun ulang widget tree. State aplikasi dipertahankan, prosesnya sangat cepat (biasanya di bawah satu detik), dan cocok untuk menyesuaikan tampilan seperti warna, teks, dan layout.

   **Hot restart** memuat ulang seluruh kode dan menjalankan aplikasi dari awal, sehingga semua state kembali ke nilai awal. Lebih lambat dari hot reload, tetapi lebih cepat dari full restart.

   Hot reload saja tidak cukup, dan kita perlu hot restart, ketika:

   - Mengubah isi `main()` atau inisialisasi `State` (misalnya `initState`);
   - Mengubah variabel global atau `static` yang sudah terinisialisasi;
   - Mengubah `enum` atau mengubah tipe class (misalnya dari `StatelessWidget` ke `StatefulWidget`);
   - Tampilan tidak berubah sesuai ekspektasi karena state lama masih terbawa.

   Full restart (menghentikan aplikasi lalu melakukan `flutter run` kembali) diperlukan ketika:

   - Mengubah `pubspec.yaml` (menambah dependency atau asset);
   - Mengubah kode native (Kotlin/Java di Android, Swift/Objective-C di iOS) atau konfigurasi Gradle, `AndroidManifest.xml`, `Info.plist`;
   - Menambah plugin baru yang punya kode native.

---

## Penggunaan Artificial Intelligence (AI)

### Tools yang dipakai

- **ChatGPT**: membantu memahami instruksi tugas, mempelajari konsep dan struktur widget Flutter, serta saran implementasi kode.
- **Claude (Anthropic)**: dipakai untuk meninjau hasil akhir tugas terhadap deskripsi dan rubrik, serta membantu merapikan README.

### Bagian yang dibantu AI

1. Memahami fungsi widget dan hubungan antarwidget (ChatGPT).
2. Arahan menyesuaikan `ItemHomepage` dan `ItemCard`, termasuk warna berbeda pada tiap tombol (ChatGPT).
3. Memeriksa kelengkapan jawaban pertanyaan reflektif (ChatGPT).
4. Review akhir terhadap checklist tugas dan rubrik (Claude).

### Strategi prompting

Strategi prompting saya adalah meminta AI untuk menjelaskan secara rinci tentang pengetahuan-pengetahuan dasar tentang Flutter, Dart, dan komponen pembangun aplikasi mobile lainnya. Contoh: "Hai GPT, bisakah kamu menjelaskan hal-hal yang menjadi requirements di tugas 7 ini dan kasih aku contoh dengan case yang mirip agar aku lebih terbayang buat mengerjakan tugas 7 (sambil melampirkan requirements dari web PBP dan zip proyek)"

### Log / bukti penggunaan AI

https://chatgpt.com/share/6afb2bb5-c87c-83ec-854f-53c7f4218b61?ogimg=plain

### Keterbatasan AI dan perbaikan manual

- AI hanya membaca kode dan tidak dapat menjalankan aplikasi di perangkat saya; hasil akhir saya verifikasi sendiri dengan menjalankan `flutter analyze` dan `flutter run`.
- AI tidak dapat melihat riwayat commit Git saya, sehingga pengelolaan commit dan push saya lakukan sendiri secara bertahap.
- Jawaban awal dari AI terkadang kurang lengkap atau kurang tepat dengan pertanyaan tugas (contohnya, bagian hot restart/full restart belum memberi contoh kasus konkret, dan ada kesalahan jumlah class pada jawaban widget). Saya memeriksa dan memperbaikinya sendiri.

Seluruh hasil bantuan AI saya tinjau kembali dan sesuaikan dengan struktur serta kebutuhan proyek. Saya bertanggung jawab atas pemeriksaan, pemahaman, dan pengumpulan hasil akhir tugas ini.
