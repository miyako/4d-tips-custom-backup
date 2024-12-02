//%attributes = {"invisible":true,"preemptive":"capable"}
TRUNCATE TABLE:C1051([Backup:2])
SET DATABASE PARAMETER:C642([Backup:2]; Table sequence number:K37:31; 0)

$options:={}

$options.compression:=ZIP Compression XZ:K91:10
$options.level:=10

If ($options.compression=ZIP Compression standard:K91:1) || ($options.compression=ZIP Compression none:K91:2)
	$options.encryption:=ZIP Encryption AES256:K91:6
	$options.password:="1234"
End if 

var $backup : 4D:C1709.Entity
$backup:=ds:C1482.Backup.archive($options)
$backup:=ds:C1482.Backup.archive()  //standard zip
$backup:=ds:C1482.Backup.copy()

SHOW ON DISK:C922(Folder:C1567("/PACKAGE/Backups/").platformPath)