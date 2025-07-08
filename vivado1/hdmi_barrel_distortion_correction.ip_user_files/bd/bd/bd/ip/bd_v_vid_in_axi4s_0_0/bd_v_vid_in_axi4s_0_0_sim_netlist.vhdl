-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Thu May 29 15:11:38 2025
-- Host        : DESKTOP-OIK79P6 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/work/vivado/pynq/hdmi_io/hdmi_io.srcs/sources_1/bd/bd/ip/bd_v_vid_in_axi4s_0_0/bd_v_vid_in_axi4s_0_0_sim_netlist.vhdl
-- Design      : bd_v_vid_in_axi4s_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_formatter is
  port (
    vtd_active_video : out STD_LOGIC;
    de_3_reg_0 : out STD_LOGIC;
    vtd_vblank : out STD_LOGIC;
    vtd_hblank : out STD_LOGIC;
    vtd_vsync : out STD_LOGIC;
    vtd_hsync : out STD_LOGIC;
    vtd_field_id : out STD_LOGIC;
    din : out STD_LOGIC_VECTOR ( 26 downto 0 );
    wr_en : out STD_LOGIC;
    vid_io_in_ce : in STD_LOGIC;
    vid_active_video : in STD_LOGIC;
    aclk : in STD_LOGIC;
    vid_vblank : in STD_LOGIC;
    vid_hblank : in STD_LOGIC;
    vid_vsync : in STD_LOGIC;
    vid_hsync : in STD_LOGIC;
    vid_field_id : in STD_LOGIC;
    axis_enable : in STD_LOGIC;
    wr_rst_busy : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg : in STD_LOGIC;
    vid_data : in STD_LOGIC_VECTOR ( 23 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_formatter : entity is "v_vid_in_axi4s_v4_0_7_formatter";
end bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_formatter;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_formatter is
  signal data_1 : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal data_2 : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal de_2 : STD_LOGIC;
  signal de_3 : STD_LOGIC;
  signal \^de_3_reg_0\ : STD_LOGIC;
  signal \^din\ : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal eol_i_1_n_0 : STD_LOGIC;
  signal field_id_2 : STD_LOGIC;
  signal sof : STD_LOGIC;
  signal sof0 : STD_LOGIC;
  signal v_blank_sync_1 : STD_LOGIC;
  signal v_blank_sync_2 : STD_LOGIC;
  signal vert_blanking_intvl_i_1_n_0 : STD_LOGIC;
  signal vert_blanking_intvl_reg_n_0 : STD_LOGIC;
  signal \^vtd_active_video\ : STD_LOGIC;
  signal \^vtd_field_id\ : STD_LOGIC;
  signal vtd_locked_i_1_n_0 : STD_LOGIC;
  signal vtd_locked_reg_n_0 : STD_LOGIC;
  signal \^vtd_vblank\ : STD_LOGIC;
  signal \^vtd_vsync\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of eol_i_1 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of sof_i_1 : label is "soft_lutpair16";
begin
  de_3_reg_0 <= \^de_3_reg_0\;
  din(26 downto 0) <= \^din\(26 downto 0);
  vtd_active_video <= \^vtd_active_video\;
  vtd_field_id <= \^vtd_field_id\;
  vtd_vblank <= \^vtd_vblank\;
  vtd_vsync <= \^vtd_vsync\;
\data_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(0),
      Q => data_1(0),
      R => \^de_3_reg_0\
    );
\data_1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(10),
      Q => data_1(10),
      R => \^de_3_reg_0\
    );
\data_1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(11),
      Q => data_1(11),
      R => \^de_3_reg_0\
    );
\data_1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(12),
      Q => data_1(12),
      R => \^de_3_reg_0\
    );
\data_1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(13),
      Q => data_1(13),
      R => \^de_3_reg_0\
    );
\data_1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(14),
      Q => data_1(14),
      R => \^de_3_reg_0\
    );
\data_1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(15),
      Q => data_1(15),
      R => \^de_3_reg_0\
    );
\data_1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(16),
      Q => data_1(16),
      R => \^de_3_reg_0\
    );
\data_1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(17),
      Q => data_1(17),
      R => \^de_3_reg_0\
    );
\data_1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(18),
      Q => data_1(18),
      R => \^de_3_reg_0\
    );
\data_1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(19),
      Q => data_1(19),
      R => \^de_3_reg_0\
    );
\data_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(1),
      Q => data_1(1),
      R => \^de_3_reg_0\
    );
\data_1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(20),
      Q => data_1(20),
      R => \^de_3_reg_0\
    );
\data_1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(21),
      Q => data_1(21),
      R => \^de_3_reg_0\
    );
\data_1_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(22),
      Q => data_1(22),
      R => \^de_3_reg_0\
    );
\data_1_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(23),
      Q => data_1(23),
      R => \^de_3_reg_0\
    );
\data_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(2),
      Q => data_1(2),
      R => \^de_3_reg_0\
    );
\data_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(3),
      Q => data_1(3),
      R => \^de_3_reg_0\
    );
\data_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(4),
      Q => data_1(4),
      R => \^de_3_reg_0\
    );
\data_1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(5),
      Q => data_1(5),
      R => \^de_3_reg_0\
    );
\data_1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(6),
      Q => data_1(6),
      R => \^de_3_reg_0\
    );
\data_1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(7),
      Q => data_1(7),
      R => \^de_3_reg_0\
    );
\data_1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(8),
      Q => data_1(8),
      R => \^de_3_reg_0\
    );
\data_1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_data(9),
      Q => data_1(9),
      R => \^de_3_reg_0\
    );
\data_2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(0),
      Q => data_2(0),
      R => \^de_3_reg_0\
    );
\data_2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(10),
      Q => data_2(10),
      R => \^de_3_reg_0\
    );
\data_2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(11),
      Q => data_2(11),
      R => \^de_3_reg_0\
    );
\data_2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(12),
      Q => data_2(12),
      R => \^de_3_reg_0\
    );
\data_2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(13),
      Q => data_2(13),
      R => \^de_3_reg_0\
    );
\data_2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(14),
      Q => data_2(14),
      R => \^de_3_reg_0\
    );
\data_2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(15),
      Q => data_2(15),
      R => \^de_3_reg_0\
    );
\data_2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(16),
      Q => data_2(16),
      R => \^de_3_reg_0\
    );
\data_2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(17),
      Q => data_2(17),
      R => \^de_3_reg_0\
    );
\data_2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(18),
      Q => data_2(18),
      R => \^de_3_reg_0\
    );
\data_2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(19),
      Q => data_2(19),
      R => \^de_3_reg_0\
    );
\data_2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(1),
      Q => data_2(1),
      R => \^de_3_reg_0\
    );
\data_2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(20),
      Q => data_2(20),
      R => \^de_3_reg_0\
    );
\data_2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(21),
      Q => data_2(21),
      R => \^de_3_reg_0\
    );
\data_2_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(22),
      Q => data_2(22),
      R => \^de_3_reg_0\
    );
\data_2_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(23),
      Q => data_2(23),
      R => \^de_3_reg_0\
    );
\data_2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(2),
      Q => data_2(2),
      R => \^de_3_reg_0\
    );
\data_2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(3),
      Q => data_2(3),
      R => \^de_3_reg_0\
    );
\data_2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(4),
      Q => data_2(4),
      R => \^de_3_reg_0\
    );
\data_2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(5),
      Q => data_2(5),
      R => \^de_3_reg_0\
    );
\data_2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(6),
      Q => data_2(6),
      R => \^de_3_reg_0\
    );
\data_2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(7),
      Q => data_2(7),
      R => \^de_3_reg_0\
    );
\data_2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(8),
      Q => data_2(8),
      R => \^de_3_reg_0\
    );
\data_2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_1(9),
      Q => data_2(9),
      R => \^de_3_reg_0\
    );
\data_3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(0),
      Q => \^din\(0),
      R => \^de_3_reg_0\
    );
\data_3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(10),
      Q => \^din\(10),
      R => \^de_3_reg_0\
    );
\data_3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(11),
      Q => \^din\(11),
      R => \^de_3_reg_0\
    );
\data_3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(12),
      Q => \^din\(12),
      R => \^de_3_reg_0\
    );
\data_3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(13),
      Q => \^din\(13),
      R => \^de_3_reg_0\
    );
\data_3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(14),
      Q => \^din\(14),
      R => \^de_3_reg_0\
    );
\data_3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(15),
      Q => \^din\(15),
      R => \^de_3_reg_0\
    );
\data_3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(16),
      Q => \^din\(16),
      R => \^de_3_reg_0\
    );
\data_3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(17),
      Q => \^din\(17),
      R => \^de_3_reg_0\
    );
\data_3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(18),
      Q => \^din\(18),
      R => \^de_3_reg_0\
    );
\data_3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(19),
      Q => \^din\(19),
      R => \^de_3_reg_0\
    );
\data_3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(1),
      Q => \^din\(1),
      R => \^de_3_reg_0\
    );
\data_3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(20),
      Q => \^din\(20),
      R => \^de_3_reg_0\
    );
\data_3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(21),
      Q => \^din\(21),
      R => \^de_3_reg_0\
    );
\data_3_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(22),
      Q => \^din\(22),
      R => \^de_3_reg_0\
    );
\data_3_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(23),
      Q => \^din\(23),
      R => \^de_3_reg_0\
    );
\data_3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(2),
      Q => \^din\(2),
      R => \^de_3_reg_0\
    );
\data_3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(3),
      Q => \^din\(3),
      R => \^de_3_reg_0\
    );
\data_3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(4),
      Q => \^din\(4),
      R => \^de_3_reg_0\
    );
\data_3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(5),
      Q => \^din\(5),
      R => \^de_3_reg_0\
    );
\data_3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(6),
      Q => \^din\(6),
      R => \^de_3_reg_0\
    );
\data_3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(7),
      Q => \^din\(7),
      R => \^de_3_reg_0\
    );
\data_3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(8),
      Q => \^din\(8),
      R => \^de_3_reg_0\
    );
\data_3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => data_2(9),
      Q => \^din\(9),
      R => \^de_3_reg_0\
    );
de_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_active_video,
      Q => \^vtd_active_video\,
      R => \^de_3_reg_0\
    );
de_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => \^vtd_active_video\,
      Q => de_2,
      R => \^de_3_reg_0\
    );
de_3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => de_2,
      Q => de_3,
      R => \^de_3_reg_0\
    );
eol_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => de_2,
      I1 => \^vtd_active_video\,
      O => eol_i_1_n_0
    );
eol_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => eol_i_1_n_0,
      Q => \^din\(24),
      R => \^de_3_reg_0\
    );
field_id_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_field_id,
      Q => \^vtd_field_id\,
      R => \^de_3_reg_0\
    );
field_id_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => \^vtd_field_id\,
      Q => field_id_2,
      R => \^de_3_reg_0\
    );
field_id_3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => field_id_2,
      Q => \^din\(26),
      R => \^de_3_reg_0\
    );
hblank_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_hblank,
      Q => vtd_hblank,
      R => \^de_3_reg_0\
    );
hsync_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_hsync,
      Q => vtd_hsync,
      R => \^de_3_reg_0\
    );
sof_1_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => sof,
      Q => \^din\(25),
      R => \^de_3_reg_0\
    );
sof_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => de_2,
      I1 => \^vtd_active_video\,
      I2 => vert_blanking_intvl_reg_n_0,
      O => sof0
    );
sof_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => sof0,
      Q => sof,
      R => \^de_3_reg_0\
    );
v_blank_sync_2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^vtd_vblank\,
      I1 => \^vtd_vsync\,
      O => v_blank_sync_1
    );
v_blank_sync_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => v_blank_sync_1,
      Q => v_blank_sync_2,
      R => \^de_3_reg_0\
    );
vblank_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_vblank,
      Q => \^vtd_vblank\,
      R => \^de_3_reg_0\
    );
vert_blanking_intvl_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B0B0F0F0FFB0F0F0"
    )
        port map (
      I0 => de_2,
      I1 => \^vtd_active_video\,
      I2 => vert_blanking_intvl_reg_n_0,
      I3 => v_blank_sync_1,
      I4 => vid_io_in_ce,
      I5 => v_blank_sync_2,
      O => vert_blanking_intvl_i_1_n_0
    );
vert_blanking_intvl_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => vert_blanking_intvl_i_1_n_0,
      Q => vert_blanking_intvl_reg_n_0,
      R => '0'
    );
vsync_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => vid_io_in_ce,
      D => vid_vsync,
      Q => \^vtd_vsync\,
      R => \^de_3_reg_0\
    );
vtd_locked_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BAAA0000"
    )
        port map (
      I0 => vtd_locked_reg_n_0,
      I1 => \^din\(25),
      I2 => vid_io_in_ce,
      I3 => sof,
      I4 => axis_enable,
      I5 => \^de_3_reg_0\,
      O => vtd_locked_i_1_n_0
    );
vtd_locked_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => vtd_locked_i_1_n_0,
      Q => vtd_locked_reg_n_0,
      R => '0'
    );
xpm_fifo_base_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => fifo_overflow_from_coupler_pulse_reg,
      I1 => aresetn,
      O => \^de_3_reg_0\
    );
xpm_fifo_base_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400000000000000"
    )
        port map (
      I0 => wr_rst_busy,
      I1 => aresetn,
      I2 => fifo_overflow_from_coupler_pulse_reg,
      I3 => de_3,
      I4 => vtd_locked_reg_n_0,
      I5 => vid_io_in_ce,
      O => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_xpm_cdc_single is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of bd_v_vid_in_axi4s_0_0_xpm_cdc_single : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of bd_v_vid_in_axi4s_0_0_xpm_cdc_single : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_xpm_cdc_single : entity is "xpm_cdc_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of bd_v_vid_in_axi4s_0_0_xpm_cdc_single : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of bd_v_vid_in_axi4s_0_0_xpm_cdc_single : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of bd_v_vid_in_axi4s_0_0_xpm_cdc_single : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of bd_v_vid_in_axi4s_0_0_xpm_cdc_single : entity is "TRUE";
  attribute xpm_cdc : string;
  attribute xpm_cdc of bd_v_vid_in_axi4s_0_0_xpm_cdc_single : entity is "SINGLE";
end bd_v_vid_in_axi4s_0_0_xpm_cdc_single;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_xpm_cdc_single is
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SINGLE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SINGLE";
begin
  dest_out <= syncstages_ff(3);
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => src_in,
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ : entity is "xpm_cdc_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ : entity is "TRUE";
  attribute xpm_cdc : string;
  attribute xpm_cdc of \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ : entity is "SINGLE";
end \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\;

architecture STRUCTURE of \bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\ is
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SINGLE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SINGLE";
begin
  dest_out <= syncstages_ff(3);
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => src_in,
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_xpm_counter_updn is
  port (
    S : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    \count_value_i_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \count_value_i_reg[1]_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_fwft.curr_fwft_state_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    ram_empty_i : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    \gen_rst_cc.fifo_wr_rst_i_reg\ : in STD_LOGIC;
    rd_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_xpm_counter_updn : entity is "xpm_counter_updn";
end bd_v_vid_in_axi4s_0_0_xpm_counter_updn;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_xpm_counter_updn is
  signal \^di\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal count_value_i : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \count_value_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_2_n_0\ : STD_LOGIC;
  signal \^count_value_i_reg[1]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute HLUTNM : string;
  attribute HLUTNM of \gwdc.wr_data_count_i[3]_i_4\ : label is "lutpair0";
  attribute HLUTNM of \gwdc.wr_data_count_i[3]_i_8\ : label is "lutpair0";
begin
  DI(0) <= \^di\(0);
  \count_value_i_reg[1]_0\(0) <= \^count_value_i_reg[1]_0\(0);
\count_value_i[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000005AA98585"
    )
        port map (
      I0 => count_value_i(0),
      I1 => \gen_fwft.curr_fwft_state_reg[1]\(1),
      I2 => ram_empty_i,
      I3 => rd_en,
      I4 => \gen_fwft.curr_fwft_state_reg[1]\(0),
      I5 => \gen_rst_cc.fifo_wr_rst_i_reg\,
      O => \count_value_i[0]_i_1_n_0\
    );
\count_value_i[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AA8A"
    )
        port map (
      I0 => \count_value_i[1]_i_2_n_0\,
      I1 => \gen_fwft.curr_fwft_state_reg[1]\(1),
      I2 => ram_empty_i,
      I3 => \gen_fwft.curr_fwft_state_reg[1]\(0),
      I4 => \gen_rst_cc.fifo_wr_rst_i_reg\,
      O => \count_value_i[1]_i_1_n_0\
    );
\count_value_i[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFFDF5F550020A0A"
    )
        port map (
      I0 => count_value_i(0),
      I1 => \gen_fwft.curr_fwft_state_reg[1]\(1),
      I2 => ram_empty_i,
      I3 => rd_en,
      I4 => \gen_fwft.curr_fwft_state_reg[1]\(0),
      I5 => \^count_value_i_reg[1]_0\(0),
      O => \count_value_i[1]_i_2_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => \count_value_i[0]_i_1_n_0\,
      Q => count_value_i(0),
      R => '0'
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => \count_value_i[1]_i_1_n_0\,
      Q => \^count_value_i_reg[1]_0\(0),
      R => '0'
    );
\gwdc.wr_data_count_i[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => count_value_i(0),
      I1 => Q(0),
      O => \^di\(0)
    );
\gwdc.wr_data_count_i[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => \^di\(0),
      I1 => Q(1),
      I2 => \^count_value_i_reg[1]_0\(0),
      I3 => \count_value_i_reg[1]_1\(1),
      O => S(1)
    );
\gwdc.wr_data_count_i[3]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => count_value_i(0),
      I1 => Q(0),
      I2 => \count_value_i_reg[1]_1\(0),
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    ram_empty_i0 : out STD_LOGIC;
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    S : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \grdc.rd_data_count_i_reg[3]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \grdc.rd_data_count_i_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ : out STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \count_value_i_reg[10]_0\ : in STD_LOGIC_VECTOR ( 10 downto 0 );
    \count_value_i_reg[8]_0\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \count_value_i_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    ram_empty_i : in STD_LOGIC;
    \gen_fwft.curr_fwft_state_reg[0]\ : in STD_LOGIC;
    \count_value_i_reg[9]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\ : in STD_LOGIC;
    \count_value_i_reg[9]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \count_value_i_reg[9]_2\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rd_en : in STD_LOGIC;
    \gen_fwft.curr_fwft_state_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_2\ : in STD_LOGIC;
    clr_full : in STD_LOGIC;
    \gen_rst_cc.fifo_wr_rst_i_reg\ : in STD_LOGIC;
    rd_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0\ : entity is "xpm_counter_updn";
end \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0\;

architecture STRUCTURE of \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0\ is
  signal \^co\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \count_value_i[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \count_value_i_reg[10]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_value_i_reg[10]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_value_i_reg[10]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_value_i_reg[10]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_value_i_reg[10]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1__0_n_1\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1__0_n_2\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1__0_n_3\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1__0_n_4\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1__0_n_5\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1__0_n_6\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1__0_n_7\ : STD_LOGIC;
  signal \count_value_i_reg_n_0_[10]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_10_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_11_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_12_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_6_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_7_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_8_n_0\ : STD_LOGIC;
  signal \^gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_2_n_1\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_2_n_2\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_2_n_3\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_3_n_1\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_3_n_2\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_3_n_3\ : STD_LOGIC;
  signal \NLW_count_value_i_reg[10]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_count_value_i_reg[10]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  CO(0) <= \^co\(0);
  Q(9 downto 0) <= \^q\(9 downto 0);
  \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\(0) <= \^gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\(0);
\count_value_i[3]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BAAA4555"
    )
        port map (
      I0 => ram_empty_i,
      I1 => rd_en,
      I2 => \gen_fwft.curr_fwft_state_reg[1]\(1),
      I3 => \gen_fwft.curr_fwft_state_reg[1]\(0),
      I4 => \^q\(0),
      O => \count_value_i[3]_i_2__0_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[3]_i_1__0_n_7\,
      Q => \^q\(0),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[10]_i_1__0_n_5\,
      Q => \count_value_i_reg_n_0_[10]\,
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[10]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_value_i_reg[7]_i_1__0_n_0\,
      CO(3 downto 2) => \NLW_count_value_i_reg[10]_i_1__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \count_value_i_reg[10]_i_1__0_n_2\,
      CO(0) => \count_value_i_reg[10]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_count_value_i_reg[10]_i_1__0_O_UNCONNECTED\(3),
      O(2) => \count_value_i_reg[10]_i_1__0_n_5\,
      O(1) => \count_value_i_reg[10]_i_1__0_n_6\,
      O(0) => \count_value_i_reg[10]_i_1__0_n_7\,
      S(3) => '0',
      S(2) => \count_value_i_reg_n_0_[10]\,
      S(1 downto 0) => \^q\(9 downto 8)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[3]_i_1__0_n_6\,
      Q => \^q\(1),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[3]_i_1__0_n_5\,
      Q => \^q\(2),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[3]_i_1__0_n_4\,
      Q => \^q\(3),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[3]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_value_i_reg[3]_i_1__0_n_0\,
      CO(2) => \count_value_i_reg[3]_i_1__0_n_1\,
      CO(1) => \count_value_i_reg[3]_i_1__0_n_2\,
      CO(0) => \count_value_i_reg[3]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \^q\(0),
      O(3) => \count_value_i_reg[3]_i_1__0_n_4\,
      O(2) => \count_value_i_reg[3]_i_1__0_n_5\,
      O(1) => \count_value_i_reg[3]_i_1__0_n_6\,
      O(0) => \count_value_i_reg[3]_i_1__0_n_7\,
      S(3 downto 1) => \^q\(3 downto 1),
      S(0) => \count_value_i[3]_i_2__0_n_0\
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[7]_i_1__0_n_7\,
      Q => \^q\(4),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[7]_i_1__0_n_6\,
      Q => \^q\(5),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[7]_i_1__0_n_5\,
      Q => \^q\(6),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[7]_i_1__0_n_4\,
      Q => \^q\(7),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[7]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_value_i_reg[3]_i_1__0_n_0\,
      CO(3) => \count_value_i_reg[7]_i_1__0_n_0\,
      CO(2) => \count_value_i_reg[7]_i_1__0_n_1\,
      CO(1) => \count_value_i_reg[7]_i_1__0_n_2\,
      CO(0) => \count_value_i_reg[7]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_value_i_reg[7]_i_1__0_n_4\,
      O(2) => \count_value_i_reg[7]_i_1__0_n_5\,
      O(1) => \count_value_i_reg[7]_i_1__0_n_6\,
      O(0) => \count_value_i_reg[7]_i_1__0_n_7\,
      S(3 downto 0) => \^q\(7 downto 4)
    );
\count_value_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[10]_i_1__0_n_7\,
      Q => \^q\(8),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \gen_fwft.curr_fwft_state_reg[0]\,
      D => \count_value_i_reg[10]_i_1__0_n_6\,
      Q => \^q\(9),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000005540FF40"
    )
        port map (
      I0 => \gen_fwft.curr_fwft_state_reg[0]\,
      I1 => \^gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\(0),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\,
      I3 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_2\,
      I4 => \^co\(0),
      I5 => clr_full,
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i_reg[10]_0\(6),
      I2 => \count_value_i_reg[10]_0\(8),
      I3 => \^q\(8),
      I4 => \count_value_i_reg[10]_0\(7),
      I5 => \^q\(7),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_10_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i_reg[10]_0\(3),
      I2 => \count_value_i_reg[10]_0\(5),
      I3 => \^q\(5),
      I4 => \count_value_i_reg[10]_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_11_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \count_value_i_reg[10]_0\(0),
      I2 => \count_value_i_reg[10]_0\(2),
      I3 => \^q\(2),
      I4 => \count_value_i_reg[10]_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_12_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i_reg[8]_0\(6),
      I2 => \count_value_i_reg[8]_0\(8),
      I3 => \^q\(8),
      I4 => \count_value_i_reg[8]_0\(7),
      I5 => \^q\(7),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_6_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i_reg[8]_0\(3),
      I2 => \count_value_i_reg[8]_0\(5),
      I3 => \^q\(5),
      I4 => \count_value_i_reg[8]_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_7_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \count_value_i_reg[8]_0\(0),
      I2 => \count_value_i_reg[8]_0\(2),
      I3 => \^q\(2),
      I4 => \count_value_i_reg[8]_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_8_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \^gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\(0),
      CO(2) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_2_n_1\,
      CO(1) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_2_n_2\,
      CO(0) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_2_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_2_O_UNCONNECTED\(3 downto 0),
      S(3) => \count_value_i_reg[9]_2\(0),
      S(2) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_6_n_0\,
      S(1) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_7_n_0\,
      S(0) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_8_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \^co\(0),
      CO(2) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_3_n_1\,
      CO(1) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_3_n_2\,
      CO(0) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_3_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_i_3_O_UNCONNECTED\(3 downto 0),
      S(3) => \count_value_i_reg[9]_1\(0),
      S(2) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_10_n_0\,
      S(1) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_11_n_0\,
      S(0) => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_12_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4444FCCC"
    )
        port map (
      I0 => \^co\(0),
      I1 => ram_empty_i,
      I2 => \gen_fwft.curr_fwft_state_reg[0]\,
      I3 => \count_value_i_reg[9]_0\(0),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\,
      O => ram_empty_i0
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i_reg[10]_0\(3),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\(2)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(2),
      I1 => \count_value_i_reg[10]_0\(2),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\(1)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[10]_0\(1),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\(0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(7),
      I1 => \count_value_i_reg[10]_0\(7),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\(3)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i_reg[10]_0\(6),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\(2)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i_reg[10]_0\(5),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\(1)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \count_value_i_reg[10]_0\(4),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\(0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[9]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(9),
      I1 => \count_value_i_reg[10]_0\(9),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\(1)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[9]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(8),
      I1 => \count_value_i_reg[10]_0\(8),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\(0)
    );
\gwdc.wr_data_count_i[10]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(9),
      I1 => \count_value_i_reg[10]_0\(9),
      I2 => \count_value_i_reg_n_0_[10]\,
      I3 => \count_value_i_reg[10]_0\(10),
      O => S(2)
    );
\gwdc.wr_data_count_i[10]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(8),
      I1 => \count_value_i_reg[10]_0\(8),
      I2 => \^q\(9),
      I3 => \count_value_i_reg[10]_0\(9),
      O => S(1)
    );
\gwdc.wr_data_count_i[10]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(7),
      I1 => \count_value_i_reg[10]_0\(7),
      I2 => \^q\(8),
      I3 => \count_value_i_reg[10]_0\(8),
      O => S(0)
    );
\gwdc.wr_data_count_i[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D4"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[1]_0\(0),
      I2 => \count_value_i_reg[10]_0\(1),
      O => DI(0)
    );
\gwdc.wr_data_count_i[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(2),
      I1 => \count_value_i_reg[10]_0\(2),
      I2 => \^q\(3),
      I3 => \count_value_i_reg[10]_0\(3),
      O => \grdc.rd_data_count_i_reg[3]\(0)
    );
\gwdc.wr_data_count_i[7]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i_reg[10]_0\(6),
      I2 => \^q\(7),
      I3 => \count_value_i_reg[10]_0\(7),
      O => \grdc.rd_data_count_i_reg[7]\(3)
    );
\gwdc.wr_data_count_i[7]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i_reg[10]_0\(5),
      I2 => \^q\(6),
      I3 => \count_value_i_reg[10]_0\(6),
      O => \grdc.rd_data_count_i_reg[7]\(2)
    );
\gwdc.wr_data_count_i[7]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(4),
      I1 => \count_value_i_reg[10]_0\(4),
      I2 => \^q\(5),
      I3 => \count_value_i_reg[10]_0\(5),
      O => \grdc.rd_data_count_i_reg[7]\(1)
    );
\gwdc.wr_data_count_i[7]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i_reg[10]_0\(3),
      I2 => \^q\(4),
      I3 => \count_value_i_reg[10]_0\(4),
      O => \grdc.rd_data_count_i_reg[7]\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0_0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 10 downto 0 );
    \gen_pntr_flags_cc.ram_empty_i_reg\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\ : out STD_LOGIC_VECTOR ( 9 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \count_value_i_reg[8]_0\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    S : in STD_LOGIC_VECTOR ( 0 to 0 );
    \count_value_i_reg[9]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    DI : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \count_value_i_reg[2]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \count_value_i_reg[6]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_value_i_reg[9]_1\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_rst_cc.fifo_wr_rst_i_reg\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \count_value_i_reg[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_value_i_reg[7]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_value_i_reg[9]_2\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \count_value_i_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \count_value_i_reg[9]_3\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \gen_rst_cc.fifo_wr_rst_i_reg_0\ : in STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ : in STD_LOGIC;
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0_0\ : entity is "xpm_counter_updn";
end \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0_0\;

architecture STRUCTURE of \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0_0\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \count_value_i_reg[10]_i_1_n_2\ : STD_LOGIC;
  signal \count_value_i_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \count_value_i_reg[10]_i_1_n_5\ : STD_LOGIC;
  signal \count_value_i_reg[10]_i_1_n_6\ : STD_LOGIC;
  signal \count_value_i_reg[10]_i_1_n_7\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1_n_4\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1_n_5\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1_n_6\ : STD_LOGIC;
  signal \count_value_i_reg[3]_i_1_n_7\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \count_value_i_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_4_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_5_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_6_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_reg_i_2_n_1\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_reg_i_2_n_2\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_reg_i_2_n_3\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]_i_1_n_3\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[10]_i_2_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[10]_i_3_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[3]_i_2_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[3]_i_6_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[7]_i_2_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[7]_i_3_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[7]_i_4_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i[7]_i_5_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[10]_i_1_n_2\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \gwdc.wr_data_count_i_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \NLW_count_value_i_reg[10]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_count_value_i_reg[10]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_gen_pntr_flags_cc.ram_empty_i_reg_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gwdc.wr_data_count_i_reg[10]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gwdc.wr_data_count_i_reg[10]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]_i_1\ : label is "{SYNTH-8 {cell *THIS*}}";
begin
  Q(10 downto 0) <= \^q\(10 downto 0);
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[3]_i_1_n_7\,
      Q => \^q\(0),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[10]_i_1_n_5\,
      Q => \^q\(10),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[10]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_value_i_reg[7]_i_1_n_0\,
      CO(3 downto 2) => \NLW_count_value_i_reg[10]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \count_value_i_reg[10]_i_1_n_2\,
      CO(0) => \count_value_i_reg[10]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_count_value_i_reg[10]_i_1_O_UNCONNECTED\(3),
      O(2) => \count_value_i_reg[10]_i_1_n_5\,
      O(1) => \count_value_i_reg[10]_i_1_n_6\,
      O(0) => \count_value_i_reg[10]_i_1_n_7\,
      S(3) => '0',
      S(2 downto 0) => \^q\(10 downto 8)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[3]_i_1_n_6\,
      Q => \^q\(1),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[3]_i_1_n_5\,
      Q => \^q\(2),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[3]_i_1_n_4\,
      Q => \^q\(3),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_value_i_reg[3]_i_1_n_0\,
      CO(2) => \count_value_i_reg[3]_i_1_n_1\,
      CO(1) => \count_value_i_reg[3]_i_1_n_2\,
      CO(0) => \count_value_i_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \^q\(0),
      O(3) => \count_value_i_reg[3]_i_1_n_4\,
      O(2) => \count_value_i_reg[3]_i_1_n_5\,
      O(1) => \count_value_i_reg[3]_i_1_n_6\,
      O(0) => \count_value_i_reg[3]_i_1_n_7\,
      S(3 downto 1) => \^q\(3 downto 1),
      S(0) => S(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[7]_i_1_n_7\,
      Q => \^q\(4),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[7]_i_1_n_6\,
      Q => \^q\(5),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[7]_i_1_n_5\,
      Q => \^q\(6),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[7]_i_1_n_4\,
      Q => \^q\(7),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_value_i_reg[3]_i_1_n_0\,
      CO(3) => \count_value_i_reg[7]_i_1_n_0\,
      CO(2) => \count_value_i_reg[7]_i_1_n_1\,
      CO(1) => \count_value_i_reg[7]_i_1_n_2\,
      CO(0) => \count_value_i_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_value_i_reg[7]_i_1_n_4\,
      O(2) => \count_value_i_reg[7]_i_1_n_5\,
      O(1) => \count_value_i_reg[7]_i_1_n_6\,
      O(0) => \count_value_i_reg[7]_i_1_n_7\,
      S(3 downto 0) => \^q\(7 downto 4)
    );
\count_value_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[10]_i_1_n_7\,
      Q => \^q\(8),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\count_value_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i_reg[10]_i_1_n_6\,
      Q => \^q\(9),
      R => \gen_rst_cc.fifo_wr_rst_i_reg_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(9),
      I1 => \count_value_i_reg[9]_3\(8),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\(0)
    );
\gen_pntr_flags_cc.ram_empty_i_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i_reg[8]_0\(6),
      I2 => \count_value_i_reg[8]_0\(8),
      I3 => \^q\(8),
      I4 => \count_value_i_reg[8]_0\(7),
      I5 => \^q\(7),
      O => \gen_pntr_flags_cc.ram_empty_i_i_4_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i_reg[8]_0\(3),
      I2 => \count_value_i_reg[8]_0\(5),
      I3 => \^q\(5),
      I4 => \count_value_i_reg[8]_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.ram_empty_i_i_5_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \count_value_i_reg[8]_0\(0),
      I2 => \count_value_i_reg[8]_0\(2),
      I3 => \^q\(2),
      I4 => \count_value_i_reg[8]_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.ram_empty_i_i_6_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_reg_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gen_pntr_flags_cc.ram_empty_i_reg\(0),
      CO(2) => \gen_pntr_flags_cc.ram_empty_i_reg_i_2_n_1\,
      CO(1) => \gen_pntr_flags_cc.ram_empty_i_reg_i_2_n_2\,
      CO(0) => \gen_pntr_flags_cc.ram_empty_i_reg_i_2_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_pntr_flags_cc.ram_empty_i_reg_i_2_O_UNCONNECTED\(3 downto 0),
      S(3) => \count_value_i_reg[9]_0\(0),
      S(2) => \gen_pntr_flags_cc.ram_empty_i_i_4_n_0\,
      S(1) => \gen_pntr_flags_cc.ram_empty_i_i_5_n_0\,
      S(0) => \gen_pntr_flags_cc.ram_empty_i_i_6_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1_n_0\,
      CO(2) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1_n_1\,
      CO(1) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1_n_2\,
      CO(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1_n_3\,
      CYINIT => \^q\(0),
      DI(3 downto 1) => \^q\(3 downto 1),
      DI(0) => \gen_rst_cc.fifo_wr_rst_i_reg\(0),
      O(3 downto 0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\(3 downto 0),
      S(3 downto 0) => \count_value_i_reg[3]_0\(3 downto 0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_i_1_n_0\,
      CO(3) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_0\,
      CO(2) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_1\,
      CO(1) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_2\,
      CO(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^q\(7 downto 4),
      O(3 downto 0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\(7 downto 4),
      S(3 downto 0) => \count_value_i_reg[7]_0\(3 downto 0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_0\,
      CO(3 downto 1) => \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \^q\(8),
      O(3 downto 2) => \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\(9 downto 8),
      S(3 downto 2) => B"00",
      S(1 downto 0) => \count_value_i_reg[9]_2\(1 downto 0)
    );
\gwdc.wr_data_count_i[10]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(8),
      I1 => \count_value_i_reg[9]_3\(7),
      O => \gwdc.wr_data_count_i[10]_i_2_n_0\
    );
\gwdc.wr_data_count_i[10]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(7),
      I1 => \count_value_i_reg[9]_3\(6),
      O => \gwdc.wr_data_count_i[10]_i_3_n_0\
    );
\gwdc.wr_data_count_i[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(2),
      I1 => \count_value_i_reg[9]_3\(1),
      O => \gwdc.wr_data_count_i[3]_i_2_n_0\
    );
\gwdc.wr_data_count_i[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"718E8E71"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[1]_0\(0),
      I2 => \count_value_i_reg[9]_3\(0),
      I3 => \count_value_i_reg[9]_3\(1),
      I4 => \^q\(2),
      O => \gwdc.wr_data_count_i[3]_i_6_n_0\
    );
\gwdc.wr_data_count_i[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i_reg[9]_3\(5),
      O => \gwdc.wr_data_count_i[7]_i_2_n_0\
    );
\gwdc.wr_data_count_i[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i_reg[9]_3\(4),
      O => \gwdc.wr_data_count_i[7]_i_3_n_0\
    );
\gwdc.wr_data_count_i[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(4),
      I1 => \count_value_i_reg[9]_3\(3),
      O => \gwdc.wr_data_count_i[7]_i_4_n_0\
    );
\gwdc.wr_data_count_i[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i_reg[9]_3\(2),
      O => \gwdc.wr_data_count_i[7]_i_5_n_0\
    );
\gwdc.wr_data_count_i_reg[10]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \gwdc.wr_data_count_i_reg[7]_i_1_n_0\,
      CO(3 downto 2) => \NLW_gwdc.wr_data_count_i_reg[10]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \gwdc.wr_data_count_i_reg[10]_i_1_n_2\,
      CO(0) => \gwdc.wr_data_count_i_reg[10]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \gwdc.wr_data_count_i[10]_i_2_n_0\,
      DI(0) => \gwdc.wr_data_count_i[10]_i_3_n_0\,
      O(3) => \NLW_gwdc.wr_data_count_i_reg[10]_i_1_O_UNCONNECTED\(3),
      O(2 downto 0) => D(10 downto 8),
      S(3) => '0',
      S(2 downto 0) => \count_value_i_reg[9]_1\(2 downto 0)
    );
\gwdc.wr_data_count_i_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gwdc.wr_data_count_i_reg[3]_i_1_n_0\,
      CO(2) => \gwdc.wr_data_count_i_reg[3]_i_1_n_1\,
      CO(1) => \gwdc.wr_data_count_i_reg[3]_i_1_n_2\,
      CO(0) => \gwdc.wr_data_count_i_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \gwdc.wr_data_count_i[3]_i_2_n_0\,
      DI(2 downto 1) => DI(1 downto 0),
      DI(0) => \^q\(0),
      O(3 downto 0) => D(3 downto 0),
      S(3) => \count_value_i_reg[2]_0\(2),
      S(2) => \gwdc.wr_data_count_i[3]_i_6_n_0\,
      S(1 downto 0) => \count_value_i_reg[2]_0\(1 downto 0)
    );
\gwdc.wr_data_count_i_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \gwdc.wr_data_count_i_reg[3]_i_1_n_0\,
      CO(3) => \gwdc.wr_data_count_i_reg[7]_i_1_n_0\,
      CO(2) => \gwdc.wr_data_count_i_reg[7]_i_1_n_1\,
      CO(1) => \gwdc.wr_data_count_i_reg[7]_i_1_n_2\,
      CO(0) => \gwdc.wr_data_count_i_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \gwdc.wr_data_count_i[7]_i_2_n_0\,
      DI(2) => \gwdc.wr_data_count_i[7]_i_3_n_0\,
      DI(1) => \gwdc.wr_data_count_i[7]_i_4_n_0\,
      DI(0) => \gwdc.wr_data_count_i[7]_i_5_n_0\,
      O(3 downto 0) => D(7 downto 4),
      S(3 downto 0) => \count_value_i_reg[6]_0\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \count_value_i_reg[0]_0\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_fwft.curr_fwft_state_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rd_en : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    \count_value_i_reg[9]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_rst_cc.fifo_wr_rst_i_reg\ : in STD_LOGIC;
    rd_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1\ : entity is "xpm_counter_updn";
end \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1\;

architecture STRUCTURE of \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \count_value_i[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_2_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[8]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_2_n_0\ : STD_LOGIC;
  signal \^count_value_i_reg[0]_0\ : STD_LOGIC;
  signal \count_value_i_reg_n_0_[9]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count_value_i[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count_value_i[8]_i_1\ : label is "soft_lutpair0";
begin
  Q(8 downto 0) <= \^q\(8 downto 0);
  \count_value_i_reg[0]_0\ <= \^count_value_i_reg[0]_0\;
\count_value_i[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40BF"
    )
        port map (
      I0 => rd_en,
      I1 => \gen_fwft.curr_fwft_state_reg[1]\(1),
      I2 => \gen_fwft.curr_fwft_state_reg[1]\(0),
      I3 => \^q\(0),
      O => \count_value_i[0]_i_1__0_n_0\
    );
\count_value_i[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08FFF700"
    )
        port map (
      I0 => \gen_fwft.curr_fwft_state_reg[1]\(0),
      I1 => \gen_fwft.curr_fwft_state_reg[1]\(1),
      I2 => rd_en,
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \count_value_i[1]_i_1__0_n_0\
    );
\count_value_i[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__0_n_0\
    );
\count_value_i[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__0_n_0\
    );
\count_value_i[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__0_n_0\
    );
\count_value_i[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[6]_i_2_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1_n_0\
    );
\count_value_i[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \count_value_i[6]_i_2_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => \count_value_i[6]_i_1_n_0\
    );
\count_value_i[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AA2A00000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \gen_fwft.curr_fwft_state_reg[1]\(0),
      I2 => \gen_fwft.curr_fwft_state_reg[1]\(1),
      I3 => rd_en,
      I4 => ram_empty_i,
      I5 => \^q\(0),
      O => \count_value_i[6]_i_2_n_0\
    );
\count_value_i[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i[9]_i_2_n_0\,
      I2 => \^q\(6),
      I3 => \^q\(7),
      O => \count_value_i[7]_i_1_n_0\
    );
\count_value_i[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i[9]_i_2_n_0\,
      I2 => \^q\(5),
      I3 => \^q\(7),
      I4 => \^q\(8),
      O => \count_value_i[8]_i_1_n_0\
    );
\count_value_i[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(5),
      I2 => \count_value_i[9]_i_2_n_0\,
      I3 => \^q\(6),
      I4 => \^q\(8),
      I5 => \count_value_i_reg_n_0_[9]\,
      O => \count_value_i[9]_i_1_n_0\
    );
\count_value_i[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^count_value_i_reg[0]_0\,
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_value_i[9]_i_2_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[0]_i_1__0_n_0\,
      Q => \^q\(0),
      S => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[1]_i_1__0_n_0\,
      Q => \^q\(1),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[2]_i_1__0_n_0\,
      Q => \^q\(2),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[3]_i_1__0_n_0\,
      Q => \^q\(3),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[4]_i_1__0_n_0\,
      Q => \^q\(4),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[5]_i_1_n_0\,
      Q => \^q\(5),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[6]_i_1_n_0\,
      Q => \^q\(6),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[7]_i_1_n_0\,
      Q => \^q\(7),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[8]_i_1_n_0\,
      Q => \^q\(8),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => \^count_value_i_reg[0]_0\,
      D => \count_value_i[9]_i_1_n_0\,
      Q => \count_value_i_reg_n_0_[9]\,
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\gen_pntr_flags_cc.ram_empty_i_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \count_value_i_reg_n_0_[9]\,
      I1 => \count_value_i_reg[9]_0\(0),
      O => S(0)
    );
\gen_sdpram.xpm_memory_base_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00F7"
    )
        port map (
      I0 => \gen_fwft.curr_fwft_state_reg[1]\(0),
      I1 => \gen_fwft.curr_fwft_state_reg[1]\(1),
      I2 => rd_en,
      I3 => ram_empty_i,
      O => \^count_value_i_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1_1\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    D : out STD_LOGIC_VECTOR ( 9 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ : in STD_LOGIC;
    \gen_rst_cc.fifo_wr_rst_i_reg\ : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\ : in STD_LOGIC;
    \gen_rst_cc.fifo_wr_rst_i_reg_0\ : in STD_LOGIC;
    \count_value_i_reg[9]_0\ : in STD_LOGIC_VECTOR ( 9 downto 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1_1\ : entity is "xpm_counter_updn";
end \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1_1\;

architecture STRUCTURE of \bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1_1\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \count_value_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_2_n_0\ : STD_LOGIC;
  signal \count_value_i[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_2__0_n_0\ : STD_LOGIC;
  signal \count_value_i_reg_n_0_[9]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[10]_i_2_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[10]_i_3_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_3_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_4_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_5_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_6_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_2_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_3_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_4_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_5_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[10]_i_1_n_3\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[10]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[10]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count_value_i[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \count_value_i[5]_i_1__0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count_value_i[6]_i_1__0\ : label is "soft_lutpair2";
begin
  Q(8 downto 0) <= \^q\(8 downto 0);
\count_value_i[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count_value_i[0]_i_1_n_0\
    );
\count_value_i[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \count_value_i[1]_i_1_n_0\
    );
\count_value_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1_n_0\
    );
\count_value_i[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1_n_0\
    );
\count_value_i[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1_n_0\
    );
\count_value_i[5]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[7]_i_2_n_0\,
      I2 => \^q\(4),
      I3 => \^q\(5),
      O => \count_value_i[5]_i_1__0_n_0\
    );
\count_value_i[6]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \count_value_i[7]_i_2_n_0\,
      I2 => \^q\(3),
      I3 => \^q\(5),
      I4 => \^q\(6),
      O => \count_value_i[6]_i_1__0_n_0\
    );
\count_value_i[7]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \count_value_i[7]_i_2_n_0\,
      I3 => \^q\(4),
      I4 => \^q\(6),
      I5 => \^q\(7),
      O => \count_value_i[7]_i_1__0_n_0\
    );
\count_value_i[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000080000000000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \gen_rst_cc.fifo_wr_rst_i_reg\,
      I3 => wr_en,
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\,
      I5 => \^q\(1),
      O => \count_value_i[7]_i_2_n_0\
    );
\count_value_i[8]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i[9]_i_2__0_n_0\,
      I2 => \^q\(5),
      I3 => \^q\(7),
      I4 => \^q\(8),
      O => \count_value_i[8]_i_1__0_n_0\
    );
\count_value_i[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(5),
      I2 => \count_value_i[9]_i_2__0_n_0\,
      I3 => \^q\(6),
      I4 => \^q\(8),
      I5 => \count_value_i_reg_n_0_[9]\,
      O => \count_value_i[9]_i_1__0_n_0\
    );
\count_value_i[9]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_value_i[9]_i_2__0_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[0]_i_1_n_0\,
      Q => \^q\(0),
      S => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[1]_i_1_n_0\,
      Q => \^q\(1),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[2]_i_1_n_0\,
      Q => \^q\(2),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[3]_i_1_n_0\,
      Q => \^q\(3),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[4]_i_1_n_0\,
      Q => \^q\(4),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[5]_i_1__0_n_0\,
      Q => \^q\(5),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[6]_i_1__0_n_0\,
      Q => \^q\(6),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[7]_i_1__0_n_0\,
      Q => \^q\(7),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[8]_i_1__0_n_0\,
      Q => \^q\(8),
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\count_value_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\,
      D => \count_value_i[9]_i_1__0_n_0\,
      Q => \count_value_i_reg_n_0_[9]\,
      R => \gen_rst_cc.fifo_wr_rst_i_reg\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \count_value_i_reg_n_0_[9]\,
      I1 => \count_value_i_reg[9]_0\(9),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\(0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[10]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \count_value_i_reg_n_0_[9]\,
      I1 => \count_value_i_reg[9]_0\(9),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[10]_i_2_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[10]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(8),
      I1 => \count_value_i_reg[9]_0\(8),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[10]_i_3_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i_reg[9]_0\(3),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_3_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(2),
      I1 => \count_value_i_reg[9]_0\(2),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_4_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[9]_0\(1),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_5_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => \count_value_i_reg[9]_0\(0),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_6_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(7),
      I1 => \count_value_i_reg[9]_0\(7),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_2_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i_reg[9]_0\(6),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_3_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i_reg[9]_0\(5),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_4_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \count_value_i_reg[9]_0\(4),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_5_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[10]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1_n_0\,
      CO(3 downto 1) => \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[10]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[10]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \^q\(8),
      O(3 downto 2) => \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[10]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => D(9 downto 8),
      S(3 downto 2) => B"00",
      S(1) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[10]_i_2_n_0\,
      S(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[10]_i_3_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1_n_0\,
      CO(2) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1_n_1\,
      CO(1) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1_n_2\,
      CO(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1_n_3\,
      CYINIT => \gen_rst_cc.fifo_wr_rst_i_reg_0\,
      DI(3 downto 0) => \^q\(3 downto 0),
      O(3 downto 0) => D(3 downto 0),
      S(3) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_3_n_0\,
      S(2) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_4_n_0\,
      S(1) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_5_n_0\,
      S(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_6_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]_i_1_n_0\,
      CO(3) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1_n_0\,
      CO(2) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1_n_1\,
      CO(1) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1_n_2\,
      CO(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^q\(7 downto 4),
      O(3 downto 0) => D(7 downto 4),
      S(3) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_2_n_0\,
      S(2) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_3_n_0\,
      S(1) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_4_n_0\,
      S(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[8]_i_5_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_xpm_fifo_reg_bit is
  port (
    rst_d1 : out STD_LOGIC;
    clr_full : out STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_reg\ : out STD_LOGIC;
    \gen_rst_cc.fifo_wr_rst_i_reg\ : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    ram_wr_en_pf_q : in STD_LOGIC;
    prog_full_i217_in : in STD_LOGIC;
    ram_rd_en_pf_q : in STD_LOGIC;
    prog_full : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_xpm_fifo_reg_bit : entity is "xpm_fifo_reg_bit";
end bd_v_vid_in_axi4s_0_0_xpm_fifo_reg_bit;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_xpm_fifo_reg_bit is
  signal \^clr_full\ : STD_LOGIC;
  signal \^rst_d1\ : STD_LOGIC;
begin
  clr_full <= \^clr_full\;
  rst_d1 <= \^rst_d1\;
d_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gen_rst_cc.fifo_wr_rst_i_reg\,
      Q => \^rst_d1\,
      R => '0'
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => rst,
      I1 => \^rst_d1\,
      I2 => \gen_rst_cc.fifo_wr_rst_i_reg\,
      O => \^clr_full\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45550040"
    )
        port map (
      I0 => \^clr_full\,
      I1 => ram_wr_en_pf_q,
      I2 => prog_full_i217_in,
      I3 => ram_rd_en_pf_q,
      I4 => prog_full,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_reg\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_xpm_fifo_rst is
  port (
    \count_value_i_reg[1]\ : out STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_reg\ : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    overflow_i0 : out STD_LOGIC;
    underflow_i0 : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\ : out STD_LOGIC;
    \count_value_i_reg[0]\ : out STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]\ : out STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    rst_d1 : in STD_LOGIC;
    write_only_q : in STD_LOGIC;
    prog_empty : in STD_LOGIC;
    prog_empty_i1 : in STD_LOGIC;
    read_only_q : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    wr_en : in STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ : in STD_LOGIC;
    \gen_fwft.curr_fwft_state_reg[0]\ : in STD_LOGIC;
    \gen_fwft.empty_fwft_i_reg\ : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    \count_value_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \count_value_i_reg[9]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \count_value_i_reg[0]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_xpm_fifo_rst : entity is "xpm_fifo_rst";
end bd_v_vid_in_axi4s_0_0_xpm_fifo_rst;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_xpm_fifo_rst is
  signal \^count_value_i_reg[0]\ : STD_LOGIC;
  signal \^count_value_i_reg[1]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_2_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \power_on_rst_reg_n_0_[0]\ : STD_LOGIC;
  signal rst_i : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \gof.overflow_i_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \grdc.rd_data_count_i[10]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \guf.underflow_i_i_1\ : label is "soft_lutpair5";
begin
  \count_value_i_reg[0]\ <= \^count_value_i_reg[0]\;
  \count_value_i_reg[1]\ <= \^count_value_i_reg[1]\;
\count_value_i[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB04"
    )
        port map (
      I0 => \^count_value_i_reg[1]\,
      I1 => wr_en,
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\,
      I3 => \count_value_i_reg[0]_0\(0),
      O => S(0)
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444455500004555"
    )
        port map (
      I0 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_2_n_0\,
      I1 => \gen_fwft.curr_fwft_state_reg[0]\,
      I2 => \count_value_i_reg[9]\(0),
      I3 => \^count_value_i_reg[0]\,
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\,
      I5 => CO(0),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => \^count_value_i_reg[1]\,
      I1 => rst_d1,
      I2 => rst,
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_2_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF04FF"
    )
        port map (
      I0 => \^count_value_i_reg[1]\,
      I1 => wr_en,
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\,
      I3 => \gen_fwft.curr_fwft_state_reg[0]\,
      I4 => \gen_fwft.empty_fwft_i_reg\,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\(0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF04FF0000FB00"
    )
        port map (
      I0 => \^count_value_i_reg[1]\,
      I1 => wr_en,
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\,
      I3 => \gen_fwft.curr_fwft_state_reg[0]\,
      I4 => \gen_fwft.empty_fwft_i_reg\,
      I5 => \count_value_i_reg[0]_1\(0),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_0\(0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFC4C"
    )
        port map (
      I0 => write_only_q,
      I1 => prog_empty,
      I2 => prog_empty_i1,
      I3 => read_only_q,
      I4 => \^count_value_i_reg[1]\,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_reg\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \^count_value_i_reg[1]\,
      I1 => wr_en,
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\,
      I3 => \gen_fwft.curr_fwft_state_reg[0]\,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]\
    );
\gen_rst_cc.fifo_wr_rst_i_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in,
      I1 => rst,
      O => rst_i
    );
\gen_rst_cc.fifo_wr_rst_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rst_i,
      Q => \^count_value_i_reg[1]\,
      R => '0'
    );
\gen_sdpram.xpm_memory_base_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\,
      I1 => wr_en,
      I2 => \^count_value_i_reg[1]\,
      O => \^count_value_i_reg[0]\
    );
\gof.overflow_i_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => wr_en,
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\,
      I2 => \^count_value_i_reg[1]\,
      O => overflow_i0
    );
\grdc.rd_data_count_i[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AB"
    )
        port map (
      I0 => \^count_value_i_reg[1]\,
      I1 => Q(0),
      I2 => Q(1),
      O => SR(0)
    );
\guf.underflow_i_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => rd_en,
      I1 => \gen_fwft.empty_fwft_i_reg\,
      I2 => \^count_value_i_reg[1]\,
      O => underflow_i0
    );
\power_on_rst_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      Q => \power_on_rst_reg_n_0_[0]\,
      R => '0'
    );
\power_on_rst_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \power_on_rst_reg_n_0_[0]\,
      Q => p_0_in,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_xpm_memory_base is
  port (
    sleep : in STD_LOGIC;
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 26 downto 0 );
    injectsbiterra : in STD_LOGIC;
    injectdbiterra : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 26 downto 0 );
    sbiterra : out STD_LOGIC;
    dbiterra : out STD_LOGIC;
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 26 downto 0 );
    injectsbiterrb : in STD_LOGIC;
    injectdbiterrb : in STD_LOGIC;
    doutb : out STD_LOGIC_VECTOR ( 26 downto 0 );
    sbiterrb : out STD_LOGIC;
    dbiterrb : out STD_LOGIC
  );
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 10;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 10;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute ECC_MODE : integer;
  attribute ECC_MODE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27648;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 1;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "xpm_memory_base";
  attribute P_ECC_MODE : string;
  attribute P_ECC_MODE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 1024;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "auto";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "yes";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 10;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 10;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 10;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 10;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 2;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 2;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "0";
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 27;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 2;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is 2;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of bd_v_vid_in_axi4s_0_0_xpm_memory_base : entity is "TRUE";
end bd_v_vid_in_axi4s_0_0_xpm_memory_base;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_xpm_memory_base is
  signal \<const0>\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_INJECTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_INJECTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 27 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute \MEM.PORTA.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ : integer;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 1023;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is "p0_d27";
  attribute \MEM.PORTA.DATA_LSB\ : integer;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ : integer;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 26;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ : integer;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 1023;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is "p0_d27";
  attribute \MEM.PORTB.DATA_LSB\ : integer;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ : integer;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 26;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg\ : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 27648;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg\ : label is 26;
begin
  dbiterra <= \<const0>\;
  dbiterrb <= \<const0>\;
  douta(26) <= \<const0>\;
  douta(25) <= \<const0>\;
  douta(24) <= \<const0>\;
  douta(23) <= \<const0>\;
  douta(22) <= \<const0>\;
  douta(21) <= \<const0>\;
  douta(20) <= \<const0>\;
  douta(19) <= \<const0>\;
  douta(18) <= \<const0>\;
  douta(17) <= \<const0>\;
  douta(16) <= \<const0>\;
  douta(15) <= \<const0>\;
  douta(14) <= \<const0>\;
  douta(13) <= \<const0>\;
  douta(12) <= \<const0>\;
  douta(11) <= \<const0>\;
  douta(10) <= \<const0>\;
  douta(9) <= \<const0>\;
  douta(8) <= \<const0>\;
  douta(7) <= \<const0>\;
  douta(6) <= \<const0>\;
  douta(5) <= \<const0>\;
  douta(4) <= \<const0>\;
  douta(3) <= \<const0>\;
  douta(2) <= \<const0>\;
  douta(1) <= \<const0>\;
  douta(0) <= \<const0>\;
  sbiterra <= \<const0>\;
  sbiterrb <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_wr_a.gen_word_narrow.mem_reg\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      CASCADEINA => '1',
      CASCADEINB => '1',
      CASCADEOUTA => \NLW_gen_wr_a.gen_word_narrow.mem_reg_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_gen_wr_a.gen_word_narrow.mem_reg_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_DBITERR_UNCONNECTED\,
      DIADI(31 downto 27) => B"00000",
      DIADI(26 downto 0) => dina(26 downto 0),
      DIBDI(31 downto 0) => B"00000111111111111111111111111111",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_DOADO_UNCONNECTED\(31 downto 0),
      DOBDO(31 downto 27) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_DOBDO_UNCONNECTED\(31 downto 27),
      DOBDO(26 downto 0) => doutb(26 downto 0),
      DOPADOP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => ena,
      ENBWREN => enb,
      INJECTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_INJECTDBITERR_UNCONNECTED\,
      INJECTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_INJECTSBITERR_UNCONNECTED\,
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => regceb,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => rstb,
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_SBITERR_UNCONNECTED\,
      WEA(3) => ena,
      WEA(2) => ena,
      WEA(1) => ena,
      WEA(0) => ena,
      WEBWE(7 downto 0) => B"00000000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single is
  port (
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single : entity is "v_vid_in_axi4s_v4_0_7_cdc_single";
end bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single is
  signal xpm_cdc_single_inst_n_0 : STD_LOGIC;
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of xpm_cdc_single_inst : label is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of xpm_cdc_single_inst : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of xpm_cdc_single_inst : label is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of xpm_cdc_single_inst : label is 0;
  attribute VERSION : integer;
  attribute VERSION of xpm_cdc_single_inst : label is 0;
  attribute XPM_CDC : string;
  attribute XPM_CDC of xpm_cdc_single_inst : label is "SINGLE";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of xpm_cdc_single_inst : label is "TRUE";
begin
xpm_cdc_single_inst: entity work.bd_v_vid_in_axi4s_0_0_xpm_cdc_single
     port map (
      dest_clk => aclk,
      dest_out => xpm_cdc_single_inst_n_0,
      src_clk => '0',
      src_in => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single__xdcDup__1\ is
  port (
    fifo_overflow_from_coupler_pulse_reg : in STD_LOGIC;
    aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single__xdcDup__1\ : entity is "v_vid_in_axi4s_v4_0_7_cdc_single";
end \bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single__xdcDup__1\;

architecture STRUCTURE of \bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single__xdcDup__1\ is
  signal fifo_overflow_from_coupler_sync : STD_LOGIC;
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of xpm_cdc_single_inst : label is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of xpm_cdc_single_inst : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of xpm_cdc_single_inst : label is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of xpm_cdc_single_inst : label is 0;
  attribute VERSION : integer;
  attribute VERSION of xpm_cdc_single_inst : label is 0;
  attribute XPM_CDC : string;
  attribute XPM_CDC of xpm_cdc_single_inst : label is "SINGLE";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of xpm_cdc_single_inst : label is "TRUE";
begin
xpm_cdc_single_inst: entity work.\bd_v_vid_in_axi4s_0_0_xpm_cdc_single__2\
     port map (
      dest_clk => aclk,
      dest_out => fifo_overflow_from_coupler_sync,
      src_clk => '0',
      src_in => fifo_overflow_from_coupler_pulse_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_xpm_fifo_base is
  port (
    sleep : in STD_LOGIC;
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 26 downto 0 );
    full : out STD_LOGIC;
    full_n : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    overflow : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 26 downto 0 );
    empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    underflow : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    data_valid : out STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC
  );
  attribute CDC_DEST_SYNC_FF : integer;
  attribute CDC_DEST_SYNC_FF of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 2;
  attribute COMMON_CLOCK : integer;
  attribute COMMON_CLOCK of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 1;
  attribute DOUT_RESET_VALUE : string;
  attribute DOUT_RESET_VALUE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "0";
  attribute ECC_MODE : integer;
  attribute ECC_MODE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute ENABLE_ECC : integer;
  attribute ENABLE_ECC of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute EN_ADV_FEATURE : string;
  attribute EN_ADV_FEATURE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "16'b0000011100000111";
  attribute EN_AE : string;
  attribute EN_AE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b0";
  attribute EN_AF : string;
  attribute EN_AF of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b0";
  attribute EN_DVLD : string;
  attribute EN_DVLD of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b0";
  attribute EN_OF : string;
  attribute EN_OF of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b1";
  attribute EN_PE : string;
  attribute EN_PE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b1";
  attribute EN_PF : string;
  attribute EN_PF of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b1";
  attribute EN_RDC : string;
  attribute EN_RDC of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b1";
  attribute EN_UF : string;
  attribute EN_UF of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b1";
  attribute EN_WACK : string;
  attribute EN_WACK of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b0";
  attribute EN_WDC : string;
  attribute EN_WDC of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b1";
  attribute FG_EQ_ASYM_DOUT : string;
  attribute FG_EQ_ASYM_DOUT of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b0";
  attribute FIFO_MEMORY_TYPE : integer;
  attribute FIFO_MEMORY_TYPE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute FIFO_MEM_TYPE : integer;
  attribute FIFO_MEM_TYPE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute FIFO_READ_DEPTH : integer;
  attribute FIFO_READ_DEPTH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 1024;
  attribute FIFO_READ_LATENCY : integer;
  attribute FIFO_READ_LATENCY of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 27648;
  attribute FIFO_WRITE_DEPTH : integer;
  attribute FIFO_WRITE_DEPTH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 1024;
  attribute FULL_RESET_VALUE : integer;
  attribute FULL_RESET_VALUE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 1;
  attribute FULL_RST_VAL : string;
  attribute FULL_RST_VAL of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "1'b1";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "xpm_fifo_base";
  attribute PE_THRESH_ADJ : integer;
  attribute PE_THRESH_ADJ of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 8;
  attribute PE_THRESH_MAX : integer;
  attribute PE_THRESH_MAX of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 1019;
  attribute PE_THRESH_MIN : integer;
  attribute PE_THRESH_MIN of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 5;
  attribute PF_THRESH_ADJ : integer;
  attribute PF_THRESH_ADJ of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 8;
  attribute PF_THRESH_MAX : integer;
  attribute PF_THRESH_MAX of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 1019;
  attribute PF_THRESH_MIN : integer;
  attribute PF_THRESH_MIN of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 7;
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 10;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 10;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 11;
  attribute RD_DC_WIDTH_EXT : integer;
  attribute RD_DC_WIDTH_EXT of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 11;
  attribute RD_LATENCY : integer;
  attribute RD_LATENCY of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 2;
  attribute RD_MODE : integer;
  attribute RD_MODE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 1;
  attribute RD_PNTR_WIDTH : integer;
  attribute RD_PNTR_WIDTH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 10;
  attribute READ_DATA_WIDTH : integer;
  attribute READ_DATA_WIDTH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 27;
  attribute READ_MODE : integer;
  attribute READ_MODE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 1;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute REMOVE_WR_RD_PROT_LOGIC : integer;
  attribute REMOVE_WR_RD_PROT_LOGIC of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute USE_ADV_FEATURES : string;
  attribute USE_ADV_FEATURES of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "0707";
  attribute VERSION : integer;
  attribute VERSION of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute WRITE_DATA_WIDTH : integer;
  attribute WRITE_DATA_WIDTH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 27;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 11;
  attribute WR_DC_WIDTH_EXT : integer;
  attribute WR_DC_WIDTH_EXT of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 11;
  attribute WR_PNTR_WIDTH : integer;
  attribute WR_PNTR_WIDTH of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 10;
  attribute WR_RD_RATIO : integer;
  attribute WR_RD_RATIO of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base : entity is "TRUE";
end bd_v_vid_in_axi4s_0_0_xpm_fifo_base;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_xpm_fifo_base is
  signal \<const0>\ : STD_LOGIC;
  signal clr_full : STD_LOGIC;
  signal count_value_i : STD_LOGIC_VECTOR ( 1 to 1 );
  signal diff_pntr_pe : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal diff_pntr_pf_q : STD_LOGIC_VECTOR ( 10 downto 1 );
  signal diff_pntr_pf_q0 : STD_LOGIC_VECTOR ( 10 downto 1 );
  signal \^empty\ : STD_LOGIC;
  signal \^full\ : STD_LOGIC;
  signal \gen_fwft.curr_fwft_state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \gen_fwft.empty_fwft_i_reg0\ : STD_LOGIC;
  signal \gen_fwft.next_fwft_state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \gen_fwft.ram_regout_en\ : STD_LOGIC;
  signal \gen_fwft.rdpp1_inst_n_0\ : STD_LOGIC;
  signal \gen_fwft.rdpp1_inst_n_1\ : STD_LOGIC;
  signal \gen_fwft.rdpp1_inst_n_2\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[0]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[1]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[2]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[3]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[4]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[5]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[6]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[7]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[8]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[9]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_i_1_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_i_1_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_i_3_n_0\ : STD_LOGIC;
  signal going_empty1 : STD_LOGIC;
  signal going_full1 : STD_LOGIC;
  signal \grdc.diff_wr_rd_pntr_rdc\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \grdc.rd_data_count_i0\ : STD_LOGIC;
  signal leaving_empty0 : STD_LOGIC;
  signal overflow_i0 : STD_LOGIC;
  signal \^prog_empty\ : STD_LOGIC;
  signal prog_empty_i1 : STD_LOGIC;
  signal \^prog_full\ : STD_LOGIC;
  signal prog_full_i217_in : STD_LOGIC;
  signal ram_empty_i : STD_LOGIC;
  signal ram_empty_i0 : STD_LOGIC;
  signal ram_rd_en_pf_q : STD_LOGIC;
  signal ram_wr_en_pf_q : STD_LOGIC;
  signal rd_pntr_ext : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^rd_rst_busy\ : STD_LOGIC;
  signal rdp_inst_n_10 : STD_LOGIC;
  signal rdp_inst_n_13 : STD_LOGIC;
  signal rdp_inst_n_14 : STD_LOGIC;
  signal rdp_inst_n_15 : STD_LOGIC;
  signal rdp_inst_n_17 : STD_LOGIC;
  signal rdp_inst_n_18 : STD_LOGIC;
  signal rdp_inst_n_19 : STD_LOGIC;
  signal rdp_inst_n_20 : STD_LOGIC;
  signal rdp_inst_n_21 : STD_LOGIC;
  signal rdp_inst_n_22 : STD_LOGIC;
  signal rdp_inst_n_23 : STD_LOGIC;
  signal rdp_inst_n_24 : STD_LOGIC;
  signal rdp_inst_n_25 : STD_LOGIC;
  signal rdp_inst_n_26 : STD_LOGIC;
  signal rdp_inst_n_27 : STD_LOGIC;
  signal rdp_inst_n_28 : STD_LOGIC;
  signal rdp_inst_n_29 : STD_LOGIC;
  signal rdp_inst_n_30 : STD_LOGIC;
  signal rdp_inst_n_31 : STD_LOGIC;
  signal rdpp1_inst_n_0 : STD_LOGIC;
  signal rdpp1_inst_n_1 : STD_LOGIC;
  signal rdpp1_inst_n_10 : STD_LOGIC;
  signal rdpp1_inst_n_2 : STD_LOGIC;
  signal rdpp1_inst_n_3 : STD_LOGIC;
  signal rdpp1_inst_n_4 : STD_LOGIC;
  signal rdpp1_inst_n_5 : STD_LOGIC;
  signal rdpp1_inst_n_6 : STD_LOGIC;
  signal rdpp1_inst_n_7 : STD_LOGIC;
  signal rdpp1_inst_n_8 : STD_LOGIC;
  signal rdpp1_inst_n_9 : STD_LOGIC;
  signal read_only_q : STD_LOGIC;
  signal rst_d1 : STD_LOGIC;
  signal rst_d1_inst_n_2 : STD_LOGIC;
  signal underflow_i0 : STD_LOGIC;
  signal wr_pntr_ext : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal write_only_q : STD_LOGIC;
  signal wrp_inst_n_0 : STD_LOGIC;
  signal wrp_inst_n_33 : STD_LOGIC;
  signal wrpp1_inst_n_0 : STD_LOGIC;
  signal wrpp1_inst_n_1 : STD_LOGIC;
  signal wrpp1_inst_n_19 : STD_LOGIC;
  signal wrpp1_inst_n_2 : STD_LOGIC;
  signal wrpp1_inst_n_3 : STD_LOGIC;
  signal wrpp1_inst_n_4 : STD_LOGIC;
  signal wrpp1_inst_n_5 : STD_LOGIC;
  signal wrpp1_inst_n_6 : STD_LOGIC;
  signal wrpp1_inst_n_7 : STD_LOGIC;
  signal wrpp1_inst_n_8 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_1 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_10 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_3 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_6 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_7 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_8 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_9 : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED\ : STD_LOGIC_VECTOR ( 26 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gen_fwft.curr_fwft_state[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gen_fwft.curr_fwft_state[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_i_1\ : label is "soft_lutpair8";
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 10;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 10;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute ECC_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute \MEM.ADDRESS_SPACE\ : boolean;
  attribute \MEM.ADDRESS_SPACE\ of \gen_sdpram.xpm_memory_base_inst\ : label is std.standard.true;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ : integer;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ of \gen_sdpram.xpm_memory_base_inst\ : label is 26;
  attribute \MEM.ADDRESS_SPACE_END\ : integer;
  attribute \MEM.ADDRESS_SPACE_END\ of \gen_sdpram.xpm_memory_base_inst\ : label is 1023;
  attribute \MEM.CORE_MEMORY_WIDTH\ : integer;
  attribute \MEM.CORE_MEMORY_WIDTH\ of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of \gen_sdpram.xpm_memory_base_inst\ : label is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of \gen_sdpram.xpm_memory_base_inst\ : label is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of \gen_sdpram.xpm_memory_base_inst\ : label is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of \gen_sdpram.xpm_memory_base_inst\ : label is 27648;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_ECC_MODE : string;
  attribute P_ECC_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of \gen_sdpram.xpm_memory_base_inst\ : label is 1024;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of \gen_sdpram.xpm_memory_base_inst\ : label is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of \gen_sdpram.xpm_memory_base_inst\ : label is "auto";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of \gen_sdpram.xpm_memory_base_inst\ : label is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is "yes";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 10;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 10;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 10;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 10;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of \gen_sdpram.xpm_memory_base_inst\ : label is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of \gen_sdpram.xpm_memory_base_inst\ : label is "0";
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute VERSION of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute WAKEUP_TIME of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 27;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute XPM_MODULE of \gen_sdpram.xpm_memory_base_inst\ : label is "TRUE";
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  data_valid <= \<const0>\;
  dbiterr <= \<const0>\;
  empty <= \^empty\;
  full <= \^full\;
  prog_empty <= \^prog_empty\;
  prog_full <= \^prog_full\;
  rd_rst_busy <= \^rd_rst_busy\;
  sbiterr <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_rst_busy <= \^rd_rst_busy\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_fwft.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \gen_fwft.curr_fwft_state\(1),
      I1 => rd_en,
      I2 => \gen_fwft.curr_fwft_state\(0),
      O => \gen_fwft.next_fwft_state\(0)
    );
\gen_fwft.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"20FF"
    )
        port map (
      I0 => \gen_fwft.curr_fwft_state\(1),
      I1 => rd_en,
      I2 => \gen_fwft.curr_fwft_state\(0),
      I3 => ram_empty_i,
      O => \gen_fwft.next_fwft_state\(1)
    );
\gen_fwft.curr_fwft_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => \gen_fwft.next_fwft_state\(0),
      Q => \gen_fwft.curr_fwft_state\(0),
      R => \^rd_rst_busy\
    );
\gen_fwft.curr_fwft_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => \gen_fwft.next_fwft_state\(1),
      Q => \gen_fwft.curr_fwft_state\(1),
      R => \^rd_rst_busy\
    );
\gen_fwft.empty_fwft_i_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F320"
    )
        port map (
      I0 => rd_en,
      I1 => \gen_fwft.curr_fwft_state\(1),
      I2 => \gen_fwft.curr_fwft_state\(0),
      I3 => \^empty\,
      O => \gen_fwft.empty_fwft_i_reg0\
    );
\gen_fwft.empty_fwft_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => \gen_fwft.empty_fwft_i_reg0\,
      Q => \^empty\,
      S => \^rd_rst_busy\
    );
\gen_fwft.rdpp1_inst\: entity work.bd_v_vid_in_axi4s_0_0_xpm_counter_updn
     port map (
      DI(0) => \gen_fwft.rdpp1_inst_n_2\,
      Q(1 downto 0) => rd_pntr_ext(1 downto 0),
      S(1) => \gen_fwft.rdpp1_inst_n_0\,
      S(0) => \gen_fwft.rdpp1_inst_n_1\,
      \count_value_i_reg[1]_0\(0) => count_value_i(1),
      \count_value_i_reg[1]_1\(1 downto 0) => wr_pntr_ext(1 downto 0),
      \gen_fwft.curr_fwft_state_reg[1]\(1 downto 0) => \gen_fwft.curr_fwft_state\(1 downto 0),
      \gen_rst_cc.fifo_wr_rst_i_reg\ => \^rd_rst_busy\,
      ram_empty_i => ram_empty_i,
      rd_clk => rd_clk,
      rd_en => rd_en
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rdp_inst_n_22,
      Q => \^full\,
      S => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => xpm_fifo_rst_inst_n_7,
      Q => full_n,
      R => '0'
    );
\gen_pntr_flags_cc.ram_empty_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => ram_empty_i0,
      Q => ram_empty_i,
      S => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(0),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[0]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(1),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[1]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(2),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[2]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(3),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[3]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(4),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[4]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(5),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[5]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(6),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[6]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(7),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[7]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(8),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[8]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => diff_pntr_pe(9),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[9]\,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[7]\,
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[6]\,
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[5]\,
      I3 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[9]\,
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[8]\,
      I5 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3_n_0\,
      O => prog_empty_i1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[1]\,
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[3]\,
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[0]\,
      I3 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[4]\,
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[2]\,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => xpm_fifo_rst_inst_n_1,
      Q => \^prog_empty\,
      R => '0'
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4044"
    )
        port map (
      I0 => \^empty\,
      I1 => rdpp1_inst_n_9,
      I2 => \^full\,
      I3 => wr_en,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_i_1_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_reg\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_i_1_n_0\,
      Q => read_only_q,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4044"
    )
        port map (
      I0 => \^full\,
      I1 => wr_en,
      I2 => \^empty\,
      I3 => rdpp1_inst_n_9,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_i_1_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_i_1_n_0\,
      Q => write_only_q,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(10),
      Q => diff_pntr_pf_q(10),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(1),
      Q => diff_pntr_pf_q(1),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(2),
      Q => diff_pntr_pf_q(2),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(3),
      Q => diff_pntr_pf_q(3),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(4),
      Q => diff_pntr_pf_q(4),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(5),
      Q => diff_pntr_pf_q(5),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(6),
      Q => diff_pntr_pf_q(6),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(7),
      Q => diff_pntr_pf_q(7),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(8),
      Q => diff_pntr_pf_q(8),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pf_q0(9),
      Q => diff_pntr_pf_q(9),
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => diff_pntr_pf_q(8),
      I1 => diff_pntr_pf_q(7),
      I2 => diff_pntr_pf_q(6),
      I3 => diff_pntr_pf_q(10),
      I4 => diff_pntr_pf_q(9),
      I5 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_i_3_n_0\,
      O => prog_full_i217_in
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => diff_pntr_pf_q(2),
      I1 => diff_pntr_pf_q(4),
      I2 => diff_pntr_pf_q(1),
      I3 => diff_pntr_pf_q(5),
      I4 => diff_pntr_pf_q(3),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_i_3_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rst_d1_inst_n_2,
      Q => \^prog_full\,
      S => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.ram_rd_en_pf_q_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rdpp1_inst_n_9,
      Q => ram_rd_en_pf_q,
      R => \^rd_rst_busy\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.ram_wr_en_pf_q_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => xpm_fifo_rst_inst_n_8,
      Q => ram_wr_en_pf_q,
      R => \^rd_rst_busy\
    );
\gen_sdpram.xpm_memory_base_inst\: entity work.bd_v_vid_in_axi4s_0_0_xpm_memory_base
     port map (
      addra(9 downto 0) => wr_pntr_ext(9 downto 0),
      addrb(9 downto 0) => rd_pntr_ext(9 downto 0),
      clka => wr_clk,
      clkb => '0',
      dbiterra => \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED\,
      dbiterrb => \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED\,
      dina(26 downto 0) => din(26 downto 0),
      dinb(26 downto 0) => B"000000000000000000000000000",
      douta(26 downto 0) => \NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED\(26 downto 0),
      doutb(26 downto 0) => dout(26 downto 0),
      ena => xpm_fifo_rst_inst_n_8,
      enb => rdpp1_inst_n_9,
      injectdbiterra => '0',
      injectdbiterrb => '0',
      injectsbiterra => '0',
      injectsbiterrb => '0',
      regcea => '0',
      regceb => \gen_fwft.ram_regout_en\,
      rsta => '0',
      rstb => \^rd_rst_busy\,
      sbiterra => \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED\,
      sbiterrb => \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED\,
      sleep => sleep,
      wea(0) => '0',
      web(0) => '0'
    );
\gen_sdpram.xpm_memory_base_inst_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
        port map (
      I0 => \gen_fwft.curr_fwft_state\(1),
      I1 => \gen_fwft.curr_fwft_state\(0),
      I2 => rd_en,
      O => \gen_fwft.ram_regout_en\
    );
\gof.overflow_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => overflow_i0,
      Q => overflow,
      R => '0'
    );
\grdc.rd_data_count_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(0),
      Q => rd_data_count(0),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(10),
      Q => rd_data_count(10),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(1),
      Q => rd_data_count(1),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(2),
      Q => rd_data_count(2),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(3),
      Q => rd_data_count(3),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(4),
      Q => rd_data_count(4),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(5),
      Q => rd_data_count(5),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(6),
      Q => rd_data_count(6),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(7),
      Q => rd_data_count(7),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(8),
      Q => rd_data_count(8),
      R => \grdc.rd_data_count_i0\
    );
\grdc.rd_data_count_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(9),
      Q => rd_data_count(9),
      R => \grdc.rd_data_count_i0\
    );
\guf.underflow_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => underflow_i0,
      Q => underflow,
      R => '0'
    );
\gwdc.wr_data_count_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(0),
      Q => wr_data_count(0),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(10),
      Q => wr_data_count(10),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(1),
      Q => wr_data_count(1),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(2),
      Q => wr_data_count(2),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(3),
      Q => wr_data_count(3),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(4),
      Q => wr_data_count(4),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(5),
      Q => wr_data_count(5),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(6),
      Q => wr_data_count(6),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(7),
      Q => wr_data_count(7),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(8),
      Q => wr_data_count(8),
      R => \^rd_rst_busy\
    );
\gwdc.wr_data_count_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \grdc.diff_wr_rd_pntr_rdc\(9),
      Q => wr_data_count(9),
      R => \^rd_rst_busy\
    );
rdp_inst: entity work.\bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0\
     port map (
      CO(0) => leaving_empty0,
      DI(0) => rdp_inst_n_10,
      Q(9 downto 0) => rd_pntr_ext(9 downto 0),
      S(2) => rdp_inst_n_13,
      S(1) => rdp_inst_n_14,
      S(0) => rdp_inst_n_15,
      clr_full => clr_full,
      \count_value_i_reg[10]_0\(10) => wrp_inst_n_0,
      \count_value_i_reg[10]_0\(9 downto 0) => wr_pntr_ext(9 downto 0),
      \count_value_i_reg[1]_0\(0) => count_value_i(1),
      \count_value_i_reg[8]_0\(8) => wrpp1_inst_n_0,
      \count_value_i_reg[8]_0\(7) => wrpp1_inst_n_1,
      \count_value_i_reg[8]_0\(6) => wrpp1_inst_n_2,
      \count_value_i_reg[8]_0\(5) => wrpp1_inst_n_3,
      \count_value_i_reg[8]_0\(4) => wrpp1_inst_n_4,
      \count_value_i_reg[8]_0\(3) => wrpp1_inst_n_5,
      \count_value_i_reg[8]_0\(2) => wrpp1_inst_n_6,
      \count_value_i_reg[8]_0\(1) => wrpp1_inst_n_7,
      \count_value_i_reg[8]_0\(0) => wrpp1_inst_n_8,
      \count_value_i_reg[9]_0\(0) => going_empty1,
      \count_value_i_reg[9]_1\(0) => wrp_inst_n_33,
      \count_value_i_reg[9]_2\(0) => wrpp1_inst_n_19,
      \gen_fwft.curr_fwft_state_reg[0]\ => rdpp1_inst_n_9,
      \gen_fwft.curr_fwft_state_reg[1]\(1 downto 0) => \gen_fwft.curr_fwft_state\(1 downto 0),
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\(0) => going_full1,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ => rdp_inst_n_22,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\ => xpm_fifo_rst_inst_n_8,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_2\ => \^full\,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\(2) => rdp_inst_n_23,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\(1) => rdp_inst_n_24,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\(0) => rdp_inst_n_25,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\(3) => rdp_inst_n_26,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\(2) => rdp_inst_n_27,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\(1) => rdp_inst_n_28,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\(0) => rdp_inst_n_29,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\(1) => rdp_inst_n_30,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\(0) => rdp_inst_n_31,
      \gen_rst_cc.fifo_wr_rst_i_reg\ => \^rd_rst_busy\,
      \grdc.rd_data_count_i_reg[3]\(0) => rdp_inst_n_17,
      \grdc.rd_data_count_i_reg[7]\(3) => rdp_inst_n_18,
      \grdc.rd_data_count_i_reg[7]\(2) => rdp_inst_n_19,
      \grdc.rd_data_count_i_reg[7]\(1) => rdp_inst_n_20,
      \grdc.rd_data_count_i_reg[7]\(0) => rdp_inst_n_21,
      ram_empty_i => ram_empty_i,
      ram_empty_i0 => ram_empty_i0,
      rd_clk => rd_clk,
      rd_en => rd_en
    );
rdpp1_inst: entity work.\bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1\
     port map (
      Q(8) => rdpp1_inst_n_0,
      Q(7) => rdpp1_inst_n_1,
      Q(6) => rdpp1_inst_n_2,
      Q(5) => rdpp1_inst_n_3,
      Q(4) => rdpp1_inst_n_4,
      Q(3) => rdpp1_inst_n_5,
      Q(2) => rdpp1_inst_n_6,
      Q(1) => rdpp1_inst_n_7,
      Q(0) => rdpp1_inst_n_8,
      S(0) => rdpp1_inst_n_10,
      \count_value_i_reg[0]_0\ => rdpp1_inst_n_9,
      \count_value_i_reg[9]_0\(0) => wr_pntr_ext(9),
      \gen_fwft.curr_fwft_state_reg[1]\(1 downto 0) => \gen_fwft.curr_fwft_state\(1 downto 0),
      \gen_rst_cc.fifo_wr_rst_i_reg\ => \^rd_rst_busy\,
      ram_empty_i => ram_empty_i,
      rd_clk => rd_clk,
      rd_en => rd_en
    );
rst_d1_inst: entity work.bd_v_vid_in_axi4s_0_0_xpm_fifo_reg_bit
     port map (
      clr_full => clr_full,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.prog_full_i_reg\ => rst_d1_inst_n_2,
      \gen_rst_cc.fifo_wr_rst_i_reg\ => \^rd_rst_busy\,
      prog_full => \^prog_full\,
      prog_full_i217_in => prog_full_i217_in,
      ram_rd_en_pf_q => ram_rd_en_pf_q,
      ram_wr_en_pf_q => ram_wr_en_pf_q,
      rst => rst,
      rst_d1 => rst_d1,
      wr_clk => wr_clk
    );
wrp_inst: entity work.\bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized0_0\
     port map (
      D(10 downto 0) => \grdc.diff_wr_rd_pntr_rdc\(10 downto 0),
      DI(1) => rdp_inst_n_10,
      DI(0) => \gen_fwft.rdpp1_inst_n_2\,
      Q(10) => wrp_inst_n_0,
      Q(9 downto 0) => wr_pntr_ext(9 downto 0),
      S(0) => xpm_fifo_rst_inst_n_6,
      \count_value_i_reg[1]_0\(0) => count_value_i(1),
      \count_value_i_reg[2]_0\(2) => rdp_inst_n_17,
      \count_value_i_reg[2]_0\(1) => \gen_fwft.rdpp1_inst_n_0\,
      \count_value_i_reg[2]_0\(0) => \gen_fwft.rdpp1_inst_n_1\,
      \count_value_i_reg[3]_0\(3) => rdp_inst_n_23,
      \count_value_i_reg[3]_0\(2) => rdp_inst_n_24,
      \count_value_i_reg[3]_0\(1) => rdp_inst_n_25,
      \count_value_i_reg[3]_0\(0) => xpm_fifo_rst_inst_n_9,
      \count_value_i_reg[6]_0\(3) => rdp_inst_n_18,
      \count_value_i_reg[6]_0\(2) => rdp_inst_n_19,
      \count_value_i_reg[6]_0\(1) => rdp_inst_n_20,
      \count_value_i_reg[6]_0\(0) => rdp_inst_n_21,
      \count_value_i_reg[7]_0\(3) => rdp_inst_n_26,
      \count_value_i_reg[7]_0\(2) => rdp_inst_n_27,
      \count_value_i_reg[7]_0\(1) => rdp_inst_n_28,
      \count_value_i_reg[7]_0\(0) => rdp_inst_n_29,
      \count_value_i_reg[8]_0\(8) => rdpp1_inst_n_0,
      \count_value_i_reg[8]_0\(7) => rdpp1_inst_n_1,
      \count_value_i_reg[8]_0\(6) => rdpp1_inst_n_2,
      \count_value_i_reg[8]_0\(5) => rdpp1_inst_n_3,
      \count_value_i_reg[8]_0\(4) => rdpp1_inst_n_4,
      \count_value_i_reg[8]_0\(3) => rdpp1_inst_n_5,
      \count_value_i_reg[8]_0\(2) => rdpp1_inst_n_6,
      \count_value_i_reg[8]_0\(1) => rdpp1_inst_n_7,
      \count_value_i_reg[8]_0\(0) => rdpp1_inst_n_8,
      \count_value_i_reg[9]_0\(0) => rdpp1_inst_n_10,
      \count_value_i_reg[9]_1\(2) => rdp_inst_n_13,
      \count_value_i_reg[9]_1\(1) => rdp_inst_n_14,
      \count_value_i_reg[9]_1\(0) => rdp_inst_n_15,
      \count_value_i_reg[9]_2\(1) => rdp_inst_n_30,
      \count_value_i_reg[9]_2\(0) => rdp_inst_n_31,
      \count_value_i_reg[9]_3\(8 downto 0) => rd_pntr_ext(9 downto 1),
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\(0) => wrp_inst_n_33,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ => xpm_fifo_rst_inst_n_8,
      \gen_pntr_flags_cc.ram_empty_i_reg\(0) => going_empty1,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\(9 downto 0) => diff_pntr_pe(9 downto 0),
      \gen_rst_cc.fifo_wr_rst_i_reg\(0) => xpm_fifo_rst_inst_n_3,
      \gen_rst_cc.fifo_wr_rst_i_reg_0\ => \^rd_rst_busy\,
      wr_clk => wr_clk
    );
wrpp1_inst: entity work.\bd_v_vid_in_axi4s_0_0_xpm_counter_updn__parameterized1_1\
     port map (
      D(9 downto 0) => diff_pntr_pf_q0(10 downto 1),
      Q(8) => wrpp1_inst_n_0,
      Q(7) => wrpp1_inst_n_1,
      Q(6) => wrpp1_inst_n_2,
      Q(5) => wrpp1_inst_n_3,
      Q(4) => wrpp1_inst_n_4,
      Q(3) => wrpp1_inst_n_5,
      Q(2) => wrpp1_inst_n_6,
      Q(1) => wrpp1_inst_n_7,
      Q(0) => wrpp1_inst_n_8,
      \count_value_i_reg[9]_0\(9 downto 0) => rd_pntr_ext(9 downto 0),
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\(0) => wrpp1_inst_n_19,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ => xpm_fifo_rst_inst_n_8,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_1\ => \^full\,
      \gen_rst_cc.fifo_wr_rst_i_reg\ => \^rd_rst_busy\,
      \gen_rst_cc.fifo_wr_rst_i_reg_0\ => xpm_fifo_rst_inst_n_10,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
xpm_fifo_rst_inst: entity work.bd_v_vid_in_axi4s_0_0_xpm_fifo_rst
     port map (
      CO(0) => leaving_empty0,
      Q(1 downto 0) => \gen_fwft.curr_fwft_state\(1 downto 0),
      S(0) => xpm_fifo_rst_inst_n_6,
      SR(0) => \grdc.rd_data_count_i0\,
      \count_value_i_reg[0]\ => xpm_fifo_rst_inst_n_8,
      \count_value_i_reg[0]_0\(0) => wr_pntr_ext(0),
      \count_value_i_reg[0]_1\(0) => rd_pntr_ext(0),
      \count_value_i_reg[1]\ => \^rd_rst_busy\,
      \count_value_i_reg[9]\(0) => going_full1,
      \gen_fwft.curr_fwft_state_reg[0]\ => rdpp1_inst_n_9,
      \gen_fwft.empty_fwft_i_reg\ => \^empty\,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ => \^full\,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\ => xpm_fifo_rst_inst_n_7,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\(0) => xpm_fifo_rst_inst_n_3,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]_0\(0) => xpm_fifo_rst_inst_n_9,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_reg\ => xpm_fifo_rst_inst_n_1,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpf_cc_sym.diff_pntr_pf_q_reg[4]\ => xpm_fifo_rst_inst_n_10,
      overflow_i0 => overflow_i0,
      prog_empty => \^prog_empty\,
      prog_empty_i1 => prog_empty_i1,
      rd_en => rd_en,
      read_only_q => read_only_q,
      rst => rst,
      rst_d1 => rst_d1,
      underflow_i0 => underflow_i0,
      wr_clk => wr_clk,
      wr_en => wr_en,
      write_only_q => write_only_q
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_xpm_fifo_sync is
  port (
    overflow : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 26 downto 0 );
    underflow : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[11]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[10]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[9]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[8]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[7]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[6]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[5]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[4]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[3]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[2]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[1]\ : out STD_LOGIC;
    m_axis_video_tvalid : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[0]\ : out STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[0]_0\ : out STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg_0 : in STD_LOGIC;
    aclk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 26 downto 0 );
    D : in STD_LOGIC_VECTOR ( 10 downto 0 );
    m_axis_video_tready : in STD_LOGIC;
    aclken : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \fifo_overflow_from_coupler_cnt_reg[5]_0\ : in STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[10]_0\ : in STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg_1 : in STD_LOGIC;
    vid_io_in_ce : in STD_LOGIC;
    aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_xpm_fifo_sync : entity is "xpm_fifo_sync";
end bd_v_vid_in_axi4s_0_0_xpm_fifo_sync;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_xpm_fifo_sync is
  signal empty_i : STD_LOGIC;
  signal \^overflow\ : STD_LOGIC;
  signal xpm_fifo_base_inst_i_3_n_0 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_0 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_10 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_11 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_12 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_13 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_16 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_17 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_2 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_3 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_4 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_46 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_47 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_48 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_49 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_5 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_50 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_51 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_52 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_53 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_54 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_55 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_56 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_57 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_6 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_60 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_61 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_62 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_63 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_7 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_8 : STD_LOGIC;
  signal xpm_fifo_base_inst_n_9 : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_full_n_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[10]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[11]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[11]_i_3\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[5]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[6]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[7]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[8]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \fifo_overflow_from_coupler_cnt[9]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of m_axis_video_tvalid_INST_0 : label is "soft_lutpair10";
  attribute CDC_DEST_SYNC_FF : integer;
  attribute CDC_DEST_SYNC_FF of xpm_fifo_base_inst : label is 2;
  attribute COMMON_CLOCK : integer;
  attribute COMMON_CLOCK of xpm_fifo_base_inst : label is 1;
  attribute DOUT_RESET_VALUE : string;
  attribute DOUT_RESET_VALUE of xpm_fifo_base_inst : label is "0";
  attribute ECC_MODE : integer;
  attribute ECC_MODE of xpm_fifo_base_inst : label is 0;
  attribute ENABLE_ECC : integer;
  attribute ENABLE_ECC of xpm_fifo_base_inst : label is 0;
  attribute EN_ADV_FEATURE : string;
  attribute EN_ADV_FEATURE of xpm_fifo_base_inst : label is "16'b0000011100000111";
  attribute EN_AE : string;
  attribute EN_AE of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_AF : string;
  attribute EN_AF of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_DVLD : string;
  attribute EN_DVLD of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_OF : string;
  attribute EN_OF of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_PE : string;
  attribute EN_PE of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_PF : string;
  attribute EN_PF of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_RDC : string;
  attribute EN_RDC of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_UF : string;
  attribute EN_UF of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_WACK : string;
  attribute EN_WACK of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_WDC : string;
  attribute EN_WDC of xpm_fifo_base_inst : label is "1'b1";
  attribute FG_EQ_ASYM_DOUT : string;
  attribute FG_EQ_ASYM_DOUT of xpm_fifo_base_inst : label is "1'b0";
  attribute FIFO_MEMORY_TYPE : integer;
  attribute FIFO_MEMORY_TYPE of xpm_fifo_base_inst : label is 0;
  attribute FIFO_MEM_TYPE : integer;
  attribute FIFO_MEM_TYPE of xpm_fifo_base_inst : label is 0;
  attribute FIFO_READ_DEPTH : integer;
  attribute FIFO_READ_DEPTH of xpm_fifo_base_inst : label is 1024;
  attribute FIFO_READ_LATENCY : integer;
  attribute FIFO_READ_LATENCY of xpm_fifo_base_inst : label is 0;
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of xpm_fifo_base_inst : label is 27648;
  attribute FIFO_WRITE_DEPTH : integer;
  attribute FIFO_WRITE_DEPTH of xpm_fifo_base_inst : label is 1024;
  attribute FULL_RESET_VALUE : integer;
  attribute FULL_RESET_VALUE of xpm_fifo_base_inst : label is 1;
  attribute FULL_RST_VAL : string;
  attribute FULL_RST_VAL of xpm_fifo_base_inst : label is "1'b1";
  attribute PE_THRESH_ADJ : integer;
  attribute PE_THRESH_ADJ of xpm_fifo_base_inst : label is 8;
  attribute PE_THRESH_MAX : integer;
  attribute PE_THRESH_MAX of xpm_fifo_base_inst : label is 1019;
  attribute PE_THRESH_MIN : integer;
  attribute PE_THRESH_MIN of xpm_fifo_base_inst : label is 5;
  attribute PF_THRESH_ADJ : integer;
  attribute PF_THRESH_ADJ of xpm_fifo_base_inst : label is 8;
  attribute PF_THRESH_MAX : integer;
  attribute PF_THRESH_MAX of xpm_fifo_base_inst : label is 1019;
  attribute PF_THRESH_MIN : integer;
  attribute PF_THRESH_MIN of xpm_fifo_base_inst : label is 7;
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of xpm_fifo_base_inst : label is 10;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of xpm_fifo_base_inst : label is 10;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of xpm_fifo_base_inst : label is 11;
  attribute RD_DC_WIDTH_EXT : integer;
  attribute RD_DC_WIDTH_EXT of xpm_fifo_base_inst : label is 11;
  attribute RD_LATENCY : integer;
  attribute RD_LATENCY of xpm_fifo_base_inst : label is 2;
  attribute RD_MODE : integer;
  attribute RD_MODE of xpm_fifo_base_inst : label is 1;
  attribute RD_PNTR_WIDTH : integer;
  attribute RD_PNTR_WIDTH of xpm_fifo_base_inst : label is 10;
  attribute READ_DATA_WIDTH : integer;
  attribute READ_DATA_WIDTH of xpm_fifo_base_inst : label is 27;
  attribute READ_MODE : integer;
  attribute READ_MODE of xpm_fifo_base_inst : label is 1;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of xpm_fifo_base_inst : label is 0;
  attribute REMOVE_WR_RD_PROT_LOGIC : integer;
  attribute REMOVE_WR_RD_PROT_LOGIC of xpm_fifo_base_inst : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of xpm_fifo_base_inst : label is 0;
  attribute USE_ADV_FEATURES : string;
  attribute USE_ADV_FEATURES of xpm_fifo_base_inst : label is "0707";
  attribute VERSION : integer;
  attribute VERSION of xpm_fifo_base_inst : label is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of xpm_fifo_base_inst : label is 0;
  attribute WRITE_DATA_WIDTH : integer;
  attribute WRITE_DATA_WIDTH of xpm_fifo_base_inst : label is 27;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of xpm_fifo_base_inst : label is 11;
  attribute WR_DC_WIDTH_EXT : integer;
  attribute WR_DC_WIDTH_EXT of xpm_fifo_base_inst : label is 11;
  attribute WR_PNTR_WIDTH : integer;
  attribute WR_PNTR_WIDTH of xpm_fifo_base_inst : label is 10;
  attribute WR_RD_RATIO : integer;
  attribute WR_RD_RATIO of xpm_fifo_base_inst : label is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of xpm_fifo_base_inst : label is "TRUE";
  attribute SOFT_HLUTNM of xpm_fifo_base_inst_i_3 : label is "soft_lutpair10";
begin
  overflow <= \^overflow\;
\fifo_overflow_from_coupler_cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^overflow\,
      I1 => Q(0),
      O => \fifo_overflow_from_coupler_cnt_reg[0]\
    );
\fifo_overflow_from_coupler_cnt[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(9),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[10]\
    );
\fifo_overflow_from_coupler_cnt[11]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F700"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg[5]_0\,
      I1 => \fifo_overflow_from_coupler_cnt_reg[10]_0\,
      I2 => \^overflow\,
      I3 => vid_io_in_ce,
      O => \fifo_overflow_from_coupler_cnt_reg[0]_0\
    );
\fifo_overflow_from_coupler_cnt[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(10),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[11]\
    );
\fifo_overflow_from_coupler_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(0),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[1]\
    );
\fifo_overflow_from_coupler_cnt[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(1),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[2]\
    );
\fifo_overflow_from_coupler_cnt[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(2),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[3]\
    );
\fifo_overflow_from_coupler_cnt[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(3),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[4]\
    );
\fifo_overflow_from_coupler_cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(4),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[5]\
    );
\fifo_overflow_from_coupler_cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(5),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[6]\
    );
\fifo_overflow_from_coupler_cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(6),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[7]\
    );
\fifo_overflow_from_coupler_cnt[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(7),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[8]\
    );
\fifo_overflow_from_coupler_cnt[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => D(8),
      I1 => \^overflow\,
      O => \fifo_overflow_from_coupler_cnt_reg[9]\
    );
fifo_overflow_from_coupler_pulse_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF70F0F000000000"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg[5]_0\,
      I1 => \fifo_overflow_from_coupler_cnt_reg[10]_0\,
      I2 => fifo_overflow_from_coupler_pulse_reg_1,
      I3 => \^overflow\,
      I4 => vid_io_in_ce,
      I5 => aresetn,
      O => fifo_overflow_from_coupler_pulse_reg
    );
m_axis_video_tvalid_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => empty_i,
      O => m_axis_video_tvalid
    );
xpm_fifo_base_inst: entity work.bd_v_vid_in_axi4s_0_0_xpm_fifo_base
     port map (
      almost_empty => xpm_fifo_base_inst_n_60,
      almost_full => xpm_fifo_base_inst_n_16,
      data_valid => xpm_fifo_base_inst_n_61,
      dbiterr => xpm_fifo_base_inst_n_63,
      din(26 downto 0) => din(26 downto 0),
      dout(26 downto 0) => dout(26 downto 0),
      empty => empty_i,
      full => xpm_fifo_base_inst_n_0,
      full_n => NLW_xpm_fifo_base_inst_full_n_UNCONNECTED,
      injectdbiterr => '0',
      injectsbiterr => '0',
      overflow => \^overflow\,
      prog_empty => xpm_fifo_base_inst_n_46,
      prog_full => xpm_fifo_base_inst_n_2,
      rd_clk => aclk,
      rd_data_count(10) => xpm_fifo_base_inst_n_47,
      rd_data_count(9) => xpm_fifo_base_inst_n_48,
      rd_data_count(8) => xpm_fifo_base_inst_n_49,
      rd_data_count(7) => xpm_fifo_base_inst_n_50,
      rd_data_count(6) => xpm_fifo_base_inst_n_51,
      rd_data_count(5) => xpm_fifo_base_inst_n_52,
      rd_data_count(4) => xpm_fifo_base_inst_n_53,
      rd_data_count(3) => xpm_fifo_base_inst_n_54,
      rd_data_count(2) => xpm_fifo_base_inst_n_55,
      rd_data_count(1) => xpm_fifo_base_inst_n_56,
      rd_data_count(0) => xpm_fifo_base_inst_n_57,
      rd_en => xpm_fifo_base_inst_i_3_n_0,
      rd_rst_busy => NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED,
      rst => fifo_overflow_from_coupler_pulse_reg_0,
      sbiterr => xpm_fifo_base_inst_n_62,
      sleep => '0',
      underflow => underflow,
      wr_ack => xpm_fifo_base_inst_n_17,
      wr_clk => aclk,
      wr_data_count(10) => xpm_fifo_base_inst_n_3,
      wr_data_count(9) => xpm_fifo_base_inst_n_4,
      wr_data_count(8) => xpm_fifo_base_inst_n_5,
      wr_data_count(7) => xpm_fifo_base_inst_n_6,
      wr_data_count(6) => xpm_fifo_base_inst_n_7,
      wr_data_count(5) => xpm_fifo_base_inst_n_8,
      wr_data_count(4) => xpm_fifo_base_inst_n_9,
      wr_data_count(3) => xpm_fifo_base_inst_n_10,
      wr_data_count(2) => xpm_fifo_base_inst_n_11,
      wr_data_count(1) => xpm_fifo_base_inst_n_12,
      wr_data_count(0) => xpm_fifo_base_inst_n_13,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
xpm_fifo_base_inst_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => m_axis_video_tready,
      I1 => aclken,
      I2 => empty_i,
      O => xpm_fifo_base_inst_i_3_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_fifo_sync is
  port (
    overflow : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 26 downto 0 );
    underflow : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[11]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[10]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[9]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[8]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[7]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[6]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[5]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[4]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[3]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[2]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[1]\ : out STD_LOGIC;
    m_axis_video_tvalid : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[0]\ : out STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[0]_0\ : out STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg_0 : in STD_LOGIC;
    aclk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 26 downto 0 );
    D : in STD_LOGIC_VECTOR ( 10 downto 0 );
    m_axis_video_tready : in STD_LOGIC;
    aclken : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \fifo_overflow_from_coupler_cnt_reg[5]_0\ : in STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[10]_0\ : in STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg_1 : in STD_LOGIC;
    vid_io_in_ce : in STD_LOGIC;
    aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_fifo_sync : entity is "v_vid_in_axi4s_v4_0_7_fifo_sync";
end bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_fifo_sync;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_fifo_sync is
begin
XPM_FIFO_SYNC_INST: entity work.bd_v_vid_in_axi4s_0_0_xpm_fifo_sync
     port map (
      D(10 downto 0) => D(10 downto 0),
      Q(0) => Q(0),
      aclk => aclk,
      aclken => aclken,
      aresetn => aresetn,
      din(26 downto 0) => din(26 downto 0),
      dout(26 downto 0) => dout(26 downto 0),
      \fifo_overflow_from_coupler_cnt_reg[0]\ => \fifo_overflow_from_coupler_cnt_reg[0]\,
      \fifo_overflow_from_coupler_cnt_reg[0]_0\ => \fifo_overflow_from_coupler_cnt_reg[0]_0\,
      \fifo_overflow_from_coupler_cnt_reg[10]\ => \fifo_overflow_from_coupler_cnt_reg[10]\,
      \fifo_overflow_from_coupler_cnt_reg[10]_0\ => \fifo_overflow_from_coupler_cnt_reg[10]_0\,
      \fifo_overflow_from_coupler_cnt_reg[11]\ => \fifo_overflow_from_coupler_cnt_reg[11]\,
      \fifo_overflow_from_coupler_cnt_reg[1]\ => \fifo_overflow_from_coupler_cnt_reg[1]\,
      \fifo_overflow_from_coupler_cnt_reg[2]\ => \fifo_overflow_from_coupler_cnt_reg[2]\,
      \fifo_overflow_from_coupler_cnt_reg[3]\ => \fifo_overflow_from_coupler_cnt_reg[3]\,
      \fifo_overflow_from_coupler_cnt_reg[4]\ => \fifo_overflow_from_coupler_cnt_reg[4]\,
      \fifo_overflow_from_coupler_cnt_reg[5]\ => \fifo_overflow_from_coupler_cnt_reg[5]\,
      \fifo_overflow_from_coupler_cnt_reg[5]_0\ => \fifo_overflow_from_coupler_cnt_reg[5]_0\,
      \fifo_overflow_from_coupler_cnt_reg[6]\ => \fifo_overflow_from_coupler_cnt_reg[6]\,
      \fifo_overflow_from_coupler_cnt_reg[7]\ => \fifo_overflow_from_coupler_cnt_reg[7]\,
      \fifo_overflow_from_coupler_cnt_reg[8]\ => \fifo_overflow_from_coupler_cnt_reg[8]\,
      \fifo_overflow_from_coupler_cnt_reg[9]\ => \fifo_overflow_from_coupler_cnt_reg[9]\,
      fifo_overflow_from_coupler_pulse_reg => fifo_overflow_from_coupler_pulse_reg,
      fifo_overflow_from_coupler_pulse_reg_0 => fifo_overflow_from_coupler_pulse_reg_0,
      fifo_overflow_from_coupler_pulse_reg_1 => fifo_overflow_from_coupler_pulse_reg_1,
      m_axis_video_tready => m_axis_video_tready,
      m_axis_video_tvalid => m_axis_video_tvalid,
      overflow => overflow,
      underflow => underflow,
      vid_io_in_ce => vid_io_in_ce,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_coupler is
  port (
    overflow : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 26 downto 0 );
    underflow : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[11]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[10]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[9]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[8]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[7]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[6]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[5]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[4]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[3]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[2]\ : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[1]\ : out STD_LOGIC;
    m_axis_video_tvalid : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[0]\ : out STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg : out STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[0]_0\ : out STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg_0 : in STD_LOGIC;
    aclk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 26 downto 0 );
    D : in STD_LOGIC_VECTOR ( 10 downto 0 );
    m_axis_video_tready : in STD_LOGIC;
    aclken : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \fifo_overflow_from_coupler_cnt_reg[5]_0\ : in STD_LOGIC;
    \fifo_overflow_from_coupler_cnt_reg[10]_0\ : in STD_LOGIC;
    fifo_overflow_from_coupler_pulse_reg_1 : in STD_LOGIC;
    vid_io_in_ce : in STD_LOGIC;
    aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_coupler : entity is "v_vid_in_axi4s_v4_0_7_coupler";
end bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_coupler;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_coupler is
begin
\generate_sync_fifo.FIFO_INST\: entity work.bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_fifo_sync
     port map (
      D(10 downto 0) => D(10 downto 0),
      Q(0) => Q(0),
      aclk => aclk,
      aclken => aclken,
      aresetn => aresetn,
      din(26 downto 0) => din(26 downto 0),
      dout(26 downto 0) => dout(26 downto 0),
      \fifo_overflow_from_coupler_cnt_reg[0]\ => \fifo_overflow_from_coupler_cnt_reg[0]\,
      \fifo_overflow_from_coupler_cnt_reg[0]_0\ => \fifo_overflow_from_coupler_cnt_reg[0]_0\,
      \fifo_overflow_from_coupler_cnt_reg[10]\ => \fifo_overflow_from_coupler_cnt_reg[10]\,
      \fifo_overflow_from_coupler_cnt_reg[10]_0\ => \fifo_overflow_from_coupler_cnt_reg[10]_0\,
      \fifo_overflow_from_coupler_cnt_reg[11]\ => \fifo_overflow_from_coupler_cnt_reg[11]\,
      \fifo_overflow_from_coupler_cnt_reg[1]\ => \fifo_overflow_from_coupler_cnt_reg[1]\,
      \fifo_overflow_from_coupler_cnt_reg[2]\ => \fifo_overflow_from_coupler_cnt_reg[2]\,
      \fifo_overflow_from_coupler_cnt_reg[3]\ => \fifo_overflow_from_coupler_cnt_reg[3]\,
      \fifo_overflow_from_coupler_cnt_reg[4]\ => \fifo_overflow_from_coupler_cnt_reg[4]\,
      \fifo_overflow_from_coupler_cnt_reg[5]\ => \fifo_overflow_from_coupler_cnt_reg[5]\,
      \fifo_overflow_from_coupler_cnt_reg[5]_0\ => \fifo_overflow_from_coupler_cnt_reg[5]_0\,
      \fifo_overflow_from_coupler_cnt_reg[6]\ => \fifo_overflow_from_coupler_cnt_reg[6]\,
      \fifo_overflow_from_coupler_cnt_reg[7]\ => \fifo_overflow_from_coupler_cnt_reg[7]\,
      \fifo_overflow_from_coupler_cnt_reg[8]\ => \fifo_overflow_from_coupler_cnt_reg[8]\,
      \fifo_overflow_from_coupler_cnt_reg[9]\ => \fifo_overflow_from_coupler_cnt_reg[9]\,
      fifo_overflow_from_coupler_pulse_reg => fifo_overflow_from_coupler_pulse_reg,
      fifo_overflow_from_coupler_pulse_reg_0 => fifo_overflow_from_coupler_pulse_reg_0,
      fifo_overflow_from_coupler_pulse_reg_1 => fifo_overflow_from_coupler_pulse_reg_1,
      m_axis_video_tready => m_axis_video_tready,
      m_axis_video_tvalid => m_axis_video_tvalid,
      overflow => overflow,
      underflow => underflow,
      vid_io_in_ce => vid_io_in_ce,
      wr_en => wr_en,
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 is
  port (
    vid_io_in_clk : in STD_LOGIC;
    vid_io_in_ce : in STD_LOGIC;
    vid_io_in_reset : in STD_LOGIC;
    vid_active_video : in STD_LOGIC;
    vid_vblank : in STD_LOGIC;
    vid_hblank : in STD_LOGIC;
    vid_vsync : in STD_LOGIC;
    vid_hsync : in STD_LOGIC;
    vid_field_id : in STD_LOGIC;
    vid_data : in STD_LOGIC_VECTOR ( 23 downto 0 );
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_video_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_video_tvalid : out STD_LOGIC;
    m_axis_video_tready : in STD_LOGIC;
    m_axis_video_tuser : out STD_LOGIC;
    m_axis_video_tlast : out STD_LOGIC;
    fid : out STD_LOGIC;
    vtd_active_video : out STD_LOGIC;
    vtd_vblank : out STD_LOGIC;
    vtd_hblank : out STD_LOGIC;
    vtd_vsync : out STD_LOGIC;
    vtd_hsync : out STD_LOGIC;
    vtd_field_id : out STD_LOGIC;
    overflow : out STD_LOGIC;
    underflow : out STD_LOGIC;
    axis_enable : in STD_LOGIC;
    drop_en : in STD_LOGIC;
    remap_420_en : in STD_LOGIC
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 10;
  attribute C_ADDR_WIDTH_PIXEL_REMAP_420 : integer;
  attribute C_ADDR_WIDTH_PIXEL_REMAP_420 of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 10;
  attribute C_COMPONENTS_PER_PIXEL : integer;
  attribute C_COMPONENTS_PER_PIXEL of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 3;
  attribute C_FAMILY : string;
  attribute C_FAMILY of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is "zynq";
  attribute C_HAS_ASYNC_CLK : integer;
  attribute C_HAS_ASYNC_CLK of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 0;
  attribute C_INCLUDE_PIXEL_DROP : integer;
  attribute C_INCLUDE_PIXEL_DROP of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 0;
  attribute C_INCLUDE_PIXEL_REMAP_420 : integer;
  attribute C_INCLUDE_PIXEL_REMAP_420 of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 0;
  attribute C_M_AXIS_COMPONENT_WIDTH : integer;
  attribute C_M_AXIS_COMPONENT_WIDTH of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 8;
  attribute C_M_AXIS_TDATA_WIDTH : integer;
  attribute C_M_AXIS_TDATA_WIDTH of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 24;
  attribute C_NATIVE_COMPONENT_WIDTH : integer;
  attribute C_NATIVE_COMPONENT_WIDTH of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 8;
  attribute C_NATIVE_DATA_WIDTH : integer;
  attribute C_NATIVE_DATA_WIDTH of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 24;
  attribute C_PIXELS_PER_CLOCK : integer;
  attribute C_PIXELS_PER_CLOCK of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is 1;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 : entity is "v_vid_in_axi4s_v4_0_7";
end bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7 is
  signal COUPLER_INST_n_30 : STD_LOGIC;
  signal COUPLER_INST_n_31 : STD_LOGIC;
  signal COUPLER_INST_n_32 : STD_LOGIC;
  signal COUPLER_INST_n_33 : STD_LOGIC;
  signal COUPLER_INST_n_34 : STD_LOGIC;
  signal COUPLER_INST_n_35 : STD_LOGIC;
  signal COUPLER_INST_n_36 : STD_LOGIC;
  signal COUPLER_INST_n_37 : STD_LOGIC;
  signal COUPLER_INST_n_38 : STD_LOGIC;
  signal COUPLER_INST_n_39 : STD_LOGIC;
  signal COUPLER_INST_n_40 : STD_LOGIC;
  signal COUPLER_INST_n_42 : STD_LOGIC;
  signal COUPLER_INST_n_43 : STD_LOGIC;
  signal COUPLER_INST_n_44 : STD_LOGIC;
  signal FORMATTER_INST_n_1 : STD_LOGIC;
  signal fifo_overflow_from_coupler_cnt0 : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal \fifo_overflow_from_coupler_cnt[11]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[11]_i_5_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[11]_i_7_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[11]_i_8_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[11]_i_9_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[4]_i_6_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt[8]_i_6_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[11]_i_6_n_2\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[11]_i_6_n_3\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[10]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[11]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[7]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[8]\ : STD_LOGIC;
  signal \fifo_overflow_from_coupler_cnt_reg_n_0_[9]\ : STD_LOGIC;
  signal fifo_overflow_from_coupler_pulse_reg_n_0 : STD_LOGIC;
  signal idf_data : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal vid_reset : STD_LOGIC;
  signal wr_en_i : STD_LOGIC;
  signal wr_rst_busy_i : STD_LOGIC;
  signal \NLW_fifo_overflow_from_coupler_cnt_reg[11]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_fifo_overflow_from_coupler_cnt_reg[11]_i_6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
CDC_SINGLE_COUPLER_OVERFLOW_INST: entity work.\bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single__xdcDup__1\
     port map (
      aclk => aclk,
      fifo_overflow_from_coupler_pulse_reg => fifo_overflow_from_coupler_pulse_reg_n_0
    );
CDC_SINGLE_REMAP_OVERFLOW_INST: entity work.bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_cdc_single
     port map (
      aclk => aclk
    );
COUPLER_INST: entity work.bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_coupler
     port map (
      D(10 downto 0) => fifo_overflow_from_coupler_cnt0(11 downto 1),
      Q(0) => \fifo_overflow_from_coupler_cnt_reg_n_0_[0]\,
      aclk => aclk,
      aclken => aclken,
      aresetn => aresetn,
      din(26 downto 0) => idf_data(26 downto 0),
      dout(26) => fid,
      dout(25) => m_axis_video_tuser,
      dout(24) => m_axis_video_tlast,
      dout(23 downto 0) => m_axis_video_tdata(23 downto 0),
      \fifo_overflow_from_coupler_cnt_reg[0]\ => COUPLER_INST_n_42,
      \fifo_overflow_from_coupler_cnt_reg[0]_0\ => COUPLER_INST_n_44,
      \fifo_overflow_from_coupler_cnt_reg[10]\ => COUPLER_INST_n_31,
      \fifo_overflow_from_coupler_cnt_reg[10]_0\ => \fifo_overflow_from_coupler_cnt[11]_i_5_n_0\,
      \fifo_overflow_from_coupler_cnt_reg[11]\ => COUPLER_INST_n_30,
      \fifo_overflow_from_coupler_cnt_reg[1]\ => COUPLER_INST_n_40,
      \fifo_overflow_from_coupler_cnt_reg[2]\ => COUPLER_INST_n_39,
      \fifo_overflow_from_coupler_cnt_reg[3]\ => COUPLER_INST_n_38,
      \fifo_overflow_from_coupler_cnt_reg[4]\ => COUPLER_INST_n_37,
      \fifo_overflow_from_coupler_cnt_reg[5]\ => COUPLER_INST_n_36,
      \fifo_overflow_from_coupler_cnt_reg[5]_0\ => \fifo_overflow_from_coupler_cnt[11]_i_4_n_0\,
      \fifo_overflow_from_coupler_cnt_reg[6]\ => COUPLER_INST_n_35,
      \fifo_overflow_from_coupler_cnt_reg[7]\ => COUPLER_INST_n_34,
      \fifo_overflow_from_coupler_cnt_reg[8]\ => COUPLER_INST_n_33,
      \fifo_overflow_from_coupler_cnt_reg[9]\ => COUPLER_INST_n_32,
      fifo_overflow_from_coupler_pulse_reg => COUPLER_INST_n_43,
      fifo_overflow_from_coupler_pulse_reg_0 => FORMATTER_INST_n_1,
      fifo_overflow_from_coupler_pulse_reg_1 => fifo_overflow_from_coupler_pulse_reg_n_0,
      m_axis_video_tready => m_axis_video_tready,
      m_axis_video_tvalid => m_axis_video_tvalid,
      overflow => overflow,
      underflow => underflow,
      vid_io_in_ce => vid_io_in_ce,
      wr_en => wr_en_i,
      wr_rst_busy => wr_rst_busy_i
    );
FORMATTER_INST: entity work.bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7_formatter
     port map (
      aclk => aclk,
      aresetn => aresetn,
      axis_enable => axis_enable,
      de_3_reg_0 => FORMATTER_INST_n_1,
      din(26 downto 0) => idf_data(26 downto 0),
      fifo_overflow_from_coupler_pulse_reg => fifo_overflow_from_coupler_pulse_reg_n_0,
      vid_active_video => vid_active_video,
      vid_data(23 downto 0) => vid_data(23 downto 0),
      vid_field_id => vid_field_id,
      vid_hblank => vid_hblank,
      vid_hsync => vid_hsync,
      vid_io_in_ce => vid_io_in_ce,
      vid_vblank => vid_vblank,
      vid_vsync => vid_vsync,
      vtd_active_video => vtd_active_video,
      vtd_field_id => vtd_field_id,
      vtd_hblank => vtd_hblank,
      vtd_hsync => vtd_hsync,
      vtd_vblank => vtd_vblank,
      vtd_vsync => vtd_vsync,
      wr_en => wr_en_i,
      wr_rst_busy => wr_rst_busy_i
    );
\fifo_overflow_from_coupler_cnt[11]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => vid_reset
    );
\fifo_overflow_from_coupler_cnt[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[5]\,
      I1 => \fifo_overflow_from_coupler_cnt_reg_n_0_[3]\,
      I2 => \fifo_overflow_from_coupler_cnt_reg_n_0_[4]\,
      I3 => \fifo_overflow_from_coupler_cnt_reg_n_0_[0]\,
      I4 => \fifo_overflow_from_coupler_cnt_reg_n_0_[1]\,
      I5 => \fifo_overflow_from_coupler_cnt_reg_n_0_[2]\,
      O => \fifo_overflow_from_coupler_cnt[11]_i_4_n_0\
    );
\fifo_overflow_from_coupler_cnt[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[10]\,
      I1 => \fifo_overflow_from_coupler_cnt_reg_n_0_[9]\,
      I2 => \fifo_overflow_from_coupler_cnt_reg_n_0_[11]\,
      I3 => \fifo_overflow_from_coupler_cnt_reg_n_0_[6]\,
      I4 => \fifo_overflow_from_coupler_cnt_reg_n_0_[7]\,
      I5 => \fifo_overflow_from_coupler_cnt_reg_n_0_[8]\,
      O => \fifo_overflow_from_coupler_cnt[11]_i_5_n_0\
    );
\fifo_overflow_from_coupler_cnt[11]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[11]\,
      O => \fifo_overflow_from_coupler_cnt[11]_i_7_n_0\
    );
\fifo_overflow_from_coupler_cnt[11]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[10]\,
      O => \fifo_overflow_from_coupler_cnt[11]_i_8_n_0\
    );
\fifo_overflow_from_coupler_cnt[11]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[9]\,
      O => \fifo_overflow_from_coupler_cnt[11]_i_9_n_0\
    );
\fifo_overflow_from_coupler_cnt[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[4]\,
      O => \fifo_overflow_from_coupler_cnt[4]_i_3_n_0\
    );
\fifo_overflow_from_coupler_cnt[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[3]\,
      O => \fifo_overflow_from_coupler_cnt[4]_i_4_n_0\
    );
\fifo_overflow_from_coupler_cnt[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[2]\,
      O => \fifo_overflow_from_coupler_cnt[4]_i_5_n_0\
    );
\fifo_overflow_from_coupler_cnt[4]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[1]\,
      O => \fifo_overflow_from_coupler_cnt[4]_i_6_n_0\
    );
\fifo_overflow_from_coupler_cnt[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[8]\,
      O => \fifo_overflow_from_coupler_cnt[8]_i_3_n_0\
    );
\fifo_overflow_from_coupler_cnt[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[7]\,
      O => \fifo_overflow_from_coupler_cnt[8]_i_4_n_0\
    );
\fifo_overflow_from_coupler_cnt[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[6]\,
      O => \fifo_overflow_from_coupler_cnt[8]_i_5_n_0\
    );
\fifo_overflow_from_coupler_cnt[8]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \fifo_overflow_from_coupler_cnt_reg_n_0_[5]\,
      O => \fifo_overflow_from_coupler_cnt[8]_i_6_n_0\
    );
\fifo_overflow_from_coupler_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_42,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[0]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_31,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[10]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_30,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[11]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[11]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_overflow_from_coupler_cnt_reg[8]_i_2_n_0\,
      CO(3 downto 2) => \NLW_fifo_overflow_from_coupler_cnt_reg[11]_i_6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \fifo_overflow_from_coupler_cnt_reg[11]_i_6_n_2\,
      CO(0) => \fifo_overflow_from_coupler_cnt_reg[11]_i_6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \fifo_overflow_from_coupler_cnt_reg_n_0_[10]\,
      DI(0) => \fifo_overflow_from_coupler_cnt_reg_n_0_[9]\,
      O(3) => \NLW_fifo_overflow_from_coupler_cnt_reg[11]_i_6_O_UNCONNECTED\(3),
      O(2 downto 0) => fifo_overflow_from_coupler_cnt0(11 downto 9),
      S(3) => '0',
      S(2) => \fifo_overflow_from_coupler_cnt[11]_i_7_n_0\,
      S(1) => \fifo_overflow_from_coupler_cnt[11]_i_8_n_0\,
      S(0) => \fifo_overflow_from_coupler_cnt[11]_i_9_n_0\
    );
\fifo_overflow_from_coupler_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_40,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[1]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_39,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[2]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_38,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[3]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_37,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[4]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \fifo_overflow_from_coupler_cnt_reg[4]_i_2_n_0\,
      CO(2) => \fifo_overflow_from_coupler_cnt_reg[4]_i_2_n_1\,
      CO(1) => \fifo_overflow_from_coupler_cnt_reg[4]_i_2_n_2\,
      CO(0) => \fifo_overflow_from_coupler_cnt_reg[4]_i_2_n_3\,
      CYINIT => \fifo_overflow_from_coupler_cnt_reg_n_0_[0]\,
      DI(3) => \fifo_overflow_from_coupler_cnt_reg_n_0_[4]\,
      DI(2) => \fifo_overflow_from_coupler_cnt_reg_n_0_[3]\,
      DI(1) => \fifo_overflow_from_coupler_cnt_reg_n_0_[2]\,
      DI(0) => \fifo_overflow_from_coupler_cnt_reg_n_0_[1]\,
      O(3 downto 0) => fifo_overflow_from_coupler_cnt0(4 downto 1),
      S(3) => \fifo_overflow_from_coupler_cnt[4]_i_3_n_0\,
      S(2) => \fifo_overflow_from_coupler_cnt[4]_i_4_n_0\,
      S(1) => \fifo_overflow_from_coupler_cnt[4]_i_5_n_0\,
      S(0) => \fifo_overflow_from_coupler_cnt[4]_i_6_n_0\
    );
\fifo_overflow_from_coupler_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_36,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[5]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_35,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[6]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_34,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[7]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_33,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[8]\,
      R => vid_reset
    );
\fifo_overflow_from_coupler_cnt_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \fifo_overflow_from_coupler_cnt_reg[4]_i_2_n_0\,
      CO(3) => \fifo_overflow_from_coupler_cnt_reg[8]_i_2_n_0\,
      CO(2) => \fifo_overflow_from_coupler_cnt_reg[8]_i_2_n_1\,
      CO(1) => \fifo_overflow_from_coupler_cnt_reg[8]_i_2_n_2\,
      CO(0) => \fifo_overflow_from_coupler_cnt_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => \fifo_overflow_from_coupler_cnt_reg_n_0_[8]\,
      DI(2) => \fifo_overflow_from_coupler_cnt_reg_n_0_[7]\,
      DI(1) => \fifo_overflow_from_coupler_cnt_reg_n_0_[6]\,
      DI(0) => \fifo_overflow_from_coupler_cnt_reg_n_0_[5]\,
      O(3 downto 0) => fifo_overflow_from_coupler_cnt0(8 downto 5),
      S(3) => \fifo_overflow_from_coupler_cnt[8]_i_3_n_0\,
      S(2) => \fifo_overflow_from_coupler_cnt[8]_i_4_n_0\,
      S(1) => \fifo_overflow_from_coupler_cnt[8]_i_5_n_0\,
      S(0) => \fifo_overflow_from_coupler_cnt[8]_i_6_n_0\
    );
\fifo_overflow_from_coupler_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => COUPLER_INST_n_44,
      D => COUPLER_INST_n_32,
      Q => \fifo_overflow_from_coupler_cnt_reg_n_0_[9]\,
      R => vid_reset
    );
fifo_overflow_from_coupler_pulse_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => COUPLER_INST_n_43,
      Q => fifo_overflow_from_coupler_pulse_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_v_vid_in_axi4s_0_0 is
  port (
    vid_io_in_ce : in STD_LOGIC;
    vid_active_video : in STD_LOGIC;
    vid_vblank : in STD_LOGIC;
    vid_hblank : in STD_LOGIC;
    vid_vsync : in STD_LOGIC;
    vid_hsync : in STD_LOGIC;
    vid_field_id : in STD_LOGIC;
    vid_data : in STD_LOGIC_VECTOR ( 23 downto 0 );
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_video_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_video_tvalid : out STD_LOGIC;
    m_axis_video_tready : in STD_LOGIC;
    m_axis_video_tuser : out STD_LOGIC;
    m_axis_video_tlast : out STD_LOGIC;
    fid : out STD_LOGIC;
    vtd_active_video : out STD_LOGIC;
    vtd_vblank : out STD_LOGIC;
    vtd_hblank : out STD_LOGIC;
    vtd_vsync : out STD_LOGIC;
    vtd_hsync : out STD_LOGIC;
    vtd_field_id : out STD_LOGIC;
    overflow : out STD_LOGIC;
    underflow : out STD_LOGIC;
    axis_enable : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of bd_v_vid_in_axi4s_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of bd_v_vid_in_axi4s_0_0 : entity is "bd_v_vid_in_axi4s_0_0,v_vid_in_axi4s_v4_0_7,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bd_v_vid_in_axi4s_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of bd_v_vid_in_axi4s_0_0 : entity is "v_vid_in_axi4s_v4_0_7,Vivado 2017.4";
end bd_v_vid_in_axi4s_0_0;

architecture STRUCTURE of bd_v_vid_in_axi4s_0_0 is
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of inst : label is 10;
  attribute C_ADDR_WIDTH_PIXEL_REMAP_420 : integer;
  attribute C_ADDR_WIDTH_PIXEL_REMAP_420 of inst : label is 10;
  attribute C_COMPONENTS_PER_PIXEL : integer;
  attribute C_COMPONENTS_PER_PIXEL of inst : label is 3;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "zynq";
  attribute C_HAS_ASYNC_CLK : integer;
  attribute C_HAS_ASYNC_CLK of inst : label is 0;
  attribute C_INCLUDE_PIXEL_DROP : integer;
  attribute C_INCLUDE_PIXEL_DROP of inst : label is 0;
  attribute C_INCLUDE_PIXEL_REMAP_420 : integer;
  attribute C_INCLUDE_PIXEL_REMAP_420 of inst : label is 0;
  attribute C_M_AXIS_COMPONENT_WIDTH : integer;
  attribute C_M_AXIS_COMPONENT_WIDTH of inst : label is 8;
  attribute C_M_AXIS_TDATA_WIDTH : integer;
  attribute C_M_AXIS_TDATA_WIDTH of inst : label is 24;
  attribute C_NATIVE_COMPONENT_WIDTH : integer;
  attribute C_NATIVE_COMPONENT_WIDTH of inst : label is 8;
  attribute C_NATIVE_DATA_WIDTH : integer;
  attribute C_NATIVE_DATA_WIDTH of inst : label is 24;
  attribute C_PIXELS_PER_CLOCK : integer;
  attribute C_PIXELS_PER_CLOCK of inst : label is 1;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk_intf CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF video_out, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_dvi2rgb_0_0_PixelClk";
  attribute X_INTERFACE_INFO of aclken : signal is "xilinx.com:signal:clockenable:1.0 aclken_intf CE";
  attribute X_INTERFACE_PARAMETER of aclken : signal is "XIL_INTERFACENAME aclken_intf, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn_intf RST";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn_intf, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of m_axis_video_tlast : signal is "xilinx.com:interface:axis:1.0 video_out TLAST";
  attribute X_INTERFACE_PARAMETER of m_axis_video_tlast : signal is "XIL_INTERFACENAME video_out, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_dvi2rgb_0_0_PixelClk, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xilinx.com:video:G_B_R_444:1.0} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value rows} size {attribs {resolve_type generated dependency active_rows format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency active_rows_stride format long minimum {} maximum {}} value 24} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value cols} size {attribs {resolve_type generated dependency active_cols format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency active_cols_stride format long minimum {} maximum {}} value 24} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_G {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value G} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} field_B {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value B} enabled {attribs {resolve_type generated dependency video_comp1_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type generated dependency video_comp1_offset format long minimum {} maximum {}} value 8} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} field_R {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value R} enabled {attribs {resolve_type generated dependency video_comp2_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type generated dependency video_comp2_offset format long minimum {} maximum {}} value 16} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}}}}}} TDATA_WIDTH 24}";
  attribute X_INTERFACE_INFO of m_axis_video_tready : signal is "xilinx.com:interface:axis:1.0 video_out TREADY";
  attribute X_INTERFACE_INFO of m_axis_video_tuser : signal is "xilinx.com:interface:axis:1.0 video_out TUSER";
  attribute X_INTERFACE_INFO of m_axis_video_tvalid : signal is "xilinx.com:interface:axis:1.0 video_out TVALID";
  attribute X_INTERFACE_INFO of vid_active_video : signal is "xilinx.com:interface:vid_io:1.0 vid_io_in ACTIVE_VIDEO";
  attribute X_INTERFACE_INFO of vid_field_id : signal is "xilinx.com:interface:vid_io:1.0 vid_io_in FIELD";
  attribute X_INTERFACE_INFO of vid_hblank : signal is "xilinx.com:interface:vid_io:1.0 vid_io_in HBLANK";
  attribute X_INTERFACE_INFO of vid_hsync : signal is "xilinx.com:interface:vid_io:1.0 vid_io_in HSYNC";
  attribute X_INTERFACE_INFO of vid_io_in_ce : signal is "xilinx.com:signal:clockenable:1.0 vid_io_in_ce_intf CE";
  attribute X_INTERFACE_PARAMETER of vid_io_in_ce : signal is "XIL_INTERFACENAME vid_io_in_ce_intf, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of vid_vblank : signal is "xilinx.com:interface:vid_io:1.0 vid_io_in VBLANK";
  attribute X_INTERFACE_INFO of vid_vsync : signal is "xilinx.com:interface:vid_io:1.0 vid_io_in VSYNC";
  attribute X_INTERFACE_INFO of vtd_active_video : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out ACTIVE_VIDEO";
  attribute X_INTERFACE_INFO of vtd_field_id : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out FIELD";
  attribute X_INTERFACE_INFO of vtd_hblank : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out HBLANK";
  attribute X_INTERFACE_INFO of vtd_hsync : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out HSYNC";
  attribute X_INTERFACE_INFO of vtd_vblank : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out VBLANK";
  attribute X_INTERFACE_INFO of vtd_vsync : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out VSYNC";
  attribute X_INTERFACE_INFO of m_axis_video_tdata : signal is "xilinx.com:interface:axis:1.0 video_out TDATA";
  attribute X_INTERFACE_INFO of vid_data : signal is "xilinx.com:interface:vid_io:1.0 vid_io_in DATA";
begin
inst: entity work.bd_v_vid_in_axi4s_0_0_v_vid_in_axi4s_v4_0_7
     port map (
      aclk => aclk,
      aclken => aclken,
      aresetn => aresetn,
      axis_enable => axis_enable,
      drop_en => '0',
      fid => fid,
      m_axis_video_tdata(23 downto 0) => m_axis_video_tdata(23 downto 0),
      m_axis_video_tlast => m_axis_video_tlast,
      m_axis_video_tready => m_axis_video_tready,
      m_axis_video_tuser => m_axis_video_tuser,
      m_axis_video_tvalid => m_axis_video_tvalid,
      overflow => overflow,
      remap_420_en => '0',
      underflow => underflow,
      vid_active_video => vid_active_video,
      vid_data(23 downto 0) => vid_data(23 downto 0),
      vid_field_id => vid_field_id,
      vid_hblank => vid_hblank,
      vid_hsync => vid_hsync,
      vid_io_in_ce => vid_io_in_ce,
      vid_io_in_clk => '0',
      vid_io_in_reset => '0',
      vid_vblank => vid_vblank,
      vid_vsync => vid_vsync,
      vtd_active_video => vtd_active_video,
      vtd_field_id => vtd_field_id,
      vtd_hblank => vtd_hblank,
      vtd_hsync => vtd_hsync,
      vtd_vblank => vtd_vblank,
      vtd_vsync => vtd_vsync
    );
end STRUCTURE;
