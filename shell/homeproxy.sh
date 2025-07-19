#!/bin/bash

# 平台基础URL
declare -A PLATFORMS=(
  ["x86_64"]="https://mirrors.sjtug.sjtu.edu.cn/immortalwrt/releases/24.10.2/packages/x86_64"
  ["aarch64_generic"]="https://mirrors.sjtug.sjtu.edu.cn/immortalwrt/releases/24.10.2/packages/aarch64_generic"
)

# 各类包对应的目录
declare -A PACKAGE_SOURCES=(
  ["luci-app-homeproxy"]="luci"
  ["luci-i18n-homeproxy-zh-cn"]="luci"
  ["sing-box"]="packages"
)

# 当前目录下创建平台输出目录
OUT_DIR=$(pwd)

for platform in "${!PLATFORMS[@]}"; do
  BASE_URL="${PLATFORMS[$platform]}"
  SAVE_DIR="${OUT_DIR}/${platform}"
  mkdir -p "$SAVE_DIR"

  echo "📦 正在处理平台: $platform"

  for keyword in "${!PACKAGE_SOURCES[@]}"; do
    subdir="${PACKAGE_SOURCES[$keyword]}"
    URL="${BASE_URL}/${subdir}/"

    echo "🔍 正在从 $URL 查找 $keyword"

    PACKAGE_LIST=$(curl -s "$URL" | grep -oE 'href="[^"]+\.ipk"' | cut -d'"' -f2)

    if [ -z "$PACKAGE_LIST" ]; then
      echo "⚠️ 无法读取 $URL 的包列表"
      continue
    fi

    FILE=$(echo "$PACKAGE_LIST" | grep "^${keyword}.*\.ipk" | head -n 1)
    if [ -n "$FILE" ]; then
      echo "⬇️ 正在下载: $FILE"
      curl -s -L -o "${SAVE_DIR}/${FILE}" "${URL}${FILE}"
    else
      echo "❌ 未找到匹配: $keyword"
    fi
  done
done

echo "✅ 下载完成，文件已分别存入 x86_64/ 与 aarch64_generic/ 目录中。"
