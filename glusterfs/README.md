This is an example of using glusterfs in Kubernetes

GlusterFS cluster should be installed and respective gluster volume mounted on clients. For example: /mnt/storage
http://gluster.readthedocs.io/en/latest/Quick-Start-Guide/Quickstart/

Add in /etc/fstab:
```
/dev/vdb1 /data/brick1 xfs defaults 0 0
srv2:/gv0 /mnt/storage/ glusterfs defaults 0 0
```
