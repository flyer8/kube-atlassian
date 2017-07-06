This is an example of using glusterfs for nginx virtual hosts. 

GlusterFS cluster should be installed and respective gluster volume mounted on clients.
For example: /mnt/storage

To /etc/fstab add for example:
```
/dev/vdb1 /data/brick1 xfs defaults 0 0
srv2:/gv0 /mnt/storage/ glusterfs defaults 0 0
```
