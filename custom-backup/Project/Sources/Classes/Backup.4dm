Class extends DataClass

exposed Function copy() : 4D:C1709.Entity
	
	return This:C1470._backup()
	
exposed Function archive($options : Object) : 4D:C1709.Entity
	
	If ($options=Null:C1517)
		$options:={}
		$options.compression:=ZIP Compression standard:K91:1
		$options.level:=10
	End if 
	
	return This:C1470._backup($options)
	
Function _backup($options : Object) : 4D:C1709.Entity
	
	var $targetFolder : 4D:C1709.Folder
	$targetFolder:=Folder:C1567("/PACKAGE/Backups/")
	$targetFolder.create()
	
	var $backup : cs:C1710.BackupEntity
	$backup:=This:C1470.new()
	$backup.start:=Timestamp:C1445
	$status:=$backup.save()
	
	ds:C1482.flushAndLock()
	
	If ($options#Null:C1517)
		
		$options.files:=[Folder:C1567("/DATA/")]
		$backup.zip:=$targetFolder.file(String:C10($backup.getKey(dk key as string:K85:16))+".zip")
		$backup.status:=ZIP Create archive:C1640($options; $backup.zip)
		
	Else 
		
		$backup.zip:=$targetFolder.folder(String:C10($backup.getKey(dk key as string:K85:16)))
		$backup.zip.create()
		$backup.status:=Folder:C1567("/DATA/").copyTo($backup.zip)
		
	End if 
	
	$backup.end:=Timestamp:C1445
	$status:=$backup.save()
	
	//TRACE
	
	ds:C1482.unlock()
	
	return $backup