
DECLARE @x xml;
SET @x = '';
SELECT @x.query('(1,2, (3,4,5)),6');
DECLARE @x xml;
SET @x = '';
-- Expression returns a sequence of 1 text node (singleton).
SELECT @x.query('1');
-- Expression returns a sequence of 2 text nodes
SELECT @x.query('"abc", "xyz"');
-- Expression returns a sequence of one atomic value. data() returns
-- typed value of the node.
SELECT @x.query('data(1)');
-- Expression returns a sequence of one element node. 
-- In the expression XML construction is used to construct an element.
SELECT @x.query('<x> {1+2} </x>');
SELECT @x.query('<x> [1+2] </x>');
SELECT @x.query('<x>11</x>, 22');

SELECT xmlcontent.query('
     <step1> Step 1 description goes here</step1>,
     <step2> Step 2 description goes here </step2>
') AS Result
FROM testxml


select name from testxml

update testxml set name .write('oo',1,0)