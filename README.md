# Secure Microservices LAMP Stack (Refactored) 🛡️

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Linux](https://img.shields.io/badge/Alpine_Linux-0D597F?style=for-the-badge&logo=alpine-linux&logoColor=white)
![Security](https://img.shields.io/badge/Security-Hardened-success?style=for-the-badge)

## 📋 Overview

This repository demonstrates the refactoring of a legacy, monolithic application environment into a **modern, decoupled microservices architecture**.

The project replaces a deprecated, single-container setup (Ubuntu 16.04 EOL) with a secure, orchestrated environment using **Docker Compose**. It is designed to showcase **SRE best practices**, including immutable infrastructure, principle of least privilege, and image optimization.

## 🏗️ Architecture



The application is split into three decoupled services to ensure scalability and fault isolation:

1.  **Proxy Layer (Nginx):** Handles HTTP traffic, static content, and reverse proxies to the application layer. Based on Alpine Linux for minimal attack surface.
2.  **Application Layer (PHP-FPM):** Stateless execution environment running as a non-root user.
3.  **Data Layer (MariaDB):** Persistent storage with volume management and secure credential injection.

## 🚀 Key Features & SRE Improvements

| Feature | Legacy Monolith | Modern Refactor (This Repo) |
| :--- | :--- | :--- |
| **Base OS** | Ubuntu 16.04 (EOL/Insecure) | **Alpine Linux 3.19** (Secure/Maintained) |
| **Architecture** | Single Process (Monolith) | **Microservices** (Decoupled) |
| **Security** | Root User Execution | **Non-Root User (UID 1000)** |
| **Secrets** | Hardcoded in Dockerfile | **Environment Variable Injection** |
| **Image Size** | ~1 GB | **~100 MB** (Optimized) |
| **Updates** | Manual `apt-get` | **Official Upstream Images** |

## 📂 Project Structure

```text
.
├── docker-compose.yml       # Orchestration manifest
├── Dockerfile               # Application layer definition (Multi-stage)
├── .env.example             # Template for environment variables
├── src/                     # Application source code (Volume mounted)
│   └── index.php
└── nginx/
    └── conf.d/              # Nginx configuration
        └── default.conf
