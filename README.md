# 非官方 RuyiSDK 补充软件源：龙芯/龙架构支持

> [!NOTE]
> 本项目是非官方的（既非龙芯官方，也非 RuyiSDK 项目官方），纯出于测试需要而构建的。
>
> 项目作者不建议将其用于生产环境，不对使用该项目所造成的任何后果负责。

配合 [RuyiSDK 包管理器](https://github.com/ruyisdk/ruyi)使用的，旨在演示该项目的多仓库、多架构、插件功能的玩具软件源。

## 分步骤演示

添加本仓库：

```sh
ruyi repo add test-loongson https://github.com/xen0n/ruyi-addons-loongson.git
ruyi update
```

以下仅在 `x86_64` 主机可操作。安装我们打包的、龙芯官方编译的交叉编译工具链，并以此创建一个虚拟环境：

```sh
ruyi install toolchain/loongson-build-tools-glibc
ruyi venv -t loongson-build-tools-glibc la64v1.0 /tmp/venv-foo
```

激活虚拟环境：

```sh
source /tmp/venv-foo/bin/ruyi-activate

# 您现在可以用龙芯官方工具链开始构建了！
loongarch64-unknown-linux-gnu-gcc --version
```

玩腻了，退出并删除虚拟环境，恢复原状：

```sh
ruyi-deactivate  # 如果您还在虚拟环境里
rm -rf /tmp/venv-foo  # 务必小心谨慎！
ruyi uninstall loongson-build-tools-glibc
ruyi repo remove --purge test-loongson
```

## 许可证

`SPDX-License-Identifier: Apache-2.0`
