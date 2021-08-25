import os


path = "C:\\Users\\MarcinKo\\Desktop\\Nowy folder (3)\\color_txt_picker\\lib\\fonts"

to_skip = ["sorter.py", "fonts.txt", "BlackItalic", "Bold", "BoldItalic", "ExtraBold", "ExtraBoldItalic",
           "Italic", "Medium", "SemiBold", "Light", "Thin", "ThinItalic", "Black"]

for font in os.listdir(path):
    if "Regular" in font and font not in to_skip:
        print(f"""'{font.replace("-Regular.ttf", "")}',""")
