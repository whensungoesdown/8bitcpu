library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk1MHz is
	Port (
		clk_in : in STD_LOGIC;
		clk_out: out STD_LOGIC
		);
end clk1MHz;

architecture Behavioral of clk1MHz is
	signal temporal: STD_LOGIC := '0';
	signal counter : integer range 0 to 49 := 0;
begin
	frequency_divider: process (clk_in) begin
		if (clk_in = '1') then
			if (counter = 49) then
				temporal <=  NOT(temporal);
				counter <= 0;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	
	clk_out <= temporal;
end Behavioral;
			