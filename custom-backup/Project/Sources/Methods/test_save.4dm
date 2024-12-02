//%attributes = {"invisible":true,"preemptive":"capable"}
/*

run this method while ds.Backup.run() is running
.save() will lock until ds.unlock() on the server side

*/

var $e : 4D:C1709.Entity
$e:=ds:C1482.Table_1.new()
$status:=$e.save()