--
-- file: Tupfile.lua
--
-- author: Copyright (C) 2014-2016 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
--
-- This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
-- distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
--

if CONFIG_CHIP_STM32F0 == "y" then

	local ldScriptGenerator = DISTORTOS_TOP .. "source/architecture/ARM/ARMv6-M-ARMv7-M/ARMv6-M-ARMv7-M.ld.sh"
	local ldscriptOutputs = {LDSCRIPT, filenameToGroup(LDSCRIPT)}

	tup.rule("^ SH " .. ldScriptGenerator .. "^ ./" .. ldScriptGenerator .. " \"" .. CONFIG_CHIP .. "\" \"" ..
			CONFIG_CHIP_STM32F0_FLASH_ADDRESS .. "," .. CONFIG_CHIP_STM32F0_FLASH_SIZE .. "\" \"" ..
			CONFIG_CHIP_STM32F0_SRAM_ADDRESS .. "," .. CONFIG_CHIP_STM32F0_SRAM_SIZE .. "\" \"" ..
			CONFIG_ARCHITECTURE_ARMV6_M_ARMV7_M_MAIN_STACK_SIZE .. "\" \"" .. CONFIG_MAIN_THREAD_STACK_SIZE ..
			"\" > \"%o\"", ldscriptOutputs)

	CXXFLAGS += STANDARD_INCLUDES

	tup.include(DISTORTOS_TOP .. "compile.lua")

end	-- if CONFIG_CHIP_STM32F0 == "y" then