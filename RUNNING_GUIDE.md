## 🚀 Panduan Lengkap Menjalankan Aplikasi

### 📋 Ringkasan Perubahan yang Dilakukan

#### **1. UI/UX Improvements**
✅ **Font Plus Jakarta Sans** - Diterapkan di semua screen (login, register, profile, contact list)
✅ **Kontras Warna yang Lebih Baik** - Enhanced color palette dengan WCAG compliance
✅ **Teks Lebih Besar dan Jelas** - Heading 28-32sp, body 15-16sp
✅ **Layout Lebih Menarik** - Better spacing, elevation, dan visual hierarchy
✅ **Avatar/Icons Lebih Terang** - Menggunakan primary color untuk visibility

#### **2. File yang Dimodifikasi**
- ✅ `app/src/main/res/values/colors.xml` - Color palette baru
- ✅ `app/src/main/res/values/themes.xml` - Font Jakarta Sans + text styles
- ✅ `app/src/main/res/layout/activity_login.xml` - Login UI redesign
- ✅ `app/src/main/res/layout/activity_register.xml` - Register UI redesign
- ✅ `app/src/main/res/layout/activity_main.xml` - Main screen enhancement
- ✅ `app/src/main/res/layout/activity_profile.xml` - Profile screen redesign
- ✅ `app/src/main/res/layout/item_contact.xml` - Contact card styling
- ✅ `app/src/main/res/layout/dialog_add_edit_contact.xml` - Dialog styling
- ✅ `app/src/main/res/font/` - Font files (3 variants)

---

## 🔧 Langkah-Langkah Menjalankan Aplikasi

### **Step 1: Setup Font Jakarta Sans (WAJIB)**

Unduh font asli dari Google Fonts dan gantikan file placeholder:

1. Kunjungi: https://fonts.google.com/specimen/Plus+Jakarta+Sans
2. Download: Regular (400), SemiBold (600), Bold (700)
3. Letakkan di folder: `app/src/main/res/font/`
   - `plus_jakarta_sans_regular.ttf`
   - `plus_jakarta_sans_semibold.ttf`
   - `plus_jakarta_sans_bold.ttf`

### **Step 2: Build Project**

Di Android Studio, buka Terminal dan jalankan:

```bash
# Clean build
./gradlew clean

# Build debug
./gradlew build

# Atau gunakan menu:
Build → Clean Project
Build → Make Project
```

### **Step 3: Perbaiki Emulator**

Jika masih error "emulator process has terminated", jalankan script:

```bash
# Double-click file ini:
FIX_EMULATOR.bat
```

Atau secara manual:

1. Buka **Device Manager** di Android Studio (Tools → Device Manager)
2. Klik **Create Device** atau edit "Medium_Phone"
3. Atur ulang settings:
   - **RAM**: 2048 MB
   - **Internal Storage**: 2048 MB
   - **Graphics**: Hardware / Auto
   - **API Level**: 34 atau 35

### **Step 4: Run Aplikasi**

Pilih salah satu cara:

**Cara A: Langsung dari Android Studio**
```
1. Pilih device/emulator di toolbar
2. Tekan Ctrl+R atau Run → Run 'app'
3. Tunggu hingga aplikasi muncul
```

**Cara B: Via Terminal**
```bash
# Install dan jalankan
./gradlew installDebug
./gradlew connectedDebugAndroidTest

# Atau direct run
./gradlew runDebug
```

**Cara C: Manual via ADB**
```bash
# Build APK
./gradlew build

# Install
adb install app/build/outputs/apk/debug/app-debug.apk

# Launch
adb shell am start -n com.example.contactapp/.MainActivity
```

---

## 📱 Testing Checklist

Setelah aplikasi berjalan, periksa hal-hal berikut:

### **Login Screen**
- [ ] Font terlihat jelas (Sans Jakarta)
- [ ] Title "Selamat Datang" ukuran besar (32sp)
- [ ] Input fields memiliki border jelas
- [ ] Button "Masuk" warna biru tua dengan kontras baik
- [ ] Text "Daftar disini" terlihat jelas

### **Register Screen**
- [ ] Semua layout konsisten dengan login screen
- [ ] 3 input fields: Username, Password, Konfirmasi Password
- [ ] Button styling seragam

### **Contact List (Main Screen)**
- [ ] Toolbar berwarna biru gelap dengan text putih
- [ ] Setiap contact card menampilkan:
  - Avatar dengan background primary color (biru)
  - Nama kontak (bold, 17sp)
  - Email (14sp, secondary text)
  - Nomor telepon (14sp, light text)
  - Tombol Edit dan Delete
- [ ] Button "Tambah Kontak" di bawah dengan padding cukup

### **Profile Screen**
- [ ] Avatar profile besar (120dp) dengan background biru
- [ ] Username terlihat jelas (24sp, bold)
- [ ] 2 buttons:
  - "Kembali ke Kontak" - biru
  - "Log Out" - merah dengan border

### **Add/Edit Dialog**
- [ ] Title "Tambah Kontak" jelas (28sp)
- [ ] 3 input fields dengan icon
- [ ] Input fields memiliki border 2dp

---

## 🎨 Color Reference

| Element | Color | Hex |
|---------|-------|-----|
| Primary (Buttons, Toolbar) | Indigo 600 | #4F46E5 |
| Primary Dark (Focus) | Indigo 900 | #3730A3 |
| Text Main | Slate 900 | #111827 |
| Text Secondary | Slate 600 | #4B5563 |
| Error (Delete) | Red 600 | #DC2626 |
| Success | Green 600 | #059669 |
| Borders | Gray 300 | #D1D5DB |
| Background | Gray 50 | #F9FAFB |

---

## ❌ Troubleshooting

### **Masalah: Font tidak tampil (masih default)**
```
Solusi:
1. Pastikan TTF files ada di: app/src/main/res/font/
2. Rebuild project: ./gradlew clean build
3. Clear cache: File → Invalidate Caches → Restart
4. Uninstall app dari emulator
5. Jalankan ulang
```

### **Masalah: Emulator masih error**
```
Solusi:
1. Gunakan x86_64 architecture (lebih cepat, RAM sedikit)
2. Kurangi RAM alloc ke 1024MB (coba dulu)
3. Matikan visual effects: Settings → Developer Options → Animation scale 0.5x
4. Gunakan physical device jika tersedia
```

### **Masalah: Text terlalu kecil/besar di device lain**
```
Solusi:
1. Gunakan sp (scalable pixels) untuk text - SUDAH FIXED
2. Test di berbagai ukuran screen
3. Adjust text sizes di themes.xml
```

### **Masalah: Button warna tidak sesuai**
```
Solusi:
1. Buka activity files dan verify android:backgroundTint
2. Buka colors.xml dan verify color hex values
3. Rebuild: ./gradlew clean build
```

---

## 📊 Performa Tips

Untuk emulator berjalan lancar:

1. **Matikan animasi**
   ```bash
   adb shell settings put global window_animation_scale 0
   adb shell settings put global transition_animation_scale 0
   ```

2. **Increase available RAM**
   - Tutup aplikasi berat lainnya
   - Restart Android Studio
   - Allocate lebih banyak RAM ke AVD

3. **Use snapshots**
   - Snapshots mempercepat boot time
   - Buat snapshot setelah setup awal

---

## 📞 Quick Command Reference

```bash
# Clean and rebuild
./gradlew clean build

# Install debug APK
adb install -r app/build/outputs/apk/debug/app-debug.apk

# Clear app data
adb shell pm clear com.example.contactapp

# List connected devices
adb devices

# View logs
adb logcat

# Take screenshot
adb shell screencap -p /sdcard/screenshot.png
adb pull /sdcard/screenshot.png

# Reboot emulator
adb reboot
```

---

## 📝 Catatan Penting

✅ **Semua layout files sudah diupdate** dengan kontras yang lebih baik
✅ **Font Plus Jakarta Sans** sudah terintegrasi di themes.xml
✅ **Color palette** yang WCAG-compliant sudah diterapkan
✅ **Text sizes** sudah optimal untuk readability
⚠️ **Font TTF files perlu didownload** dari Google Fonts (file saat ini adalah placeholder)

---

## 🎯 Next Steps

1. **Download Plus Jakarta Sans font** dari Google Fonts
2. **Letakkan di `app/src/main/res/font/`**
3. **Run `./gradlew clean build`**
4. **Perbaiki emulator menggunakan `FIX_EMULATOR.bat`**
5. **Jalankan aplikasi via Android Studio**
6. **Test semua screens dan pastikan UI terlihat menarik**

---

**Jika ada pertanyaan atau masalah, periksa:**
- `UI_REDESIGN_COMPLETE.md` - Dokumentasi lengkap UI changes
- `FIX_EMULATOR.bat` - Script otomatis untuk perbaikan emulator
- Android Studio Logcat - Error messages dan debugging info

**Selamat! 🎉 UI aplikasi Anda sudah lebih menarik dengan kontras yang jelas dan font Sans Jakarta!**

