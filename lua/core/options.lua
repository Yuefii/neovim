-- Nonaktifkan highlight hasil pencarian
vim.o.hlsearch = false
-- Tampilkan nomor baris
vim.wo.number = true
-- Aktifkan penggunaan mouse di semua mode
vim.o.mouse = ""
-- Sinkronisasi clipboard Neovim dengan sistem operasi
vim.o.clipboard = "unnamedplus"
-- Pertahankan indentasi saat baris dibungkus
vim.o.breakindent = true
-- Simpan riwayat undo ke dalam file
vim.o.undofile = true
-- Abaikan huruf kapital saat mencari (case-insensitive)
vim.o.ignorecase = true
-- Gunakan pencarian case-sensitive jika ada huruf kapital dalam query
vim.o.smartcase = true
-- Tampilkan kolom tanda (seperti git atau diagnosa) secara permanen
vim.wo.signcolumn = "yes"
-- Kurangi waktu update (untuk responsifitas fitur seperti linting)
vim.o.updatetime = 250
-- Waktu tunggu maksimal untuk menyelesaikan kombinasi tombol (dalam ms)
vim.o.timeoutlen = 300
-- Tidak membuat file backup
vim.o.backup = false
-- Cegah pengeditan jika file sedang dibuka di program lain
vim.o.writebackup = false
-- Konfigurasi menu autocomplete agar lebih baik
vim.o.completeopt = "menuone,noselect"
-- Aktifkan dukungan warna true color
vim.opt.termguicolors = true
-- Izinkan tombol navigasi tertentu berpindah antar baris
vim.o.whichwrap = "bs<>[]hl"
-- Jangan membungkus baris panjang (ditampilkan dalam satu baris horizontal)
vim.o.wrap = true
-- Jika membungkus baris, pecah baris di spasi, bukan di tengah kata
vim.o.linebreak = true
-- Selalu tampilkan minimal 4 baris di atas/bawah kursor
vim.o.scrolloff = 4
-- Tampilkan minimal 8 kolom di kiri/kanan kursor jika tidak membungkus baris
vim.o.sidescrolloff = 8
-- Tampilkan nomor relatif pada baris selain baris aktif
vim.o.relativenumber = true
-- Lebar kolom nomor baris (default: 4)
vim.o.numberwidth = 4
-- Jumlah spasi untuk setiap indentasi (ketika menggunakan `>>` atau `<<`)
vim.o.shiftwidth = 4
-- Nilai tab dianggap sebagai 4 spasi
vim.o.tabstop = 4
-- Spasi yang dihitung saat menekan <Tab> dalam mode insert
vim.o.softtabstop = 4
-- Ubah tab menjadi spasi
vim.o.expandtab = true
-- Jangan sorot baris tempat kursor berada
vim.o.cursorline = false
-- Buka jendela horizontal baru di bawah jendela aktif
vim.o.splitbelow = true
-- Buka jendela vertikal baru di kanan jendela aktif
vim.o.splitright = true
-- Nonaktifkan pembuatan file swap
vim.o.swapfile = false
-- Aktifkan indentasi otomatis yang cerdas
vim.o.smartindent = true
-- Jangan tampilkan mode seperti -- INSERT --
vim.o.showmode = false
-- Selalu tampilkan tab line meskipun hanya ada satu tab
vim.o.showtabline = 2
-- Izinkan tombol backspace untuk menghapus indentasi, akhir baris, dan karakter sebelum insert
vim.o.backspace = "indent,eol,start"
-- Tinggi maksimum menu popup autocomplete
vim.o.pumheight = 10
-- Tampilkan karakter tersembunyi (contohnya `` di markdown)
vim.o.conceallevel = 0
-- Gunakan encoding UTF-8 saat menyimpan file
vim.o.fileencoding = "utf-8"
-- Ukuran baris command line (menentukan ruang untuk pesan)
vim.o.cmdheight = 1
-- Gunakan indentasi baris sebelumnya saat membuat baris baru
vim.o.autoindent = true
-- Sembunyikan pesan tambahan dari menu autocomplete
vim.opt.shortmess:append("c")
-- Perlakukan tanda `-` sebagai bagian dari kata saat mencari
vim.opt.iskeyword:append("-")
-- Jangan otomatis menambahkan komentar saat pindah baris atau menulis
vim.opt.formatoptions:remove({ "c", "r", "o" })
