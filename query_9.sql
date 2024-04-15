SELECT DISTINCT 
    ts.subject_name
FROM 
    journal j
JOIN 
    teaching_subjects ts ON j.subject_id = ts.id
WHERE 
    j.student_id = 30;