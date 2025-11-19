========= Tugas Individu 7 =========
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


========= Tugas Individu 8 =========
1) Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
jawab)
Perbedaan antara Navigator.push() dan Navigator.pushReplacement() terletak pada cara mereka memanipulasi riwayat halaman aplikasi atau yang dikenal sebagai Navigator Stack. Ketika menggunakan Navigator.push(), route atau halaman baru akan ditambahkan (pushed) tepat di atas route yang sedang aktif, route lama tetap dipertahankan di bawahnya, sehingga memungkinkan pengguna untuk kembali ke halaman sebelumnya. Sebaliknya, Navigator.pushReplacement() tidak hanya menambahkan route baru, tetapi juga menghapus (removes) route yang saat ini berada di puncak stack dan menggantinya dengan route baru tersebut, hasil akhirnya adalah route lama yang diganti tidak akan lagi tersedia dalam riwayat navigasi.

    push() pada proyek ini baik digunakan ketika pengguna harus bisa kembali dengan mudah ke halaman sblmnya ketika menekan tombol back. seperti implementasi pada ItemCard di MyHomePage(tombol "Add Product"), ini menambahkan ProductFormPage di atas MyHomePage (Beranda) dalam stack navigasi. Sehingga ketika pengguna berada pada ProductFormPage akan mudah untuk kembali ke halaman utama.

    pushReplacement() pada proyek ini baik digunakan untuk membersihkan stack. seperti implementasi pada LeftDrawer untuk pindah ke MyHomePage atau ProductFormPage. Jika pengguna terus menerus membuka drawer dan memilih menu yang sama, stack tidak akan menumpuk halaman yang berulang (misalnya [Home, Home, Home]), sehingga manajemen memori dan alur navigasi menjadi lebih rapi dan efisien.

2) Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
jawab)
 a. Scaffold sebagai Pondasi Halaman
    Dengan menempatkan Scaffold sebagai root dari setiap halaman (Screen), saya memastikan bahwa semua halaman memiliki tata letak Material Design yang konsisten, lengkap dengan area untuk header (AppBar), body, dan Drawer.
    Scaffold mendefinisikan area-area standar (appBar, body, drawer, bottomNavigationBar, dll.), memastikan konten aplikasi (ditempatkan di body) tidak tumpang tindih dengan area sistem atau navigasi.

 b. AppBar
    Karena diletakkan di dalam Scaffold, setiap halaman akan secara otomatis memiliki header di lokasi yang sama. 
    Judul aplikasi, warna latar belakang, dan ikon penting (seperti tombol Back atau Action Buttons) ditetapkan di AppBar, memberikan tampilan merek dan identitas yang seragam di seluruh aplikasi.

 c. Drawer 
    Dengan membuat widget Drawer sebagai widget terpisah yang reusable, saya memastikan bahwa semua halaman yang memiliki Drawer akan menampilkan menu navigasi samping yang persis sama.
    Drawer menjadi pusat kendali untuk navigasi ke halaman-halaman utama (Home, Add Product, dll.), sehingga lebih konsisten dan mudah diakses bagi pengguna untuk berpindah antara bagian utama aplikasi.

3) Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
jawab)
a. Padding
Menciptakan keterbacaan dan pemisahan visual antar elemen form. Ini mencegah field input, label, dan tombol terlihat saling berhimpitan, membuat formulir terasa lebih terstruktur mengurangi kemungkinan kesalahan sentuhan (mis-tap) oleh pengguna.
contoh : 
    Padding( // <-- Memberi jarak 8.0 di sekeliling TextFormField
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
        // ... input field ...
    ),
    ),
b. SingleChildScrollView
Memberikan responsivitas vertikal pada formulir. Ini sangat penting untuk mencegah error umum "Pixel Overflow" ketika keyboard muncul atau ketika aplikasi berjalan pada layar kecil. Pengguna dapat mengisi formulir panjang tanpa terhalang ukuran layar atau keyboard.
contoh :
    body: Form(
    key: _formKey,
    child: SingleChildScrollView( // <-- Memastikan Form bisa di-scroll
        child: Column(
        // ... semua field TextFormField & DropdownButtonFormField ...
        ),
    ),
    ),
c. ListView
menawarkan kemampuan scrolling secara default, tetapi lebih efisien untuk daftar panjang karena hanya membangun widget yang terlihat di layar. 
contoh:
    @override
    Widget build(BuildContext context) {
    return Drawer( // Widget utama untuk menu samping
        child: ListView( // Memungkinkan konten Drawer digulir
        )
    )
    }

4) Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
jawab)
yang pertama yaitu mengidentifikasi warna brand inti, menetukan warna primer dan sekunder berdasarkan brand tersebut. Kemudian warna-warna inti ini diimplementasikan di widget MyApp (atau root widget) menggunakan ThemeData dan ColorScheme.
Untuk widget kustom yang digunakan secara luas seperti LeftDrawer dan ItemCard, warna tema dimanfaatkan sebagai berikut:
    LeftDrawer Header -> menggunakan Theme.of(context).colorScheme.primary agar konsisten dengan AppBar.

    AppBar di MyHomePage -> menggunakan Theme.of(context).colorScheme.primary, memastikan judul dan warna latar belakang selalu mengikuti skema warna utama brand.

    ElevatedButton (Tombol Simpan) -> menggunakan Colors.indigo yang mendekati warna tema.

========= Tugas Individu 9 =========
1) Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
jawab) 
Dengan membuat class model dari data JSON, kita dapat mengubah data mentah yang tidak bertipe (Map<String, dynamic> atau List<dynamic>) menjadi objek Dart yang bertanggung jawab dan bertipe kuat (strongly typed). Akibatnya kita menciptakan objek terisolasi di dalam constructor factory Product.fromJson().
Konsekuensi Menggunakan Map<String, dynamic> Langsung (Tanpa Model) :
    a) Saat mengakses nilai dari Map, Dart tidak tahu tipe data spesifiknya. Sehingga jika backend tiba-tiba mengirimkan 'price' sebagai String ("1000") alih-alih Integer, atau jika nama key salah ketik ('Price'), Anda akan mendapatkan runtime error seperti TypeError atau NoSuchMethodError (atau null jika tidak ada key), dan ini hanya terdeteksi saat aplikasi berjalan (bukan saat kompilasi).

    b) Ketika mengakses key yang mungkin tidak ada, hasil pengaksesan Map adalah nullable secara default. Sehingga kita harus secara manual menambahkan pengecekan null di mana-mana.Sedangkan dengan Model, Anda bisa mendefinisikan field sebagai required dalam constructor (Product.fromJson), memaksa kita untuk menangani nilai yang hilang atau null saat konversi (di satu tempat), bukan tersebar di seluruh logika bisnis kita.

    c) Setiap kali kita ingin menggunakan data produk, kita harus mengingat dan mengetik ulang key yang sama berulang kali di seluruh aplikasi. Ini menjadi sulit untuk mem refactor nama field. Jika kita mengubah nama field di backend (misalnya dari product_name menjadi title), kita harus mencari dan mengubahnya secara manual di setiap tempat di kode Flutter. Dengan model, kita hanya perlu mengubahnya satu kali di dalam definisi class Product.

2) Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
jawab)
Paket http berfungsi sebagai lapisan transportasi jaringan dasar, bertugas mengirimkan permintaan HTTP (GET, POST, dll.) dan menerima respons dari server, namun paket ini bersifat stateless; artinya, ia tidak menyimpan cookie sesi apa pun yang dikirimkan oleh Django. Setiap permintaan adalah independen dan baru, sehingga http hanya cocok untuk mengakses data publik yang tidak memerlukan autentikasi. Sebaliknya, CookieRequest (yang merupakan class khusus atau dari paket pihak ketiga yang dibangun di atas http) berperan sebagai manajer sesi yang bertanggung jawab dan stateful. Tugas utamanya adalah secara otomatis menyimpan cookie sesi (sessionid) setelah login berhasil, dan menyertakan kembali cookie tersebut pada setiap permintaan berikutnya. Peran ini sangat penting karena memungkinkan Django untuk mengenali pengguna yang terautentikasi dan mengizinkan akses ke view yang dilindungi (@login_required), sehingga mempertahankan status login pengguna di seluruh sesi aplikasi.

3) Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
jawab)
Instance CookieRequest wajib dibagikan ke seluruh komponen aplikasi karena ia berfungsi sebagai Single Source of Truth untuk state autentikasi dan manajemen sesi. Dengan membagikan satu instance ini (biasanya di root aplikasi), semua komponen dapat dijamin menggunakan sesi yang konsisten (yaitu, cookie sesi yang sama). Ini memastikan bahwa ketika pengguna berhasil login di satu bagian aplikasi, status login (request.loggedIn) dan cookie sesi yang tersimpan dapat segera diakses dan dikirimkan oleh komponen lain saat mereka membuat permintaan ke backend Django. Jika instance ini tidak dibagikan, setiap komponen akan memiliki sesi terpisah, yang mengakibatkan ketidakkonsistenan login, redundansi koneksi, dan kegagalan untuk mempertahankan status sesi pengguna.

4) Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
jawab)
Agar aplikasi Flutter di Android Emulator dapat berkomunikasi dengan backend Django yang berjalan di mesin host lokal, diperlukan beberapa penyesuaian wajib. Pertama, alamat 10.0.2.2 harus ditambahkan ke ALLOWED_HOSTS di Django, sebab ini adalah IP khusus yang digunakan Emulator untuk merujuk ke localhost, dan tanpanya, permintaan akan ditolak dengan error 400 Bad Request. Kedua, paket django-cors-headers harus diaktifkan dan dikonfigurasi (CORS_ALLOW_ALL_ORIGINS=True dan CORS_ALLOW_CREDENTIALS=True) untuk mengizinkan permintaan lintas origin (Flutter ke Django), yang tanpanya akan terjadi error kebijakan CORS. Ketiga, pengaturan cookie Django harus disetel ke CSRF_COOKIE_SAMESITE='None' dan SESSION_COOKIE_SAMESITE='None' untuk memungkinkan cookie sesi dikirimkan dalam permintaan cross-origin, memastikan sesi login tetap persisten; kegagalan dalam langkah ini akan membuat pengguna harus login berulang kali. Terakhir, izin <uses-permission android:name="android.permission.INTERNET" /> wajib ada di AndroidManifest.xml Android, sebab tanpa izin eksplisit ini, aplikasi Flutter tidak akan memiliki akses jaringan dan akan gagal dengan SocketException.

5) Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
jawab) 
Proses pengiriman data dari formulir Flutter ke Django dan kembali ke tampilan melibatkan dua alur utama: POST untuk menyimpan dan GET untuk mengambil. Saat pengguna menekan tombol Save di formulir Flutter, data divalidasi dan dikonversi menjadi string JSON menggunakan jsonEncode(). String ini kemudian dikirim melalui permintaan POST oleh CookieRequest ke view Django yang dihiasi @csrf_exempt. Di Django, view tersebut mengurai string JSON kembali menjadi data Python (json.loads(request.body)), mengekstrak field data, membuat instance model, dan menyimpannya ke database (.save()), lalu mengembalikan JsonResponse sukses. Untuk menampilkan data, Flutter mengirimkan permintaan GET ke endpoint /json/. Django merespons dengan mengambil QuerySet dari database, menserialisasikannya menjadi array JSON, dan mengirimkannya kembali. Flutter kemudian menerima array JSON tersebut, mende-serialisasikannya menjadi daftar objek Dart yang bertipe kuat (misalnya, List<ProductEntry>), yang kemudian digunakan oleh ListView.builder untuk diperbarui dan ditampilkan di UI.

6) Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
jawab)
Mekanisme autentikasi Flutter-Django didasarkan pada manajemen sesi cookie yang dikelola oleh CookieRequest di sisi Flutter. Untuk Register, Flutter mengirimkan username dan dua password melalui POST ke view register Django, yang memvalidasi password dan membuat instance User baru di database, kemudian mengembalikan status sukses. Untuk Login, Flutter menggunakan method khusus request.login() untuk mengirim kredensial melalui POST ke view login. Setelah Django memverifikasi kredensial menggunakan authenticate(), ia memanggil auth_login(request, user), yang mana proses ini membuat sesi dan menginstruksikan server untuk mengirim header Set-Cookie yang berisi sessionid. Kunci dari proses ini adalah CookieRequest di Flutter akan menyimpan sessionid tersebut dan mengatur state loggedIn menjadi true. Setelah itu, Flutter menavigasi ke HomePage dan semua permintaan selanjutnya (untuk mengakses data yang dilindungi) akan secara otomatis menyertakan cookie sesi yang tersimpan. Akhirnya, untuk Logout, Flutter mengirimkan permintaan ke view logout Django, yang memanggil auth_logout(request) untuk menghapus sesi di server dan cookie di client; CookieRequest menghapus cookie yang disimpan, mengatur loggedIn menjadi false, dan Flutter kembali ke LoginPage.

7) Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
jawab)
    1. Konfigurasi Deployment dan Konektivitas
    Implementasi dimulai dengan memastikan Django berjalan di http://localhost:8000 dan endpoint JSON /json/ dapat diakses, menampilkan array objek Product yang lengkap. Konfigurasi konektivitas sangat penting: paket django-cors-headers diinstal dan dikonfigurasi dengan CORS_ALLOW_ALL_ORIGINS = True dan CORS_ALLOW_CREDENTIALS = True untuk mengizinkan permintaan lintas origin dari Flutter. ALLOWED_HOSTS diperbarui dengan 10.0.2.2 (IP Android Emulator) untuk memastikan koneksi host dari emulator diterima. Pengaturan cookie sesi diperbaiki dengan CSRF_COOKIE_SAMESITE = 'None' dan SESSION_COOKIE_SAMESITE = 'None' serta _SECURE = True, yang memungkinkan cookie dikirim dalam permintaan lintas origin untuk mempertahankan sesi. Selain itu, sebuah view proxy_image dibuat di Django untuk mengatasi masalah CORS pada pemuatan gambar dari URL eksternal di Flutter.

    2. Implementasi Registrasi Akun dan Halaman Login
    App authentication dibuat untuk menangani fitur login dan register. View register di Django diberi decorator @csrf_exempt, menerima data JSON (username, password1, password2), melakukan validasi kecocokan password dan ketersediaan username, dan jika valid, menggunakan User.objects.create_user() untuk menyimpan pengguna baru dengan password yang di-hash, lalu mengembalikan JsonResponse sukses (200). Di Flutter, RegisterPage mengirimkan POST JSON ke /auth/register/ menggunakan request.postJson(), dan setelah sukses akan menavigasi ke LoginPage. Halaman LoginPage yang estetik mengirimkan kredensial melalui request.login() ke /auth/login/. View login Django menggunakan authenticate() dan auth_login(request, user) untuk membuat sesi baru, mengembalikan JsonResponse dan Set-Cookie yang berisi session id.

    4. Integrasi Sistem Autentikasi dan Model Kustom
    Integrasi state autentikasi dilakukan dengan menginstal paket provider dan pbp_django_auth. CookieRequest di-inject sebagai Provider di root main.dart, menjadikannya single source of truth untuk manajemen sesi cookie dan status login (request.loggedIn). Instance ini diakses oleh komponen menggunakan context.watch atau context.read. Untuk model data, JSON response dari /json/ diumpankan ke Quicktype untuk secara otomatis menghasilkan class ProductEntry di Dart, lengkap dengan factory constructor fromJson() untuk parsing data bertipe kuat. Konfigurasi serializer Django dimodifikasi untuk memastikan ID (UUID) dan timestamp (created_at) diformat dengan benar agar sesuai dengan tipe String dan DateTime di Flutter.

    6. Halaman Daftar Item dan Halaman Detail
    Halaman ProductEntryListPage menampilkan semua produk menggunakan FutureBuilder yang memanggil method fetchProduct(). Method ini mengirimkan GET request ke /json/ dan mengubah array JSON yang diterima menjadi List<ProductEntry> menggunakan method ProductEntry.fromJson(). Untuk tampilan, ProductEntryCard yang dapat digunakan kembali menampilkan data produk, termasuk thumbnail yang dimuat melalui proxy endpoint Django, dengan penanganan error gambar dan tampilan stock serta views yang detail. Halaman ProductDetailPage menerima objek ProductEntry yang dipilih, menampilkan tata letak yang lebih rinci dengan thumbnail besar, badge "Featured", title besar, price yang diformat Rupiah, dan info kartu terpisah untuk size, stock, dan views, serta deskripsi penuh.

    8. Fitur Filter dan Implementasi Logout
    Fungsi filtering (menampilkan produk milik pengguna) diimplementasikan melalui endpoint baru Django, /json/user/, yang dilindungi oleh @login_required dan menggunakan Product.objects.filter(user=request.user) untuk mengembalikan data yang sudah disaring. Flutter membuat halaman MyProductListPage yang secara spesifik memanggil endpoint ini menggunakan request.get(), yang secara otomatis menyertakan cookie sesi untuk autentikasi. Untuk Logout, view Django logout dibuat dengan auth_logout(request) untuk menghapus sesi di server. Di Flutter, menekan tombol Logout (di AppBar atau LeftDrawer) memanggil request.logout(), yang menghapus cookie sesi di klien, mengatur request.loggedIn ke false, dan segera menavigasi pengguna kembali ke LoginPage menggunakan Navigator.pushReplacement() demi keamanan.