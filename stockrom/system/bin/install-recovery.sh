#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 6768640 408ba509d2aad104c67b7e57430102ab02d42d2b 4397056 6159d4cddc815570a929619a3b04c736667bc94a
fi

if ! applypatch -c EMMC:/dev/block/platform/dw_mmc/by-name/RECOVERY:6768640:408ba509d2aad104c67b7e57430102ab02d42d2b; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/dw_mmc/by-name/BOOT:4397056:6159d4cddc815570a929619a3b04c736667bc94a EMMC:/dev/block/platform/dw_mmc/by-name/RECOVERY 408ba509d2aad104c67b7e57430102ab02d42d2b 6768640 6159d4cddc815570a929619a3b04c736667bc94a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
