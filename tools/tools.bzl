load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

def tools_repositories():
    excludes = native.existing_rules().keys()
    if "buildifier" not in excludes:
        http_file(
            name = "buildifier",
            executable = True,
            sha256 = "4c985c883eafdde9c0e8cf3c8595b8bfdf32e77571c369bf8ddae83b042028d6",
            urls = ["https://github.com/bazelbuild/buildtools/releases/download/0.29.0/buildifier"],
        )

    if "buildifier_osx" not in excludes:
        http_file(
            name = "buildifier_osx",
            executable = True,
            sha256 = "9b108decaa9a624fbac65285e529994088c5d15fecc1a30866afc03a48619245",
            urls = ["https://github.com/bazelbuild/buildtools/releases/download/0.29.0/buildifier.mac"],
        )

    if "buildozer" not in excludes:
        http_file(
            name = "buildozer",
            executable = True,
            sha256 = "2a5c3e3390de07248704f21ed38495062fb623c9b0aef37deda257a917891ea6",
            urls = ["https://github.com/bazelbuild/buildtools/releases/download/0.29.0/buildozer"],
        )

    if "buildozer_osx" not in excludes:
        http_file(
            name = "buildozer_osx",
            executable = True,
            sha256 = "316d24478f3be8a076b7901810dbfff79e305b3ac73a93b56f30a92950e5d0d0",
            urls = ["https://github.com/bazelbuild/buildtools/releases/download/0.29.0/buildozer.mac"],
        )

    if "unused_deps" not in excludes:
        http_file(
            name = "unused_deps",
            executable = True,
            sha256 = "3562f6453eb433be5477b5d11c197ff95c7f359fa752c8a89e619af00da2c8fd",
            urls = ["https://github.com/bazelbuild/buildtools/releases/download/0.29.0/unused_deps"],
        )

    if "unused_deps_osx" not in excludes:
        http_file(
            name = "unused_deps_osx",
            executable = True,
            sha256 = "b255362bacddb0b523a122efcc92a1c13f579cd09bce55bed905ef1b9d4a9514",
            urls = ["https://github.com/bazelbuild/buildtools/releases/download/0.29.0/unused_deps.mac"],
        )

    if "shfmt" not in excludes:
        http_file(
            name = "shfmt",
            executable = True,
            sha256 = "86892020280d923976ecaaad1e7db372d37dce3cfaad44a7de986f7eb728eae7",
            urls = ["https://github.com/mvdan/sh/releases/download/v3.0.1/shfmt_v3.0.1_linux_amd64"],
        )

    if "shfmt_osx" not in excludes:
        http_file(
            name = "shfmt_osx",
            executable = True,
            sha256 = "e470d216818a107078fbaf34807079c4857cb98610d67c96bf4dece43a56b66c",
            urls = ["https://github.com/mvdan/sh/releases/download/v3.0.1/shfmt_v3.0.1_darwin_amd64"],
        )
    if "prototool" not in excludes:
        http_file(
            name = "prototool",
            executable = True,
            sha256 = "e1e3d81228f7d157d9476034dd1b21005926c96dcd8b7d220074ac071304545e",
            urls = ["https://github.com/uber/prototool/releases/download/v1.9.0/prototool-Linux-x86_64"],
        )

    if "prototool_osx" not in excludes:
        http_file(
            name = "prototool_osx",
            executable = True,
            sha256 = "8cb668edbd51a13f057535d8ca7e4b0574fe7ae092338714b3d4b513cf188220",
            urls = ["https://github.com/uber/prototool/releases/download/v1.9.0/prototool-Darwin-x86_64"],
        )

    if "helm" not in excludes:
        http_archive(
            name = "helm",
            build_file = "@//:tools/helm/helm.BUILD",
            sha256 = "538f85b4b73ac6160b30fd0ab4b510441aa3fa326593466e8bf7084a9c288420",
            urls = ["https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz"],
        )

    if "helm_osx" not in excludes:
        http_archive(
            name = "helm_osx",
            build_file = "@//:tools/helm/helm.BUILD",
            sha256 = "71d213d63e1b727d6640c4420aee769316f0a93168b96073d166edcd3a425b3d",
            urls = ["https://get.helm.sh/helm-v3.4.1-darwin-amd64.tar.gz"],
        )
