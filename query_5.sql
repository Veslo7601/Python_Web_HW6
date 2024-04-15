SELECT 
    ts.subject_name
FROM 
    teaching_subjects ts
JOIN 
    teachers t ON ts.teachers_id = t.id
WHERE 
    t.id = 2;