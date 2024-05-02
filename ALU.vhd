library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    generic(
        operand_width : integer:=4);
    port (
        A: in std_logic_vector(operand_width-1 downto 0);
        B: in std_logic_vector(operand_width-1 downto 0);
       op: out std_logic_vector(5 downto 0)) ;
end ALU;

architecture a1 of ALU is
    function add(A: in std_logic_vector(operand_width-1 downto 0); 
    B: in std_logic_vector(operand_width-1 downto 0))
        return std_logic_vector is
		  variable sum : std_logic_vector(operand_width downto 0) := (others => '0');
		  variable carry : std_logic := '0';

        begin
				for i in 0 to 3 loop
					sum(i) := ((A(i) xor B(i)) xor carry);
					carry := (A(i) and B(i)) or (B(i) and carry) or (carry and A(i));
				end loop;
				sum(4) := carry;
            return sum;  --according to your logic you can change what you want to return
    end add;
 
begin
ALU : process(A, B)
variable sel  : std_logic_vector(1 downto 0);
variable outp : std_logic_vector(5 downto 0):= (others => '0');
variable out1, out2  : std_logic_vector(5 downto 0);
variable mul  : std_logic_vector(4 downto 0);

begin
   -- complete VHDL code for various outputs of ALU based on select lines
   sel := A(3) & B(3);
   case sel is
      when "00" =>
			if (A > B) then
			outp := "00" & A;
			elsif (A < B) then
			outp := "00" & B;
			else 
			outp := "000000";
			end if;
			
		when "01" =>
			outp := "00" & (A and B);
			
		when "10" =>
			out1 := "00" & A;
			out1 := out1(4 downto 0) & '0';
			mul := add(out1(3 downto 0), A);
			outp(3 downto 0) := mul(3 downto 0);
			outp(4) := out1(4) XOR mul(4);
			outp(5) := out1(4) AND mul(4);
			
		when "11" =>
			if (A = B) then 
			outp := "00" & A;
			else
			outp := "000000";
			end if;
		
		when others => 
			outp := "000000";
	end case;
			op <= outp;
end process ; -- alu
end a1 ; -- a1