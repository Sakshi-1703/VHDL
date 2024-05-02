library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;


entity mux4x3 is
  port(A:in std_logic_vector(3 downto 0);
  B:in std_logic_vector(2 downto 0);
  Y:out std_logic_vector(6 downto 0));
end entity mux4x3 ;
 
 
  
  architecture struct of mux4x3 is 
  signal Y00,Y01,Y02,Y03,Y10,Y11,Y12,Y13,Y20,Y21,Y22,Y23:std_logic;
  signal P:std_logic_vector(3 downto 0);

	
component Adder_Subtractor is
  port(A,B:in std_logic_vector(3 downto 0);
Cin:in std_logic;
S:out std_logic_vector(3 downto 0);
CF:out std_logic);
 end component Adder_Subtractor;
begin

   a00:AND_2 port map(A => A(0),B => B(0),Y => Y(0));
	a01:AND_2 port map(A => A(1),B => B(0),Y => Y01);
	a02:AND_2 port map(A => A(2),B => B(0),Y => Y02);
	a03:AND_2 port map(A => A(3),B => B(0),Y => Y03);
	a10:AND_2 port map(A => A(0),B => B(1),Y => Y10);
	a11:AND_2 port map(A => A(1),B => B(1),Y => Y11);
	a12:AND_2 port map(A => A(2),B => B(1),Y => Y12);
	a13:AND_2 port map(A => A(3),B => B(1),Y => Y13);
	a20:AND_2 port map(A => A(0),B => B(2),Y => Y20);
	a21:AND_2 port map(A => A(1),B => B(2),Y => Y21);
	a22:AND_2 port map(A => A(2),B => B(2),Y => Y22);
	a23:AND_2 port map(A => A(3),B => B(2),Y => Y23);
	
	A1:Adder_Subtractor
	port map(A(3) => '0',B(3) => Y13,S(3) => P(2),A(2) => Y03,B(2) => Y12,S(2) => P(1),A(1) => Y02,B(1) => Y11,S(1) => P(0), A(0) => Y01,B(0) =>Y10,S(0) => Y(1),Cin => '0', CF => P(3));
	
	A2:Adder_Subtractor
	port map(A(3) => P(3),B(3) => Y23,S(3) => Y(5),A(2) => P(2),B(2) => Y22,S(2) => Y(4),A(1) => P(1),B(1) => Y21,S(1) => Y(3), A(0) => P(0),B(0) =>Y20,S(0) => Y(2),Cin => '0',CF =>Y(6));
	
end struct;
  
