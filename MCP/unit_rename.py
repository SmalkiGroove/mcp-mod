import os

# Unit to rename
# --------------
unit_current_name = "mcpc1bas"      # <-- Write the current name of the unit you want to rename here
unit_replace_name = "mrb5102"      # <-- Write the new name you want for this unit here

# Renaming functions
# ------------------
modpath = os.path.dirname(os.path.abspath(__file__))

# DOC : replace all occurences of 'fromstr' by 'tostr' in file located at 'filepath'. Overwrites file.
def replace_in_file(filepath, fromstr, tostr):
    file_ext = os.path.splitext(filepath)[1]
    if file_ext not in ['.lua', '.bp']:
        # print("/!\ Cannot read file with extension " + file_ext)
        return
    file_r = open(filepath, 'r')
    content = file_r.read()
    file_r.close()
    if fromstr in content.lower():
        print("Found '{}' in file {}. Replacing by '{}'.".format(fromstr, filepath, tostr))
        content = content.replace(fromstr, tostr)
        content = content.replace(fromstr.upper(), tostr.upper())
        # print(content)
        file_w = open(filepath, 'w')
        file_w.write(content)
        file_w.close()

# DOC : rename the icon file of the unit named 'currentname' to its new name 'targetname'.
def rename_icon(currentname, targetname):
    iconspath = os.path.join(modpath, "textures/ui/common/icons/units")
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
        if root == hookpath:
            continue
        for f in files:
            filepath = os.path.join(root, f)
            replace_in_file(filepath, currentname, targetname)

# DOC : rename all files of the unit named 'currentname' to its new name 'targetname' and replace all occurences of this name in all files in the mod /units folder.
def rename_unit(currentname, targetname):
    unitpath = os.path.join(modpath, "units/{}".format(currentname))
    files = os.listdir(unitpath)
    for f in files:
        filepath = os.path.join(unitpath, f)
        targetpath = os.path.join(unitpath, f.replace(currentname.upper(), targetname))
        replace_in_file(filepath, currentname, targetname)
        print("Rename file {} to {}".format(filepath, targetpath))
        os.rename(filepath, targetpath)
    print("Rename directory units/{} to units/{}".format(currentname, targetname))
    os.rename(unitpath, os.path.join(modpath, "units/{}".format(targetname)))


# Main script
# -----------
print("#######################################")
print("Unit rename from {} to {}.".format(unit_current_name, unit_replace_name))
print("#######################################")

print("> Search in icons...")
rename_icon(unit_current_name, unit_replace_name)
print("> Search in lua...")
rename_lua(unit_current_name, unit_replace_name)
print("> Search in hook...")
rename_hook(unit_current_name, unit_replace_name)
print("> Search in units...")
rename_unit(unit_current_name, unit_replace_name)

print("All done !")