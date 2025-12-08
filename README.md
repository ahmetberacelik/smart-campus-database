# 🎓 Smart Campus Database

Akıllı Kampüs Yönetim Sistemi için MySQL veritabanı yapılandırması.

## 📋 İçindekiler

- [Gereksinimler](#-gereksinimler)
- [Kurulum](#-kurulum)
- [Kullanım](#-kullanım)
- [Veritabanı Şeması](#-veritabanı-şeması)
- [Test Kullanıcıları](#-test-kullanıcıları)

## 🔧 Gereksinimler

- Docker & Docker Compose
- Git

## 🚀 Kurulum

### 1. Repository'yi klonlayın

```bash
git clone https://github.com/your-username/smart-campus-database.git
cd smart-campus-database
```

### 2. Environment dosyasını oluşturun

```bash
cp .env.example .env
```

`.env` dosyasını düzenleyerek şifreleri güncelleyin.

### 3. Docker container'ı başlatın

```bash
cd docker
docker-compose up -d
```

### 4. Seed verilerini yükleyin

```bash
# Windows (PowerShell)
Get-Content ..\scripts\seed.sql | docker exec -i smart_campus_db mysql -u root -proot_password_123 smart_campus

# Linux/Mac
docker exec -i smart_campus_db mysql -u root -proot_password_123 smart_campus < ../scripts/seed.sql
```

## 📖 Kullanım

### Container Yönetimi

```bash
# Container'ı başlat
cd docker
docker-compose up -d

# Container'ı durdur
docker-compose down

# Container loglarını görüntüle
docker-compose logs -f mysql

# Container durumunu kontrol et
docker-compose ps
```

### MySQL'e Bağlanma

```bash
# Docker exec ile
docker exec -it smart_campus_db mysql -u root -p

# Veya MySQL client ile
mysql -h localhost -P 3306 -u smart_campus_user -p smart_campus
```

### Veritabanını Sıfırlama

```bash
# Container'ı ve volume'u sil
cd docker
docker-compose down -v

# Yeniden başlat
docker-compose up -d

# Seed verilerini yükle
# (yukarıdaki seed komutunu çalıştır)
```

## 🗄️ Veritabanı Şeması

### Tablolar (Part 1)

| Tablo | Açıklama |
|-------|----------|
| `departments` | Akademik bölümler |
| `users` | Tüm kullanıcıların temel bilgileri |
| `students` | Öğrenci detayları |
| `faculty` | Öğretim üyesi detayları |
| `refresh_tokens` | JWT refresh token'ları |
| `email_verification_tokens` | Email doğrulama token'ları |
| `password_reset_tokens` | Şifre sıfırlama token'ları |

Detaylı şema için: [docs/DATABASE_SCHEMA.md](docs/DATABASE_SCHEMA.md)

## 👥 Test Kullanıcıları

Seed verileri yüklendikten sonra aşağıdaki kullanıcılarla test yapabilirsiniz:

| Email | Rol | Şifre |
|-------|-----|-------|
| admin@smartcampus.edu.tr | ADMIN | password123 |
| ahmet.yilmaz@smartcampus.edu.tr | FACULTY | password123 |
| ayse.demir@smartcampus.edu.tr | FACULTY | password123 |
| ali.kaya@smartcampus.edu.tr | STUDENT | password123 |
| zeynep.celik@smartcampus.edu.tr | STUDENT | password123 |
| mehmet.ozturk@smartcampus.edu.tr | STUDENT | password123 |
| fatma.sahin@smartcampus.edu.tr | STUDENT | password123 |
| emre.arslan@smartcampus.edu.tr | STUDENT | password123 |

## 📁 Klasör Yapısı

```
smart-campus-database/
├── docker/
│   └── docker-compose.yml    # Docker Compose yapılandırması
├── migrations/
│   ├── V1__create_departments.sql
│   ├── V2__create_users.sql
│   ├── V3__create_students.sql
│   ├── V4__create_faculty.sql
│   └── V5__create_auth_tables.sql
├── seeds/
│   ├── 01_departments.sql
│   ├── 02_users.sql
│   ├── 03_students.sql
│   └── 04_faculty.sql
├── scripts/
│   ├── init.sql              # Başlangıç script'i
│   └── seed.sql              # Test verileri script'i
├── docs/
│   ├── DATABASE_SCHEMA.md
│   └── FINAL_PROJECT_ASSIGNMENT.md
├── .env.example
├── .gitignore
└── README.md
```

## 🔗 İlişkili Repository'ler

- [smart-campus-backend](https://github.com/your-username/smart-campus-backend) - Spring Boot Backend
- [smart-campus-frontend](https://github.com/your-username/smart-campus-frontend) - React Frontend

## 📄 Lisans

Bu proje eğitim amaçlı geliştirilmiştir.
