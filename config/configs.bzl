load("//config:utils.bzl",
    "config_with_updated_linker_flags",
    "configs_with_config",
    "merge_dict",
    "DEVELOPMENT_LANGUAGE",
    "SHARED_CONFIGS",
    "ALL_LOAD_LINKER_FLAG",
    "read_config_nonempty",
    "optimization_config",
    "add_provisioning_profile_specifier",
    "add_codesign_identity",
    "strip_debug_symbols",
    "get_build_number",
    "get_short_version",
    "bundle_identifier",
    "get_development_team",
    "get_provisioning_profile",
    "get_codesign_entitlements",
)

def app_binary_configs(name="TemplateApp"):
    config = {
        "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES": "YES",
        "DEVELOPMENT_LANGUAGE": DEVELOPMENT_LANGUAGE,
        "PRODUCT_BUNDLE_IDENTIFIER": bundle_identifier(suffix=""),
        "CODE_SIGN_ENTITLEMENTS": get_codesign_entitlements("app"),
        "DEVELOPMENT_TEAM": get_development_team(),
        "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon",
        "BUILD_NUMBER": get_build_number(),
        "PRODUCT_BUNDLE_SHORT_VERSION": get_short_version(),
        "APP_NAME": name,
        "PRODUCT_NAME": name,
        "TARGETED_DEVICE_FAMILY": "1,2",
    }
    config = merge_dict(SHARED_CONFIGS, config)
    config = merge_dict(config, optimization_config())
    config = config_with_updated_linker_flags(config, ALL_LOAD_LINKER_FLAG)
    configs = configs_with_config(config)
    configs = add_provisioning_profile_specifier(configs, "app")
    configs = add_codesign_identity(configs)
    configs = strip_debug_symbols(configs)
    return configs

def app_test_configs(name):
    config = {
        "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES": "NO",
        "DEVELOPMENT_LANGUAGE": DEVELOPMENT_LANGUAGE,
        "PRODUCT_BUNDLE_IDENTIFIER": bundle_identifier(suffix=""),
        "DEVELOPMENT_TEAM": get_development_team(),
        "BUILD_NUMBER": get_build_number(),
        "PRODUCT_BUNDLE_SHORT_VERSION": get_short_version(),
        "APP_NAME": name,
        "PRODUCT_NAME": name,
        "TARGETED_DEVICE_FAMILY": "1,2",
        "CLANG_ENABLE_CODE_COVERAGE": "YES",
        "COPY_PHASE_STRIP": "NO"
    }
    config = merge_dict(SHARED_CONFIGS, config)
    config = merge_dict(config, optimization_config())
    config = config_with_updated_linker_flags(config, ALL_LOAD_LINKER_FLAG)
    configs = {
        "Debug": config,
        "Profile": config,
    }
    return configs

def info_plist_substitutions(name):
    substitutions = {
        "DEVELOPMENT_LANGUAGE": DEVELOPMENT_LANGUAGE,
        "EXECUTABLE_NAME": name,
        "PRODUCT_BUNDLE_IDENTIFIER": bundle_identifier(name),
        "PRODUCT_NAME": name,
        "CURRENT_PROJECT_VERSION": "1",
    }
    return substitutions

def app_info_plist_substitutions(name="TemplateApp"):
    substitutions = {
        "DEVELOPMENT_LANGUAGE": DEVELOPMENT_LANGUAGE,
        "EXECUTABLE_NAME": name,
        "PRODUCT_BUNDLE_IDENTIFIER": bundle_identifier(suffix=""),
        "PRODUCT_NAME": name,
        "APP_NAME": name,
        "CURRENT_PROJECT_VERSION": "1",
        "BUILD_NUMBER": get_build_number(),
        "PRODUCT_BUNDLE_SHORT_VERSION": get_short_version(),
        "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon",
        "TARGETED_DEVICE_FAMILY": "1,2",
    }
    return substitutions
