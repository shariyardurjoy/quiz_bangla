import os
from PIL import Image, ImageDraw, ImageFont

def generate_icons():
    os.makedirs('assets/icon', exist_ok=True)
    size = 1024
    bg_color = '#5B4AE8'
    
    # Master Icon
    img = Image.new('RGB', (size, size), bg_color)
    draw = ImageDraw.Draw(img)
    
    # Draw a stylized Q and a spark/question motif
    # We will draw a large bold white Q and a small diamond/spark at the bottom right.
    # We will use simple vector shapes.
    
    # Q main circle
    cx, cy = size // 2, size // 2
    r = 280
    thickness = 80
    
    # Outer circle
    draw.ellipse((cx - r, cy - r, cx + r, cy + r), outline='white', width=thickness)
    
    # Q tail
    draw.line((cx + r - 80, cy + r - 80, cx + r + 100, cy + r + 100), fill='white', width=thickness)
    
    # Question/spark motif inside Q
    # We will put a stylized question mark inside
    draw.arc((cx - 80, cy - 120, cx + 80, cy + 40), start=135, end=45, fill='white', width=50)
    draw.line((cx, cy, cx, cy + 80), fill='white', width=50)
    draw.ellipse((cx - 25, cy + 120, cx + 25, cy + 170), fill='white')
    
    img.save('assets/icon/quizbangla_icon.png')
    
    # Foreground Adaptive Icon (transparent background)
    img_fg = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw_fg = ImageDraw.Draw(img_fg)
    
    draw_fg.ellipse((cx - r, cy - r, cx + r, cy + r), outline='white', width=thickness)
    draw_fg.line((cx + r - 80, cy + r - 80, cx + r + 100, cy + r + 100), fill='white', width=thickness)
    
    draw_fg.arc((cx - 80, cy - 120, cx + 80, cy + 40), start=135, end=45, fill='white', width=50)
    draw_fg.line((cx, cy, cx, cy + 80), fill='white', width=50)
    draw_fg.ellipse((cx - 25, cy + 120, cx + 25, cy + 170), fill='white')
    
    img_fg.save('assets/icon/quizbangla_icon_foreground.png')
    print("Icons generated successfully.")

if __name__ == '__main__':
    generate_icons()
