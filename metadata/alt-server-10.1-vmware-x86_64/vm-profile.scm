((server
  (title . "Setup for server")
  (action . trivial)
  (actiondata
               ; Disk size in sectors
               ; Calculating: disk_size (M) * 1024 * 2
               ; 10 MiB (for BIOS boot partition)
               ("" (size 20480 . 20480) (methods plain))
               ; The rest.
               ; 3.7 (GiB) * 1024 * 1024 * 2
               ("/" (size 7759463 . #t) (fsim . "Ext2/3") (methods plain))
               )))

