SELECT vf.name AS name
FROM v_persons_female vf
UNION 
SELECT vm.name AS name
FROM v_persons_male vm
ORDER BY name;
