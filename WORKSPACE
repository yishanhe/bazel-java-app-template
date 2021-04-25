workspace(
    name = "bazel-java-app-template",
    managed_directories = {
        "@npm-openapi": ["thirdparty/npm/openapi/node_modules"],
    },
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# https://github.com/bazelbuild/rules_docker/issues/1814
http_archive(
    name = "io_bazel_rules_docker",
    patch_args = ["-p1"],
    patches = ["//:rules_docker_bad_checksum.patch"],
    sha256 = "95d39fd84ff4474babaf190450ee034d958202043e366b9fc38f438c9e6c3334",
    strip_prefix = "rules_docker-0.16.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.16.0/rules_docker-v0.16.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "java_base",
    registry = "index.docker.io",
    repository = "openjdk",
    tag = "8-jre-alpine",
)

RULES_JVM_EXTERNAL_TAG = "3.0"

RULES_JVM_EXTERNAL_SHA = "62133c125bf4109dfd9d2af64830208356ce4ef8b165a6ef15bbff7460b35c3a"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:specs.bzl", "maven")

# TODO: split maven deps into multiple when this list grows too large
maven_install(
    name = "maven",
    artifacts = [
        maven.artifact(
            "junit",
            "junit",
            "4.13",
        ),
        "org.projectlombok:lombok:1.18.12",
        "com.google.guava:guava:30.1-jre",
        "com.fasterxml.jackson.core:jackson-annotations:2.11.0",
        "com.fasterxml.jackson.core:jackson-databind:2.11.0",
        "com.fasterxml.jackson.core:jackson-core:2.11.0",
        "javax.annotation:javax.annotation-api:1.3.2",
        "javax.persistence:javax.persistence-api:2.2",
        "io.swagger:swagger-annotations:1.5.3",
        "org.postgresql:postgresql:42.2.20",
        "org.springframework.data:spring-data-jpa:2.5.0",
        "org.springframework.data:spring-data-commons:2.5.0",
        "org.springframework:spring-beans:5.2.7.RELEASE",
        "org.springframework:spring-core:5.2.7.RELEASE",
        "org.springframework:spring-context:5.2.7.RELEASE",
        "org.springframework:spring-web:5.2.7.RELEASE",
        "org.springframework:spring-webmvc:5.2.7.RELEASE",
        "org.springframework.boot:spring-boot:2.3.1.RELEASE",
        "org.springframework.boot:spring-boot-starter:2.3.1.RELEASE",
        "org.springframework.boot:spring-boot-loader:2.3.1.RELEASE",
        "org.springframework.boot:spring-boot-starter-logging:2.3.1.RELEASE",
        "org.springframework.boot:spring-boot-starter-data-jpa:2.3.1.RELEASE",
        "org.springframework.boot:spring-boot-starter-web:2.3.1.RELEASE",
        "org.springframework.boot:spring-boot-autoconfigure:2.3.1.RELEASE",
        "org.springframework.boot:spring-boot-actuator:2.3.1.RELEASE",
        "org.springframework.boot:spring-boot-actuator-autoconfigure:2.3.1.RELEASE",
        "javax.validation:validation-api:2.0.1.Final",
        "javax.servlet:javax.servlet-api:4.0.1",
        "io.springfox:springfox-swagger2:2.9.2",
        "io.springfox:springfox-spring-web:2.9.2",
        "org.openapitools:jackson-databind-nullable:0.2.1",
        "org.apache.logging.log4j:log4j-slf4j-impl:2.13.3",
    ],
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

RULES_OPEN_API_VERSION = "f0f42afb855139ad5346659d089c32fb756d068e"

RULES_OPEN_API_SHA256 = "9570186948f1f65c61d2c6c6006840ea70888b270f028bbd0eb736caae1cd9df"

http_archive(
    name = "io_bazel_rules_openapi",
    sha256 = RULES_OPEN_API_SHA256,
    strip_prefix = "rules_openapi-%s" % RULES_OPEN_API_VERSION,
    url = "https://github.com/meetup/rules_openapi/archive/%s.tar.gz" % RULES_OPEN_API_VERSION,
)

load("@io_bazel_rules_openapi//openapi:openapi.bzl", "openapi_repositories")

openapi_repositories(
    codegen_cli_provider = "openapi",
    codegen_cli_sha256 = "f438cd16bc1db28d3363e314cefb59384f252361db9cb1a04a322e7eb5b331c1",
    codegen_cli_version = "4.3.1",
    prefix = "io_bazel_rules_openapi",
)

# spring rule
http_archive(
    name = "rules_spring",
    sha256 = "2178aa714516fe3ba8e88663aef8e183e6ab28c8bf1f9da96f76533ee86a47b4",
    urls = [
        "https://github.com/salesforce/rules_spring/releases/download/2.1.0/rules-spring-2.1.0.zip",
    ],
)

http_archive(
    name = "rules_python",
    sha256 = "b6d46438523a3ec0f3cead544190ee13223a52f6a6765a29eae7b7cc24cc83a0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.1.0/rules_python-0.1.0.tar.gz",
)

load("@rules_python//python:pip.bzl", "pip_install")

# Create a central repo that knows about the dependencies needed for
# requirements.txt.
pip_install(
    name = "pre_commit_deps",
    requirements = "//tools/precommit:requirements.txt",
)

# node js dependency
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "6142e9586162b179fdd570a55e50d1332e7d9c030efd853453438d607569721d",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/3.0.0/rules_nodejs-3.0.0.tar.gz"],
)

load("@build_bazel_rules_nodejs//:index.bzl", "npm_install")

npm_install(
    name = "npm-openapi",
    data = [
        "//thirdparty/npm/openapi:.npmrc",  # example of using .npmrc
    ],
    package_json = "//thirdparty/npm/openapi:package.json",
    package_lock_json = "//thirdparty/npm/openapi:package-lock.json",
    quiet = True,
)

load("//tools:tools.bzl", "tools_repositories")

tools_repositories()
