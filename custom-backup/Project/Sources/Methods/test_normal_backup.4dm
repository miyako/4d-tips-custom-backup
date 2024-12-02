//%attributes = {"invisible":true,"preemptive":"incapable"}
BACKUP:C887

var $lastDate : Date
var $lastTime : Time
GET BACKUP INFORMATION:C888(Last backup date:K54:1; $lastDate; $lastTime)

var $duration : Integer
var $timestamp : Text
GET BACKUP INFORMATION:C888(Last Backup information:K54:12; $duration; $timestamp)

var $status : Integer
var $message : Text
GET BACKUP INFORMATION:C888(Last backup status:K54:2; $status; $message)

var $nextDate : Date
var $nextTime : Time
GET BACKUP INFORMATION:C888(Last backup date:K54:1; $nextDate; $nextTime)