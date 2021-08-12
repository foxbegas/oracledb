--user/password@SID AS STANDARD; setzt voraus, dass die Tabelle users mit dem Feld pers_id exisitiert

select * from users u where u.username ='USERNAME';
-- select * from users u where getdescbyid(u.pers_id) like 'ID%';