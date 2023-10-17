DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit() CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit() CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit() CASCADE;
TRUNCATE person_audit;


CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $$
  BEGIN
      IF (TG_OP = 'INSERT') THEN
          INSERT INTO person_audit (type_event,row_id, name, age, gender, address)
          VALUES ('I',NEW.id,NEW.name,NEW.age,NEW.gender,NEW.address);
      ELSIF TG_OP = 'UPDATE' THEN
          INSERT INTO person_audit(type_event,row_id, name, age, gender, address)
          VALUES ('U',OLD.id, OLD.name,OLD.age,OLD.gender,OLD.address);
      ELSIF TG_OP = 'DELETE' THEN
          INSERT INTO person_audit(type_event,row_id, name, age, gender, address)
          VALUES ('D',OLD.id, OLD.name,OLD.age,OLD.gender,OLD.address);
      END IF;
      RETURN NEW;
  END;
$$ language plpgsql;

CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
