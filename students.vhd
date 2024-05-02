library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity students is
port( inp:in std_logic_vector(4 downto 0);
reset,clock:in std_logic;
outp: out std_logic);
end students;

architecture bhv of students is
---------------Define state type here-----------------------------
type state is (rst,S1,S2,S3,S4,S5,S6,S7); -- Fill other states here
---------------Define signals of state type-----------------------
signal y_present,y_next: state:=rst;

begin
clock_proc:process(clock,reset)
begin
if(clock='1' and clock' event) then
if(reset='1') then
y_present<= rst;
else
y_present<= y_next;
end if;
end if;
end process;

state_transition_proc:process(inp,y_present)
begin
case y_present is
when rst=>
if(unsigned(inp)=19) then --s has been detected
y_next<= S1;-- Fill the code here
else
y_next<= rst;
end if;
 
when S1=>
if(unsigned(inp)=20) then --s has been detected
y_next<= S2;-- Fill the code here
else
y_next<= S1;
end if;

when S2=>
if(unsigned(inp)=21) then --s has been detected
 y_next<= S3;-- Fill the code here
else
 y_next<= S2;
end if;

when S3=>
if(unsigned(inp)=4) then --s has been detected
 y_next<= S4;-- Fill the code here
else
 y_next<= S3;
end if;

when S4=>
if(unsigned(inp)=5) then --s has been detected
 y_next<= S5;-- Fill the code here
else
 y_next<= S4;
end if;

when S5=>
if(unsigned(inp)=14) then --s has been detected
 y_next<= S6;-- Fill the code here
else
 y_next<= S5;
end if;

when S6=>
if(unsigned(inp)=20) then --s has been detected
 y_next<= S7;-- Fill the code here
else
 y_next<= S6;
end if;

when S7=>
 if(unsigned(inp)=19) then --s has been detected
 y_next<= S1;-- Fill the code here
else
 y_next<= S7;
 end if;
 
when others => 
 y_next <= rst;

end case;
end process;
-------------------------
---------Fill rest of the code here---------
-------Similarly define output process after this which will give
-------the output based on the present state and input (Mealy machine)
output_proc:process(y_present, inp)
begin
case y_present is
when rst=>
outp<='0';
when S1=>
outp<='0';
when S2=>
outp<='0';
when S3=>
outp<='0';
when S4=>
outp<='0';
when S5=>
outp<='0';
when S6=>
outp<='0';

when S7=>
if (unsigned(inp)=19) then
outp<= '1';
else
outp<='0';
end if;

end case;
end process;
end bhv;