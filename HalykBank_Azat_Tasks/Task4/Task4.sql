-- In this task, let's parse string which represents 
-- set of int values, for example ID of some products


-- this is our input string with ID
declare @input_str nvarchar(100) = '2021,1999,3,11,324,';
 
-- create a table with name task4 
-- to store our ID
declare @task4 table (id int);
 

-- create a variable which saves delimiter
declare @delimiter nvarchar(1) = ','
 
-- defining position of first delimiter
declare @pos int = charindex(@delimiter,@input_str)
 

-- create a variable to store one ID
declare @id nvarchar(10)
    
while (@pos != 0)
begin
    -- we will get ID
    set @id = SUBSTRING(@input_str, 1, @pos-1)
    -- write it to the table
    insert into @task4 (id) values(cast(@id as int))
    -- we will reduce size of string
	-- by the size of the getted ID and delimiter
    set @input_str = SUBSTRING(@input_str, @pos+1, LEN(@input_str))
    -- defining position of next delimiter
    set @pos = CHARINDEX(@delimiter,@input_str)
end


SELECT * FROM @task4