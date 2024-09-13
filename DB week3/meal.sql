---Data model:
create database mealsharing;

CREATE TABLE Meal (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     title VARCHAR(255) NOT NULL,
    ->     description TEXT,
    ->     location VARCHAR(255),
    ->     `when` DATETIME,
    ->     max_reservations INT,
    ->     price DECIMAL(10, 2),
    ->     created_date DATE
    -> );
	
	CREATE TABLE Reservation (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     number_of_guests INT NOT NULL,
    ->     meal_id INT,
    ->     created_date DATE,
    ->     contact_phonenumber VARCHAR(20),
    ->     contact_name VARCHAR(255),
    ->     contact_email VARCHAR(255),
    ->     FOREIGN KEY (meal_id) REFERENCES Meal(id)
    -> );
	
	CREATE TABLE Review (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     title VARCHAR(255),
    ->     description TEXT,
    ->     meal_id INT,
    ->     stars INT,
    ->     created_date DATE,
    ->     FOREIGN KEY (meal_id) REFERENCES Meal(id)
    -> );
	
	INSERT INTO Meal (title, description, location, `when`, max_reservations, price, created_date)
    -> VALUES 
    -> ('Italian Dinner', 'A classic Italian meal with pasta and wine', 'Rome, Italy', '2024-09-20 18:30:00', 50, 29.99, '2024-09-10'),
    -> ('Mexican Fiesta', 'Authentic Mexican dishes with spicy options', 'Mexico City, Mexico', '2024-09-21 19:00:00', 60, 24.99, '2024-09-10'),
    -> ('Sushi Night', 'Fresh sushi from Japan with sake', 'Tokyo, Japan', '2024-09-22 20:00:00', 40, 34.99, '2024-09-10');
	
	INSERT INTO Reservation (number_of_guests, meal_id, created_date, contact_phonenumber, contact_name, contact_email)
    -> VALUES
    -> (4, 1, '2024-09-15', '123-456-7890', 'John Doe', 'john@example.com'),
    -> (2, 2, '2024-09-16', '987-654-3210', 'Jane Smith', 'jane@example.com'),
    -> (3, 3, '2024-09-17', '456-789-1234', 'Carlos Lopez', 'carlos@example.com');
	
	INSERT INTO Review (title, description, meal_id, stars, created_date)
    -> VALUES 
    -> ('Amazing Dinner!', 'The Italian Dinner was fantastic, great food and atmosphere.', 1, 5, '2024-09-21'),
    -> ('Spicy and Delicious', 'The Mexican Fiesta had the best tacos I have ever had!', 2, 4, '2024-09-22'),
    -> ('Fresh Sushi!', 'Loved the Sushi Night, everything was very fresh and tasty.', 3, 5, '2024-09-23');
	
	
	--Meal
	--get all meal:
	 select * from meal;
	 +----+----------------+---------------------------------------------+---------------------+---------------------+------------------+-------+--------------+
| id | title          | description                                 | location            | when                | max_reservations | price | created_date |
+----+----------------+---------------------------------------------+---------------------+---------------------+------------------+-------+--------------+
|  1 | Italian Dinner | A classic Italian meal with pasta and wine  | Rome, Italy         | 2024-09-20 18:30:00 |               50 | 29.99 | 2024-09-10   |
|  2 | Mexican Fiesta | Authentic Mexican dishes with spicy options | Mexico City, Mexico | 2024-09-21 19:00:00 |               60 | 24.99 | 2024-09-10   |
|  3 | Sushi Night    | Fresh sushi from Japan with sake            | Tokyo, Japan        | 2024-09-22 20:00:00 |               40 | 34.99 | 2024-09-10   |
+----+----------------+---------------------------------------------+---------------------+---------------------+------------------+-------+--------------+
	 
	 --add a meal:
	 INSERT INTO Meal (title, description, location, `when`, max_reservations, price, created_date)
VALUES 
('French Gourmet Night', 'A luxurious French meal featuring fine wines and gourmet dishes', 'Paris, France', '2024-09-25 19:00:00', 30, 49.99, '2024-09-10');




select * from Meal where id = 2;


UPDATE Meal
    -> SET title = 'Italian Gourmet Dinner', 
    ->     price = 39.99,
    ->     location = 'Venice, Italy'
    -> WHERE id = 1;
	
	--Delete a meal with any id, fx 1
	alter table Reservation DROP FOREIGN KEY Reservation_ibfk_1;    
	alter table Reservation
    -> add constraint Reservation_ibfk_1
    -> FOREIGN KEY (meal_id) REFERENCES Meal(id) ON DELETE CASCADE;
	