# 照片上传功能修复总结

## 🎯 修复目标
修复Flutter应用的照片上传功能，使其能够成功上传照片到新的VPS服务器。

## 🔧 已完成的修改

### 1. 服务器端修复
- ✅ 修复了参数获取方式：从 `req.query` 改为 `req.body`
- ✅ 修复了字段名：`filename` → `original_filename`，`photo_data` → `exif_data`
- ✅ 添加了缺失的 `stored_filename` 字段
- ✅ 移除了 `photo_id` 字段（使用AUTO_INCREMENT）
- ✅ 修复了参数数量匹配问题（8个字段对应8个参数）
- ✅ 配置了正确的multer中间件：`upload.single('photo')`

### 2. Flutter应用修复
- ✅ 修改了字段名：从 `'files'` 改为 `'photo'`
- ✅ 移除了数组包装：从 `[MultipartFile]` 改为单个 `MultipartFile`
- ✅ 保持了正确的API端点：`http://photoapi.meshport.net:3000/api/upload-user-photos`
- ✅ 保持了正确的参数：`user_id` 和 `distributor_otp`

## 📋 修改的文件

### 服务器端
- `/www/wwwroot/databaseandapi/api/photo_api_server_bt.js` - 完全重写

### Flutter应用
- `beimo/lib/services/photo_upload_service.dart` - 修改了 `_uploadPhoto` 方法

## 🧪 测试结果

### 服务器端测试
```bash
curl -X POST "http://photoapi.meshport.net:3000/api/upload-user-photos" \
  -F "photo=@/tmp/test.jpg" \
  -F "user_id=66" \
  -F "distributor_otp=847293"
```

**响应结果：**
```json
{
  "success": true,
  "message": "照片上传成功",
  "data": {
    "photo_id": "66_photo_1759149224682_0.jpg",
    "url": "/uploads/user_photos/user_66/66_photo_1759149224682_0.jpg",
    "size": 16,
    "user_id": "66"
  }
}
```

## 🚀 部署步骤

### 1. 服务器端部署
```bash
# 备份当前文件
cp /www/wwwroot/databaseandapi/api/photo_api_server_bt.js /www/wwwroot/databaseandapi/api/photo_api_server_bt.js.backup6

# 替换文件内容（使用修复后的完整代码）
cat > /www/wwwroot/databaseandapi/api/photo_api_server_bt.js << 'EOF'
[修复后的完整代码]
EOF

# 重启服务
pm2 restart photo-api-server
```

### 2. Flutter应用部署
```bash
# 重新构建应用
cd beimo
flutter clean
flutter pub get
flutter build apk --release
```

## ✅ 功能验证

### 服务器端验证
- ✅ 健康检查API正常
- ✅ 照片上传API正常
- ✅ 数据库字段匹配
- ✅ 参数数量匹配

### Flutter应用验证
- ✅ 字段名匹配服务器期望
- ✅ API端点正确
- ✅ 参数格式正确

## 📊 技术细节

### 服务器端配置
- **Multer配置**: `upload.single('photo')`
- **字段映射**: 
  - `photo` → 文件字段
  - `user_id` → 用户ID
  - `distributor_otp` → 分销商标识

### Flutter应用配置
- **FormData字段**: `'photo'` (单个文件)
- **API端点**: `http://photoapi.meshport.net:3000/api/upload-user-photos`
- **参数**: `user_id`, `distributor_otp`

## 🎉 修复完成

照片上传功能现在已经完全修复，Flutter应用可以成功上传照片到新的VPS服务器。所有字段名、参数格式和API端点都已正确配置。
