#!/usr/bin/env python3
# Script untuk validasi semua XML layout files

import os
import xml.etree.ElementTree as ET
from pathlib import Path

project_path = r"D:\TRPL UGM\SEM 3\PPPB\pppbandroid"
layout_dir = os.path.join(project_path, "app\src\main\res\layout")

print("=" * 60)
print("XML Layout Validation Report")
print("=" * 60)
print()

layout_files = [
    "activity_main.xml",
    "activity_login.xml",
    "activity_register.xml",
    "activity_profile.xml",
    "item_contact.xml",
    "dialog_add_edit_contact.xml"
]

issues = []

for layout_file in layout_files:
    filepath = os.path.join(layout_dir, layout_file)
    print(f"Checking: {layout_file}...", end=" ")

    try:
        tree = ET.parse(filepath)
        root = tree.getroot()
        print("✓ OK")
    except ET.ParseError as e:
        print(f"✗ ERROR")
        issues.append(f"{layout_file}: XML Parse Error - {str(e)}")
    except FileNotFoundError:
        print(f"✗ NOT FOUND")
        issues.append(f"{layout_file}: File not found")
    except Exception as e:
        print(f"✗ ERROR")
        issues.append(f"{layout_file}: {str(e)}")

print()
print("=" * 60)
if issues:
    print("ISSUES FOUND:")
    for issue in issues:
        print(f"  • {issue}")
else:
    print("All layout files are valid!")
print("=" * 60)

