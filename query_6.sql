SELECT 
    s.id,
    s.first_name,
    s.last_name,
    s.groups_id 
FROM 
    students s
WHERE 
	s.groups_id = 1