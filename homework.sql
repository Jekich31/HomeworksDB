--ALTER TABLE Wizards 
--ALTER COLUMN BloodStatus ADD MASKED WITH (FUNCTION = 'partial(0, "XXXXX", 0)');

--SELECT TrackId, WizardName, Location, MovementTime
--FROM MaraudersMapLogs
--WHERE MovementTime >= '2026-06-01' 
--  AND MovementTime < '2026-07-01';