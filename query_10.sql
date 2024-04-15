SELECT DISTINCT 
    ts.subject_name,
    t.first_name,
    t.last_name,
    j.student_id 
FROM 
    journal j
JOIN 
    teaching_subjects ts ON j.subject_id = ts.id
JOIN 
    teachers t ON ts.teachers_id = t.id
WHERE 
    j.student_id = 22 AND t.id = 2;