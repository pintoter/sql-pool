CREATE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $$
  BEGIN
  IF TG_OP = 'UPDATE' THEN
      INSERT INTO person_audit(created,type_event,row_id, name, age, gender, address)
      VALUES ((SELECT current_timestamp AT TIME ZONE 'Europe/Moscow'),
              'U',OLD.id, OLD.name,OLD.age,OLD.gender,OLD.address);
  END IF;
  RETURN NEW;
  END;
$$ language plpgsql;


CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;