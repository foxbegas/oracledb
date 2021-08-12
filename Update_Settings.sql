--einfaches Update-Beispiel; Mailserver
connect user as normal;

update user_settings set VALUE='mailserver.domain' where SUBJECT='EMAIL' and ITEM='HOST';
update user_settings set VALUE='25' where SUBJECT='EMAIL' and ITEM='PORT';
update user_settings set VALUE='anonym' where SUBJECT='EMAIL' and ITEM='SMTP_AUTH';

--Anpassen der Farben eines bestimmten UI's
prompt "Passe Farben an..."

	update schema.user_settings set value ='olive' where  subject = '<SUBJECT>' and item = 'BACKCOLOR';
	update schema.user_settings set value ='wheat' where  subject = '<SUBJECT>' and item = 'BUTTONFACECOLOR';

prompt "Farben angepasst."

commit;
exit