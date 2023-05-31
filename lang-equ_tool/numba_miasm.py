from miasm.analysis.simplifier import IRCFGSimplifier
from miasm.arch.x86.arch import mn_x86
from miasm.core.locationdb import LocationDB
from miasm.analysis.machine import Machine
from miasm.analysis.binary import Container
from miasm.ir.symbexec import SymbolicExecutionEngine

loc_db = LocationDB()

# asm -> binary code
def binstring(l):
    binstr = b''
    for asminst in l:
        internal_asminst = mn_x86.fromstring(asminst, loc_db, 32)
        binstr += mn_x86.asm(internal_asminst)[0]
    return binstr


"""
--- from numba execution ---
leaq (%rdx, %rcx), %rax
addq $1010, %rax
movq %rax, (%rdi)
xorl %eax, %eax
retq

"""


shellcode = ['LEA EAX, DWORD PTR [EDX+ECX]',
            'ADD EAX, 1010',
            'MOV DWORD PTR [EDI+0], EAX',
            'XOR EAX, EAX',
            'RET']

machine = Machine('x86_32')

print("(1) binary string from list of asm string")
s = binstring(shellcode)
print('binstr s =', s)
print()

print("(2) disassembled code from s: with next block numbers in cfg")
# get disassembled shell code
c = Container.from_string(s, loc_db)

# Instantiate a disassembler engine, using the previous bin_stream and its
# associated location DB. The assembly listing will use the binary symbols
mdis = machine.dis_engine(c.bin_stream, loc_db=loc_db)
asmcfg = mdis.dis_multiblock(0)


# Display each basic block
# also add asm block to ircfg
print("----------- ASM block_start -----------")
for block in asmcfg.blocks:
    print(block)
print("ASM block end")
print()


print("(3) Working with IR, for instance by getting side effects")
lifter = machine.lifter_model_call(loc_db)
ircfg = lifter.new_ircfg_from_asmcfg(asmcfg)
print()


# Initializing the engine with default symbolic values:
# 0 for loc_0, 16 is for loc_10, 19 is for loc_13, 11 is for loc_b
# execution until conditional-jump, otherwise until ret
print("(4) print symbolic execution steps")
print("----------- Symbolic Engine with Log -----------")
sb = SymbolicExecutionEngine(lifter, machine.mn.regs.regs_init)
IRCFGSimplifier(lifter).simplify(ircfg, 0)
symbolic_pc = sb.run_at(ircfg, 0, step=True)
