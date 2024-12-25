-- 3.Truy van du lieu
-- Truy vấn tất cả thông tin sinh viên (tên, họ, email).
SELECT first_name, last_name, email
FROM Students;
-- Truy vấn tất cả khóa học (tên khóa học, mô tả)
SELECT course_name, course_description
FROM Courses;
-- Truy vấn danh sách sinh viên cùng khóa học họ đăng ký (bao gồm tên sinh viên và tên khóa học).
SELECT CONCAT(s.first_name, ' ', s.last_name) student_name,
       c.course_name
FROM Enrollments e
         JOIN Students s ON e.student_id = s.id
         JOIN Courses c ON e.course_id = c.id;
-- Truy vấn danh sách sinh viên đã đăng ký khóa học "Lập Trình Cơ Bản".
SELECT CONCAT(s.first_name, ' ', s.last_name) student_name,
       c.course_name
FROM Enrollments e
         JOIN Students s ON e.student_id = s.id
         JOIN Courses c ON e.course_id = c.id
WHERE c.course_name = 'Lập Trình Cơ Bản';
-- Truy vấn các sinh viên có ngày sinh sau ngày 2000-01-01 và có email chứa từ "example".
SELECT first_name, last_name, email
FROM Students
WHERE birth_date > '2000-01-01'
  AND email LIKE '%example%';
-- 4.Update
-- · Cập nhật email của sinh viên có student_id = 1 thành một địa chỉ email mới.
UPDATE Students
SET email = 'new.email@example.com'
WHERE id = 1;
-- · Cập nhật mô tả của khóa học "Lập Trình Cơ Bản" thành mô tả mới.
UPDATE Courses
SET course_description = 'This is course about programming and algorithms.'
WHERE course_name = 'Computer Science';
-- 5.DELETE
-- · Xóa một sinh viên cụ thể khỏi bảng Students (chỉ xóa nếu sinh viên không có bất kỳ khóa học nào đã đăng ký).
DELETE
FROM Students
WHERE id = 1
  AND NOT EXISTS (SELECT 1
                  FROM Enrollments
                  WHERE Enrollments.student_id = Students.id);
-- · Xóa một khóa học khỏi bảng Courses (chỉ xóa nếu khóa học đó không có sinh viên nào đã đăng ký
DELETE
FROM Courses
WHERE id = 1
  AND NOT EXISTS (SELECT 1
                  FROM Enrollments
                  WHERE Enrollments.course_id = Courses.id);
-- 6. Toan tu
-- o Truy vấn các sinh viên có ngày sinh lớn hơn 2000-01-01.
SELECT first_name, last_name, email
FROM Students
WHERE birth_date > '2000-01-01';
-- o Truy vấn tất cả các sinh viên có tên bắt đầu bằng "Nguyen".
SELECT first_name, last_name, email
FROM Students
WHERE last_name LIKE 'Nguyen%';
-- Truy vấn tất cả các sinh viên có ngày sinh sau 2000-01-01 và đã đăng ký khóa học "Toán Học".
SELECT s.*
FROM Students s
         JOIN Enrollments e
              ON s.id = e.student_id
         JOIN Courses c ON e.course_id = c.id
WHERE s.birth_date
    > '2000-01-01'
  AND c.course_name = 'Mathematics';
-- o Truy vấn các sinh viên đã đăng ký các khóa học có course_id trong danh sách 101, 102.
SELECT s.first_name,
       s.last_name,
       s.email,
       e.course_id
FROM Students s
         JOIN Enrollments e ON s.id = e.student_id
WHERE e.course_id IN (101, 102);
-- Truy vấn các khóa học có course_id nằm trong khoảng từ 101 đến 103.
SELECT s.first_name,
       s.last_name,
       s.email,
       e.course_id
FROM Students s
         JOIN Enrollments e ON s.id = e.student_id
WHERE e.course_id BETWEEN 101 AND 103;