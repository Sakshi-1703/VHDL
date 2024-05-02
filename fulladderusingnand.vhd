library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity fullAdder is
port(A,B,Cin:in std_logic;S,Cout:out std_logic);
end entity fullAdder;

architecture struct of fullAdder is
signal D1,D2,D3,D4,D5,D6,D7:std_logic;
begin

a1:NAND_2 port map(A => A,B => B,Y => D1);
a2:NAND_2 port map(A => A,B => D1,Y => D2);
a3:NAND_2 port map(A => D1,B => B,Y => D3
a4:NAND_2 port map(A => D2,B => D3,Y => D4);
a5:NAND_2 port map(A => D4,B => Cin,Y => D5);
a6:NAND_2 port map(A => D4,B => D5,Y => D6);
a7:NAND_2 port map(A => D5,B => Cin,Y => D7);
a8:NAND_2 port map(A => D6,B => D7,Y => S);
a9:NAND_2 port map(A => D5,B => D1,Y => Cout);
end struct;
