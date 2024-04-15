SELECT 
    s.id AS student_id,
    s.first_name,
    s.last_name,
    AVG(j.rating) AS average_grade
FROM 
    students s
JOIN 
    journal j ON s.id = j.student_id
JOIN 
    teaching_subjects ts ON j.subject_id = ts.id
WHERE 
    ts.subject_name = 'Курс - Історія'
GROUP BY 
    s.id
ORDER BY 
    average_grade DESC
LIMIT 1;