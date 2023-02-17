DELIMITER //
CREATE FUNCTION html_entity_decode(input_text TEXT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    RETURN REPLACE(REPLACE(REPLACE(input_text, '&lt;', '<'), '&gt;', '>'), '&amp;', '&');
END//
DELIMITER ;


DELIMITER //

CREATE FUNCTION html_entity_decode(input_text TEXT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE output_text TEXT;
    SET output_text = input_text;
    SET output_text = REPLACE(output_text, '&#39;', "'");
    SET output_text = REPLACE(output_text, '&quot;', '"');
    SET output_text = REPLACE(output_text, '&lt;', '<');
    SET output_text = REPLACE(output_text, '&gt;', '>');
    SET output_text = REPLACE(output_text, '&amp;', '&');
    SET output_text = REPLACE(output_text, '&#34;', '"');
    SET output_text = REPLACE(output_text, '&#38;', '&');
    SET output_text = REPLACE(output_text, '&#62;', '>');
    SET output_text = REPLACE(output_text, '&#60;', '<');
    SET output_text = REPLACE(output_text, '&#160;', ' ');
    SET output_text = REPLACE(output_text, '&#162;', '¢');
    SET output_text = REPLACE(output_text, '&#163;', '£');
    SET output_text = REPLACE(output_text, '&#165;', '¥');
    SET output_text = REPLACE(output_text, '&#169;', '©');
    SET output_text = REPLACE(output_text, '&#174;', '®');
    SET output_text = REPLACE(output_text, '&#176;', '°');
    SET output_text = REPLACE(output_text, '&#181;', 'µ');
    SET output_text = REPLACE(output_text, '&#215;', '×');
    SET output_text = REPLACE(output_text, '&#247;', '÷');
    SET output_text = REPLACE(output_text, '&#8364;', '€');
    SET output_text = REGEXP_REPLACE(output_text, '&#([0-9]+);', CHAR(CONVERT(SUBSTRING_INDEX('\\1', ';', 1), UNSIGNED)));
    RETURN output_text;
END//

DELIMITER ;
