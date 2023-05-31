import math
import sys

import numba


@numba.jit(nopython=True, nogil=True)
def doubleTest(a, b):
    a = a * 2
    b = b * 2
    c = a + b
    return c


def main(*argv):
    doubleTest(1,2)  # Call the function(s), otherwise `inspect_asm()` would return empty dict
    speed_funcs = [
        (doubleTest, numba.int32()),
    ]
    for func, _ in speed_funcs:
        file_name_asm = "numba_{:s}_{:s}_{:03d}_{:02d}{:02d}{:02d}.asm".format(func.__name__, sys.platform, int(round(math.log2(sys.maxsize))) + 1, *sys.version_info[:3])
        asm = func.inspect_asm()
        print("Writing to {:s}:".format(file_name_asm))
        with open(file_name_asm, "wb") as fout:
            for k, v in asm.items():
                print("    {:}".format(k))
                fout.write(v.encode())


if __name__ == "__main__":
    print("Python {:s} {:03d}bit on {:s}\n".format(" ".join(elem.strip() for elem in sys.version.split("\n")),
                                                   64 if sys.maxsize > 0x100000000 else 32, sys.platform))
    rc = main(*sys.argv[1:])
    print("\nDone.\n")
    sys.exit(rc)