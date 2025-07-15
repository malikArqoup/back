# 🚀 دليل رفع الباك إند على Railway

## ✅ الباك إند جاهز للرفع على Railway!

### 📁 الملفات الجاهزة:
- `railway.json` - إعدادات Railway
- `backend/Procfile` - أمر تشغيل الباك إند
- `backend/runtime.txt` - إصدار Python
- `railway.env.example` - متغيرات البيئة

---

## 🚀 خطوات الرفع على Railway:

### **الخطوة 1: اذهب لـ Railway**
1. اذهب إلى [railway.app](https://railway.app)
2. سجل دخول بـ GitHub
3. اضغط "New Project"

### **الخطوة 2: اربط المشروع**
1. اختر "Deploy from GitHub repo"
2. اختر repository المشروع
3. Railway سيكتشف تلقائياً أنه مشروع Python

### **الخطوة 3: أضف قاعدة البيانات**
1. اضغط "New" → "Database" → "PostgreSQL"
2. Railway سيربطها تلقائياً مع الباك إند
3. ستجد `DATABASE_URL` في متغيرات البيئة

### **الخطوة 4: أضف متغيرات البيئة**
في Railway Dashboard → Variables، أضف:

```env
SECRET_KEY=your_very_secure_random_key_here_2024
ACCESS_TOKEN_EXPIRE_MINUTES=180
CLOUDINARY_CLOUD_NAME=dbrut3x1b
CLOUDINARY_API_KEY=324117751933592
CLOUDINARY_API_SECRET=Kg3fbXTZV5ajQV2kwmBrFO3JXek
ALLOWED_ORIGINS=https://*.netlify.app,https://netlify.app,http://localhost:4200,http://localhost:3000
```

### **الخطوة 5: انتظر النشر**
- Railway سيبني المشروع تلقائياً
- سيعطيك رابط مباشر للباك إند

---

## 🌐 النتائج:

### **بعد النشر:**
- **الباك إند**: `https://your-app-name.railway.app`
- **وثائق API**: `https://your-app-name.railway.app/docs`
- **فحص الصحة**: `https://your-app-name.railway.app/health`

### **بيانات تسجيل الدخول:**
- **البريد**: `admin@clinic.com`
- **كلمة المرور**: `admin123`

---

## 🔗 ربط الفرونت إند:

### **عدّل عنوان API في الفرونت إند:**
في ملف `clinic-frontend/src/app/config/environment.ts`:
```typescript
production: {
  apiUrl: 'https://your-app-name.railway.app', // رابط Railway
  frontendUrl: 'https://your-netlify-app.netlify.app'
}
```

### **أعد بناء الفرونت إند:**
```bash
cd clinic-frontend
npm run build
```

### **ارفع الفرونت إند المحدث:**
- ارفع مجلد `browser` الجديد إلى Netlify

---

## 🔒 الأمان:

### **تغييرات مطلوبة:**
1. **غيّر SECRET_KEY** لشيء آمن
2. **غيّر بيانات المدير الافتراضية**
3. **تأكد من إعدادات Cloudinary**

### **إنشاء مستخدم مدير:**
بعد النشر، اذهب إلى:
`https://your-app-name.railway.app/register`

أو استخدم البيانات الافتراضية:
- Email: `admin@clinic.com`
- Password: `admin123`

---

## 🔧 استكشاف الأخطاء:

### **مشكلة في البناء:**
- تحقق من `requirements.txt`
- تأكد من إصدار Python (3.11)

### **مشكلة في قاعدة البيانات:**
- تحقق من متغير `DATABASE_URL` في Railway
- تأكد من أن قاعدة البيانات نشطة

### **مشكلة في CORS:**
- تأكد من إضافة عنوان الفرونت إند في `ALLOWED_ORIGINS`

---

## 📝 ملاحظات:

1. **Railway مجاني** للاستخدام الأساسي
2. **SSL مجاني** تلقائياً
3. **قاعدة البيانات** مرتبطة تلقائياً
4. **النشر التلقائي** عند تحديث GitHub

---

## 🎯 الخلاصة:

1. **ارفع الكود على GitHub**
2. **اربط المشروع بـ Railway**
3. **أضف قاعدة بيانات PostgreSQL**
4. **أضف متغيرات البيئة**
5. **عدّل عنوان API في الفرونت إند**

**الباك إند جاهز للرفع على Railway! 🎉** 