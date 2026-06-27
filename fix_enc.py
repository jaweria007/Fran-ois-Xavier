import os

path = r"C:\Users\Logic saint\OneDrive\Documents\New folder\fonction-publique.html"
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

replacements = {
    '\u00c3\u00a9': '\u00e9',  # Ã© -> é
    '\u00c3\u00a8': '\u00e8',  # Ã¨ -> è
    '\u00c3\u00aa': '\u00ea',  # Ãª -> ê
    '\u00c3\u00ab': '\u00eb',  # Ã« -> ë
    '\u00c3\u00b9': '\u00f9',  # Ã¹ -> ù
    '\u00c3\u00bb': '\u00fb',  # Ã» -> û
    '\u00c3\u00bc': '\u00fc',  # Ã¼ -> ü
    '\u00c3\u00a0': '\u00e0',  # Ã  -> à
    '\u00c3\u00a2': '\u00e2',  # Ã¢ -> â
    '\u00c3\u0089': '\u00c9',  # Ã‰ -> É
    '\u00c3\u0088': '\u00c8',  # Ãˆ -> È
    '\u00c3\u008a': '\u00ca',  # ÃŠ -> Ê
    '\u00c3\u0087': '\u00c7',  # Ã‡ -> Ç
    '\u00c3\u00a7': '\u00e7',  # Ã§ -> ç
    '\u00c3\u0080': '\u00c0',  # Ã€ -> À
    '\u00e2\u20ac\u2122': "'",  # â€™ -> '
    '\u00e2\u20ac\u0153': "'",  # â€˜ -> '
    '\u00e2\u20ac\u0153': '"',  # â€œ -> "
    '\u00e2\u20ac\u009d': '"',  # â€
    '\u00e2\u20ac\u0093': '-',  # â€“ -> -
    '\u00e2\u20ac\u201d': '-',  # â€” -> -
    '\u00e2\u20ac\u00a2': '-',  # â€¢ -> -
    '\u00e2\u20ac\u00a6': '...',  # â€¦ -> ...
    'A,A': 'a F',
    'A,A?': 'a F',
}

for old, new in replacements.items():
    content = content.replace(old, new)

# Fix remaining Ã+space patterns
import re
content = re.sub(r'\u00c3 ', '\u00e0', content)  # Ã  -> à
content = re.sub(r'\u00c3©', '\u00e9', content)
content = re.sub(r'\u00c3¨', '\u00e8', content)
content = re.sub(r'\u00c3ª', '\u00ea', content)
content = re.sub(r'\u00c3«', '\u00eb', content)
content = re.sub(r'\u00c3¹', '\u00f9', content)
content = re.sub(r'\u00c3»', '\u00fb', content)
content = re.sub(r'\u00c3¼', '\u00fc', content)
content = re.sub(r'\u00c3¢', '\u00e2', content)

with open(path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Done")
