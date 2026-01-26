A: int = ord("A")


def rows(which: str) -> list[str]:
    """Port of ../../lua/diamond/diamond.lua"""
    letter = ord(which) - A + 1  # letter is 1 for A, 2 for B, 3 for C
    lines = [" " * (letter - 1) + "A" + " " * (letter - 1)]
    for position in range(2, letter + 1):  # add one as stop for range is exclusive (1)
        char = chr(A + position - 1)
        lines.append(  # append to list, rather than use sparse table (2)
            "".join(
                (
                    " " * (letter - position),
                    char,
                    " " * (2 * position - 3),
                    char,
                    " " * (letter - position),
                )
            )
        )
    for i in range(len(lines) + 1, 2 * letter):
        lines.append(
            lines[2 * letter - i - 1]  # subtract 1 as Python lists are zero based (3)
        )
    return lines
