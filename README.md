========= Tugas Individu 6 =========
1) Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
jawab)
widget tree adalah struktur data hierarkis yang mempresentasikan seluruh User Interface dari aplikasi Flutter. Setiap elemen visual/non-visual yang ada di layar(button, teks, gambar,tata letak, atau aplikasi itu sendiri) direpresentasikan oleh sebuah Widget. widget-widget ini disuusn dalam struktur parent-child, mirip dengan struktur silsilah keluarga/folder di komputer. Widget tree inilah yang menjadi blueprint awal yang digunakan Flutter untuk sebelumnya ditampilkan ke layar (Render Tree). 
Widget Induk(Parent) bertugas untuk menentukan layout dan posisi dari widget child-nya.Ia menentukan batasan yang diberikan kepada anak. Sedangkan widget anak bertanggung jawab untuk menentukan ukuran yang diinginkannya, berdasarkan batasan yang telah diberikan oleh induknya, dan kemudian menggambar dirinya sendiri (melalui rendering).

2) Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
jawab)
a). MaterialApp
Mendefinisikan Tema(ThemeData), skema warna, dan menjadi titik masuk utama untuk navigasi.
b). Scaffold
Menyediakan struktur tata letak halaman utama(beranda). Ini juga wadah untuk AppBar dan body.
c). AppBar
Menampilkan judul aplikasi dengan latar belakang warna utama tema.
d). StatelessWidget
kelas abstrak yang merupakan dasar dari widget yang tidak memerlukan perubahan data setelah dibuat
e). Text
menampilkan text di UI (Seperti di judul, konten infoCard, dan nama ItemCard)
f). Icon
Menampilkan ikon dari pustaka Icons Flutter dan digunakan didalam ItemCard
g). Padding
Menambahkan jarak (padding) di sekitar widget anak. Digunakan untuk memberi jarak di sekeliling body halaman dan teks sambutan.
h). SizedBox
Widget kotak dengan ukuran tetap yang digunakan untuk memberikan jarak (spasi) vertikal antara widget (Row dan Center kolom).
i). Container
Widget serbaguna yang digunakan untuk menentukan ukuran pada InfoCard dan sebagai wadah untuk konten ItemCard
j). Center
Widget tata letak yang menempatkan widget anaknya tepat di tengah (horisontal dan vertikal) ruang yang tersedia.
k). Card
Sebuah wadah Material Design yang biasanya ditampilkan dengan sudut membulat dan bayangan (elevation), memberikan efek "di atas" latar belakang. Digunakan untuk InfoCard.
l). Material
Widget yang mendefinisikan bentuk, elevasi, dan warna visual Material Design. Digunakan di ItemCard untuk memberi borderRadius dan warna sekunder.
m). InkWell
Widget yang menyediakan efek visual tap (riple effect) saat ditekan, menjadikannya responsif. Digunakan sebagai pembungkus ItemCard.
n). SnackBar
Widget notifikasi ringan yang ditampilkan sementara di bagian bawah layar saat ItemCard ditekan.
o). Column 
Widget tata letak yang menata widget-widget anak (children) secara vertikal. Digunakan berkali-kali untuk menyusun konten halaman.
p). Row
Widget tata letak yang menata widget-widget anak (children) secara horizontal. Digunakan untuk menempatkan tiga InfoCard secara berdampingan.
q). GridView.count
Widget tata letak yang menampilkan item-item dalam grid dua dimensi. Digunakan untuk menampilkan daftar ItemCard dalam 3 kolom (crossAxisCount: 3).
r). MyApp
Titik awal aplikasi, mengembalikan MaterialApp.
s). MyHomePage
Halaman beranda utama yang menyusun seluruh tampilan menu (AppBar, InfoCard, dan ItemCard GridView).
t). InfoCard
Widget kustom yang menampilkan judul (title) dan konten (content) di dalam sebuah Card.
u). ItemCard
Widget kustom yang menampilkan ikon dan nama menu, dibungkus dengan Material dan InkWell agar dapat ditekan (clickable).

3) Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
jawab)
MaterialApp untuk menyediakan semua fungsionalitas dan konfigurasi yang diperlukan untuk aplikasi yang mengikuti pedoman desain Material Design dari Google. Fungsi Utama: 
    a) Theming (Pewarnaan dan Gaya) : Menyediakan properti theme yang memungkinkan untuk mendefinisikan skema warna, tipografi, dan gaya visual lainnya untuk seluruh aplikasi.
    b) Navigation : Menyediakan widget Navigator yang mengelola tumpukan halaman. tanpa materialApp
    c) Localizations : Mendukung pengaturan bahasa dan lokalitas yang berbeda untuk aplikasi.
    d) Akses Debug : Secara default, ia menampilkan banner "DEBUG" di sudut kanan atas saat aplikasi berjalan dalam mode debug.
MaterialApp hampir selalu digunakan sebagai widget root (widget teratas/induk dari semua widget lain) karena ia adalah fondasi yang menyediakan konteks bagi semua widget turunannya.

4) Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
jawab)
StatelessWidget (Widget tanpa state)adalah sebuah widget yang tidak memiliki data internal yang dapat berubah setelah dibuat sehingga memiliki sifat immutable (tampilan tetap sama selama lifetime widget). widget ini hanya akan di rebuild jika parent widgetnya berubah. contohnya padding, row, column, dan cntainer non-interaktif.
StatefullWidget (Widget denngan state) adalah widget yang memiliki data internal yang dapat berubah seiring waktu atau interaksi pengguna. jenis ini bersifat mutable sehingga tampilan dapat diperbarui. contohnya checkbox, slider, tombol dengan counter, form input, dll. widget ini di rebuild ketika setState() dipanggil di dalam kelas State yang terkait.

5) Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
jawab)
BuildContext adalah identitas dan alamat dari sebuah widget. Setiap widget yang dibangun oleh Flutter memiliki BuildContext yang terasosiasi dengannya. Karena mewakili lokasi widget, ia memungkinkan widget tersebut untuk berinteraksi dengan dan mengambil informasi dari tree widget.
build() adalah tempat utama di mana akan berinteraksi dengan BuildContext. Setiap metode build() baik di StatelessWidget maupun StateFullWidget memiliki signature:
    @override
    Widget build(BuildContext context){
    }
context memiliki peran untuk mengakses InheritedWidget dan melakukan tindakan.

6) Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
jawab)
Konsep Hot Reload dan Hot Restart adalah inti dari kecepatan developer workflow Flutter, di mana perbedaan utamanya terletak pada cara mereka menangani state aplikasi. 
Hot Reload adalah mekanisme yang sangat cepat (biasanya kurang dari satu detik) yang hanya menginjeksikan perubahan kode (seperti perubahan tampilan UI atau logika non-state) ke dalam mesin Dart yang sedang berjalan, dan yang paling penting, ia mempertahankan state aplikasi saat ini (misalnya, posisi halaman, nilai counter, atau data yang sudah dimuat). Sebaliknya, Hot Restart adalah proses yang lebih menyeluruh dan sedikit lebih lambat, yang menghapus dan membangun ulang seluruh Widget Tree serta menginisialisasi ulang mesin Dart. Akibatnya, Hot Restart menghapus semua state aplikasi, mengembalikannya ke kondisi awal seolah-olah baru diluncurkan. 

7) Jelaskan bagaimana kamu menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter.
jawab)
Di flutter, setiap page adalah sebuah Route. Ketika berpindah ke page baru, kita sedang mendorong(push) Route baru ke atas tumpukan dan ketika "kembali", kita sedang mengeluarkan(pop) Route dari tumpukan tersebut. Misalnya FirstScreen layar saat ini dan SecondScreen adalah layar tujuannya.
Langkah pertama kita bisa mulai merancang layar tujuan yang merupakan widget penuh. Navigasi dilakukan menggunakan objek Navigator.of(context), yang memerlukan BuildContent untuk mengetahui di mana posisi widget saat ini di dalam tree. Untuk menambahkan Route baru ke tumpukannya, kita menggunakan Navigator.push(). ini akan menampilkan layar tujuannya. Untuk kembali ke layar sebelumnya, kita cukup mengeluarkan Route yang berada di atas tumpukan dengan Navigator.pop(). 