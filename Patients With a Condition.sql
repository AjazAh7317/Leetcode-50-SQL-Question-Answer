SELECT 
  patient_id, 
  patient_name, 
  conditions
FROM Patients
WHERE conditions REGEXP '\\bDIAB1';
