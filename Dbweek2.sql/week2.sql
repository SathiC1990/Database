
Add a task with these attributes: title, description, created, updated, due_date, status_id, user_id
mysql> INSERT INTO task (title, description, created, updated, due_date, status_id, user_id)
    -> VALUES ('Cooking', 'Mexican Cuisine', NOW(), NOW(), '2024-09-30 16:00:00', 1, 1);
	
	--Change the title of a task
	update task set title ='Grocery Shopping'  where title = 'New Task Title'; 
	
--Change a task due date	
	update task  set due_date = '2024-09-10' where due_date = '2024-09-30 16:00:00'; 
	
	--Change a task status
	update task set status_id = 3 where status_id = 2;
	
	--Mark a task as complete
	update task set status_id = 3 where status_id =1;  

--Delete a task
delete from task where title = 'New Task Title'	





-- create database
create database school;
-- select database
use school;
-- Create the Class table
CREATE TABLE Class (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    begins DATE NOT NULL,
    ends DATE NOT NULL
);

-- Create the Student table
CREATE TABLE Student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    class_id INT,
    CONSTRAINT fk_class
        FOREIGN KEY (class_id) REFERENCES Class(id)
        ON DELETE SET NULL -- You can change this behavior as needed
        ON UPDATE CASCADE
);


-- Create an index on the name column of the Student table
CREATE INDEX idx_student_name ON Student(name);

-- Add status column to the Class table with ENUM values
ALTER TABLE Class
ADD COLUMN status ENUM('not-started', 'ongoing', 'finished') NOT NULL DEFAULT 'not-started';


update Student set address='Glostrup' where name='Biswajit';



--
select task.* from task join user on task.user_id = user.id where  user.email like '%@spotify.com';  


select task.* from task 
join user on user.id = task.user_id
join status on status.id = task.status_id
where user.name= 'Donald Duck' 
	and status.name= 'Not started';
	
select t.* from task t            
    join user u  on t.user_id=u.id    
    join status s on t.status_id=s.id
    where u.name = 'Maryrose Meadows'
		and MONTH(t.created) = 9;  
		
SELECT YEAR(created) AS year, MONTH(created) AS month, COUNT(*) AS task_count
    FROM task
    GROUP BY YEAR(created), MONTH(created);
--or
SELECT MONTH(created) AS month, COUNT(*) AS task_count
	FROM task
	GROUP BY MONTH(created); 