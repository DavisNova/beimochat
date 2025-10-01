#!/bin/bash

echo "🔧 测试Podfile语法"
echo "=================="

# 进入iOS目录
cd ios

# 检查Podfile语法
echo "1. 检查Podfile语法..."
if pod install --dry-run; then
    echo "✅ Podfile语法正确"
else
    echo "❌ Podfile语法错误"
    exit 1
fi

echo "✅ 测试完成！"
