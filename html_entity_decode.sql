-- Create the HTML entity table
CREATE TABLE html_entities (
    code INT PRIMARY KEY,
    character VARCHAR(10)
);

-- Populate the HTML entity table with some sample data
INSERT INTO html_entities (code, character)
VALUES 
    (34, '"'),
    (38, '&'),
    (60, '<'),
    (62, '>'),
    (160, ' '),
    (162, '¢'),
    (163, '£'),
    (165, '¥'),
    (169, '©'),
    (174, '®'),
    (176, '°'),
    (181, 'µ'),
    (215, '×'),
    (247, '÷'),
    (8364, '€');

-- Define the HTML entity decoding function using the HTML entity table
DELIMITER //

CREATE FUNCTION html_entity_decode(input_text TEXT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE output_text TEXT;
    SET output_text = input_text;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT code, character FROM html_entities;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO code, char;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET output_text = REPLACE(output_text, CONCAT('&#", code, ';'), char);
    END LOOP;
    CLOSE cur;
    RETURN output_text;
END//

DELIMITER ;
