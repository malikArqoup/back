# 🚀 دليل رفع الباك إند - تطبيق العيادة

## ✅ الباك إند جاهز للرفع!

### 📁 الملفات الجاهزة:
- `backend/` - مجلد الباك إند كاملاً
- `env.production.ready` - ملف البيئة للإنتاج
- `deploy-backend.sh` - سكريبت النشر التلقائي
- `docker-compose.prod.yml` - إعدادات Docker للإنتاج

---

## 🚀 طرق الرفع:

### **الطريقة الأولى: سكريبت تلقائي (الأسهل)**
```bash
# على السيرفر
git clone your-repo
cd clinic
chmod +x deploy-backend.sh
./deploy-backend.sh
```

### **الطريقة الثانية: Docker Compose**
```bash
# على السيرفر
git clone your-repo
cd clinic

# انسخ ملف البيئة
cp backend/env.production.ready backend/.env

# شغل الباك إند
docker-compose -f docker-compose.prod.yml up -d --build backend db
```

### **الطريقة الثالثة: رفع يدوي (بدون Docker)**
```bash
# على السيرفر
cd backend
pip install -r requirements.txt

# انسخ ملف البيئة
cp env.production.ready .env

# شغل الباك إند
uvicorn app.main:app --host 0.0.0.0 --port 8001
```

---

## ⚙️ إعدادات مهمة:

### **1. تعديل ملف البيئة:**
في ملف `backend/.env`:
```env
DATABASE_URL=postgresql://postgres:your_password@db:5432/clinic_db
SECRET_KEY=your_very_secure_random_key_here
CLOUDINARY_CLOUD_NAME=your_cloudinary_name
CLOUDINARY_API_KEY=your_cloudinary_api_key
CLOUDINARY_API_SECRET=your_cloudinary_api_secret
```

### **2. تأكد من CORS:**
في `backend/app/main.py`:
```python
allowed_origins = [
    "https://*.netlify.app",  # لـ Netlify
    "https://your-frontend-domain.com",  # لـ دومينك
]
```

---

## 🌐 النتائج:

### **بعد الرفع:**
- **الباك إند**: `http://your-server-ip:8001`
- **وثائق API**: `http://your-server-ip:8001/docs`
- **فحص الصحة**: `http://your-server-ip:8001/health`

### **بيانات تسجيل الدخول:**
- **البريد**: `admin@clinic.com`
- **كلمة المرور**: `admin123`

---

## 🔒 الأمان:

### **تغييرات مطلوبة:**
1. **غيّر كلمة مرور قاعدة البيانات**
2. **غيّر SECRET_KEY**
3. **أضف شهادة SSL**
4. **غيّر بيانات المدير الافتراضية**

### **إعداد SSL:**
```bash
# تثبيت Certbot
sudo apt install certbot python3-certbot-nginx

# الحصول على شهادة SSL
sudo certbot --nginx -d your-domain.com
```

---

## 🔧 استكشاف الأخطاء:

### **مشكلة في المنفذ:**
```bash
# فتح المنفذ 8001
sudo ufw allow 8001
```

### **مشكلة في قاعدة البيانات:**
```bash
# فحص حالة قاعدة البيانات
docker-compose -f docker-compose.prod.yml logs db
```

### **مشكلة في CORS:**
- تأكد من أن عنوان الفرونت إند مضاف في `allowed_origins`

---

## 📝 ملاحظات:

1. **المنفذ 8001** سيعمل بشكل طبيعي
2. **قاعدة البيانات** ستُنشأ تلقائياً
3. **Cloudinary** يجب أن يكون مُعد للصور
4. **CORS** يسمح لـ Netlify تلقائياً

**الباك إند جاهز 100% للرفع! 🎉** 