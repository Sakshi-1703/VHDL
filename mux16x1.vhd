library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;


entity mux16x1 is
  port(In4,In3,In2,In1:in std_logic_vector(3 downto 0);
  S1,S2:in std_logic;
  Y:out std_logic_vector(3 downto 0));
end entity mux16x1 ;
 
 
  
  architecture struct of mux16x1 is 
	
component MUX_4x1 is
  port(In4,In3,In2,In1,S1,S2:in std_logic;
  Y:out std_logic);
 end component;
begin

mu1:MUX_4x1
    port map(In4 => In4(3), In3 => In3(3), In2 => In2(3), In1 => In1(3), S1 => S1, S2 => S2, Y => Y(3));
mu2:MUX_4x1
     port map(In4 => In4(2), In3 => In3(2), In2 => In2(2), In1 => In1(2),S1 => S1, S2 => S2, Y =>Y(2) );

mu3:MUX_4x1
     port map(In4 => In4(1), In3 => In3(1), In2 => In2(1), In1 => In1(1), S1 => S1, S2 => S2, Y => Y(1));
mu4:MUX_4x1
     port map(In4 => In4(0), In3 => In3(0), In2 => In2(0), In1 => In1(0), S1 => S1, S2 => S2, Y =>Y(0));
end struct;
  
