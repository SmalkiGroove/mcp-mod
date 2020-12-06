import os

#########################################################################################################
# README !
#
# First put this file in your mod folder (like this : '.../mods/YourMod/unit_rename.py')
# Then check the "Variables definitions" section below and check the variables are correct.
# Set the current and desired name of the unit you want to rename in "Unit to rename" below.
# Finally run the script : python .\unit_rename.py (example)
#########################################################################################################

# Unit to rename
# --------------
unit_current_name = "mcps3bpd" # <-- Write the current name (IN LOWERCASE) of the unit you want to rename here
unit_replace_name = "msb2306" # <-- Write the new name (IN LOWERCASE) you want for this unit here

# Variables definitions
# ---------------------
file_extensions_to_parse = ['.lua', '.bp'] # <-- You can add file extensions there if needed
units_icons_relative_path = "textures/ui/common/icons/units" # <-- Change it if your icons are in a different location
unit_definition_path = "units" # <-- If you have subfolders in the 'units' folder, set the path of the unit you want to rename (for example 'units/uef')

modpath = os.path.dirname(os.path.abspath(__file__))

# Renaming functions
# ------------------

# DOC : replace all occurences of 'fromstr' by 'tostr' in file located at 'filepath'. Overwrites file.
def replace_in_file(filepath, fromstr, tostr):
    file_ext = os.path.splitext(filepath)[1]
    if file_ext not in file_extensions_to_parse:
        # print("/!\ Cannot read file with extension " + file_ext)
        return
    file_r = open(filepath, 'r')
    content = file_r.read()
    file_r.close()
    if fromstr in content.lower():
        print("Found '{}' occurrences in file {}. Replacing by '{}'.".format(fromstr, filepath, tostr))
        content = content.replace(fromstr, tostr)
        content = content.replace(fromstr.upper(), tostr.upper())
        # print(content)
        file_w = open(filepath, 'w')
        file_w.write(content)
        file_w.close()

# DOC : rename the icon file of the unit named 'currentname' to its new name 'targetname'.
def rename_icon(currentname, targetname):
    iconspath = os.path.join(modpath, units_icons_relative_path)
    icons = os.listdir(iconspath)
    for icon in icons:
        if icon.lower().startswith(currentname):
            target = targetname + "_icon.dds"
            print("Rename icon {} to {}".format(icon, target))
            os.rename(os.path.join(iconspath, icon), os.path.join(iconspath, target))

# DOC : replace all occurences of 'currentname' by 'targetname' in all files in the mod /lua folder.
def rename_lua(currentname, targetname):
    luapath = os.path.join(modpath, "lua")
    for root, dirs, files in os.walk(luapath):
        if root == luapath:
            continue
        for f in files:
            filepath = os.path.join(root, f)
            replace_in_file(filepath, currentname, targetname)

# DOC : replace all occurences of 'currentname' by 'targetname' in all files in the mod /hook/lua folder.
def rename_hook(currentname, targetname):
    hookpath = os.path.join(modpath, "hook/lua")
    for root, dirs, files in os.walk(hookpath):
        for f in files:
            filepath = os.path.join(root, f)
            replace_in_file(filepath, currentname, targetname)

# DOC : rename all files of the unit named 'currentname' to its new name 'targetname' and replace all occurences of this name in all files in the mod /units folder.
def rename_unit(currentname, targetname):
    unitpath = os.path.join(modpath, "{}/{}".format(unit_definition_path, currentname))
    files = os.listdir(unitpath)
    for f in files:
        filepath = os.path.join(unitpath, f)
        targetpath = os.path.join(unitpath, f.replace(currentname.upper(), targetname))
        replace_in_file(filepath, currentname, targetname)
        print("Rename file {} to {}".format(filepath, targetpath))
        os.rename(filepath, targetpath)
    print("Rename directory {}/{} to {}/{}".format(unit_definition_path, currentname, unit_definition_path, targetname))
    os.rename(unitpath, os.path.join(modpath, "{}/{}".format(unit_definition_path, targetname)))

# DOC : replace all occurences of 'currentname' by 'targetname' in all other blueprints than its own.
def rename_refs(currentname, targetname):
    unitspath = os.path.join(modpath, unit_definition_path)
    units = os.listdir(unitspath)
    for u in units:
        if u.lower() == targetname:
            continue
        filepath = os.path.join(unitspath, "{}/{}_unit.bp".format(u,u))
        replace_in_file(filepath, currentname, targetname)

# Main script
# -----------
print("#######################################")
print("Unit rename from {} to {}.".format(unit_current_name, unit_replace_name))
print("#######################################")

# You can comment lines below to avoid renaming in certain locations.
print("> Search in icons...")
rename_icon(unit_current_name, unit_replace_name)
print("> Search in lua...")
rename_lua(unit_current_name, unit_replace_name)
print("> Search in hook...")
rename_hook(unit_current_name, unit_replace_name)
print("> Search in units...")
rename_unit(unit_current_name, unit_replace_name)
print("> Search in blueprints...")
rename_refs(unit_current_name, unit_replace_name)

print("All done !")