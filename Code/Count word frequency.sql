CREATE FUNCTION [dbo].[fn_SplitString]   
(   
    @String VARCHAR(8000),   
    @Delimiter VARCHAR(255)   
)   
RETURNS   
@Results TABLE   
(   
    ID INT IDENTITY(1, 1),   
    Item VARCHAR(8000)   
)   
AS   
BEGIN   
INSERT INTO @Results (Item)   
SELECT SUBSTRING(@String+@Delimiter, num,   
    CHARINDEX(@Delimiter, @String+@Delimiter, num) - num)   
FROM Numbers   
WHERE num <= LEN(REPLACE(@String,' ','|'))   
AND SUBSTRING(@Delimiter + @String,   
            num,   
            LEN(REPLACE(@delimiter,' ','|'))) = @Delimiter   
ORDER BY num RETURN   
END   



SELECT News, count(1)
FROM ticket_diary_comment 
    CROSS APPLY dbo.fn_SplitString(content, ' ')
GROUP BY item