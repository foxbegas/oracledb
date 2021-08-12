// https://stackoverflow.com/questions/187886/
BEGIN
   FOR R IN (SELECT owner, table_name FROM all_tables WHERE owner='TheOwner') LOOP
      EXECUTE IMMEDIATE 'grant select on '||R.owner||'.'||R.table_name||' to TheUser';
   END LOOP;
END; 