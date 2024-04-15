SELECT 
    s.first_name,
    s.last_name,
    ts.subject_name,
    j.rating,
    j.date_of_rating,
    g.group_name 
FROM 
    students s
JOIN 
    groups g ON s.groups_id = g.id
JOIN 
    journal j ON s.id = j.student_id
JOIN 
    teaching_subjects ts ON j.subject_id = ts.id
WHERE 
    g.group_name = 'Група: Продвинутий Хімія'
    AND ts.subject_name = 'Курс - Математика';