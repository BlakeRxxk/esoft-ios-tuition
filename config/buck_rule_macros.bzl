load("//config:utils.bzl",
    "library_configs",
    "dynamic_library_configs",
)

load("//config:configs.bzl",
    "app_test_configs",
)

text_section_items = [
    "__text",
]

text_section_rename_linker_flags = [] #["-Wl,-rename_section,__TEXT,%s,__MEXT,%s" % (name, name) for name in text_section_items] + ["-Wl,-segprot,__MEXT,rx,rx"]

section_rename_linker_flags = text_section_rename_linker_flags

def apple_lib(
        name,
        visibility = ["PUBLIC"],
        srcs = [],
        headers = [],
        exported_headers = [],
        extra_xcode_files = [],
        deps = [],
        exported_deps = [],
        additional_linker_flags = None,
        exported_preprocessor_flags = [],
        exported_linker_flags = [],
        frameworks = [],
        weak_frameworks = [],
        swift_version = None,
        modular = True,
        compiler_flags = None,
        platform_compiler_flags = None,
        swift_compiler_flags = None,
        warning_as_error = False,
        suppress_warnings = False,
        has_cpp = False,
        tests = [],
        framework = False):
    swift_version = swift_version or native.read_config('swift', 'version')
    swift_compiler_flags = swift_compiler_flags or []

    resolved_frameworks = frameworks

    if native.read_config("xcode", "beta") == "True":
        warning_as_error = False

    if platform_compiler_flags != None:
        if compiler_flags != None:
            fail("compiler_flags and platform_compiler_flags are mutually exclusive")
        compiler_flags = []
        for i in range(len(platform_compiler_flags)):
            if warning_as_error:
                platform_compiler_flags[i][1].append("-Werror")
            elif suppress_warnings:
                platform_compiler_flags[i][1].append("-w")
    else:
        compiler_flags = compiler_flags or []
        if warning_as_error:
            compiler_flags.append("-Werror")
        elif suppress_warnings:
            compiler_flags.append("-w")

    if warning_as_error:
        swift_compiler_flags.append("-warnings-as-errors")
    elif suppress_warnings:
        swift_compiler_flags.append("-suppress-warnings")

    if framework:
        additional_linker_flags = additional_linker_flags or []
        if has_cpp:
            linker_flags = [
                "-lc++",
                "-lz"
            ]
        else:
            linker_flags = []

        if native.read_config("custom", "mode") == "project":
            resolved_linker_flags = linker_flags + additional_linker_flags + ["-Wl,-install_name,@rpath/lib%s.dylib" % (name)]
            resolved_frameworks = resolved_frameworks + ["$SDKROOT/System/Library/Frameworks/%s.framework" % x for x in weak_frameworks]
        else:
            resolved_linker_flags = linker_flags + additional_linker_flags + ["-Wl,-install_name,@rpath/%s.framework/%s" % (name, name)]
            for framework in weak_frameworks:
                resolved_linker_flags = resolved_linker_flags + ["-Wl,-weak_framework,%s" % framework]

        resolved_linker_flags = resolved_linker_flags + section_rename_linker_flags
        native.apple_library(
            name = name + "",
            srcs = srcs,
            header_namespace = name,
            module_name = name,
            soname = "lib" + name + ".dylib",
            headers = headers,
            exported_headers = exported_headers,
            deps = deps,
            exported_deps = exported_deps,
            extra_xcode_files = extra_xcode_files,
            frameworks = resolved_frameworks,
            visibility = visibility,
            swift_version = swift_version,
            configs = dynamic_library_configs(),
            modular = modular,
            compiler_flags = compiler_flags,
            platform_compiler_flags = platform_compiler_flags,
            swift_compiler_flags = swift_compiler_flags,
            preferred_linkage = "shared",
            link_style = "static",
            linker_flags = resolved_linker_flags,
            tests = tests
        )
    else:
        additional_linker_flags = additional_linker_flags or []
        if has_cpp:
            linker_flags = [
                "-lc++",
                "-lz"
            ]
        else:
            linker_flags = []

        resolved_exported_linker_flags = exported_linker_flags + linker_flags + additional_linker_flags

        if native.read_config("custom", "mode") == "project":
            resolved_frameworks = resolved_frameworks + ["$SDKROOT/System/Library/Frameworks/%s.framework" % x for x in weak_frameworks]
        else:
            for framework in weak_frameworks:
                resolved_exported_linker_flags = resolved_exported_linker_flags + ["-Wl,-weak_framework,%s" % framework]

        native.apple_library(
            name = name,
            srcs = srcs,
            headers = headers,
            exported_headers = exported_headers,
            deps = deps,
            exported_deps = exported_deps,
            exported_linker_flags = resolved_exported_linker_flags,
            extra_xcode_files = extra_xcode_files,
            frameworks = resolved_frameworks,
            visibility = visibility,
            swift_version = swift_version,
            configs = library_configs(),
            modular = modular,
            compiler_flags = compiler_flags,
            platform_compiler_flags = platform_compiler_flags,
            swift_compiler_flags = swift_compiler_flags,
            preferred_linkage = "static",
            exported_preprocessor_flags = exported_preprocessor_flags,
            tests = tests
        )

def static_library(
        name,
        visibility = ["PUBLIC"],
        has_cpp = False,
        srcs = [],
        headers = [],
        exported_headers = [],
        extra_xcode_files = [],
        deps = [],
        additional_linker_flags = None,
        exported_preprocessor_flags = [],
        exported_linker_flags = [],
        frameworks = [],
        weak_frameworks = [],
        info_plist = None,
        info_plist_substitutions = {},
        modular = True,
        compiler_flags = None,
        platform_compiler_flags = None,
        swift_compiler_flags = None,
        warning_as_error = False,
        suppress_warnings = True,
        test_host_app = None,
        run_test_separately = False,
        test_frameworks = [],
        test_deps = [],
    ):
    lib_test_name = test_name(name)

    apple_lib(
        name = name,
        srcs = srcs,
        has_cpp = has_cpp,
        exported_headers = exported_headers,
        headers = headers,
        modular = modular,
        compiler_flags = compiler_flags,
        platform_compiler_flags = platform_compiler_flags,
        swift_compiler_flags = swift_compiler_flags,
        extra_xcode_files = extra_xcode_files,
        deps = deps,
        additional_linker_flags = additional_linker_flags,
        exported_preprocessor_flags = exported_preprocessor_flags,
        exported_linker_flags = exported_linker_flags,
        frameworks = frameworks,
        weak_frameworks = weak_frameworks,
        warning_as_error = warning_as_error,
        suppress_warnings = suppress_warnings,
        tests = [":" + lib_test_name],
    )

    test_sources = native.glob(["Tests/**/*.swift"])
    test_headers = None
    if has_cpp:
        test_sources.extend(native.glob(["Tests/**/*.m"]))
        test_headers = native.glob(["Tests/**/*.h"])

    apple_test_lib(
        name = lib_test_name,
        srcs = test_sources,
        headers = test_headers,
        info_plist = info_plist,
        info_plist_substitutions = info_plist_substitutions,
        test_host_app = test_host_app,
        run_test_separately = run_test_separately,
        frameworks = test_frameworks,
        deps = [":" + name] + test_deps
    )

def framework(
        name,
        visibility = ["PUBLIC"],
        has_cpp = False,
        srcs = [],
        headers = [],
        exported_headers = [],
        extra_xcode_files = [],
        deps = [],
        exported_deps = [],
        additional_linker_flags = None,
        frameworks = [],
        weak_frameworks = [],
        info_plist = None,
        info_plist_substitutions = {},
        modular = True,
        compiler_flags = None,
        platform_compiler_flags = None,
        swift_compiler_flags = None,
        warning_as_error = False,
        suppress_warnings = True):
    apple_lib(
        name = name,
        srcs = srcs,
        has_cpp = has_cpp,
        exported_headers = exported_headers,
        headers = headers,
        modular = modular,
        compiler_flags = compiler_flags,
        platform_compiler_flags = platform_compiler_flags,
        swift_compiler_flags = swift_compiler_flags,
        extra_xcode_files = extra_xcode_files,
        deps = deps,
        exported_deps = exported_deps,
        additional_linker_flags = additional_linker_flags,
        frameworks = frameworks,
        weak_frameworks = weak_frameworks,
        warning_as_error = warning_as_error,
        suppress_warnings = suppress_warnings,
        framework = True
    )

CXX_SRC_EXT = ["mm", "cpp", "S"]
def apple_cxx_lib(
        srcs = [],
        additional_exported_linker_flags = [],
        **kwargs):
    c_srcs, cxx_srcs = [], []

    cxx_compile_flags = native.read_config("cxx", "cxxflags").split(" ")
    cxx_compile_flags.append("-w")

    for file_ in srcs:
        if file_.split(".")[-1] in CXX_SRC_EXT:
            cxx_srcs.append((file_, cxx_compile_flags))
        else:
            c_srcs.append(file_)
    apple_lib(
        srcs = c_srcs + cxx_srcs,
        exported_linker_flags = [
            "-lc++",
            "-lz"
        ] + additional_exported_linker_flags,
        **kwargs
    )

def framework_binary_dependencies(names):
    result = []
    for name in names:
        result.append(name + "#shared")
    return result

def framework_bundle_dependencies(names):
    result = []
    if native.read_config("custom", "mode") == "project":
        for name in names:
            pass
    else:
        for name in names:
            result.append(name + "#shared")
    return result

def gen_header_targets(header_paths, prefix, flavor, source_rule, source_path):
    result = dict()
    for header_path in header_paths:
        name = prefix + header_path.replace('/', '_sub_')
        native.genrule(
            name = name + flavor,
            cmd = 'cp $(location :' + source_rule + ')/' + source_path + '/' + header_path + ' $OUT',
            out = name,
        )
        result[header_path] = ':' + name + flavor
    return result

def merge_maps(dicts):
    result = dict()
    for d in dicts:
        for key in d:
            if key in result and result[key] != d[key]:
                fail(
                    "Conflicting files in file search paths. " +
                    "\"%s\" maps to both \"%s\" and \"%s\"." %
                    (key, result[key], d[key]),
                )
        result.update(d)
    return result

def basename(p):
    return p.rpartition("/")[-1]

def glob_map(glob_results):
    result = dict()
    for path in glob_results:
        file_name = basename(path)
        if file_name in result:
            fail('\"%s\" maps to both \"%s\" and \"%s\"' % (file_name, result[file_name], path))
        result[file_name] = path
    return result

def glob_sub_map(prefix, glob_specs):
    result = dict()
    for path in native.glob(glob_specs):
        if not path.startswith(prefix):
            fail('\"%s\" does not start with \"%s\"' % (path, prefix))
        file_key = path[len(prefix):]
        if file_key in result:
            fail('\"%s\" maps to both \"%s\" and \"%s\"' % (file_key, result[file_key], path))
        result[file_key] = path
    return result


def test_name(name):
     return name + "Tests"
def ci_test_name(name):
    return name + "-For-CI"

def apple_test_lib(
        name,
        visibility = ["PUBLIC"],
        bundle_for_ci = True,
        info_plist = None,
        info_plist_substitutions = {},
        test_host_app = None,
        run_test_separately = False,
        is_ui_test = False,
        ui_test_target_app = None,
        frameworks = [],
        labels = [],
        destination_specifier = None,
        **kwargs):
    if bundle_for_ci:
        # Create a library with the test files. We'll use use these for our CI tests.
        # Libraries are much faster to create in CI than unit test bundles.
        # Therefore, we package up this test target as a library that we can depend on
        # later with a single apple_test bundle.
        native.apple_library(
            name = ci_test_name(name),
            visibility = visibility,
            frameworks = [
                "$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework",
            ] + frameworks,
            labels = ["CI"] + labels,
            **kwargs
        )
    if info_plist == None:
        info_plist = "//config:test_info_plist"

    substitutions = {}
    substitutions.update(info_plist_substitutions)
    native.apple_test(
        name = name,
        visibility = visibility,
        info_plist = info_plist,
        info_plist_substitutions = substitutions,
        destination_specifier = destination_specifier,
        test_host_app = test_host_app,
        is_ui_test = is_ui_test,
        ui_test_target_app = ui_test_target_app,
        run_test_separately = run_test_separately,
        configs = app_test_configs(name),
        frameworks = [
          "$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework"
        ] + frameworks,
        labels = labels,
        **kwargs
    )

def apple_test_all(
        libraries = [],
        additional_tests = [],
        prebuilt_frameworks = [],
        **kwargs):
    ci_test_libraries = []
    for library in libraries:
        ci_test_libraries.append(ci_test_name(test_name(library)))

    apple_test_lib(
        deps = ci_test_libraries + additional_tests + prebuilt_frameworks,
        bundle_for_ci = False,
        **kwargs
    )