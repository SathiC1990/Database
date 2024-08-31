--Find out how many tasks are in the task table
 select count(*) from task;
--Find out how many tasks in the task table do not have a valid due date
select count(*) from task where due_date is null;
--Find all the tasks that are marked as done
select t.* from task t    
   left join status s on s.id=t.status_id
   where s.name='Done';
--Find all the tasks that are not marked as done
select t.* from task t
   left join status s on s.id=t.status_id
   where s.name !='Done' || t.status_id is null;
--Get all the tasks, sorted with the most recently created first
select * from task order by  created desc; 
--Get the single most recently created task
select * from task order by  created desc limit 1;
--Get the title and due date of all tasks where the title or description contains database
select title, due_date from task where title like '%database%' || description like '%database%';
--Get the title and status (as text) of all tasks
select t.title, s.name from task t                                     
   left join status s on s.id=t.status_id;
--Get the name of each status, along with a count of how many tasks have that status
select s.name, count(t.id) as task_count from status s
   left join task t on s.id=t.status_id
   group by s.name;
--Get the names of all statuses, sorted by the status with most tasks first
.select s.name, count(t.id) as task_count from status s
   left join task t on s.id=t.status_id
   group by s.name order by task_count desc; 