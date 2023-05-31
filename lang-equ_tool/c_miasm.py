from miasm.core.locationdb import LocationDB
from miasm.analysis.machine import Machine
from miasm.ir.symbexec import SymbolicExecutionEngine
from miasm.analysis.binary import Container, ContainerPE

# PYD 파일의 기능을 사용하여 작업 수행
print("----------- miasm test_c -----------")

fdesc = open('test_c', 'rb')
loc_db = LocationDB()

# The Container will provide a *bin_stream*, bytes source for the disasm engine
# It will prodvie a view from a PE or an ELF.
cont = Container.from_stream(fdesc, loc_db)

# The Machine, instantiated with the detected architecture, will provide tools
# (disassembler, etc.) to work with this architecture

# miasm/core/cpu.py -> pyparsing.operatorPrecedence
# pyparsing version update issue change below
# pyparsing.operatorPrecedence -> pypasring.infixNotation
machine = Machine(cont.arch)
print("----------- machine name -----------")
print(cont.arch)

# Instantiate a disassembler engine, using the previous bin_stream and its
# associated location DB. The assembly listing will use the binary symbols
mdis = machine.dis_engine(cont.bin_stream, loc_db=cont.loc_db)

# Run a recursive traversal disassembling from the entry point
# (do not follow sub functions by default)
addr = cont.entry_point
# dis_multiblock (address)
# address = asm control-flow-graph start address
asmcfg = mdis.dis_multiblock(0x1190)

# Display each basic block
# also add asm block to ircfg
print("----------- ASM block_start -----------")
for block in asmcfg.blocks:
    print(block)
print("ASM block end")

print("----------- Symbolic Engine Prepare -----------")
lifter = machine.lifter_model_call(mdis.loc_db)
ircfg = lifter.new_ircfg_from_asmcfg(asmcfg)

sbee = SymbolicExecutionEngine(lifter, machine.mn.regs.regs_init)


print("----------- Symbolic Execution -----------")
# run_at( ircfg, addr )
# ircfg = IR control flow graph
# addr = address to execute (int or ExprInt or label)
symbolic_pc = sbee.run_at(ircfg, 0x1190)
print(symbolic_pc)

print ("----------- Symbolic Engine with Log -----------")
sbee.run_at(ircfg, 0x1190, step=True)