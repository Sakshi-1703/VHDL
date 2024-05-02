library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity combinationcircuit is
port(X3,X2,X1,X0:in std_logic;Y:out std_logic);
end entity combinationcircuit;

architecture struct of combinationcircuit is
signal Y1,Y2:std_logic;
begin
A1:XOR_2 port map(A=>X0,B=>X1,Y=> Y1);
A2:XNOR_2 port map(A=>X2, B=>X3,Y=> Y2);
B1:AND_2 port map(A=> Y1,B=> Y2,Y=>Y);
end struct;
