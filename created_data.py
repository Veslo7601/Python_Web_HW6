from datetime import datetime
import faker
from random import randint, choice, shuffle
import sqlite3

NUMBER_STUDENTS = randint(30, 50)
NUMBER_GROUP = 3
NUMBER_TEACHING_SUBJECTS = randint(5, 8)
NUMBER_TEACHERS = randint(3, 5)

DISCIPLINE = ['Математика', 'Фізика', 'Історія', 'Біологія', 
                'Хімія', 'Література', 'Економіка', 'Психологія',
                'Філософія', 'Соціологія','Англійська', 'Німецька']

DISCIPLINE_TYPES = ['Вступний', 'Продвинутий',
                    'Спеціалізований', 'Практичний',
                    'Теоретичний']


def generate_fake_data(namber_students,
                       number_group,
                       number_teaching_subjects,
                       number_teachers):

    fake_namber_students = generate_data(namber_students, "name", number_group)
    fake_number_group = generate_data(number_group, "group")
    fake_number_teaching_subjects = generate_data(number_teaching_subjects, "subject", number_teachers)
    fake_number_teachers = generate_data(number_teachers, "name")
    fake_number_rating = fake_rating(number_teaching_subjects)

    return fake_namber_students, fake_number_group, fake_number_teaching_subjects, fake_number_teachers, fake_number_rating

def generate_data(namber, key, count=None):
    data = []
    print(namber)
    fake_connand = {
        "name" : fake_name,
        "group" : fake_group,
        "subject": fake_teaching_subject,
    }
    for _ in range(0, namber):
        value = fake_connand[key](count)
        data.append(value)
    print(data)
    return data

def fake_name(count=None):
    fake = faker.Faker('uk_UA')
    value = fake.name()
    value = value.split(" ")
    if count is not None:
        return (value[0], value[1], randint(1, count))
    else:
        return (value[0], value[1])

def fake_group(count=None):
    shuffle(DISCIPLINE)
    discipline = DISCIPLINE.pop()
    course_type = choice(DISCIPLINE_TYPES)
    return ((f"Група: {course_type} {discipline}"), )

def fake_teaching_subject(count=None):
    shuffle(DISCIPLINE)
    value = DISCIPLINE.pop()
    return ((f"Курс - {value}"), randint(1, count))

def fake_rating(namber):
    date = []
    for id_subject in range(1, namber+1):
        rating_date = datetime(year=2022,month=4,day=randint(1,20)).date()
        for id_student in range(1,NUMBER_STUDENTS+1):
            date.append((id_student, id_subject, rating_date, randint(40, 100)))
    print(date)
    return date


def app_data_to_db(students, groups, subjects, teachers, rating):

    with sqlite3.connect("jornal.db") as con:
        cur = con.cursor()

        sql_to_students = """INSERT INTO students(first_name, last_name, groups_id)
                               VALUES (?, ?, ?)"""
        cur.executemany(sql_to_students, students)

        sql_to_groups = """INSERT INTO groups(group_name)
                               VALUES (?)"""
        cur.executemany(sql_to_groups, groups)

        sql_to_teaching_subjects = """INSERT INTO teaching_subjects(subject_name, teachers_id)
                               VALUES (?, ?)"""
        cur.executemany(sql_to_teaching_subjects, subjects)

        sql_to_teachers = """INSERT INTO teachers(first_name, last_name)
                               VALUES (?, ?)"""
        cur.executemany(sql_to_teachers, teachers)

        sql_to_rating = """INSERT INTO journal(student_id, subject_id, date_of_rating, rating)
                               VALUES (?, ?, ?, ?)"""
        cur.executemany(sql_to_rating, rating)

if __name__ == "__main__":

    students, groups, subjects, teachers, rating =  generate_fake_data(NUMBER_STUDENTS,
                                                                NUMBER_GROUP,
                                                                NUMBER_TEACHING_SUBJECTS,
                                                                NUMBER_TEACHERS)
    app_data_to_db(students, groups, subjects, teachers, rating)
