LIBRARY IEEE ;
USE IEEE . STD_LOGIC_1164 . ALL ;
ENTITY SHIFTER IS
	GENERIC
	(
		N : INTEGER := 16
	) ;
	PORT
	(
		SHIFT_INPUT : IN STD_LOGIC_VECTOR ( N - 1 DOWNTO 0 ) ;
		SHIFT_CTRL : IN STD_LOGIC_VECTOR ( 3 DOWNTO 0 ) ;
		SHIFT_OUT : OUT STD_LOGIC_VECTOR ( N - 1 DOWNTO 0 )
	) ;
END SHIFTER ;
ARCHITECTURE FUNC OF SHIFTER IS
BEGIN
	PROCESS ( SHIFT_INPUT , SHIFT_CTRL )
	BEGIN
		CASE ( SHIFT_CTRL ) IS
			WHEN "1000" => SHIFT_OUT <= SHIFT_INPUT ( 7 DOWNTO 0 ) & SHIFT_INPUT ( 15 DOWNTO 8 ) ;
			WHEN "1001" => SHIFT_OUT <= SHIFT_INPUT ( 3 DOWNTO 0 ) & SHIFT_INPUT ( 15 DOWNTO 4 ) ;
			WHEN "1010" => SHIFT_OUT <= SHIFT_INPUT ( 7 DOWNTO 0 ) & "00000000" ;
			WHEN OTHERS => SHIFT_OUT <= x"0000" ;
		END CASE ;
	END PROCESS ;
END FUNC ;