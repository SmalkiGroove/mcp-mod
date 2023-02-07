import os

# Toggle variable
# ---------------

# If set to 'False', it will use default strategic icons available in FAF, if set to 'True', it will use custom strategic icons from this mod.
expand_strategic_icons = True 

# Data table
# ----------
data = [
    # T2 EMP Tank
    ['msl0204', 'icon_land2_bomb', 'mcp/icon_land2_stunner'],
    # T3 Armored Tank
    ['mal0306', 'icon_land3_directfire', 'mcp/icon_land3_armored'],
    # T1 Heavy PD
    ['meb2102', 'icon_structure1_land', 'mcp/icon_structure1_bomb'],
    ['mrb2102', 'icon_structure1_land', 'mcp/icon_structure1_bomb'],
    ['mab2102', 'icon_structure1_land', 'mcp/icon_structure1_bomb'],
    ['msb2102', 'icon_structure1_land', 'mcp/icon_structure1_bomb'],
    # T2 Heavy PD
    ['meb2202', 'icon_structure2_land', 'mcp/icon_structure2_bomb'],
    ['mrb2202', 'icon_structure2_land', 'mcp/icon_structure2_bomb'],
    ['mab2202', 'icon_structure2_land', 'mcp/icon_structure2_bomb'],
    ['msb2202', 'icon_structure2_land', 'mcp/icon_structure2_bomb'],
    # T3 Heavy PD
    ['meb2307', 'icon_structure3_land', 'mcp/icon_structure3_bomb'],
    ['mrb2307', 'icon_structure3_land', 'mcp/icon_structure3_bomb'],
    ['mab2307', 'icon_structure3_land', 'mcp/icon_structure3_bomb'],
    # T2 Anti Navy PD
    ['meb4205', 'icon_structure2_antinavy', 'mcp/icon_structure2_antiship'],
    ['mrb4205', 'icon_structure2_antinavy', 'mcp/icon_structure2_antiship'],
    ['mab4205', 'icon_structure2_antinavy', 'mcp/icon_structure2_antiship'],
    ['msb4205', 'icon_structure2_antinavy', 'mcp/icon_structure2_antiship'],
    # T3 Anti Navy PD
    ['meb4305', 'icon_structure3_antinavy', 'mcp/icon_structure3_antiship'],
    ['mrb4305', 'icon_structure3_antinavy', 'mcp/icon_structure3_antiship'],
    ['mab4305', 'icon_structure3_antinavy', 'mcp/icon_structure3_antiship'],
    ['msb4305', 'icon_structure3_antinavy', 'mcp/icon_structure3_antiship'],
    # T1 Artillery Ship
    ['mes0106', 'icon_ship1_missile', 'mcp/icon_ship1_artillery'],
    ['mrs0106', 'icon_ship1_missile', 'mcp/icon_ship1_artillery'],
    ['mas0106', 'icon_ship1_missile', 'mcp/icon_ship1_artillery'],
    ['mss0106', 'icon_ship1_missile', 'mcp/icon_ship1_artillery'],
    # T2 Artillery Ship
    ['mes0206', 'icon_ship2_missile', 'mcp/icon_ship2_artillery'],
    ['mrs0206', 'icon_ship2_missile', 'mcp/icon_ship2_artillery'],
    ['mas0206', 'icon_ship2_missile', 'mcp/icon_ship2_artillery'],
    ['mss0206', 'icon_ship2_missile', 'mcp/icon_ship2_artillery'],
    # Drones
    ['msl1401a', 'icon_fighter1_directfire', 'mcp/icon_fighter1_bomb'],
    ['mss1101a', 'icon_fighter1_directfire', 'mcp/icon_fighter1_antinavy'],
    # Air experimentals
    ['mea1401', 'icon_experimental_generic', 'mcp/icon_experimental_antiair'],
    # Naval experimentals
    ['mes1401', 'icon_experimental_generic', 'mcp/icon_experimental_antinavy'],
    ['mrs1401', 'icon_experimental_generic', 'mcp/icon_experimental_antinavy'],
    ['mss1401', 'icon_experimental_generic', 'mcp/icon_experimental_antinavy'],
    # Defense experimentals
    ['mab2403', 'icon_experimental_generic', 'mcp/icon_experimental_directfire'],
    ['meb2403', 'icon_experimental_generic', 'mcp/icon_experimental_directfire'],
    ['mrb2403', 'icon_experimental_generic', 'mcp/icon_experimental_directfire'],
    ['msb2403', 'icon_experimental_generic', 'mcp/icon_experimental_directfire'],
    # Strategic experimentals
    ['mrb2401', 'icon_experimental_generic', 'mcp/icon_experimental_artillery'],
    # Other experimentals
    ['msb4401', 'icon_experimental_generic', 'mcp/icon_experimental_shield'],
]

hookdata = [
    # Hooked unit blueprints
    ['uas0401', 'icon_experimental_generic', 'mcp/icon_experimental_antinavy'],
]

filedata = [
    ['modunits/mod_straticons.bp.bak', 'modunits/mod_straticons.bp'],
]

# Renaming functions
# ------------------
modpath = os.path.dirname(os.path.abspath(__file__))

# DOC : replace all occurences of 'fromstr' by 'tostr' in file located at 'filepath'. Overwrites file.
def replace_in_file(filepath, fromstr, tostr):
    if not os.path.exists(filepath):
        return
    file_r = open(filepath, 'r')
    content = file_r.read()
    file_r.close()
    if fromstr in content:
        print("Found '{}' in file {}. Replacing by '{}'.".format(fromstr, filepath, tostr))
        content = content.replace(fromstr, tostr)
        # print(content)
        file_w = open(filepath, 'w')
        file_w.write(content)
        file_w.close()
    else:
        print("String {} not found in {}".format(fromstr, filepath))

# Main script
# -----------
print("##########################################")
print("Setting expanded strategic icons to {}.".format(expand_strategic_icons))
print("##########################################")

for d in data:
    unit_name = d[0]
    current_straticon_name = d[1] if expand_strategic_icons else d[2]
    target_straticon_name = d[2] if expand_strategic_icons else d[1]
    unit_file_path = os.path.join(modpath, "units/{}/{}_unit.bp".format(unit_name, unit_name))
    print("Replace '{}' by '{}' in file {}".format(current_straticon_name, target_straticon_name, unit_file_path))
    replace_in_file(unit_file_path, current_straticon_name, target_straticon_name)
for d in hookdata:
    unit_name = d[0]
    current_straticon_name = d[1] if expand_strategic_icons else d[2]
    target_straticon_name = d[2] if expand_strategic_icons else d[1]
    unit_file_path = os.path.join(modpath, "hook/units/{}/{}_unit.bp".format(unit_name, unit_name))
    print("Replace '{}' by '{}' in file {}".format(current_straticon_name, target_straticon_name, unit_file_path))
    replace_in_file(unit_file_path, current_straticon_name, target_straticon_name)
for d in filedata:
    current_file_name = d[0] if expand_strategic_icons else d[1]
    target_file_name = d[1] if expand_strategic_icons else d[0]
    current_file = os.path.join(modpath, current_file_name)
    target_file = os.path.join(modpath, target_file_name)
    print("Rename '{}' to '{}'".format(current_file, target_file))
    if os.path.exists(current_file):
        os.rename(current_file, target_file)
        print("Renamed file '{}' successfully.".format(target_file))

print("Done !")