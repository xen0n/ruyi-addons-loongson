RUYI = ruyi_plugin_rev(1)

#
# Preparation of state
#

def _init_profiles(profiles, generic, emulator_presets):
    res = {}
    for id, p in profiles.items():
        if id in ["generic", "la64v1.0", "la64v1.1"]:
            p["emulator_cfg"] = emulator_presets.get("generic")
            res[id] = p
            continue

        p["mabi"] = p.get("mabi", generic["mabi"])
        p["march"] = p.get("march", generic["march"])

        #mcpu_for_emu = p["mcpu"] if p["mcpu"] else "generic"
        mcpu_for_emu = "la464"
        p["emulator_cfg"] = emulator_presets.get(
            mcpu_for_emu,
            emulator_presets.get("generic"),
        )

        res[id] = p

    return res


_trivial_la64_profiles = RUYI.load_toml("trivial-la64-profiles.toml")["profiles"]
_trivial_la64_profiles = {x["id"]: x for x in _trivial_la64_profiles}
_generic_la64_profile = _trivial_la64_profiles["generic"]

#_mcpu_map = RUYI.load_toml("mcpu-quirks.toml")
_emulator_presets = RUYI.load_toml("emulator-presets.toml")


# def map_mcpu(mcpu: str, quirks: list[str]) -> str:
def map_mcpu(mcpu, quirks):
    ## maybe our mcpu needs some substitution
    #for q in quirks:
    #    if q not in _mcpu_map:
    #        continue
    #    if mcpu in _mcpu_map[q]:
    #        return _mcpu_map[q][mcpu]
    return mcpu


loong64_profiles = _init_profiles(
    _trivial_la64_profiles,
    _generic_la64_profile,
    _emulator_presets,
)
