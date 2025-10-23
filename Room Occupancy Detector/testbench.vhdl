library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_RoomOccupancy is
end tb_RoomOccupancy;

architecture Behavioral of tb_RoomOccupancy is
    -- Signals for Testing
    signal clk : STD_LOGIC := '0';
    signal reset_signal : STD_LOGIC := '0';
    signal X : STD_LOGIC := '0';
    signal Y : STD_LOGIC := '0';
    signal max_occupancy : INTEGER range 0 to 63 := 3;
    signal Z : STD_LOGIC;
    signal occupancy_count : INTEGER range 0 to 63;

    -- Instantiate the Unit Under Test (UUT)
    component RoomOccupancy
        Port (
            clk : in STD_LOGIC;
            reset_signal : in STD_LOGIC;
            X : in STD_LOGIC;
            Y : in STD_LOGIC;
            max_occupancy : in INTEGER range 0 to 63;
            Z : out STD_LOGIC;
            occupancy_count : out INTEGER range 0 to 63
        );
    end component;

begin

    uut: RoomOccupancy
        Port map (
            clk => clk,
            reset_signal => reset_signal,
            X => X,
            Y => Y,
            max_occupancy => max_occupancy,
            Z => Z,
            occupancy_count => occupancy_count
        );

    -- Clock process
    clk_process : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    -- Test process
    stim_proc: process
    begin
        -- Reset the system
        reset_signal <= '1';
        wait for 10 ns;
        reset_signal <= '0';
        wait for 10 ns;

        -- Test entry
        X <= '1';
        wait for 10 ns;
        X <= '0';
        wait for 10 ns;

        -- Test entry
        X <= '1';
        wait for 10 ns;
        X <= '0';
        wait for 10 ns;

        -- Test exit
        Y <= '1';
        wait for 10 ns;
        Y <= '0';
        wait for 10 ns;

        -- Test max occupancy reached
        X <= '1';
        wait for 10 ns;
        X <= '0';
        wait for 10 ns;
        X <= '1';
        wait for 10 ns;
        X <= '0';
        wait for 10 ns;

        -- Test exceeding max occupancy
        X <= '1';
        wait for 10 ns;
        X <= '0';
        wait for 10 ns;

        -- Reset again
        reset_signal <= '1';
        wait for 10 ns;
        reset_signal <= '0';
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
