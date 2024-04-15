SELECT 
    g.group_name,
    AVG(j.rating) AS average_grade
FROM 
    groups g
JOIN 
    students s ON g.id = s.groups_id
JOIN 
    journal j ON s.id = j.student_id
JOIN 
    teaching_subjects ts ON j.subject_id = ts.id
WHERE 
    ts.subject_name = 'Курс - Німецька'
GROUP BY 
    g.group_name
ORDER BY 
    g.group_name;