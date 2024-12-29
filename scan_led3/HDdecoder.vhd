library ieee;
use ieee.std_logic_1164.all;

entity HDdecoder is
	port (
		cin : in std_logic_vector(3 downto 0);
		qa, qb, qc, qd, qe, qf, qg : in std_logic;
		qout : out std_logic_vector(6 downto 0)
	);
end HDdecoder;

architecture exa of HDdecoder is
begin
	process (cin, qa, qb, qc, qd, qe, qf, qg)
	begin
		case cin is
			when "1010" =>
				qout <= "1110111";
			when "1011" =>
				qout <= "0011111";
			when "1100" =>
				qout <= "1001110";
			when "1101" =>
				qout <= "0111101";
			when "1110" =>
				qout <= "1001111";
			when "1111" =>
				qout <= "1000111";
			when "0110" =>
				qout <= "1011111";
			when "1001" =>
				qout <= "1111011";
			when others =>
				qout <= qa & qb & qc & qd & qe & qf & qg;
		end case;
	end process;
end exa;
