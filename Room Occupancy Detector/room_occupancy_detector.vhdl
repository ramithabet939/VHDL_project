library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RoomOccupancy is
    Port (
        clk : in STD_LOGIC;
        reset_signal : in STD_LOGIC;
        X : in STD_LOGIC;
        Y : in STD_LOGIC;
        max_occupancy : in INTEGER range 0 to 63;
        Z : out STD_LOGIC;
        occupancy_count : out INTEGER range 0 to 63
    );
end RoomOccupancy;

architecture Behavioral of RoomOccupancy is
    signal count : INTEGER range 0 to 63 := 0;
    signal next_count : INTEGER range 0 to 63 := 0;
    signal Z_internal : STD_LOGIC := '0';
begin
    -- Register
    process(clk, reset_signal)
    begin
        if reset_signal = '1' then
            count <= 0;
        elsif rising_edge(clk) then
            count <= next_count;
        end if;
    end process;

    -- Next State Logic
    process(count, X, Y, max_occupancy)
    begin
        next_count <= count;
        Z_internal <= '0';

        if X = '1' and count < max_occupancy then
            next_count <= count + 1;
        end if;

        if Y = '1' and count > 0 then
            next_count <= count - 1;
        end if;

        if next_count >= max_occupancy then
            Z_internal <= '1';
        end if;
    end process;

    occupancy_count <= count;
    Z <= Z_internal;
end Behavioral;
