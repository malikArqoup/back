#!/bin/bash

# Backend Deployment Script
echo "🚀 Starting Backend Deployment..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Create .env file from production template
if [ ! -f "backend/.env" ]; then
    echo "📝 Creating .env file from production template..."
    cp backend/env.production.ready backend/.env
    echo "⚠️  Please edit backend/.env with your production settings!"
fi

# Set environment variables
export DB_PASSWORD=${DB_PASSWORD:-clinic_secure_password_2024}
export SECRET_KEY=${SECRET_KEY:-clinic_super_secret_key_2024_change_this_in_production_environment_secure_random_string_here}

echo "🔧 Environment variables set:"
echo "   DB_PASSWORD: $DB_PASSWORD"
echo "   SECRET_KEY: ${SECRET_KEY:0:20}..."

# Build and start backend only
echo "🚀 Building and starting backend..."
docker-compose -f docker-compose.prod.yml up -d --build backend db

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 30

# Check if services are running
echo "🔍 Checking service status..."
docker-compose -f docker-compose.prod.yml ps

# Initialize database
echo "🗄️  Initializing database..."
docker-compose -f docker-compose.prod.yml exec -T backend python -m app.core.init_db

# Create admin user
echo "👤 Creating admin user..."
docker-compose -f docker-compose.prod.yml exec -T backend python -c "
from app.core.database import SessionLocal
from app.crud.user import create_user
from app.schemas.user import UserRegister
from app.core.security import get_password_hash

db = SessionLocal()
try:
    admin_user = UserRegister(
        name='مدير النظام',
        email='admin@clinic.com',
        phone_number='+1234567890',
        age=30,
        gender='ذكر',
        password='admin123'
    )
    create_user(db, admin_user)
    print('✅ Admin user created successfully!')
    print('📧 Email: admin@clinic.com')
    print('🔑 Password: admin123')
except Exception as e:
    print(f'⚠️  Admin user might already exist: {e}')
finally:
    db.close()
"

echo "✅ Backend deployment completed!"
echo ""
echo "🌐 Backend URLs:"
echo "   API: http://$(hostname -I | awk '{print $1}'):8001"
echo "   API Docs: http://$(hostname -I | awk '{print $1}'):8001/docs"
echo "   Health Check: http://$(hostname -I | awk '{print $1}'):8001/health"
echo ""
echo "🔑 Admin Login:"
echo "   Email: admin@clinic.com"
echo "   Password: admin123"
echo ""
echo "📝 Next steps:"
echo "   1. Configure your domain names"
echo "   2. Set up SSL certificates"
echo "   3. Change default passwords"
echo "   4. Update CORS settings if needed" 