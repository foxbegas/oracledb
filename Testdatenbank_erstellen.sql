/*
2020.12.09
Testdatenbank: Zur Neuerstellung leeren und vorbereiten; muss bereits vorhanden sein!
V0.9
*/

--Sicherheitscheck, damit nicht die falsche Datenbank verwendet wird
--! Bricht derzeit noch mit einem Fehler ab, wenn die SID falsch ist. Auch gut.
prompt "Überprüfe SID..."

DECLARE
  my_sid varchar2(7);

BEGIN
  DBMS_OUTPUT.ENABLE (buffer_size => NULL);
  SELECT sys_context('userenv','instance_name') INTO my_sid FROM dual;
  --DBMS_OUTPUT.put_line(jg_sid);
  IF my_sid != '<TESTSID>' THEN
    --RAISERROR ('SID falsch', 10,1) WITH NOWAIT;
    return;
    --exit WHEN jg_sid != 'IMSTEST';
    END IF;
END;
/
prompt "SID korrekt."

--Datenbank herunterfahren und im Single-Usermode starten.
prompt "Wartungsmodus aktivieren..."

	shutdown immediate;
	--EXEC  dbms_lock.sleep (20);
	startup restrict;
	EXEC  dbms_lock.sleep (20);

prompt "Wartungsmodus aktiv."

--Rollen löschen
prompt "Lösche Rollen..."

	drop user <user> cascade;
	drop role <ROLE>;

prompt "Rollen gelöscht."

--Rollen neu erstellen, hier werden ein paar Beispiele aufgeführt
prompt "Erstelle Rollen neu..."

	create role <ROLE> not identified;
	grant SELECT ANY SEQUENCE to <ROLE>;
	grant CREATE SESSION to <ROLE>;

	create user <user> identified by <password>;
	alter user <user> quota unlimited on <user>;
	alter user <user> default tablespace <user>;
	alter user <user> temporary tablespace temp;
	grant select on sys.dba_objects to <user>;
	grant select on sys.dba_jobs to <user>;
	grant select on all_objects to <user>;
	grant select on gv_$session to <user>;
	grant CREATE ANY SYNONYM to <user>;
	grant create view to <user>;
	grant alter session to <user>;
	grant EXECUTE ON SYS.DBMS_PIPE to <user>;
	grant execute on sys.dbms_crypto to <user>;
	grant CREATE TABLE to <user>;
	grant CREATE SEQUENCE to <user>;
	grant CREATE TRIGGER to <user>;
	grant CREATE PROCEDURE to <user>;
	grant <ROLE> to <user>;
	grant debug connect session to <user>;
	grant create type to <user>;
	grant create materialized view to <user>;
	
prompt "Rollen neu erstellt."

Commit;
exit