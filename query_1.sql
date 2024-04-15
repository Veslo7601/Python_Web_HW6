-- 
SELECT 
    s.id AS student_id,
    s.first_name,
    s.last_name,
    AVG(j.rating) AS average_grade
FROM 
    students s
JOIN 
    journal j ON s.id = j.student_id
GROUP BY 
    s.id
ORDER BY 
    average_grade DESC
LIMIT 5;