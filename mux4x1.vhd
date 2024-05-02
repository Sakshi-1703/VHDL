library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;


entity MUX_4x1 is
  port(In4, In3,In2,In1,S1,S2:in std_logic;
  Y:out std_logic);
end entity MUX_4x1 ;
  
  architecture struct of MUX_4x1 is 
   signal y1,y2: std_logic;
	
component Mux_2x1 is
port(I0, I1, S:in std_logic;
  Y:out std_logic);
 end component;
begin

mu1:Mux_2x1
    port map(I0 => In1,  I1=>In2, S => S1, Y =>y1 );
mu2:Mux_2x1
     port map(I0 => In3,  I1=>In4, S => S1, Y =>y2 );

mu3:Mux_2x1
     port map(I0 => y1,  I1=>y2, S => S2, Y =>Y );
end struct;
  


library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Mux_2x1 is
  port(I0, I1, S:in std_logic;
  Y:out std_logic);
end entity Mux_2x1; 
architecture struct of Mux_2x1 is 
   signal D0, D1, D2: std_logic;
	
	
begin
z1:INVERTER  port map(A => S, Y =>D0);
a1:AND_2 port map(A => I0, B=> D0, Y =>D1);
a2:AND_2 port map(A => S, B=> I1, Y =>D2);
o1:OR_2 port map(A => D1, B=> D2, Y =>Y);

end struct;