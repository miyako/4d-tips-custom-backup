# 4d-tips-custom-backup
simple POC featuring [`ds.flushAndLock()`](https://developer.4d.com/docs/ja/API/DataStoreClass/#flushandlock)

feature introduction: [4D Backup, VSS snapshots and the new commands to lock the datastore](https://blog.4d.com/4d-backup-vss-snapshots-and-the-new-commands-to-lock-the-datastore/)

## Points of interest

* the `ds.Backup` class calls `ds.flushAndLock()` and `ds.unlock()`
* the process that locks the data store can still create and save records
* other processes must wait until the `ds.unlock()`; commands are suspended indefinitely
* the backup process can use `ZIP Create archive`, `Folder.copyTo()`, or any other alternative to `BACKUP`
