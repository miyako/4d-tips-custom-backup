# 4d-tips-custom-backup
simple POC featuring [`ds.flushAndLock()`](https://developer.4d.com/docs/ja/API/DataStoreClass/#flushandlock)

feature introduction: [4D Backup, VSS snapshots and the new commands to lock the datastore](https://blog.4d.com/4d-backup-vss-snapshots-and-the-new-commands-to-lock-the-datastore/)

## How do I…?

1. open in client server or desktop
2. run the method [`test_special_backup`](https://github.com/miyako/4d-tips-custom-backup/blob/main/custom-backup/Project/Sources/Methods/test_special_backup.4dm)
3. uncomment the `TRACE`
4. run the method [`test_save`](https://github.com/miyako/4d-tips-custom-backup/blob/main/custom-backup/Project/Sources/Methods/test_save.4dm) while custom backup is ongoing

## Points of interest

* the `ds.Backup` class calls `ds.flushAndLock()` and `ds.unlock()`
* the process that locks the data store can still create and save records
* other processes must wait until the `ds.unlock()`; commands are suspended indefinitely
* the backup process can use `ZIP Create archive`, `Folder.copyTo()`, or any other alternative to `BACKUP`
