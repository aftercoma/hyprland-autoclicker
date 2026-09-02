# hyprland-autoclicker

Bikin autoclicker di Wayland/Hyprland sering bikin pusing gara-gara isu permission `uinput` atau XClicker yang ga mempan di native Wayland. 

Script Bash simpel ini pakai `wlrctl` buat kirim perintah klik secara native tanpa perlu daemon, akses root, atau ngotak-ngatik `/dev/uinput`. Dibuat khusus buat cegah idle DC / AFK farming di Roblox (Sober) atau game lainnya.

## Fitur
- Native Wayland (`wlrctl`), ringan tanpa dependencies aneh-aneh.
- Ga butuh `sudo` atau konfig udev rule.
- Ada fitur interval & double-click bawaan.

## Requirement
Pastikan `wlrctl` udah terinstal:

- **Fedora:** `sudo dnf install wlrctl`
- **Arch:** `sudo pacman -S wlrctl`

## Cara Pakai

1. Clone repo ini dan beri izin eksekusi:
   ```bash
   git clone [https://github.com/aftercoma/hyprland-autoclicker.git](https://github.com/aftercoma/hyprland-autoclicker.git)
   cd hyprland-autoclicker
   chmod +x afk_farm.sh
   ```

2. Jalankan langsung di terminal:
   ```bash
   ./afk_farm.sh
   ```

3. (Opsional) Pasang shortcut di `hyprland.conf`:
   ```ini
   bind = , F6, exec, /path/ke/afk_farm.sh
   ```

---
Dibuat karena ribet nyari autoclicker yang pas di Hyprland.
