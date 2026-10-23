# Tugas PPM Sesi 2 - E-Commerce & Profile App

Aplikasi *mobile* Flutter berbasis *e-commerce* dan profil mahasiswa yang dikembangkan dengan tema warna biru kustom serta arsitektur kode modular.

## Identitas Mahasiswa
- **Nama:** Mohamad Arief Rifansyah
- **NIM:** 20240040194 
- **Program Studi:** Teknik Informatika - TI24B
- **Universitas:** Universitas Nusa Putra

## Fitur Utama Aplikasi
1. **Bottom Navigation Bar & IndexedStack:** Navigasi cepat ke 4 halaman utama (Beranda, Keranjang, Transaksi, Akun) tanpa mereset *state* halaman.
2. **Pencarian Produk (Search Bar):** Fitur pencarian produk secara *real-time* (Earphone, MacBook, Keyboard) di halaman beranda.
3. **Banner Promo (`Stack` & `Positioned`):** Banner diskon menarik yang disusun menggunakan widget layout lapis.
4. **Kartu Profil Mahasiswa (`StatelessWidget`):** Menampilkan informasi identitas lengkap beserta rating bintang.
5. **Kartu Produk Interaktif (`StatefulWidget`):**
   - Tombol *Favorite* (ikon hati) yang dapat ditekan untuk menambah/mengurangi jumlah *likes*.
   - Tombol pengatur kuantitas (`-` dan `+`) dengan jumlah minimum 1 serta kalkulasi total harga otomatis.
   - Tombol **Tambah ke Keranjang** yang memunculkan `SnackBar` interaktif.
6. **Halaman Keranjang & Checkout:**
   - Menampilkan daftar item belanja lengkap dengan gambar produk dan tombol kuantitas.
   - Fitur hapus item dari keranjang (ikon tempat sampah).
   - Pilihan metode pembayaran (*SeaBank*, *COD*, *ShopeePay/GoPay*) menggunakan *Modal Bottom Sheet*.

---

## Struktur Folder Project (Modular)
Project ini dikelompokkan ke dalam beberapa folder agar bersih dan mudah dikelola:
```text
lib/
├── constants/
│   └── color.dart
├── models/
│   ├── product.dart
│   └── cart_item.dart
├── data/
│   └── dummy_data.dart
├── widgets/
│   ├── profile_card.dart
│   ├── promo_banner.dart
│   └── product_card.dart
├── pages/
│   ├── home_tab.dart
│   ├── cart_tab.dart
│   ├── transaction_tab.dart
│   ├── account_tab.dart
│   └── main_page.dart
└── main.dart

## Screenshot Hasil Aplikasi
![Screenshot Aplikasi](screenshots/TampilanApp.png)