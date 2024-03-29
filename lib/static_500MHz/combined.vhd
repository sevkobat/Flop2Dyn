--------------------------------------------------------------------------------
--                RightShifterSticky24_by_max_26_Freq500_uid4
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2008-2011), Florent de Dinechin (2008-2019)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X S
-- Output signals: R Sticky

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifterSticky24_by_max_26_Freq500_uid4 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          S : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(25 downto 0);
          Sticky : out  std_logic   );
end entity;

architecture arch of RightShifterSticky24_by_max_26_Freq500_uid4 is
signal ps, ps_d1, ps_d2, ps_d3 :  std_logic_vector(4 downto 0);
signal Xpadded :  std_logic_vector(25 downto 0);
signal level5, level5_d1 :  std_logic_vector(25 downto 0);
signal stk4 :  std_logic;
signal level4, level4_d1 :  std_logic_vector(25 downto 0);
signal stk3, stk3_d1 :  std_logic;
signal level3, level3_d1, level3_d2 :  std_logic_vector(25 downto 0);
signal stk2, stk2_d1 :  std_logic;
signal level2, level2_d1, level2_d2, level2_d3 :  std_logic_vector(25 downto 0);
signal stk1 :  std_logic;
signal level1, level1_d1, level1_d2 :  std_logic_vector(25 downto 0);
signal stk0 :  std_logic;
signal level0 :  std_logic_vector(25 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               ps_d1 <=  ps;
               ps_d2 <=  ps_d1;
               ps_d3 <=  ps_d2;
               level5_d1 <=  level5;
               level4_d1 <=  level4;
               stk3_d1 <=  stk3;
               level3_d1 <=  level3;
               level3_d2 <=  level3_d1;
               stk2_d1 <=  stk2;
               level2_d1 <=  level2;
               level2_d2 <=  level2_d1;
               level2_d3 <=  level2_d2;
               level1_d1 <=  level1;
               level1_d2 <=  level1_d1;
            end if;
         end if;
      end process;
   ps<= S;
   Xpadded <= X&(1 downto 0 => '0');
   level5<= Xpadded;
   stk4 <= '1' when (level5_d1(15 downto 0)/="0000000000000000" and ps_d1(4)='1')   else '0';
   level4 <=  level5 when  ps(4)='0'    else (15 downto 0 => '0') & level5(25 downto 16);
   stk3 <= '1' when (level4_d1(7 downto 0)/="00000000" and ps_d1(3)='1') or stk4 ='1'   else '0';
   level3 <=  level4 when  ps(3)='0'    else (7 downto 0 => '0') & level4(25 downto 8);
   stk2 <= '1' when (level3_d2(3 downto 0)/="0000" and ps_d2(2)='1') or stk3_d1 ='1'   else '0';
   level2 <=  level3 when  ps(2)='0'    else (3 downto 0 => '0') & level3(25 downto 4);
   stk1 <= '1' when (level2_d3(1 downto 0)/="00" and ps_d3(1)='1') or stk2_d1 ='1'   else '0';
   level1 <=  level2_d1 when  ps_d1(1)='0'    else (1 downto 0 => '0') & level2_d1(25 downto 2);
   stk0 <= '1' when (level1_d2(0 downto 0)/="0" and ps_d3(0)='1') or stk1 ='1'   else '0';
   level0 <=  level1 when  ps_d1(0)='0'    else (0 downto 0 => '0') & level1(25 downto 1);
   R <= level0;
   Sticky <= stk0;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_27_Freq500_uid6
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_27_Freq500_uid6 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(26 downto 0);
          Y : in  std_logic_vector(26 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(26 downto 0)   );
end entity;

architecture arch of IntAdder_27_Freq500_uid6 is
signal Rtmp :  std_logic_vector(26 downto 0);
signal X_d1, X_d2, X_d3, X_d4, X_d5 :  std_logic_vector(26 downto 0);
signal Y_d1, Y_d2, Y_d3 :  std_logic_vector(26 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               X_d1 <=  X;
               X_d2 <=  X_d1;
               X_d3 <=  X_d2;
               X_d4 <=  X_d3;
               X_d5 <=  X_d4;
               Y_d1 <=  Y;
               Y_d2 <=  Y_d1;
               Y_d3 <=  Y_d2;
            end if;
         end if;
      end process;
   Rtmp <= X_d5 + Y_d3 + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                     Normalizer_Z_28_28_28_Freq500_uid8
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, (2007-2020)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X
-- Output signals: Count R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Normalizer_Z_28_28_28_Freq500_uid8 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(27 downto 0);
          Count : out  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(27 downto 0)   );
end entity;

architecture arch of Normalizer_Z_28_28_28_Freq500_uid8 is
signal level5, level5_d1 :  std_logic_vector(27 downto 0);
signal count4, count4_d1, count4_d2 :  std_logic;
signal level4 :  std_logic_vector(27 downto 0);
signal count3, count3_d1, count3_d2 :  std_logic;
signal level3, level3_d1 :  std_logic_vector(27 downto 0);
signal count2, count2_d1 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(27 downto 0);
signal count1, count1_d1 :  std_logic;
signal level1 :  std_logic_vector(27 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(27 downto 0);
signal sCount :  std_logic_vector(4 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               level5_d1 <=  level5;
               count4_d1 <=  count4;
               count4_d2 <=  count4_d1;
               count3_d1 <=  count3;
               count3_d2 <=  count3_d1;
               level3_d1 <=  level3;
               count2_d1 <=  count2;
               level2_d1 <=  level2;
               count1_d1 <=  count1;
            end if;
         end if;
      end process;
   level5 <= X ;
   count4<= '1' when level5_d1(27 downto 12) = (27 downto 12=>'0') else '0';
   level4<= level5_d1(27 downto 0) when count4='0' else level5_d1(11 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(27 downto 20) = (27 downto 20=>'0') else '0';
   level3<= level4(27 downto 0) when count3='0' else level4(19 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3_d1(27 downto 24) = (27 downto 24=>'0') else '0';
   level2<= level3_d1(27 downto 0) when count2='0' else level3_d1(23 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(27 downto 26) = (27 downto 26=>'0') else '0';
   level1<= level2_d1(27 downto 0) when count1_d1='0' else level2_d1(25 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(27 downto 27) = (27 downto 27=>'0') else '0';
   level0<= level1(27 downto 0) when count0='0' else level1(26 downto 0) & (0 downto 0 => '0');

   R <= level0;
   sCount <= count4_d2 & count3_d2 & count2_d1 & count1_d1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_34_Freq500_uid11
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_34_Freq500_uid11 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(33 downto 0);
          Y : in  std_logic_vector(33 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(33 downto 0)   );
end entity;

architecture arch of IntAdder_34_Freq500_uid11 is
signal Rtmp :  std_logic_vector(33 downto 0);
signal Y_d1, Y_d2, Y_d3, Y_d4, Y_d5, Y_d6, Y_d7, Y_d8, Y_d9 :  std_logic_vector(33 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               Y_d1 <=  Y;
               Y_d2 <=  Y_d1;
               Y_d3 <=  Y_d2;
               Y_d4 <=  Y_d3;
               Y_d5 <=  Y_d4;
               Y_d6 <=  Y_d5;
               Y_d7 <=  Y_d6;
               Y_d8 <=  Y_d7;
               Y_d9 <=  Y_d8;
            end if;
         end if;
      end process;
   Rtmp <= X + Y_d9 + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                             FloatingPointAdder
--                         (FPAdd_8_23_Freq500_uid2)
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2010-2017)
--------------------------------------------------------------------------------
-- Pipeline depth: 10 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FloatingPointAdder is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FloatingPointAdder is
   component RightShifterSticky24_by_max_26_Freq500_uid4 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             S : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(25 downto 0);
             Sticky : out  std_logic   );
   end component;

   component IntAdder_27_Freq500_uid6 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(26 downto 0);
             Y : in  std_logic_vector(26 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(26 downto 0)   );
   end component;

   component Normalizer_Z_28_28_28_Freq500_uid8 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(27 downto 0);
             Count : out  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(27 downto 0)   );
   end component;

   component IntAdder_34_Freq500_uid11 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(33 downto 0);
             Y : in  std_logic_vector(33 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(33 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(32 downto 0);
signal excExpFracY :  std_logic_vector(32 downto 0);
signal swap :  std_logic;
signal eXmeY :  std_logic_vector(7 downto 0);
signal eYmeX :  std_logic_vector(7 downto 0);
signal expDiff, expDiff_d1 :  std_logic_vector(7 downto 0);
signal newX :  std_logic_vector(33 downto 0);
signal newY, newY_d1 :  std_logic_vector(33 downto 0);
signal expX, expX_d1 :  std_logic_vector(7 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY, excY_d1 :  std_logic_vector(1 downto 0);
signal signX, signX_d1 :  std_logic;
signal signY, signY_d1 :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3, EffSub_d4, EffSub_d5, EffSub_d6, EffSub_d7, EffSub_d8, EffSub_d9 :  std_logic;
signal sXsYExnXY, sXsYExnXY_d1 :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(23 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3, excRt_d4, excRt_d5, excRt_d6, excRt_d7, excRt_d8, excRt_d9 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3, signR_d4, signR_d5, signR_d6, signR_d7 :  std_logic;
signal shiftedOut :  std_logic;
signal shiftVal :  std_logic_vector(4 downto 0);
signal shiftedFracY :  std_logic_vector(25 downto 0);
signal sticky, sticky_d1 :  std_logic;
signal fracYpad :  std_logic_vector(26 downto 0);
signal EffSubVector, EffSubVector_d1 :  std_logic_vector(26 downto 0);
signal fracYpadXorOp :  std_logic_vector(26 downto 0);
signal fracXpad :  std_logic_vector(26 downto 0);
signal cInSigAdd :  std_logic;
signal fracAddResult :  std_logic_vector(26 downto 0);
signal fracSticky :  std_logic_vector(27 downto 0);
signal nZerosNew, nZerosNew_d1 :  std_logic_vector(4 downto 0);
signal shiftedFrac, shiftedFrac_d1 :  std_logic_vector(27 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2, extendedExpInc_d3, extendedExpInc_d4, extendedExpInc_d5, extendedExpInc_d6, extendedExpInc_d7, extendedExpInc_d8 :  std_logic_vector(8 downto 0);
signal updatedExp :  std_logic_vector(9 downto 0);
signal eqdiffsign, eqdiffsign_d1, eqdiffsign_d2 :  std_logic;
signal expFrac :  std_logic_vector(33 downto 0);
signal stk, stk_d1 :  std_logic;
signal rnd, rnd_d1 :  std_logic;
signal lsb, lsb_d1 :  std_logic;
signal needToRound :  std_logic;
signal RoundedExpFrac :  std_logic_vector(33 downto 0);
signal upExc :  std_logic_vector(1 downto 0);
signal fracR, fracR_d1 :  std_logic_vector(22 downto 0);
signal expR, expR_d1 :  std_logic_vector(7 downto 0);
signal exExpExc, exExpExc_d1 :  std_logic_vector(3 downto 0);
signal excRt2 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2, signR2_d1, signR2_d2 :  std_logic;
signal computedR :  std_logic_vector(33 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               expDiff_d1 <=  expDiff;
               newY_d1 <=  newY;
               expX_d1 <=  expX;
               excY_d1 <=  excY;
               signX_d1 <=  signX;
               signY_d1 <=  signY;
               EffSub_d1 <=  EffSub;
               EffSub_d2 <=  EffSub_d1;
               EffSub_d3 <=  EffSub_d2;
               EffSub_d4 <=  EffSub_d3;
               EffSub_d5 <=  EffSub_d4;
               EffSub_d6 <=  EffSub_d5;
               EffSub_d7 <=  EffSub_d6;
               EffSub_d8 <=  EffSub_d7;
               EffSub_d9 <=  EffSub_d8;
               sXsYExnXY_d1 <=  sXsYExnXY;
               excRt_d1 <=  excRt;
               excRt_d2 <=  excRt_d1;
               excRt_d3 <=  excRt_d2;
               excRt_d4 <=  excRt_d3;
               excRt_d5 <=  excRt_d4;
               excRt_d6 <=  excRt_d5;
               excRt_d7 <=  excRt_d6;
               excRt_d8 <=  excRt_d7;
               excRt_d9 <=  excRt_d8;
               signR_d1 <=  signR;
               signR_d2 <=  signR_d1;
               signR_d3 <=  signR_d2;
               signR_d4 <=  signR_d3;
               signR_d5 <=  signR_d4;
               signR_d6 <=  signR_d5;
               signR_d7 <=  signR_d6;
               sticky_d1 <=  sticky;
               EffSubVector_d1 <=  EffSubVector;
               nZerosNew_d1 <=  nZerosNew;
               shiftedFrac_d1 <=  shiftedFrac;
               extendedExpInc_d1 <=  extendedExpInc;
               extendedExpInc_d2 <=  extendedExpInc_d1;
               extendedExpInc_d3 <=  extendedExpInc_d2;
               extendedExpInc_d4 <=  extendedExpInc_d3;
               extendedExpInc_d5 <=  extendedExpInc_d4;
               extendedExpInc_d6 <=  extendedExpInc_d5;
               extendedExpInc_d7 <=  extendedExpInc_d6;
               extendedExpInc_d8 <=  extendedExpInc_d7;
               eqdiffsign_d1 <=  eqdiffsign;
               eqdiffsign_d2 <=  eqdiffsign_d1;
               stk_d1 <=  stk;
               rnd_d1 <=  rnd;
               lsb_d1 <=  lsb;
               fracR_d1 <=  fracR;
               expR_d1 <=  expR;
               exExpExc_d1 <=  exExpExc;
               signR2_d1 <=  signR2;
               signR2_d2 <=  signR2_d1;
            end if;
         end if;
      end process;
   excExpFracX <= X(33 downto 32) & X(30 downto 0);
   excExpFracY <= Y(33 downto 32) & Y(30 downto 0);
   swap <= '1' when excExpFracX < excExpFracY else '0';
   -- exponent difference
   eXmeY <= (X(30 downto 23)) - (Y(30 downto 23));
   eYmeX <= (Y(30 downto 23)) - (X(30 downto 23));
   expDiff <= eXmeY when swap = '0' else eYmeX;
   -- input swap so that |X|>|Y|
   newX <= X when swap = '0' else Y;
   newY <= Y when swap = '0' else X;
   -- now we decompose the inputs into their sign, exponent, fraction
   expX<= newX(30 downto 23);
   excX<= newX(33 downto 32);
   excY<= newY(33 downto 32);
   signX<= newX(31);
   signY<= newY(31);
   EffSub <= signX_d1 xor signY_d1;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   fracY <= "000000000000000000000000" when excY_d1="00" else ('1' & newY_d1(22 downto 0));
   -- Exception management logic
   with sXsYExnXY_d1  select  
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   signR<= '0' when (sXsYExnXY_d1="100000" or sXsYExnXY_d1="010000") else signX_d1;
   shiftedOut <= '1' when (expDiff_d1 > 25) else '0';
   shiftVal <= expDiff_d1(4 downto 0) when shiftedOut='0' else CONV_STD_LOGIC_VECTOR(26,5);
   RightShifterComponent: RightShifterSticky24_by_max_26_Freq500_uid4
      port map ( clk  => clk,
                 ce => ce,
                 S => shiftVal,
                 X => fracY,
                 R => shiftedFracY,
                 Sticky => sticky);
   fracYpad <= "0" & shiftedFracY;
   EffSubVector <= (26 downto 0 => EffSub);
   fracYpadXorOp <= fracYpad xor EffSubVector_d1;
   fracXpad <= "01" & (newX(22 downto 0)) & "00";
   cInSigAdd <= EffSub_d4 and not sticky_d1; -- if we subtract and the sticky was one, some of the negated sticky bits would have absorbed this carry 
   fracAdder: IntAdder_27_Freq500_uid6
      port map ( clk  => clk,
                 ce => ce,
                 Cin => cInSigAdd,
                 X => fracXpad,
                 Y => fracYpadXorOp,
                 R => fracAddResult);
   fracSticky<= fracAddResult & sticky_d1; 
   LZCAndShifter: Normalizer_Z_28_28_28_Freq500_uid8
      port map ( clk  => clk,
                 ce => ce,
                 X => fracSticky,
                 Count => nZerosNew,
                 R => shiftedFrac);
   extendedExpInc<= ("0" & expX_d1) + '1';
   updatedExp <= ("0" &extendedExpInc_d8) - ("00000" & nZerosNew_d1);
   eqdiffsign <= '1' when nZerosNew="11111" else '0';
   expFrac<= updatedExp & shiftedFrac_d1(26 downto 3);
   stk<= shiftedFrac(2) or shiftedFrac(1) or shiftedFrac(0);
   rnd<= shiftedFrac(3);
   lsb<= shiftedFrac(4);
   needToRound<= '1' when (rnd_d1='1' and stk_d1='1') or (rnd_d1='1' and stk_d1='0' and lsb_d1='1')
  else '0';
   roundingAdder: IntAdder_34_Freq500_uid11
      port map ( clk  => clk,
                 ce => ce,
                 Cin => needToRound,
                 X => expFrac,
                 Y => "0000000000000000000000000000000000",
                 R => RoundedExpFrac);
   -- possible update to exception bits
   upExc <= RoundedExpFrac(33 downto 32);
   fracR <= RoundedExpFrac(23 downto 1);
   expR <= RoundedExpFrac(31 downto 24);
   exExpExc <= upExc & excRt_d8;
   with exExpExc_d1  select  
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   excR <= "00" when (eqdiffsign_d2='1' and EffSub_d9='1'  and not(excRt_d9="11")) else excRt2;
   signR2 <= '0' when (eqdiffsign='1' and EffSub_d7='1') else signR_d7;
   computedR <= excR & signR2_d2 & expR_d1 & fracR_d1;
   R <= computedR;
end architecture;



--------------------------------------------------------------------------------
--                        DSPBlock_17x24_Freq500_uid9
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_17x24_Freq500_uid9 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(16 downto 0);
          Y : in  std_logic_vector(23 downto 0);
          R : out  std_logic_vector(40 downto 0)   );
end entity;

architecture arch of DSPBlock_17x24_Freq500_uid9 is
signal Mint :  std_logic_vector(40 downto 0);
signal M :  std_logic_vector(40 downto 0);
signal Rtmp :  std_logic_vector(40 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(40 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                        DSPBlock_7x24_Freq500_uid11
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_7x24_Freq500_uid11 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(6 downto 0);
          Y : in  std_logic_vector(23 downto 0);
          R : out  std_logic_vector(30 downto 0)   );
end entity;

architecture arch of DSPBlock_7x24_Freq500_uid11 is
signal Mint :  std_logic_vector(30 downto 0);
signal M :  std_logic_vector(30 downto 0);
signal Rtmp :  std_logic_vector(30 downto 0);
begin
   Mint <= std_logic_vector(unsigned(X) * unsigned(Y)); -- multiplier
   M <= Mint(30 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_32_Freq500_uid14
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_32_Freq500_uid14 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(31 downto 0);
          Y : in  std_logic_vector(31 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(31 downto 0)   );
end entity;

architecture arch of IntAdder_32_Freq500_uid14 is
signal Rtmp :  std_logic_vector(31 downto 0);
begin
   Rtmp <= X + Y + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                         IntMultiplier_Freq500_uid5
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Martin Kumm, Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_Freq500_uid5 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          Y : in  std_logic_vector(23 downto 0);
          R : out  std_logic_vector(47 downto 0)   );
end entity;

architecture arch of IntMultiplier_Freq500_uid5 is
   component DSPBlock_17x24_Freq500_uid9 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(16 downto 0);
             Y : in  std_logic_vector(23 downto 0);
             R : out  std_logic_vector(40 downto 0)   );
   end component;

   component DSPBlock_7x24_Freq500_uid11 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(6 downto 0);
             Y : in  std_logic_vector(23 downto 0);
             R : out  std_logic_vector(30 downto 0)   );
   end component;

   component IntAdder_32_Freq500_uid14 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(31 downto 0);
             Y : in  std_logic_vector(31 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(31 downto 0)   );
   end component;

signal XX_m6 :  std_logic_vector(23 downto 0);
signal YY_m6 :  std_logic_vector(23 downto 0);
signal tile_0_X :  std_logic_vector(16 downto 0);
signal tile_0_Y :  std_logic_vector(23 downto 0);
signal tile_0_output :  std_logic_vector(40 downto 0);
signal tile_0_filtered_output :  unsigned(40-0 downto 0);
signal bh7_w0_0 :  std_logic;
signal bh7_w1_0 :  std_logic;
signal bh7_w2_0 :  std_logic;
signal bh7_w3_0 :  std_logic;
signal bh7_w4_0 :  std_logic;
signal bh7_w5_0 :  std_logic;
signal bh7_w6_0 :  std_logic;
signal bh7_w7_0 :  std_logic;
signal bh7_w8_0 :  std_logic;
signal bh7_w9_0 :  std_logic;
signal bh7_w10_0 :  std_logic;
signal bh7_w11_0 :  std_logic;
signal bh7_w12_0 :  std_logic;
signal bh7_w13_0 :  std_logic;
signal bh7_w14_0 :  std_logic;
signal bh7_w15_0 :  std_logic;
signal bh7_w16_0 :  std_logic;
signal bh7_w17_0 :  std_logic;
signal bh7_w18_0 :  std_logic;
signal bh7_w19_0 :  std_logic;
signal bh7_w20_0 :  std_logic;
signal bh7_w21_0 :  std_logic;
signal bh7_w22_0 :  std_logic;
signal bh7_w23_0 :  std_logic;
signal bh7_w24_0 :  std_logic;
signal bh7_w25_0 :  std_logic;
signal bh7_w26_0 :  std_logic;
signal bh7_w27_0 :  std_logic;
signal bh7_w28_0 :  std_logic;
signal bh7_w29_0 :  std_logic;
signal bh7_w30_0 :  std_logic;
signal bh7_w31_0 :  std_logic;
signal bh7_w32_0 :  std_logic;
signal bh7_w33_0 :  std_logic;
signal bh7_w34_0 :  std_logic;
signal bh7_w35_0 :  std_logic;
signal bh7_w36_0 :  std_logic;
signal bh7_w37_0 :  std_logic;
signal bh7_w38_0 :  std_logic;
signal bh7_w39_0 :  std_logic;
signal bh7_w40_0 :  std_logic;
signal tile_1_X :  std_logic_vector(6 downto 0);
signal tile_1_Y :  std_logic_vector(23 downto 0);
signal tile_1_output :  std_logic_vector(30 downto 0);
signal tile_1_filtered_output :  unsigned(30-0 downto 0);
signal bh7_w17_1 :  std_logic;
signal bh7_w18_1 :  std_logic;
signal bh7_w19_1 :  std_logic;
signal bh7_w20_1 :  std_logic;
signal bh7_w21_1 :  std_logic;
signal bh7_w22_1 :  std_logic;
signal bh7_w23_1 :  std_logic;
signal bh7_w24_1 :  std_logic;
signal bh7_w25_1 :  std_logic;
signal bh7_w26_1 :  std_logic;
signal bh7_w27_1 :  std_logic;
signal bh7_w28_1 :  std_logic;
signal bh7_w29_1 :  std_logic;
signal bh7_w30_1 :  std_logic;
signal bh7_w31_1 :  std_logic;
signal bh7_w32_1 :  std_logic;
signal bh7_w33_1 :  std_logic;
signal bh7_w34_1 :  std_logic;
signal bh7_w35_1 :  std_logic;
signal bh7_w36_1 :  std_logic;
signal bh7_w37_1 :  std_logic;
signal bh7_w38_1 :  std_logic;
signal bh7_w39_1 :  std_logic;
signal bh7_w40_1 :  std_logic;
signal bh7_w41_0 :  std_logic;
signal bh7_w42_0 :  std_logic;
signal bh7_w43_0 :  std_logic;
signal bh7_w44_0 :  std_logic;
signal bh7_w45_0 :  std_logic;
signal bh7_w46_0 :  std_logic;
signal bh7_w47_0 :  std_logic;
signal tmp_bitheapResult_bh7_16 :  std_logic_vector(16 downto 0);
signal bitheapFinalAdd_bh7_In0 :  std_logic_vector(31 downto 0);
signal bitheapFinalAdd_bh7_In1 :  std_logic_vector(31 downto 0);
signal bitheapFinalAdd_bh7_Cin :  std_logic;
signal bitheapFinalAdd_bh7_Out :  std_logic_vector(31 downto 0);
signal bitheapResult_bh7 :  std_logic_vector(47 downto 0);
begin
   XX_m6 <= X ;
   YY_m6 <= Y ;
   tile_0_X <= X(16 downto 0);
   tile_0_Y <= Y(23 downto 0);
   tile_0_mult: DSPBlock_17x24_Freq500_uid9
      port map ( clk  => clk,
                 ce => ce,
                 X => tile_0_X,
                 Y => tile_0_Y,
                 R => tile_0_output);

   tile_0_filtered_output <= unsigned(tile_0_output(40 downto 0));
   bh7_w0_0 <= tile_0_filtered_output(0);
   bh7_w1_0 <= tile_0_filtered_output(1);
   bh7_w2_0 <= tile_0_filtered_output(2);
   bh7_w3_0 <= tile_0_filtered_output(3);
   bh7_w4_0 <= tile_0_filtered_output(4);
   bh7_w5_0 <= tile_0_filtered_output(5);
   bh7_w6_0 <= tile_0_filtered_output(6);
   bh7_w7_0 <= tile_0_filtered_output(7);
   bh7_w8_0 <= tile_0_filtered_output(8);
   bh7_w9_0 <= tile_0_filtered_output(9);
   bh7_w10_0 <= tile_0_filtered_output(10);
   bh7_w11_0 <= tile_0_filtered_output(11);
   bh7_w12_0 <= tile_0_filtered_output(12);
   bh7_w13_0 <= tile_0_filtered_output(13);
   bh7_w14_0 <= tile_0_filtered_output(14);
   bh7_w15_0 <= tile_0_filtered_output(15);
   bh7_w16_0 <= tile_0_filtered_output(16);
   bh7_w17_0 <= tile_0_filtered_output(17);
   bh7_w18_0 <= tile_0_filtered_output(18);
   bh7_w19_0 <= tile_0_filtered_output(19);
   bh7_w20_0 <= tile_0_filtered_output(20);
   bh7_w21_0 <= tile_0_filtered_output(21);
   bh7_w22_0 <= tile_0_filtered_output(22);
   bh7_w23_0 <= tile_0_filtered_output(23);
   bh7_w24_0 <= tile_0_filtered_output(24);
   bh7_w25_0 <= tile_0_filtered_output(25);
   bh7_w26_0 <= tile_0_filtered_output(26);
   bh7_w27_0 <= tile_0_filtered_output(27);
   bh7_w28_0 <= tile_0_filtered_output(28);
   bh7_w29_0 <= tile_0_filtered_output(29);
   bh7_w30_0 <= tile_0_filtered_output(30);
   bh7_w31_0 <= tile_0_filtered_output(31);
   bh7_w32_0 <= tile_0_filtered_output(32);
   bh7_w33_0 <= tile_0_filtered_output(33);
   bh7_w34_0 <= tile_0_filtered_output(34);
   bh7_w35_0 <= tile_0_filtered_output(35);
   bh7_w36_0 <= tile_0_filtered_output(36);
   bh7_w37_0 <= tile_0_filtered_output(37);
   bh7_w38_0 <= tile_0_filtered_output(38);
   bh7_w39_0 <= tile_0_filtered_output(39);
   bh7_w40_0 <= tile_0_filtered_output(40);
   tile_1_X <= X(23 downto 17);
   tile_1_Y <= Y(23 downto 0);
   tile_1_mult: DSPBlock_7x24_Freq500_uid11
      port map ( clk  => clk,
                 ce => ce,
                 X => tile_1_X,
                 Y => tile_1_Y,
                 R => tile_1_output);

   tile_1_filtered_output <= unsigned(tile_1_output(30 downto 0));
   bh7_w17_1 <= tile_1_filtered_output(0);
   bh7_w18_1 <= tile_1_filtered_output(1);
   bh7_w19_1 <= tile_1_filtered_output(2);
   bh7_w20_1 <= tile_1_filtered_output(3);
   bh7_w21_1 <= tile_1_filtered_output(4);
   bh7_w22_1 <= tile_1_filtered_output(5);
   bh7_w23_1 <= tile_1_filtered_output(6);
   bh7_w24_1 <= tile_1_filtered_output(7);
   bh7_w25_1 <= tile_1_filtered_output(8);
   bh7_w26_1 <= tile_1_filtered_output(9);
   bh7_w27_1 <= tile_1_filtered_output(10);
   bh7_w28_1 <= tile_1_filtered_output(11);
   bh7_w29_1 <= tile_1_filtered_output(12);
   bh7_w30_1 <= tile_1_filtered_output(13);
   bh7_w31_1 <= tile_1_filtered_output(14);
   bh7_w32_1 <= tile_1_filtered_output(15);
   bh7_w33_1 <= tile_1_filtered_output(16);
   bh7_w34_1 <= tile_1_filtered_output(17);
   bh7_w35_1 <= tile_1_filtered_output(18);
   bh7_w36_1 <= tile_1_filtered_output(19);
   bh7_w37_1 <= tile_1_filtered_output(20);
   bh7_w38_1 <= tile_1_filtered_output(21);
   bh7_w39_1 <= tile_1_filtered_output(22);
   bh7_w40_1 <= tile_1_filtered_output(23);
   bh7_w41_0 <= tile_1_filtered_output(24);
   bh7_w42_0 <= tile_1_filtered_output(25);
   bh7_w43_0 <= tile_1_filtered_output(26);
   bh7_w44_0 <= tile_1_filtered_output(27);
   bh7_w45_0 <= tile_1_filtered_output(28);
   bh7_w46_0 <= tile_1_filtered_output(29);
   bh7_w47_0 <= tile_1_filtered_output(30);

   -- Adding the constant bits 
      -- All the constant bits are zero, nothing to add

   tmp_bitheapResult_bh7_16 <= bh7_w16_0 & bh7_w15_0 & bh7_w14_0 & bh7_w13_0 & bh7_w12_0 & bh7_w11_0 & bh7_w10_0 & bh7_w9_0 & bh7_w8_0 & bh7_w7_0 & bh7_w6_0 & bh7_w5_0 & bh7_w4_0 & bh7_w3_0 & bh7_w2_0 & bh7_w1_0 & bh7_w0_0;

   bitheapFinalAdd_bh7_In0 <= "0" & bh7_w47_0 & bh7_w46_0 & bh7_w45_0 & bh7_w44_0 & bh7_w43_0 & bh7_w42_0 & bh7_w41_0 & bh7_w40_0 & bh7_w39_0 & bh7_w38_0 & bh7_w37_0 & bh7_w36_0 & bh7_w35_0 & bh7_w34_0 & bh7_w33_0 & bh7_w32_0 & bh7_w31_0 & bh7_w30_0 & bh7_w29_0 & bh7_w28_0 & bh7_w27_0 & bh7_w26_0 & bh7_w25_0 & bh7_w24_0 & bh7_w23_0 & bh7_w22_0 & bh7_w21_0 & bh7_w20_0 & bh7_w19_0 & bh7_w18_0 & bh7_w17_0;
   bitheapFinalAdd_bh7_In1 <= "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & bh7_w40_1 & bh7_w39_1 & bh7_w38_1 & bh7_w37_1 & bh7_w36_1 & bh7_w35_1 & bh7_w34_1 & bh7_w33_1 & bh7_w32_1 & bh7_w31_1 & bh7_w30_1 & bh7_w29_1 & bh7_w28_1 & bh7_w27_1 & bh7_w26_1 & bh7_w25_1 & bh7_w24_1 & bh7_w23_1 & bh7_w22_1 & bh7_w21_1 & bh7_w20_1 & bh7_w19_1 & bh7_w18_1 & bh7_w17_1;
   bitheapFinalAdd_bh7_Cin <= '0';

   bitheapFinalAdd_bh7: IntAdder_32_Freq500_uid14
      port map ( clk  => clk,
                 ce => ce,
                 Cin => bitheapFinalAdd_bh7_Cin,
                 X => bitheapFinalAdd_bh7_In0,
                 Y => bitheapFinalAdd_bh7_In1,
                 R => bitheapFinalAdd_bh7_Out);
   bitheapResult_bh7 <= bitheapFinalAdd_bh7_Out(30 downto 0) & tmp_bitheapResult_bh7_16;
   R <= bitheapResult_bh7(47 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_33_Freq500_uid17
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_33_Freq500_uid17 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(32 downto 0);
          Y : in  std_logic_vector(32 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(32 downto 0)   );
end entity;

architecture arch of IntAdder_33_Freq500_uid17 is
signal Cin_0, Cin_0_d1 :  std_logic;
signal X_0, X_0_d1 :  std_logic_vector(31 downto 0);
signal Y_0, Y_0_d1, Y_0_d2 :  std_logic_vector(31 downto 0);
signal S_0 :  std_logic_vector(31 downto 0);
signal R_0 :  std_logic_vector(30 downto 0);
signal Cin_1 :  std_logic;
signal X_1, X_1_d1 :  std_logic_vector(2 downto 0);
signal Y_1, Y_1_d1, Y_1_d2 :  std_logic_vector(2 downto 0);
signal S_1 :  std_logic_vector(2 downto 0);
signal R_1 :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               Cin_0_d1 <=  Cin_0;
               X_0_d1 <=  X_0;
               Y_0_d1 <=  Y_0;
               Y_0_d2 <=  Y_0_d1;
               X_1_d1 <=  X_1;
               Y_1_d1 <=  Y_1;
               Y_1_d2 <=  Y_1_d1;
            end if;
         end if;
      end process;
   Cin_0 <= Cin;
   X_0 <= '0' & X(30 downto 0);
   Y_0 <= '0' & Y(30 downto 0);
   S_0 <= X_0_d1 + Y_0_d2 + Cin_0_d1;
   R_0 <= S_0(30 downto 0);
   Cin_1 <= S_0(31);
   X_1 <= '0' & X(32 downto 31);
   Y_1 <= '0' & Y(32 downto 31);
   S_1 <= X_1_d1 + Y_1_d2 + Cin_1;
   R_1 <= S_1(1 downto 0);
   R <= R_1 & R_0 ;
end architecture;

--------------------------------------------------------------------------------
--                          FloatingPointMultiplier
--                      (FPMult_8_23_uid2_Freq500_uid3)
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin 2008-2021
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FloatingPointMultiplier is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FloatingPointMultiplier is
   component IntMultiplier_Freq500_uid5 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             Y : in  std_logic_vector(23 downto 0);
             R : out  std_logic_vector(47 downto 0)   );
   end component;

   component IntAdder_33_Freq500_uid17 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(32 downto 0);
             Y : in  std_logic_vector(32 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(32 downto 0)   );
   end component;

signal sign, sign_d1, sign_d2 :  std_logic;
signal expX :  std_logic_vector(7 downto 0);
signal expY :  std_logic_vector(7 downto 0);
signal expSumPreSub, expSumPreSub_d1 :  std_logic_vector(9 downto 0);
signal bias, bias_d1 :  std_logic_vector(9 downto 0);
signal expSum :  std_logic_vector(9 downto 0);
signal sigX :  std_logic_vector(23 downto 0);
signal sigY :  std_logic_vector(23 downto 0);
signal sigProd :  std_logic_vector(47 downto 0);
signal excSel :  std_logic_vector(3 downto 0);
signal exc, exc_d1, exc_d2 :  std_logic_vector(1 downto 0);
signal norm, norm_d1 :  std_logic;
signal expPostNorm :  std_logic_vector(9 downto 0);
signal sigProdExt, sigProdExt_d1 :  std_logic_vector(47 downto 0);
signal expSig :  std_logic_vector(32 downto 0);
signal sticky, sticky_d1 :  std_logic;
signal guard :  std_logic;
signal round :  std_logic;
signal expSigPostRound :  std_logic_vector(32 downto 0);
signal excPostNorm :  std_logic_vector(1 downto 0);
signal finalExc :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               sign_d1 <=  sign;
               sign_d2 <=  sign_d1;
               expSumPreSub_d1 <=  expSumPreSub;
               bias_d1 <=  bias;
               exc_d1 <=  exc;
               exc_d2 <=  exc_d1;
               norm_d1 <=  norm;
               sigProdExt_d1 <=  sigProdExt;
               sticky_d1 <=  sticky;
            end if;
         end if;
      end process;
   sign <= X(31) xor Y(31);
   expX <= X(30 downto 23);
   expY <= Y(30 downto 23);
   expSumPreSub <= ("00" & expX) + ("00" & expY);
   bias <= CONV_STD_LOGIC_VECTOR(127,10);
   expSum <= expSumPreSub_d1 - bias_d1;
   sigX <= "1" & X(22 downto 0);
   sigY <= "1" & Y(22 downto 0);
   SignificandMultiplication: IntMultiplier_Freq500_uid5
      port map ( clk  => clk,
                 ce => ce,
                 X => sigX,
                 Y => sigY,
                 R => sigProd);
   excSel <= X(33 downto 32) & Y(33 downto 32);
   with excSel  select  
   exc <= "00" when  "0000" | "0001" | "0100", 
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   norm <= sigProd(47);
   -- exponent update
   expPostNorm <= expSum + ("000000000" & norm_d1);
   -- significand normalization shift
   sigProdExt <= sigProd(46 downto 0) & "0" when norm='1' else
                         sigProd(45 downto 0) & "00";
   expSig <= expPostNorm & sigProdExt_d1(47 downto 25);
   sticky <= sigProdExt(24);
   guard <= '0' when sigProdExt_d1(23 downto 0)="000000000000000000000000" else '1';
   round <= sticky_d1 and ( (guard and not(sigProdExt_d1(25))) or (sigProdExt_d1(25) ))  ;
   RoundingAdder: IntAdder_33_Freq500_uid17
      port map ( clk  => clk,
                 ce => ce,
                 Cin => round,
                 X => expSig,
                 Y => "000000000000000000000000000000000",
                 R => expSigPostRound);
   with expSigPostRound(32 downto 31)  select 
   excPostNorm <=  "01"  when  "00",
                               "10"             when "01", 
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_d2  select  
   finalExc <= exc_d2 when  "11"|"10"|"00",
                       excPostNorm when others; 
   R <= finalExc & sign_d2 & expSigPostRound(30 downto 0);
end architecture;



--------------------------------------------------------------------------------
--                          selFunction_Freq500_uid4
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007-2022)
--------------------------------------------------------------------------------
-- combinatorial
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X
-- Output signals: Y

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity selFunction_Freq500_uid4 is
    port (X : in  std_logic_vector(8 downto 0);
          Y : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of selFunction_Freq500_uid4 is
signal Y0 :  std_logic_vector(2 downto 0);
attribute ram_extract: string;
attribute ram_style: string;
attribute ram_extract of Y0: signal is "yes";
attribute ram_style of Y0: signal is "distributed";
signal Y1 :  std_logic_vector(2 downto 0);
begin
   with X  select  Y0 <= 
      "000" when "000000000",
      "000" when "000000001",
      "000" when "000000010",
      "000" when "000000011",
      "000" when "000000100",
      "000" when "000000101",
      "000" when "000000110",
      "000" when "000000111",
      "000" when "000001000",
      "000" when "000001001",
      "000" when "000001010",
      "000" when "000001011",
      "000" when "000001100",
      "000" when "000001101",
      "000" when "000001110",
      "000" when "000001111",
      "001" when "000010000",
      "000" when "000010001",
      "000" when "000010010",
      "000" when "000010011",
      "000" when "000010100",
      "000" when "000010101",
      "000" when "000010110",
      "000" when "000010111",
      "001" when "000011000",
      "001" when "000011001",
      "001" when "000011010",
      "001" when "000011011",
      "000" when "000011100",
      "000" when "000011101",
      "000" when "000011110",
      "000" when "000011111",
      "001" when "000100000",
      "001" when "000100001",
      "001" when "000100010",
      "001" when "000100011",
      "001" when "000100100",
      "001" when "000100101",
      "001" when "000100110",
      "000" when "000100111",
      "001" when "000101000",
      "001" when "000101001",
      "001" when "000101010",
      "001" when "000101011",
      "001" when "000101100",
      "001" when "000101101",
      "001" when "000101110",
      "001" when "000101111",
      "010" when "000110000",
      "001" when "000110001",
      "001" when "000110010",
      "001" when "000110011",
      "001" when "000110100",
      "001" when "000110101",
      "001" when "000110110",
      "001" when "000110111",
      "010" when "000111000",
      "010" when "000111001",
      "001" when "000111010",
      "001" when "000111011",
      "001" when "000111100",
      "001" when "000111101",
      "001" when "000111110",
      "001" when "000111111",
      "010" when "001000000",
      "010" when "001000001",
      "010" when "001000010",
      "001" when "001000011",
      "001" when "001000100",
      "001" when "001000101",
      "001" when "001000110",
      "001" when "001000111",
      "010" when "001001000",
      "010" when "001001001",
      "010" when "001001010",
      "010" when "001001011",
      "001" when "001001100",
      "001" when "001001101",
      "001" when "001001110",
      "001" when "001001111",
      "010" when "001010000",
      "010" when "001010001",
      "010" when "001010010",
      "010" when "001010011",
      "010" when "001010100",
      "010" when "001010101",
      "001" when "001010110",
      "001" when "001010111",
      "010" when "001011000",
      "010" when "001011001",
      "010" when "001011010",
      "010" when "001011011",
      "010" when "001011100",
      "010" when "001011101",
      "010" when "001011110",
      "001" when "001011111",
      "010" when "001100000",
      "010" when "001100001",
      "010" when "001100010",
      "010" when "001100011",
      "010" when "001100100",
      "010" when "001100101",
      "010" when "001100110",
      "010" when "001100111",
      "010" when "001101000",
      "010" when "001101001",
      "010" when "001101010",
      "010" when "001101011",
      "010" when "001101100",
      "010" when "001101101",
      "010" when "001101110",
      "010" when "001101111",
      "010" when "001110000",
      "010" when "001110001",
      "010" when "001110010",
      "010" when "001110011",
      "010" when "001110100",
      "010" when "001110101",
      "010" when "001110110",
      "010" when "001110111",
      "010" when "001111000",
      "010" when "001111001",
      "010" when "001111010",
      "010" when "001111011",
      "010" when "001111100",
      "010" when "001111101",
      "010" when "001111110",
      "010" when "001111111",
      "010" when "010000000",
      "010" when "010000001",
      "010" when "010000010",
      "010" when "010000011",
      "010" when "010000100",
      "010" when "010000101",
      "010" when "010000110",
      "010" when "010000111",
      "010" when "010001000",
      "010" when "010001001",
      "010" when "010001010",
      "010" when "010001011",
      "010" when "010001100",
      "010" when "010001101",
      "010" when "010001110",
      "010" when "010001111",
      "010" when "010010000",
      "010" when "010010001",
      "010" when "010010010",
      "010" when "010010011",
      "010" when "010010100",
      "010" when "010010101",
      "010" when "010010110",
      "010" when "010010111",
      "010" when "010011000",
      "010" when "010011001",
      "010" when "010011010",
      "010" when "010011011",
      "010" when "010011100",
      "010" when "010011101",
      "010" when "010011110",
      "010" when "010011111",
      "010" when "010100000",
      "010" when "010100001",
      "010" when "010100010",
      "010" when "010100011",
      "010" when "010100100",
      "010" when "010100101",
      "010" when "010100110",
      "010" when "010100111",
      "010" when "010101000",
      "010" when "010101001",
      "010" when "010101010",
      "010" when "010101011",
      "010" when "010101100",
      "010" when "010101101",
      "010" when "010101110",
      "010" when "010101111",
      "010" when "010110000",
      "010" when "010110001",
      "010" when "010110010",
      "010" when "010110011",
      "010" when "010110100",
      "010" when "010110101",
      "010" when "010110110",
      "010" when "010110111",
      "010" when "010111000",
      "010" when "010111001",
      "010" when "010111010",
      "010" when "010111011",
      "010" when "010111100",
      "010" when "010111101",
      "010" when "010111110",
      "010" when "010111111",
      "010" when "011000000",
      "010" when "011000001",
      "010" when "011000010",
      "010" when "011000011",
      "010" when "011000100",
      "010" when "011000101",
      "010" when "011000110",
      "010" when "011000111",
      "010" when "011001000",
      "010" when "011001001",
      "010" when "011001010",
      "010" when "011001011",
      "010" when "011001100",
      "010" when "011001101",
      "010" when "011001110",
      "010" when "011001111",
      "010" when "011010000",
      "010" when "011010001",
      "010" when "011010010",
      "010" when "011010011",
      "010" when "011010100",
      "010" when "011010101",
      "010" when "011010110",
      "010" when "011010111",
      "010" when "011011000",
      "010" when "011011001",
      "010" when "011011010",
      "010" when "011011011",
      "010" when "011011100",
      "010" when "011011101",
      "010" when "011011110",
      "010" when "011011111",
      "010" when "011100000",
      "010" when "011100001",
      "010" when "011100010",
      "010" when "011100011",
      "010" when "011100100",
      "010" when "011100101",
      "010" when "011100110",
      "010" when "011100111",
      "010" when "011101000",
      "010" when "011101001",
      "010" when "011101010",
      "010" when "011101011",
      "010" when "011101100",
      "010" when "011101101",
      "010" when "011101110",
      "010" when "011101111",
      "010" when "011110000",
      "010" when "011110001",
      "010" when "011110010",
      "010" when "011110011",
      "010" when "011110100",
      "010" when "011110101",
      "010" when "011110110",
      "010" when "011110111",
      "010" when "011111000",
      "010" when "011111001",
      "010" when "011111010",
      "010" when "011111011",
      "010" when "011111100",
      "010" when "011111101",
      "010" when "011111110",
      "010" when "011111111",
      "110" when "100000000",
      "110" when "100000001",
      "110" when "100000010",
      "110" when "100000011",
      "110" when "100000100",
      "110" when "100000101",
      "110" when "100000110",
      "110" when "100000111",
      "110" when "100001000",
      "110" when "100001001",
      "110" when "100001010",
      "110" when "100001011",
      "110" when "100001100",
      "110" when "100001101",
      "110" when "100001110",
      "110" when "100001111",
      "110" when "100010000",
      "110" when "100010001",
      "110" when "100010010",
      "110" when "100010011",
      "110" when "100010100",
      "110" when "100010101",
      "110" when "100010110",
      "110" when "100010111",
      "110" when "100011000",
      "110" when "100011001",
      "110" when "100011010",
      "110" when "100011011",
      "110" when "100011100",
      "110" when "100011101",
      "110" when "100011110",
      "110" when "100011111",
      "110" when "100100000",
      "110" when "100100001",
      "110" when "100100010",
      "110" when "100100011",
      "110" when "100100100",
      "110" when "100100101",
      "110" when "100100110",
      "110" when "100100111",
      "110" when "100101000",
      "110" when "100101001",
      "110" when "100101010",
      "110" when "100101011",
      "110" when "100101100",
      "110" when "100101101",
      "110" when "100101110",
      "110" when "100101111",
      "110" when "100110000",
      "110" when "100110001",
      "110" when "100110010",
      "110" when "100110011",
      "110" when "100110100",
      "110" when "100110101",
      "110" when "100110110",
      "110" when "100110111",
      "110" when "100111000",
      "110" when "100111001",
      "110" when "100111010",
      "110" when "100111011",
      "110" when "100111100",
      "110" when "100111101",
      "110" when "100111110",
      "110" when "100111111",
      "110" when "101000000",
      "110" when "101000001",
      "110" when "101000010",
      "110" when "101000011",
      "110" when "101000100",
      "110" when "101000101",
      "110" when "101000110",
      "110" when "101000111",
      "110" when "101001000",
      "110" when "101001001",
      "110" when "101001010",
      "110" when "101001011",
      "110" when "101001100",
      "110" when "101001101",
      "110" when "101001110",
      "110" when "101001111",
      "110" when "101010000",
      "110" when "101010001",
      "110" when "101010010",
      "110" when "101010011",
      "110" when "101010100",
      "110" when "101010101",
      "110" when "101010110",
      "110" when "101010111",
      "110" when "101011000",
      "110" when "101011001",
      "110" when "101011010",
      "110" when "101011011",
      "110" when "101011100",
      "110" when "101011101",
      "110" when "101011110",
      "110" when "101011111",
      "110" when "101100000",
      "110" when "101100001",
      "110" when "101100010",
      "110" when "101100011",
      "110" when "101100100",
      "110" when "101100101",
      "110" when "101100110",
      "110" when "101100111",
      "110" when "101101000",
      "110" when "101101001",
      "110" when "101101010",
      "110" when "101101011",
      "110" when "101101100",
      "110" when "101101101",
      "110" when "101101110",
      "110" when "101101111",
      "110" when "101110000",
      "110" when "101110001",
      "110" when "101110010",
      "110" when "101110011",
      "110" when "101110100",
      "110" when "101110101",
      "110" when "101110110",
      "110" when "101110111",
      "110" when "101111000",
      "110" when "101111001",
      "110" when "101111010",
      "110" when "101111011",
      "110" when "101111100",
      "110" when "101111101",
      "110" when "101111110",
      "110" when "101111111",
      "110" when "110000000",
      "110" when "110000001",
      "110" when "110000010",
      "110" when "110000011",
      "110" when "110000100",
      "110" when "110000101",
      "110" when "110000110",
      "110" when "110000111",
      "110" when "110001000",
      "110" when "110001001",
      "110" when "110001010",
      "110" when "110001011",
      "110" when "110001100",
      "110" when "110001101",
      "110" when "110001110",
      "110" when "110001111",
      "110" when "110010000",
      "110" when "110010001",
      "110" when "110010010",
      "110" when "110010011",
      "110" when "110010100",
      "110" when "110010101",
      "110" when "110010110",
      "110" when "110010111",
      "110" when "110011000",
      "110" when "110011001",
      "110" when "110011010",
      "110" when "110011011",
      "110" when "110011100",
      "110" when "110011101",
      "110" when "110011110",
      "110" when "110011111",
      "110" when "110100000",
      "110" when "110100001",
      "110" when "110100010",
      "110" when "110100011",
      "110" when "110100100",
      "110" when "110100101",
      "110" when "110100110",
      "110" when "110100111",
      "110" when "110101000",
      "110" when "110101001",
      "110" when "110101010",
      "110" when "110101011",
      "110" when "110101100",
      "110" when "110101101",
      "110" when "110101110",
      "111" when "110101111",
      "110" when "110110000",
      "110" when "110110001",
      "110" when "110110010",
      "110" when "110110011",
      "110" when "110110100",
      "111" when "110110101",
      "111" when "110110110",
      "111" when "110110111",
      "110" when "110111000",
      "110" when "110111001",
      "110" when "110111010",
      "110" when "110111011",
      "111" when "110111100",
      "111" when "110111101",
      "111" when "110111110",
      "111" when "110111111",
      "110" when "111000000",
      "110" when "111000001",
      "111" when "111000010",
      "111" when "111000011",
      "111" when "111000100",
      "111" when "111000101",
      "111" when "111000110",
      "111" when "111000111",
      "110" when "111001000",
      "111" when "111001001",
      "111" when "111001010",
      "111" when "111001011",
      "111" when "111001100",
      "111" when "111001101",
      "111" when "111001110",
      "111" when "111001111",
      "111" when "111010000",
      "111" when "111010001",
      "111" when "111010010",
      "111" when "111010011",
      "111" when "111010100",
      "111" when "111010101",
      "111" when "111010110",
      "111" when "111010111",
      "111" when "111011000",
      "111" when "111011001",
      "111" when "111011010",
      "111" when "111011011",
      "111" when "111011100",
      "111" when "111011101",
      "111" when "111011110",
      "111" when "111011111",
      "111" when "111100000",
      "111" when "111100001",
      "111" when "111100010",
      "111" when "111100011",
      "111" when "111100100",
      "111" when "111100101",
      "111" when "111100110",
      "111" when "111100111",
      "111" when "111101000",
      "111" when "111101001",
      "111" when "111101010",
      "111" when "111101011",
      "000" when "111101100",
      "000" when "111101101",
      "000" when "111101110",
      "000" when "111101111",
      "000" when "111110000",
      "000" when "111110001",
      "000" when "111110010",
      "000" when "111110011",
      "000" when "111110100",
      "000" when "111110101",
      "000" when "111110110",
      "000" when "111110111",
      "000" when "111111000",
      "000" when "111111001",
      "000" when "111111010",
      "000" when "111111011",
      "000" when "111111100",
      "000" when "111111101",
      "000" when "111111110",
      "000" when "111111111",
      "---" when others;
   Y1 <= Y0; -- for the possible blockram register
   Y <= Y1;
end architecture;

--------------------------------------------------------------------------------
--                            FloatingPointDivider
--                         (FPDiv_8_23_Freq500_uid2)
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Maxime Christ, Florent de Dinechin (2015)
--------------------------------------------------------------------------------
-- Pipeline depth: 15 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FloatingPointDivider is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FloatingPointDivider is
   component selFunction_Freq500_uid4 is
      port ( X : in  std_logic_vector(8 downto 0);
             Y : out  std_logic_vector(2 downto 0)   );
   end component;

signal fX :  std_logic_vector(23 downto 0);
signal fY :  std_logic_vector(23 downto 0);
signal expR0, expR0_d1, expR0_d2, expR0_d3, expR0_d4, expR0_d5, expR0_d6, expR0_d7, expR0_d8, expR0_d9, expR0_d10, expR0_d11, expR0_d12, expR0_d13, expR0_d14, expR0_d15 :  std_logic_vector(9 downto 0);
signal sR, sR_d1, sR_d2, sR_d3, sR_d4, sR_d5, sR_d6, sR_d7, sR_d8, sR_d9, sR_d10, sR_d11, sR_d12, sR_d13, sR_d14, sR_d15 :  std_logic;
signal exnXY :  std_logic_vector(3 downto 0);
signal exnR0, exnR0_d1, exnR0_d2, exnR0_d3, exnR0_d4, exnR0_d5, exnR0_d6, exnR0_d7, exnR0_d8, exnR0_d9, exnR0_d10, exnR0_d11, exnR0_d12, exnR0_d13, exnR0_d14, exnR0_d15 :  std_logic_vector(1 downto 0);
signal D, D_d1, D_d2, D_d3, D_d4, D_d5, D_d6, D_d7, D_d8, D_d9, D_d10, D_d11, D_d12, D_d13 :  std_logic_vector(23 downto 0);
signal psX :  std_logic_vector(24 downto 0);
signal betaw14, betaw14_d1 :  std_logic_vector(26 downto 0);
signal sel14 :  std_logic_vector(8 downto 0);
signal q14, q14_d1 :  std_logic_vector(2 downto 0);
signal q14_copy5 :  std_logic_vector(2 downto 0);
signal absq14D, absq14D_d1 :  std_logic_vector(26 downto 0);
signal w13 :  std_logic_vector(26 downto 0);
signal betaw13, betaw13_d1 :  std_logic_vector(26 downto 0);
signal sel13 :  std_logic_vector(8 downto 0);
signal q13, q13_d1 :  std_logic_vector(2 downto 0);
signal q13_copy6 :  std_logic_vector(2 downto 0);
signal absq13D, absq13D_d1 :  std_logic_vector(26 downto 0);
signal w12 :  std_logic_vector(26 downto 0);
signal betaw12, betaw12_d1 :  std_logic_vector(26 downto 0);
signal sel12 :  std_logic_vector(8 downto 0);
signal q12, q12_d1 :  std_logic_vector(2 downto 0);
signal q12_copy7 :  std_logic_vector(2 downto 0);
signal absq12D, absq12D_d1 :  std_logic_vector(26 downto 0);
signal w11 :  std_logic_vector(26 downto 0);
signal betaw11, betaw11_d1 :  std_logic_vector(26 downto 0);
signal sel11 :  std_logic_vector(8 downto 0);
signal q11, q11_d1 :  std_logic_vector(2 downto 0);
signal q11_copy8 :  std_logic_vector(2 downto 0);
signal absq11D, absq11D_d1 :  std_logic_vector(26 downto 0);
signal w10 :  std_logic_vector(26 downto 0);
signal betaw10, betaw10_d1 :  std_logic_vector(26 downto 0);
signal sel10 :  std_logic_vector(8 downto 0);
signal q10, q10_d1 :  std_logic_vector(2 downto 0);
signal q10_copy9 :  std_logic_vector(2 downto 0);
signal absq10D, absq10D_d1 :  std_logic_vector(26 downto 0);
signal w9 :  std_logic_vector(26 downto 0);
signal betaw9, betaw9_d1 :  std_logic_vector(26 downto 0);
signal sel9 :  std_logic_vector(8 downto 0);
signal q9, q9_d1 :  std_logic_vector(2 downto 0);
signal q9_copy10 :  std_logic_vector(2 downto 0);
signal absq9D, absq9D_d1 :  std_logic_vector(26 downto 0);
signal w8 :  std_logic_vector(26 downto 0);
signal betaw8, betaw8_d1 :  std_logic_vector(26 downto 0);
signal sel8 :  std_logic_vector(8 downto 0);
signal q8, q8_d1 :  std_logic_vector(2 downto 0);
signal q8_copy11 :  std_logic_vector(2 downto 0);
signal absq8D, absq8D_d1 :  std_logic_vector(26 downto 0);
signal w7 :  std_logic_vector(26 downto 0);
signal betaw7, betaw7_d1 :  std_logic_vector(26 downto 0);
signal sel7 :  std_logic_vector(8 downto 0);
signal q7, q7_d1 :  std_logic_vector(2 downto 0);
signal q7_copy12 :  std_logic_vector(2 downto 0);
signal absq7D, absq7D_d1 :  std_logic_vector(26 downto 0);
signal w6 :  std_logic_vector(26 downto 0);
signal betaw6, betaw6_d1 :  std_logic_vector(26 downto 0);
signal sel6 :  std_logic_vector(8 downto 0);
signal q6, q6_d1 :  std_logic_vector(2 downto 0);
signal q6_copy13 :  std_logic_vector(2 downto 0);
signal absq6D, absq6D_d1 :  std_logic_vector(26 downto 0);
signal w5 :  std_logic_vector(26 downto 0);
signal betaw5, betaw5_d1 :  std_logic_vector(26 downto 0);
signal sel5 :  std_logic_vector(8 downto 0);
signal q5, q5_d1 :  std_logic_vector(2 downto 0);
signal q5_copy14 :  std_logic_vector(2 downto 0);
signal absq5D, absq5D_d1 :  std_logic_vector(26 downto 0);
signal w4 :  std_logic_vector(26 downto 0);
signal betaw4, betaw4_d1 :  std_logic_vector(26 downto 0);
signal sel4 :  std_logic_vector(8 downto 0);
signal q4, q4_d1 :  std_logic_vector(2 downto 0);
signal q4_copy15 :  std_logic_vector(2 downto 0);
signal absq4D, absq4D_d1 :  std_logic_vector(26 downto 0);
signal w3 :  std_logic_vector(26 downto 0);
signal betaw3, betaw3_d1 :  std_logic_vector(26 downto 0);
signal sel3 :  std_logic_vector(8 downto 0);
signal q3, q3_d1 :  std_logic_vector(2 downto 0);
signal q3_copy16 :  std_logic_vector(2 downto 0);
signal absq3D, absq3D_d1 :  std_logic_vector(26 downto 0);
signal w2 :  std_logic_vector(26 downto 0);
signal betaw2, betaw2_d1 :  std_logic_vector(26 downto 0);
signal sel2 :  std_logic_vector(8 downto 0);
signal q2, q2_d1 :  std_logic_vector(2 downto 0);
signal q2_copy17 :  std_logic_vector(2 downto 0);
signal absq2D, absq2D_d1 :  std_logic_vector(26 downto 0);
signal w1 :  std_logic_vector(26 downto 0);
signal betaw1, betaw1_d1 :  std_logic_vector(26 downto 0);
signal sel1 :  std_logic_vector(8 downto 0);
signal q1, q1_d1 :  std_logic_vector(2 downto 0);
signal q1_copy18 :  std_logic_vector(2 downto 0);
signal absq1D, absq1D_d1 :  std_logic_vector(26 downto 0);
signal w0 :  std_logic_vector(26 downto 0);
signal wfinal :  std_logic_vector(24 downto 0);
signal qM0 :  std_logic;
signal qP14, qP14_d1, qP14_d2, qP14_d3, qP14_d4, qP14_d5, qP14_d6, qP14_d7, qP14_d8, qP14_d9, qP14_d10, qP14_d11, qP14_d12, qP14_d13 :  std_logic_vector(1 downto 0);
signal qM14, qM14_d1, qM14_d2, qM14_d3, qM14_d4, qM14_d5, qM14_d6, qM14_d7, qM14_d8, qM14_d9, qM14_d10, qM14_d11, qM14_d12, qM14_d13, qM14_d14 :  std_logic_vector(1 downto 0);
signal qP13, qP13_d1, qP13_d2, qP13_d3, qP13_d4, qP13_d5, qP13_d6, qP13_d7, qP13_d8, qP13_d9, qP13_d10, qP13_d11, qP13_d12 :  std_logic_vector(1 downto 0);
signal qM13, qM13_d1, qM13_d2, qM13_d3, qM13_d4, qM13_d5, qM13_d6, qM13_d7, qM13_d8, qM13_d9, qM13_d10, qM13_d11, qM13_d12, qM13_d13 :  std_logic_vector(1 downto 0);
signal qP12, qP12_d1, qP12_d2, qP12_d3, qP12_d4, qP12_d5, qP12_d6, qP12_d7, qP12_d8, qP12_d9, qP12_d10, qP12_d11 :  std_logic_vector(1 downto 0);
signal qM12, qM12_d1, qM12_d2, qM12_d3, qM12_d4, qM12_d5, qM12_d6, qM12_d7, qM12_d8, qM12_d9, qM12_d10, qM12_d11, qM12_d12 :  std_logic_vector(1 downto 0);
signal qP11, qP11_d1, qP11_d2, qP11_d3, qP11_d4, qP11_d5, qP11_d6, qP11_d7, qP11_d8, qP11_d9, qP11_d10 :  std_logic_vector(1 downto 0);
signal qM11, qM11_d1, qM11_d2, qM11_d3, qM11_d4, qM11_d5, qM11_d6, qM11_d7, qM11_d8, qM11_d9, qM11_d10, qM11_d11 :  std_logic_vector(1 downto 0);
signal qP10, qP10_d1, qP10_d2, qP10_d3, qP10_d4, qP10_d5, qP10_d6, qP10_d7, qP10_d8, qP10_d9 :  std_logic_vector(1 downto 0);
signal qM10, qM10_d1, qM10_d2, qM10_d3, qM10_d4, qM10_d5, qM10_d6, qM10_d7, qM10_d8, qM10_d9, qM10_d10 :  std_logic_vector(1 downto 0);
signal qP9, qP9_d1, qP9_d2, qP9_d3, qP9_d4, qP9_d5, qP9_d6, qP9_d7, qP9_d8 :  std_logic_vector(1 downto 0);
signal qM9, qM9_d1, qM9_d2, qM9_d3, qM9_d4, qM9_d5, qM9_d6, qM9_d7, qM9_d8, qM9_d9 :  std_logic_vector(1 downto 0);
signal qP8, qP8_d1, qP8_d2, qP8_d3, qP8_d4, qP8_d5, qP8_d6, qP8_d7 :  std_logic_vector(1 downto 0);
signal qM8, qM8_d1, qM8_d2, qM8_d3, qM8_d4, qM8_d5, qM8_d6, qM8_d7, qM8_d8 :  std_logic_vector(1 downto 0);
signal qP7, qP7_d1, qP7_d2, qP7_d3, qP7_d4, qP7_d5, qP7_d6 :  std_logic_vector(1 downto 0);
signal qM7, qM7_d1, qM7_d2, qM7_d3, qM7_d4, qM7_d5, qM7_d6, qM7_d7 :  std_logic_vector(1 downto 0);
signal qP6, qP6_d1, qP6_d2, qP6_d3, qP6_d4, qP6_d5 :  std_logic_vector(1 downto 0);
signal qM6, qM6_d1, qM6_d2, qM6_d3, qM6_d4, qM6_d5, qM6_d6 :  std_logic_vector(1 downto 0);
signal qP5, qP5_d1, qP5_d2, qP5_d3, qP5_d4 :  std_logic_vector(1 downto 0);
signal qM5, qM5_d1, qM5_d2, qM5_d3, qM5_d4, qM5_d5 :  std_logic_vector(1 downto 0);
signal qP4, qP4_d1, qP4_d2, qP4_d3 :  std_logic_vector(1 downto 0);
signal qM4, qM4_d1, qM4_d2, qM4_d3, qM4_d4 :  std_logic_vector(1 downto 0);
signal qP3, qP3_d1, qP3_d2 :  std_logic_vector(1 downto 0);
signal qM3, qM3_d1, qM3_d2, qM3_d3 :  std_logic_vector(1 downto 0);
signal qP2, qP2_d1 :  std_logic_vector(1 downto 0);
signal qM2, qM2_d1, qM2_d2 :  std_logic_vector(1 downto 0);
signal qP1 :  std_logic_vector(1 downto 0);
signal qM1, qM1_d1 :  std_logic_vector(1 downto 0);
signal qP, qP_d1, qP_d2 :  std_logic_vector(27 downto 0);
signal qM, qM_d1 :  std_logic_vector(27 downto 0);
signal quotient :  std_logic_vector(27 downto 0);
signal mR :  std_logic_vector(25 downto 0);
signal fRnorm :  std_logic_vector(23 downto 0);
signal round :  std_logic;
signal expR1 :  std_logic_vector(9 downto 0);
signal expfrac :  std_logic_vector(32 downto 0);
signal expfracR :  std_logic_vector(32 downto 0);
signal exnR :  std_logic_vector(1 downto 0);
signal exnRfinal :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               expR0_d1 <=  expR0;
               expR0_d2 <=  expR0_d1;
               expR0_d3 <=  expR0_d2;
               expR0_d4 <=  expR0_d3;
               expR0_d5 <=  expR0_d4;
               expR0_d6 <=  expR0_d5;
               expR0_d7 <=  expR0_d6;
               expR0_d8 <=  expR0_d7;
               expR0_d9 <=  expR0_d8;
               expR0_d10 <=  expR0_d9;
               expR0_d11 <=  expR0_d10;
               expR0_d12 <=  expR0_d11;
               expR0_d13 <=  expR0_d12;
               expR0_d14 <=  expR0_d13;
               expR0_d15 <=  expR0_d14;
               sR_d1 <=  sR;
               sR_d2 <=  sR_d1;
               sR_d3 <=  sR_d2;
               sR_d4 <=  sR_d3;
               sR_d5 <=  sR_d4;
               sR_d6 <=  sR_d5;
               sR_d7 <=  sR_d6;
               sR_d8 <=  sR_d7;
               sR_d9 <=  sR_d8;
               sR_d10 <=  sR_d9;
               sR_d11 <=  sR_d10;
               sR_d12 <=  sR_d11;
               sR_d13 <=  sR_d12;
               sR_d14 <=  sR_d13;
               sR_d15 <=  sR_d14;
               exnR0_d1 <=  exnR0;
               exnR0_d2 <=  exnR0_d1;
               exnR0_d3 <=  exnR0_d2;
               exnR0_d4 <=  exnR0_d3;
               exnR0_d5 <=  exnR0_d4;
               exnR0_d6 <=  exnR0_d5;
               exnR0_d7 <=  exnR0_d6;
               exnR0_d8 <=  exnR0_d7;
               exnR0_d9 <=  exnR0_d8;
               exnR0_d10 <=  exnR0_d9;
               exnR0_d11 <=  exnR0_d10;
               exnR0_d12 <=  exnR0_d11;
               exnR0_d13 <=  exnR0_d12;
               exnR0_d14 <=  exnR0_d13;
               exnR0_d15 <=  exnR0_d14;
               D_d1 <=  D;
               D_d2 <=  D_d1;
               D_d3 <=  D_d2;
               D_d4 <=  D_d3;
               D_d5 <=  D_d4;
               D_d6 <=  D_d5;
               D_d7 <=  D_d6;
               D_d8 <=  D_d7;
               D_d9 <=  D_d8;
               D_d10 <=  D_d9;
               D_d11 <=  D_d10;
               D_d12 <=  D_d11;
               D_d13 <=  D_d12;
               betaw14_d1 <=  betaw14;
               q14_d1 <=  q14;
               absq14D_d1 <=  absq14D;
               betaw13_d1 <=  betaw13;
               q13_d1 <=  q13;
               absq13D_d1 <=  absq13D;
               betaw12_d1 <=  betaw12;
               q12_d1 <=  q12;
               absq12D_d1 <=  absq12D;
               betaw11_d1 <=  betaw11;
               q11_d1 <=  q11;
               absq11D_d1 <=  absq11D;
               betaw10_d1 <=  betaw10;
               q10_d1 <=  q10;
               absq10D_d1 <=  absq10D;
               betaw9_d1 <=  betaw9;
               q9_d1 <=  q9;
               absq9D_d1 <=  absq9D;
               betaw8_d1 <=  betaw8;
               q8_d1 <=  q8;
               absq8D_d1 <=  absq8D;
               betaw7_d1 <=  betaw7;
               q7_d1 <=  q7;
               absq7D_d1 <=  absq7D;
               betaw6_d1 <=  betaw6;
               q6_d1 <=  q6;
               absq6D_d1 <=  absq6D;
               betaw5_d1 <=  betaw5;
               q5_d1 <=  q5;
               absq5D_d1 <=  absq5D;
               betaw4_d1 <=  betaw4;
               q4_d1 <=  q4;
               absq4D_d1 <=  absq4D;
               betaw3_d1 <=  betaw3;
               q3_d1 <=  q3;
               absq3D_d1 <=  absq3D;
               betaw2_d1 <=  betaw2;
               q2_d1 <=  q2;
               absq2D_d1 <=  absq2D;
               betaw1_d1 <=  betaw1;
               q1_d1 <=  q1;
               absq1D_d1 <=  absq1D;
               qP14_d1 <=  qP14;
               qP14_d2 <=  qP14_d1;
               qP14_d3 <=  qP14_d2;
               qP14_d4 <=  qP14_d3;
               qP14_d5 <=  qP14_d4;
               qP14_d6 <=  qP14_d5;
               qP14_d7 <=  qP14_d6;
               qP14_d8 <=  qP14_d7;
               qP14_d9 <=  qP14_d8;
               qP14_d10 <=  qP14_d9;
               qP14_d11 <=  qP14_d10;
               qP14_d12 <=  qP14_d11;
               qP14_d13 <=  qP14_d12;
               qM14_d1 <=  qM14;
               qM14_d2 <=  qM14_d1;
               qM14_d3 <=  qM14_d2;
               qM14_d4 <=  qM14_d3;
               qM14_d5 <=  qM14_d4;
               qM14_d6 <=  qM14_d5;
               qM14_d7 <=  qM14_d6;
               qM14_d8 <=  qM14_d7;
               qM14_d9 <=  qM14_d8;
               qM14_d10 <=  qM14_d9;
               qM14_d11 <=  qM14_d10;
               qM14_d12 <=  qM14_d11;
               qM14_d13 <=  qM14_d12;
               qM14_d14 <=  qM14_d13;
               qP13_d1 <=  qP13;
               qP13_d2 <=  qP13_d1;
               qP13_d3 <=  qP13_d2;
               qP13_d4 <=  qP13_d3;
               qP13_d5 <=  qP13_d4;
               qP13_d6 <=  qP13_d5;
               qP13_d7 <=  qP13_d6;
               qP13_d8 <=  qP13_d7;
               qP13_d9 <=  qP13_d8;
               qP13_d10 <=  qP13_d9;
               qP13_d11 <=  qP13_d10;
               qP13_d12 <=  qP13_d11;
               qM13_d1 <=  qM13;
               qM13_d2 <=  qM13_d1;
               qM13_d3 <=  qM13_d2;
               qM13_d4 <=  qM13_d3;
               qM13_d5 <=  qM13_d4;
               qM13_d6 <=  qM13_d5;
               qM13_d7 <=  qM13_d6;
               qM13_d8 <=  qM13_d7;
               qM13_d9 <=  qM13_d8;
               qM13_d10 <=  qM13_d9;
               qM13_d11 <=  qM13_d10;
               qM13_d12 <=  qM13_d11;
               qM13_d13 <=  qM13_d12;
               qP12_d1 <=  qP12;
               qP12_d2 <=  qP12_d1;
               qP12_d3 <=  qP12_d2;
               qP12_d4 <=  qP12_d3;
               qP12_d5 <=  qP12_d4;
               qP12_d6 <=  qP12_d5;
               qP12_d7 <=  qP12_d6;
               qP12_d8 <=  qP12_d7;
               qP12_d9 <=  qP12_d8;
               qP12_d10 <=  qP12_d9;
               qP12_d11 <=  qP12_d10;
               qM12_d1 <=  qM12;
               qM12_d2 <=  qM12_d1;
               qM12_d3 <=  qM12_d2;
               qM12_d4 <=  qM12_d3;
               qM12_d5 <=  qM12_d4;
               qM12_d6 <=  qM12_d5;
               qM12_d7 <=  qM12_d6;
               qM12_d8 <=  qM12_d7;
               qM12_d9 <=  qM12_d8;
               qM12_d10 <=  qM12_d9;
               qM12_d11 <=  qM12_d10;
               qM12_d12 <=  qM12_d11;
               qP11_d1 <=  qP11;
               qP11_d2 <=  qP11_d1;
               qP11_d3 <=  qP11_d2;
               qP11_d4 <=  qP11_d3;
               qP11_d5 <=  qP11_d4;
               qP11_d6 <=  qP11_d5;
               qP11_d7 <=  qP11_d6;
               qP11_d8 <=  qP11_d7;
               qP11_d9 <=  qP11_d8;
               qP11_d10 <=  qP11_d9;
               qM11_d1 <=  qM11;
               qM11_d2 <=  qM11_d1;
               qM11_d3 <=  qM11_d2;
               qM11_d4 <=  qM11_d3;
               qM11_d5 <=  qM11_d4;
               qM11_d6 <=  qM11_d5;
               qM11_d7 <=  qM11_d6;
               qM11_d8 <=  qM11_d7;
               qM11_d9 <=  qM11_d8;
               qM11_d10 <=  qM11_d9;
               qM11_d11 <=  qM11_d10;
               qP10_d1 <=  qP10;
               qP10_d2 <=  qP10_d1;
               qP10_d3 <=  qP10_d2;
               qP10_d4 <=  qP10_d3;
               qP10_d5 <=  qP10_d4;
               qP10_d6 <=  qP10_d5;
               qP10_d7 <=  qP10_d6;
               qP10_d8 <=  qP10_d7;
               qP10_d9 <=  qP10_d8;
               qM10_d1 <=  qM10;
               qM10_d2 <=  qM10_d1;
               qM10_d3 <=  qM10_d2;
               qM10_d4 <=  qM10_d3;
               qM10_d5 <=  qM10_d4;
               qM10_d6 <=  qM10_d5;
               qM10_d7 <=  qM10_d6;
               qM10_d8 <=  qM10_d7;
               qM10_d9 <=  qM10_d8;
               qM10_d10 <=  qM10_d9;
               qP9_d1 <=  qP9;
               qP9_d2 <=  qP9_d1;
               qP9_d3 <=  qP9_d2;
               qP9_d4 <=  qP9_d3;
               qP9_d5 <=  qP9_d4;
               qP9_d6 <=  qP9_d5;
               qP9_d7 <=  qP9_d6;
               qP9_d8 <=  qP9_d7;
               qM9_d1 <=  qM9;
               qM9_d2 <=  qM9_d1;
               qM9_d3 <=  qM9_d2;
               qM9_d4 <=  qM9_d3;
               qM9_d5 <=  qM9_d4;
               qM9_d6 <=  qM9_d5;
               qM9_d7 <=  qM9_d6;
               qM9_d8 <=  qM9_d7;
               qM9_d9 <=  qM9_d8;
               qP8_d1 <=  qP8;
               qP8_d2 <=  qP8_d1;
               qP8_d3 <=  qP8_d2;
               qP8_d4 <=  qP8_d3;
               qP8_d5 <=  qP8_d4;
               qP8_d6 <=  qP8_d5;
               qP8_d7 <=  qP8_d6;
               qM8_d1 <=  qM8;
               qM8_d2 <=  qM8_d1;
               qM8_d3 <=  qM8_d2;
               qM8_d4 <=  qM8_d3;
               qM8_d5 <=  qM8_d4;
               qM8_d6 <=  qM8_d5;
               qM8_d7 <=  qM8_d6;
               qM8_d8 <=  qM8_d7;
               qP7_d1 <=  qP7;
               qP7_d2 <=  qP7_d1;
               qP7_d3 <=  qP7_d2;
               qP7_d4 <=  qP7_d3;
               qP7_d5 <=  qP7_d4;
               qP7_d6 <=  qP7_d5;
               qM7_d1 <=  qM7;
               qM7_d2 <=  qM7_d1;
               qM7_d3 <=  qM7_d2;
               qM7_d4 <=  qM7_d3;
               qM7_d5 <=  qM7_d4;
               qM7_d6 <=  qM7_d5;
               qM7_d7 <=  qM7_d6;
               qP6_d1 <=  qP6;
               qP6_d2 <=  qP6_d1;
               qP6_d3 <=  qP6_d2;
               qP6_d4 <=  qP6_d3;
               qP6_d5 <=  qP6_d4;
               qM6_d1 <=  qM6;
               qM6_d2 <=  qM6_d1;
               qM6_d3 <=  qM6_d2;
               qM6_d4 <=  qM6_d3;
               qM6_d5 <=  qM6_d4;
               qM6_d6 <=  qM6_d5;
               qP5_d1 <=  qP5;
               qP5_d2 <=  qP5_d1;
               qP5_d3 <=  qP5_d2;
               qP5_d4 <=  qP5_d3;
               qM5_d1 <=  qM5;
               qM5_d2 <=  qM5_d1;
               qM5_d3 <=  qM5_d2;
               qM5_d4 <=  qM5_d3;
               qM5_d5 <=  qM5_d4;
               qP4_d1 <=  qP4;
               qP4_d2 <=  qP4_d1;
               qP4_d3 <=  qP4_d2;
               qM4_d1 <=  qM4;
               qM4_d2 <=  qM4_d1;
               qM4_d3 <=  qM4_d2;
               qM4_d4 <=  qM4_d3;
               qP3_d1 <=  qP3;
               qP3_d2 <=  qP3_d1;
               qM3_d1 <=  qM3;
               qM3_d2 <=  qM3_d1;
               qM3_d3 <=  qM3_d2;
               qP2_d1 <=  qP2;
               qM2_d1 <=  qM2;
               qM2_d2 <=  qM2_d1;
               qM1_d1 <=  qM1;
               qP_d1 <=  qP;
               qP_d2 <=  qP_d1;
               qM_d1 <=  qM;
            end if;
         end if;
      end process;
   fX <= "1" & X(22 downto 0);
   fY <= "1" & Y(22 downto 0);
   -- exponent difference, sign and exception combination computed early, to have fewer bits to pipeline
   expR0 <= ("00" & X(30 downto 23)) - ("00" & Y(30 downto 23));
   sR <= X(31) xor Y(31);
   -- early exception handling 
   exnXY <= X(33 downto 32) & Y(33 downto 32);
   with exnXY  select 
      exnR0 <= 
         "01"	 when "0101",										-- normal
         "00"	 when "0001" | "0010" | "0110", -- zero
         "10"	 when "0100" | "1000" | "1001", -- overflow
         "11"	 when others;										-- NaN
   D <= fY ;
   psX <= "0" & fX ;
   betaw14 <=  "00" & psX;
   sel14 <= betaw14(26 downto 21) & D(22 downto 20);
   SelFunctionTable14: selFunction_Freq500_uid4
      port map ( X => sel14,
                 Y => q14_copy5);
   q14 <= q14_copy5; -- output copy to hold a pipeline register if needed

   with q14  select 
      absq14D <= 
         "000" & D						 when "001" | "111", -- mult by 1
         "00" & D & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q14_d1(2)  select 
   w13<= betaw14_d1 - absq14D_d1 when '0',
         betaw14_d1 + absq14D_d1 when others;

   betaw13 <= w13(24 downto 0) & "00"; -- multiplication by the radix
   sel13 <= betaw13(26 downto 21) & D_d1(22 downto 20);
   SelFunctionTable13: selFunction_Freq500_uid4
      port map ( X => sel13,
                 Y => q13_copy6);
   q13 <= q13_copy6; -- output copy to hold a pipeline register if needed

   with q13  select 
      absq13D <= 
         "000" & D_d1						 when "001" | "111", -- mult by 1
         "00" & D_d1 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q13_d1(2)  select 
   w12<= betaw13_d1 - absq13D_d1 when '0',
         betaw13_d1 + absq13D_d1 when others;

   betaw12 <= w12(24 downto 0) & "00"; -- multiplication by the radix
   sel12 <= betaw12(26 downto 21) & D_d2(22 downto 20);
   SelFunctionTable12: selFunction_Freq500_uid4
      port map ( X => sel12,
                 Y => q12_copy7);
   q12 <= q12_copy7; -- output copy to hold a pipeline register if needed

   with q12  select 
      absq12D <= 
         "000" & D_d2						 when "001" | "111", -- mult by 1
         "00" & D_d2 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q12_d1(2)  select 
   w11<= betaw12_d1 - absq12D_d1 when '0',
         betaw12_d1 + absq12D_d1 when others;

   betaw11 <= w11(24 downto 0) & "00"; -- multiplication by the radix
   sel11 <= betaw11(26 downto 21) & D_d3(22 downto 20);
   SelFunctionTable11: selFunction_Freq500_uid4
      port map ( X => sel11,
                 Y => q11_copy8);
   q11 <= q11_copy8; -- output copy to hold a pipeline register if needed

   with q11  select 
      absq11D <= 
         "000" & D_d3						 when "001" | "111", -- mult by 1
         "00" & D_d3 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q11_d1(2)  select 
   w10<= betaw11_d1 - absq11D_d1 when '0',
         betaw11_d1 + absq11D_d1 when others;

   betaw10 <= w10(24 downto 0) & "00"; -- multiplication by the radix
   sel10 <= betaw10(26 downto 21) & D_d4(22 downto 20);
   SelFunctionTable10: selFunction_Freq500_uid4
      port map ( X => sel10,
                 Y => q10_copy9);
   q10 <= q10_copy9; -- output copy to hold a pipeline register if needed

   with q10  select 
      absq10D <= 
         "000" & D_d4						 when "001" | "111", -- mult by 1
         "00" & D_d4 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q10_d1(2)  select 
   w9<= betaw10_d1 - absq10D_d1 when '0',
         betaw10_d1 + absq10D_d1 when others;

   betaw9 <= w9(24 downto 0) & "00"; -- multiplication by the radix
   sel9 <= betaw9(26 downto 21) & D_d5(22 downto 20);
   SelFunctionTable9: selFunction_Freq500_uid4
      port map ( X => sel9,
                 Y => q9_copy10);
   q9 <= q9_copy10; -- output copy to hold a pipeline register if needed

   with q9  select 
      absq9D <= 
         "000" & D_d5						 when "001" | "111", -- mult by 1
         "00" & D_d5 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q9_d1(2)  select 
   w8<= betaw9_d1 - absq9D_d1 when '0',
         betaw9_d1 + absq9D_d1 when others;

   betaw8 <= w8(24 downto 0) & "00"; -- multiplication by the radix
   sel8 <= betaw8(26 downto 21) & D_d6(22 downto 20);
   SelFunctionTable8: selFunction_Freq500_uid4
      port map ( X => sel8,
                 Y => q8_copy11);
   q8 <= q8_copy11; -- output copy to hold a pipeline register if needed

   with q8  select 
      absq8D <= 
         "000" & D_d6						 when "001" | "111", -- mult by 1
         "00" & D_d6 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q8_d1(2)  select 
   w7<= betaw8_d1 - absq8D_d1 when '0',
         betaw8_d1 + absq8D_d1 when others;

   betaw7 <= w7(24 downto 0) & "00"; -- multiplication by the radix
   sel7 <= betaw7(26 downto 21) & D_d7(22 downto 20);
   SelFunctionTable7: selFunction_Freq500_uid4
      port map ( X => sel7,
                 Y => q7_copy12);
   q7 <= q7_copy12; -- output copy to hold a pipeline register if needed

   with q7  select 
      absq7D <= 
         "000" & D_d7						 when "001" | "111", -- mult by 1
         "00" & D_d7 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q7_d1(2)  select 
   w6<= betaw7_d1 - absq7D_d1 when '0',
         betaw7_d1 + absq7D_d1 when others;

   betaw6 <= w6(24 downto 0) & "00"; -- multiplication by the radix
   sel6 <= betaw6(26 downto 21) & D_d8(22 downto 20);
   SelFunctionTable6: selFunction_Freq500_uid4
      port map ( X => sel6,
                 Y => q6_copy13);
   q6 <= q6_copy13; -- output copy to hold a pipeline register if needed

   with q6  select 
      absq6D <= 
         "000" & D_d8						 when "001" | "111", -- mult by 1
         "00" & D_d8 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q6_d1(2)  select 
   w5<= betaw6_d1 - absq6D_d1 when '0',
         betaw6_d1 + absq6D_d1 when others;

   betaw5 <= w5(24 downto 0) & "00"; -- multiplication by the radix
   sel5 <= betaw5(26 downto 21) & D_d9(22 downto 20);
   SelFunctionTable5: selFunction_Freq500_uid4
      port map ( X => sel5,
                 Y => q5_copy14);
   q5 <= q5_copy14; -- output copy to hold a pipeline register if needed

   with q5  select 
      absq5D <= 
         "000" & D_d9						 when "001" | "111", -- mult by 1
         "00" & D_d9 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q5_d1(2)  select 
   w4<= betaw5_d1 - absq5D_d1 when '0',
         betaw5_d1 + absq5D_d1 when others;

   betaw4 <= w4(24 downto 0) & "00"; -- multiplication by the radix
   sel4 <= betaw4(26 downto 21) & D_d10(22 downto 20);
   SelFunctionTable4: selFunction_Freq500_uid4
      port map ( X => sel4,
                 Y => q4_copy15);
   q4 <= q4_copy15; -- output copy to hold a pipeline register if needed

   with q4  select 
      absq4D <= 
         "000" & D_d10						 when "001" | "111", -- mult by 1
         "00" & D_d10 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q4_d1(2)  select 
   w3<= betaw4_d1 - absq4D_d1 when '0',
         betaw4_d1 + absq4D_d1 when others;

   betaw3 <= w3(24 downto 0) & "00"; -- multiplication by the radix
   sel3 <= betaw3(26 downto 21) & D_d11(22 downto 20);
   SelFunctionTable3: selFunction_Freq500_uid4
      port map ( X => sel3,
                 Y => q3_copy16);
   q3 <= q3_copy16; -- output copy to hold a pipeline register if needed

   with q3  select 
      absq3D <= 
         "000" & D_d11						 when "001" | "111", -- mult by 1
         "00" & D_d11 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q3_d1(2)  select 
   w2<= betaw3_d1 - absq3D_d1 when '0',
         betaw3_d1 + absq3D_d1 when others;

   betaw2 <= w2(24 downto 0) & "00"; -- multiplication by the radix
   sel2 <= betaw2(26 downto 21) & D_d12(22 downto 20);
   SelFunctionTable2: selFunction_Freq500_uid4
      port map ( X => sel2,
                 Y => q2_copy17);
   q2 <= q2_copy17; -- output copy to hold a pipeline register if needed

   with q2  select 
      absq2D <= 
         "000" & D_d12						 when "001" | "111", -- mult by 1
         "00" & D_d12 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q2_d1(2)  select 
   w1<= betaw2_d1 - absq2D_d1 when '0',
         betaw2_d1 + absq2D_d1 when others;

   betaw1 <= w1(24 downto 0) & "00"; -- multiplication by the radix
   sel1 <= betaw1(26 downto 21) & D_d13(22 downto 20);
   SelFunctionTable1: selFunction_Freq500_uid4
      port map ( X => sel1,
                 Y => q1_copy18);
   q1 <= q1_copy18; -- output copy to hold a pipeline register if needed

   with q1  select 
      absq1D <= 
         "000" & D_d13						 when "001" | "111", -- mult by 1
         "00" & D_d13 & "0"			   when "010" | "110", -- mult by 2
         (26 downto 0 => '0')	 when others;        -- mult by 0

   with q1_d1(2)  select 
   w0<= betaw1_d1 - absq1D_d1 when '0',
         betaw1_d1 + absq1D_d1 when others;

   wfinal <= w0(24 downto 0);
   qM0 <= wfinal(24); -- rounding bit is the sign of the remainder
   qP14 <=      q14(1 downto 0);
   qM14 <=      q14(2) & "0";
   qP13 <=      q13(1 downto 0);
   qM13 <=      q13(2) & "0";
   qP12 <=      q12(1 downto 0);
   qM12 <=      q12(2) & "0";
   qP11 <=      q11(1 downto 0);
   qM11 <=      q11(2) & "0";
   qP10 <=      q10(1 downto 0);
   qM10 <=      q10(2) & "0";
   qP9 <=      q9(1 downto 0);
   qM9 <=      q9(2) & "0";
   qP8 <=      q8(1 downto 0);
   qM8 <=      q8(2) & "0";
   qP7 <=      q7(1 downto 0);
   qM7 <=      q7(2) & "0";
   qP6 <=      q6(1 downto 0);
   qM6 <=      q6(2) & "0";
   qP5 <=      q5(1 downto 0);
   qM5 <=      q5(2) & "0";
   qP4 <=      q4(1 downto 0);
   qM4 <=      q4(2) & "0";
   qP3 <=      q3(1 downto 0);
   qM3 <=      q3(2) & "0";
   qP2 <=      q2(1 downto 0);
   qM2 <=      q2(2) & "0";
   qP1 <=      q1(1 downto 0);
   qM1 <=      q1(2) & "0";
   qP <= qP14_d13 & qP13_d12 & qP12_d11 & qP11_d10 & qP10_d9 & qP9_d8 & qP8_d7 & qP7_d6 & qP6_d5 & qP5_d4 & qP4_d3 & qP3_d2 & qP2_d1 & qP1;
   qM <= qM14_d14(0) & qM13_d13 & qM12_d12 & qM11_d11 & qM10_d10 & qM9_d9 & qM8_d8 & qM7_d7 & qM6_d6 & qM5_d5 & qM4_d4 & qM3_d3 & qM2_d2 & qM1_d1 & qM0;
   quotient <= qP_d2 - qM_d1;
   -- We need a mR in (0, -wf-2) format: 1+wF fraction bits, 1 round bit, and 1 guard bit for the normalisation,
   -- quotient is the truncation of the exact quotient to at least 2^(-wF-2) bits
   -- now discarding its possible known MSB zeroes, and dropping the possible extra LSB bit (due to radix 4) 
   mR <= quotient(26 downto 1); 
   -- normalisation
   fRnorm <=    mR(24 downto 1)  when mR(25)= '1'
           else mR(23 downto 0);  -- now fRnorm is a (-1, -wF-1) fraction
   round <= fRnorm(0); 
   expR1 <= expR0_d15 + ("000" & (6 downto 1 => '1') & mR(25)); -- add back bias
   -- final rounding
   expfrac <= expR1 & fRnorm(23 downto 1) ;
   expfracR <= expfrac + ((32 downto 1 => '0') & round);
   exnR <=      "00"  when expfracR(32) = '1'   -- underflow
           else "10"  when  expfracR(32 downto 31) =  "01" -- overflow
           else "01";      -- 00, normal case
   with exnR0_d15  select 
      exnRfinal <= 
         exnR   when "01", -- normal
         exnR0_d15  when others;
   R <= exnRfinal & sR_d15 & expfracR(30 downto 0);
end architecture;



--------------------------------------------------------------------------------
--                RightShifterSticky24_by_max_26_Freq500_uid4
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2008-2011), Florent de Dinechin (2008-2019)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X S
-- Output signals: R Sticky

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifterSticky24_by_max_26_Freq500_uid4 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(23 downto 0);
          S : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(25 downto 0);
          Sticky : out  std_logic   );
end entity;

architecture arch of RightShifterSticky24_by_max_26_Freq500_uid4 is
signal ps, ps_d1, ps_d2, ps_d3 :  std_logic_vector(4 downto 0);
signal Xpadded :  std_logic_vector(25 downto 0);
signal level5, level5_d1 :  std_logic_vector(25 downto 0);
signal stk4 :  std_logic;
signal level4, level4_d1 :  std_logic_vector(25 downto 0);
signal stk3, stk3_d1 :  std_logic;
signal level3, level3_d1, level3_d2 :  std_logic_vector(25 downto 0);
signal stk2, stk2_d1 :  std_logic;
signal level2, level2_d1, level2_d2, level2_d3 :  std_logic_vector(25 downto 0);
signal stk1 :  std_logic;
signal level1, level1_d1, level1_d2 :  std_logic_vector(25 downto 0);
signal stk0 :  std_logic;
signal level0 :  std_logic_vector(25 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               ps_d1 <=  ps;
               ps_d2 <=  ps_d1;
               ps_d3 <=  ps_d2;
               level5_d1 <=  level5;
               level4_d1 <=  level4;
               stk3_d1 <=  stk3;
               level3_d1 <=  level3;
               level3_d2 <=  level3_d1;
               stk2_d1 <=  stk2;
               level2_d1 <=  level2;
               level2_d2 <=  level2_d1;
               level2_d3 <=  level2_d2;
               level1_d1 <=  level1;
               level1_d2 <=  level1_d1;
            end if;
         end if;
      end process;
   ps<= S;
   Xpadded <= X&(1 downto 0 => '0');
   level5<= Xpadded;
   stk4 <= '1' when (level5_d1(15 downto 0)/="0000000000000000" and ps_d1(4)='1')   else '0';
   level4 <=  level5 when  ps(4)='0'    else (15 downto 0 => '0') & level5(25 downto 16);
   stk3 <= '1' when (level4_d1(7 downto 0)/="00000000" and ps_d1(3)='1') or stk4 ='1'   else '0';
   level3 <=  level4 when  ps(3)='0'    else (7 downto 0 => '0') & level4(25 downto 8);
   stk2 <= '1' when (level3_d2(3 downto 0)/="0000" and ps_d2(2)='1') or stk3_d1 ='1'   else '0';
   level2 <=  level3 when  ps(2)='0'    else (3 downto 0 => '0') & level3(25 downto 4);
   stk1 <= '1' when (level2_d3(1 downto 0)/="00" and ps_d3(1)='1') or stk2_d1 ='1'   else '0';
   level1 <=  level2_d1 when  ps_d1(1)='0'    else (1 downto 0 => '0') & level2_d1(25 downto 2);
   stk0 <= '1' when (level1_d2(0 downto 0)/="0" and ps_d3(0)='1') or stk1 ='1'   else '0';
   level0 <=  level1 when  ps_d1(0)='0'    else (0 downto 0 => '0') & level1(25 downto 1);
   R <= level0;
   Sticky <= stk0;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_27_Freq500_uid6
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_27_Freq500_uid6 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(26 downto 0);
          Y : in  std_logic_vector(26 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(26 downto 0)   );
end entity;

architecture arch of IntAdder_27_Freq500_uid6 is
signal Rtmp :  std_logic_vector(26 downto 0);
signal X_d1, X_d2, X_d3, X_d4, X_d5 :  std_logic_vector(26 downto 0);
signal Y_d1, Y_d2, Y_d3 :  std_logic_vector(26 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               X_d1 <=  X;
               X_d2 <=  X_d1;
               X_d3 <=  X_d2;
               X_d4 <=  X_d3;
               X_d5 <=  X_d4;
               Y_d1 <=  Y;
               Y_d2 <=  Y_d1;
               Y_d3 <=  Y_d2;
            end if;
         end if;
      end process;
   Rtmp <= X_d5 + Y_d3 + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                     Normalizer_Z_28_28_28_Freq500_uid8
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, (2007-2020)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X
-- Output signals: Count R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Normalizer_Z_28_28_28_Freq500_uid8 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(27 downto 0);
          Count : out  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(27 downto 0)   );
end entity;

architecture arch of Normalizer_Z_28_28_28_Freq500_uid8 is
signal level5, level5_d1 :  std_logic_vector(27 downto 0);
signal count4, count4_d1, count4_d2 :  std_logic;
signal level4 :  std_logic_vector(27 downto 0);
signal count3, count3_d1, count3_d2 :  std_logic;
signal level3, level3_d1 :  std_logic_vector(27 downto 0);
signal count2, count2_d1 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(27 downto 0);
signal count1, count1_d1 :  std_logic;
signal level1 :  std_logic_vector(27 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(27 downto 0);
signal sCount :  std_logic_vector(4 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               level5_d1 <=  level5;
               count4_d1 <=  count4;
               count4_d2 <=  count4_d1;
               count3_d1 <=  count3;
               count3_d2 <=  count3_d1;
               level3_d1 <=  level3;
               count2_d1 <=  count2;
               level2_d1 <=  level2;
               count1_d1 <=  count1;
            end if;
         end if;
      end process;
   level5 <= X ;
   count4<= '1' when level5_d1(27 downto 12) = (27 downto 12=>'0') else '0';
   level4<= level5_d1(27 downto 0) when count4='0' else level5_d1(11 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(27 downto 20) = (27 downto 20=>'0') else '0';
   level3<= level4(27 downto 0) when count3='0' else level4(19 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3_d1(27 downto 24) = (27 downto 24=>'0') else '0';
   level2<= level3_d1(27 downto 0) when count2='0' else level3_d1(23 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(27 downto 26) = (27 downto 26=>'0') else '0';
   level1<= level2_d1(27 downto 0) when count1_d1='0' else level2_d1(25 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(27 downto 27) = (27 downto 27=>'0') else '0';
   level0<= level1(27 downto 0) when count0='0' else level1(26 downto 0) & (0 downto 0 => '0');

   R <= level0;
   sCount <= count4_d2 & count3_d2 & count2_d1 & count1_d1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_34_Freq500_uid11
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_34_Freq500_uid11 is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(33 downto 0);
          Y : in  std_logic_vector(33 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(33 downto 0)   );
end entity;

architecture arch of IntAdder_34_Freq500_uid11 is
signal Rtmp :  std_logic_vector(33 downto 0);
signal Y_d1, Y_d2, Y_d3, Y_d4, Y_d5, Y_d6, Y_d7, Y_d8, Y_d9 :  std_logic_vector(33 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               Y_d1 <=  Y;
               Y_d2 <=  Y_d1;
               Y_d3 <=  Y_d2;
               Y_d4 <=  Y_d3;
               Y_d5 <=  Y_d4;
               Y_d6 <=  Y_d5;
               Y_d7 <=  Y_d6;
               Y_d8 <=  Y_d7;
               Y_d9 <=  Y_d8;
            end if;
         end if;
      end process;
   Rtmp <= X + Y_d9 + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                          FloatingPointSubtractor
--                         (FPAdd_8_23_Freq500_uid2)
-- VHDL generated for Kintex7 @ 500MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2010-2017)
--------------------------------------------------------------------------------
-- Pipeline depth: 10 cycles
-- Clock period (ns): 2
-- Target frequency (MHz): 500
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FloatingPointSubtractor is
    port (clk, ce : in std_logic;
          X : in  std_logic_vector(8+23+2 downto 0);
          Y : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FloatingPointSubtractor is
   component RightShifterSticky24_by_max_26_Freq500_uid4 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(23 downto 0);
             S : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(25 downto 0);
             Sticky : out  std_logic   );
   end component;

   component IntAdder_27_Freq500_uid6 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(26 downto 0);
             Y : in  std_logic_vector(26 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(26 downto 0)   );
   end component;

   component Normalizer_Z_28_28_28_Freq500_uid8 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(27 downto 0);
             Count : out  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(27 downto 0)   );
   end component;

   component IntAdder_34_Freq500_uid11 is
      port ( clk, ce : in std_logic;
             X : in  std_logic_vector(33 downto 0);
             Y : in  std_logic_vector(33 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(33 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(32 downto 0);
signal excExpFracY :  std_logic_vector(32 downto 0);
signal swap :  std_logic;
signal eXmeY :  std_logic_vector(7 downto 0);
signal eYmeX :  std_logic_vector(7 downto 0);
signal expDiff, expDiff_d1 :  std_logic_vector(7 downto 0);
signal newX :  std_logic_vector(33 downto 0);
signal newY, newY_d1 :  std_logic_vector(33 downto 0);
signal expX, expX_d1 :  std_logic_vector(7 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY, excY_d1 :  std_logic_vector(1 downto 0);
signal signX, signX_d1 :  std_logic;
signal signY, signY_d1 :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3, EffSub_d4, EffSub_d5, EffSub_d6, EffSub_d7, EffSub_d8, EffSub_d9 :  std_logic;
signal sXsYExnXY, sXsYExnXY_d1 :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(23 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3, excRt_d4, excRt_d5, excRt_d6, excRt_d7, excRt_d8, excRt_d9 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3, signR_d4, signR_d5, signR_d6, signR_d7 :  std_logic;
signal shiftedOut :  std_logic;
signal shiftVal :  std_logic_vector(4 downto 0);
signal shiftedFracY :  std_logic_vector(25 downto 0);
signal sticky, sticky_d1 :  std_logic;
signal fracYpad :  std_logic_vector(26 downto 0);
signal EffSubVector, EffSubVector_d1 :  std_logic_vector(26 downto 0);
signal fracYpadXorOp :  std_logic_vector(26 downto 0);
signal fracXpad :  std_logic_vector(26 downto 0);
signal cInSigAdd :  std_logic;
signal fracAddResult :  std_logic_vector(26 downto 0);
signal fracSticky :  std_logic_vector(27 downto 0);
signal nZerosNew, nZerosNew_d1 :  std_logic_vector(4 downto 0);
signal shiftedFrac, shiftedFrac_d1 :  std_logic_vector(27 downto 0);
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2, extendedExpInc_d3, extendedExpInc_d4, extendedExpInc_d5, extendedExpInc_d6, extendedExpInc_d7, extendedExpInc_d8 :  std_logic_vector(8 downto 0);
signal updatedExp :  std_logic_vector(9 downto 0);
signal eqdiffsign, eqdiffsign_d1, eqdiffsign_d2 :  std_logic;
signal expFrac :  std_logic_vector(33 downto 0);
signal stk, stk_d1 :  std_logic;
signal rnd, rnd_d1 :  std_logic;
signal lsb, lsb_d1 :  std_logic;
signal needToRound :  std_logic;
signal RoundedExpFrac :  std_logic_vector(33 downto 0);
signal upExc :  std_logic_vector(1 downto 0);
signal fracR, fracR_d1 :  std_logic_vector(22 downto 0);
signal expR, expR_d1 :  std_logic_vector(7 downto 0);
signal exExpExc, exExpExc_d1 :  std_logic_vector(3 downto 0);
signal excRt2 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2, signR2_d1, signR2_d2 :  std_logic;
signal computedR :  std_logic_vector(33 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            if ce = '1' then
               expDiff_d1 <=  expDiff;
               newY_d1 <=  newY;
               expX_d1 <=  expX;
               excY_d1 <=  excY;
               signX_d1 <=  signX;
               signY_d1 <=  signY;
               EffSub_d1 <=  EffSub;
               EffSub_d2 <=  EffSub_d1;
               EffSub_d3 <=  EffSub_d2;
               EffSub_d4 <=  EffSub_d3;
               EffSub_d5 <=  EffSub_d4;
               EffSub_d6 <=  EffSub_d5;
               EffSub_d7 <=  EffSub_d6;
               EffSub_d8 <=  EffSub_d7;
               EffSub_d9 <=  EffSub_d8;
               sXsYExnXY_d1 <=  sXsYExnXY;
               excRt_d1 <=  excRt;
               excRt_d2 <=  excRt_d1;
               excRt_d3 <=  excRt_d2;
               excRt_d4 <=  excRt_d3;
               excRt_d5 <=  excRt_d4;
               excRt_d6 <=  excRt_d5;
               excRt_d7 <=  excRt_d6;
               excRt_d8 <=  excRt_d7;
               excRt_d9 <=  excRt_d8;
               signR_d1 <=  signR;
               signR_d2 <=  signR_d1;
               signR_d3 <=  signR_d2;
               signR_d4 <=  signR_d3;
               signR_d5 <=  signR_d4;
               signR_d6 <=  signR_d5;
               signR_d7 <=  signR_d6;
               sticky_d1 <=  sticky;
               EffSubVector_d1 <=  EffSubVector;
               nZerosNew_d1 <=  nZerosNew;
               shiftedFrac_d1 <=  shiftedFrac;
               extendedExpInc_d1 <=  extendedExpInc;
               extendedExpInc_d2 <=  extendedExpInc_d1;
               extendedExpInc_d3 <=  extendedExpInc_d2;
               extendedExpInc_d4 <=  extendedExpInc_d3;
               extendedExpInc_d5 <=  extendedExpInc_d4;
               extendedExpInc_d6 <=  extendedExpInc_d5;
               extendedExpInc_d7 <=  extendedExpInc_d6;
               extendedExpInc_d8 <=  extendedExpInc_d7;
               eqdiffsign_d1 <=  eqdiffsign;
               eqdiffsign_d2 <=  eqdiffsign_d1;
               stk_d1 <=  stk;
               rnd_d1 <=  rnd;
               lsb_d1 <=  lsb;
               fracR_d1 <=  fracR;
               expR_d1 <=  expR;
               exExpExc_d1 <=  exExpExc;
               signR2_d1 <=  signR2;
               signR2_d2 <=  signR2_d1;
            end if;
         end if;
      end process;
   excExpFracX <= X(33 downto 32) & X(30 downto 0);
   excExpFracY <= Y(33 downto 32) & Y(30 downto 0);
   swap <= '1' when excExpFracX < excExpFracY else '0';
   -- exponent difference
   eXmeY <= (X(30 downto 23)) - (Y(30 downto 23));
   eYmeX <= (Y(30 downto 23)) - (X(30 downto 23));
   expDiff <= eXmeY when swap = '0' else eYmeX;
   -- input swap so that |X|>|Y|
   newX <= X when swap = '0' else Y;
   newY <= Y when swap = '0' else X;
   -- now we decompose the inputs into their sign, exponent, fraction
   expX<= newX(30 downto 23);
   excX<= newX(33 downto 32);
   excY<= newY(33 downto 32);
   signX<= newX(31);
   signY<= newY(31);
   EffSub <= signX_d1 xor signY_d1;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   fracY <= "000000000000000000000000" when excY_d1="00" else ('1' & newY_d1(22 downto 0));
   -- Exception management logic
   with sXsYExnXY_d1  select  
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   signR<= '0' when (sXsYExnXY_d1="100000" or sXsYExnXY_d1="010000") else signX_d1;
   shiftedOut <= '1' when (expDiff_d1 > 25) else '0';
   shiftVal <= expDiff_d1(4 downto 0) when shiftedOut='0' else CONV_STD_LOGIC_VECTOR(26,5);
   RightShifterComponent: RightShifterSticky24_by_max_26_Freq500_uid4
      port map ( clk  => clk,
                 ce => ce,
                 S => shiftVal,
                 X => fracY,
                 R => shiftedFracY,
                 Sticky => sticky);
   fracYpad <= "0" & shiftedFracY;
   EffSubVector <= (26 downto 0 => EffSub);
   fracYpadXorOp <= fracYpad xor EffSubVector_d1;
   fracXpad <= "01" & (newX(22 downto 0)) & "00";
   cInSigAdd <= EffSub_d4 and not sticky_d1; -- if we subtract and the sticky was one, some of the negated sticky bits would have absorbed this carry 
   fracAdder: IntAdder_27_Freq500_uid6
      port map ( clk  => clk,
                 ce => ce,
                 Cin => cInSigAdd,
                 X => fracXpad,
                 Y => fracYpadXorOp,
                 R => fracAddResult);
   fracSticky<= fracAddResult & sticky_d1; 
   LZCAndShifter: Normalizer_Z_28_28_28_Freq500_uid8
      port map ( clk  => clk,
                 ce => ce,
                 X => fracSticky,
                 Count => nZerosNew,
                 R => shiftedFrac);
   extendedExpInc<= ("0" & expX_d1) + '1';
   updatedExp <= ("0" &extendedExpInc_d8) - ("00000" & nZerosNew_d1);
   eqdiffsign <= '1' when nZerosNew="11111" else '0';
   expFrac<= updatedExp & shiftedFrac_d1(26 downto 3);
   stk<= shiftedFrac(2) or shiftedFrac(1) or shiftedFrac(0);
   rnd<= shiftedFrac(3);
   lsb<= shiftedFrac(4);
   needToRound<= '1' when (rnd_d1='1' and stk_d1='1') or (rnd_d1='1' and stk_d1='0' and lsb_d1='1')
  else '0';
   roundingAdder: IntAdder_34_Freq500_uid11
      port map ( clk  => clk,
                 ce => ce,
                 Cin => needToRound,
                 X => expFrac,
                 Y => "0000000000000000000000000000000000",
                 R => RoundedExpFrac);
   -- possible update to exception bits
   upExc <= RoundedExpFrac(33 downto 32);
   fracR <= RoundedExpFrac(23 downto 1);
   expR <= RoundedExpFrac(31 downto 24);
   exExpExc <= upExc & excRt_d8;
   with exExpExc_d1  select  
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   excR <= "00" when (eqdiffsign_d2='1' and EffSub_d9='1'  and not(excRt_d9="11")) else excRt2;
   signR2 <= '0' when (eqdiffsign='1' and EffSub_d7='1') else signR_d7;
   computedR <= excR & signR2_d2 & expR_d1 & fracR_d1;
   R <= computedR;
end architecture;



