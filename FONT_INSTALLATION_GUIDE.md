# Panduan Instalasi Font Plus Jakarta Sans

## Cara Download dan Install Font

1. **Download Font Plus Jakarta Sans:**
   - Kunjungi: https://fonts.google.com/specimen/Plus+Jakarta+Sans
   - Klik tombol "Download family"
   - Extract file ZIP yang telah didownload

2. **Copy Font Files ke Project:**
   - Dari folder yang telah di-extract, cari folder `static/`
   - Copy file-file berikut ke folder `app/src/main/res/font/`:
     * `PlusJakartaSans-Regular.ttf` → rename menjadi `plus_jakarta_sans_regular.ttf`
     * `PlusJakartaSans-Medium.ttf` → rename menjadi `plus_jakarta_sans_medium.ttf`
     * `PlusJakartaSans-SemiBold.ttf` → rename menjadi `plus_jakarta_sans_semibold.ttf`
     * `PlusJakartaSans-Bold.ttf` → rename menjadi `plus_jakarta_sans_bold.ttf`

3. **Pastikan nama file menggunakan lowercase dan underscore**
   - Android resource naming harus lowercase
   - Gunakan underscore (_) bukan dash (-)

4. **Build ulang project setelah menambahkan font**

## Alternatif: Gunakan Downloadable Fonts
Jika tidak ingin download manual, Anda bisa gunakan Google Fonts langsung dari XML dengan menambahkan dependency di build.gradle.

**PENTING:** Ganti file placeholder .ttf yang ada di folder `app/src/main/res/font/` dengan file font yang sebenarnya.

