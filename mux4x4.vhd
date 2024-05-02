library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;


entity mux4x4 is
  port(A:in std_logic_vector(3 downto 0);
  B:in std_logic_vector(3 downto 0);
  Y:out std_logic_vector(8 downto 0));
end entity mux4x4 ;
 
 
  
  architecture struct of mux4x4 is 
  signal Y00,Y01,Y02,Y03,Y10,Y11,Y12,Y13,Y20,Y21,Y22,Y23,Y30,Y31,Y32,Y33:std_logic;
  signal P:std_logic_vector(6 downto 0);

	
component Carry_Look_Ahead is
  port(A,B:in std_logic_vector(3 downto 0);
Cin:in std_logic;
S:out std_logic_vector(3 downto 0);
Cout:out std_logic);
 end component Carry_Look_Ahead;
begin

   a00:AND_2 port map(A => A(0),B => B(0),Y => Y00);
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
	a30:AND_2 port map(A => A(0),B => B(3),Y => Y30);
	a31:AND_2 port map(A => A(1),B => B(3),Y => Y31);
	a32:AND_2 port map(A => A(2),B => B(3),Y => Y32);
	a33:AND_2 port map(A => A(3),B => B(3),Y => Y33);
	
	A1:Carry_Look_Ahead
	port map(A(3) => Y03,B(3) => Y12,S(3) => P(2),A(2) => Y02,B(2) => Y11,S(2) => P(1),A(1) => Y01,B(1) => Y10,S(1) => P(0), A(0) => Y00,B(0) =>'0',S(0) => Y(0),Cin => '0');
	
	A2:Carry_Look_Ahead
	port map(A(3) => Y13,B(3) => Y22,S(3) => P(3),A(2) => P(2),B(2) => Y21,S(2) => P(6),A(1) => P(1),B(1) => Y20,S(1) => Y(2), A(0) => P(0),B(0) =>'0',S(0) => Y(1),Cin => '0',Cout =>P(5));
	
	A3:Carry_Look_Ahead
	port map(A(3) => P(5),B(3) => Y32,S(3) => Y(6),A(2) => Y23,B(2) => Y31,S(2) => Y(5),A(1) => P(3),B(1) => Y30,S(1) => Y(4), A(0) => P(6),B(0) =>'0',S(0) => Y(3),Cin => '0',Cout =>Y(8));
	
end struct;
  
