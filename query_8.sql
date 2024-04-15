SELECT 
    t.first_name,
    t.last_name,
    AVG(j.rating) AS average_rating
FROM 
    journal j
JOIN 
    teaching_subjects ts ON j.subject_id = ts.id
JOIN 
    teachers t ON ts.teachers_id = t.id
WHERE 
    t.id = 3;