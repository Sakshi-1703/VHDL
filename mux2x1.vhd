library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity mux2x1 is
port(I0,I1,S:in std_logic;Y:out std_logic);
end entity mux2x1;

architecture struct of mux2x1 is
signal D0,D1,D2:std_logic;
begin

x1:INVERTER  port map(A=>S,Y=>D0);
a1:AND_2 port map(A=>I0,B=>D0,Y=>D1);
a2:AND_2 port map(A=>S,B=>I1,Y=>D2);
o1:OR_2 port map(A=>D1,B=>D2,Y=>Y);

end struct;