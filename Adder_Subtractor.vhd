library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Adder_Subtractor is
  port(A,B:in std_logic_vector(3 downto 0);
  Cin:in std_logic;
  S:out std_logic_vector(3 downto 0);
  CF:out std_logic);
end entity Adder_Subtractor; 
architecture struct of Adder_Subtractor is 
   signal y0, y1, y2, y3, p0, p1, p2: std_logic;
	
	component Full_adder_nand is
	port(A, B, Cin:in std_logic;
	     S, Cout:out std_logic);
end component Full_adder_nand;
begin
   fa1:Full_adder_nand 
	    port map(A => A(0),  B => y0, Cin => Cin, S => S(0), Cout => p0);
   fa2:Full_adder_nand  
		 port map(A => A(1),  B => y1, Cin => p0,  S => S(1), Cout => p1);
   fa3:Full_adder_nand 
		 port map(A => A(2),  B => y2, Cin => p1,  S => S(2), Cout => p2);
   fa4:Full_adder_nand  
		 port map(A => A(3),  B => y3, Cin => p2,  S => S(3), Cout => CF);
		 
		 
   X1:XOR_2  port map(A => Cin, B => B(0),  Y => y0);
	X2:XOR_2  port map(A => Cin, B => B(1),  Y => y1);
	X3:XOR_2  port map(A => Cin, B => B(2),  Y => y2);
	X4:XOR_2  port map(A => Cin, B => B(3),  Y => y3);
end struct;	


library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Full_adder_nand is
  port(A,B,Cin:in std_logic;S,Cout:out std_logic);
end entity Full_adder_nand;




 
architecture struct of Full_adder_nand is 
signal d1, d2, d3, d4, d5, d6, d7 : std_logic;
begin 
a1:NAND_2  port map(A => A,  B => B,   Y => d1);
a2:NAND_2  port map(A => A,  B => d1,  Y => d2);
a3:NAND_2  port map(A => d1, B => B,   Y => d3);
a4:NAND_2  port map(A => d2, B => d3,  Y => d4);
a5:NAND_2  port map(A => d4, B => Cin, Y => d5);
a6:NAND_2  port map(A => d4, B => d5,  Y => d6);
a7:NAND_2  port map(A => d5, B => Cin, Y => d7);
a8:NAND_2  port map(A => d6, B => d7,  Y => S);
a9:NAND_2  port map(A => d5, B => d1,  Y => Cout);


end struct;