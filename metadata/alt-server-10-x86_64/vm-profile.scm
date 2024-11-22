((server
  (title . "Setup for server")
  (action . trivial)
  (actiondata
               ; Disk size in sectors
               ; Calculating: disk_size (M) * 1024 * 2 - 4096
               ; 5 GiB
               ("/" (size 10481664 . #t ) (fsim . "Ext2/3") (methods plain))
               )))
