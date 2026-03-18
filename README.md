# Student-Attendance-and-Homework-Evaluation-System-Based-on-WeChat-Mini-Program
该系统以Java语言配合SpringBoot框架当作后端开发手段，前端运用微信小程序技术，用MySQL作数据库来存放数据，此系统包含学生端和管理员端，学生端具备扫码签到，作业提交与查阅，成绩查询等功能；管理员端则有学生信息管理，考勤记录管理，作业发布与打分之类的功能。
# 基于微信小程序的学生考勤与作业评价系统 
### Student Attendance and Homework Evaluation System Based on WeChat Mini-Program

[![Platform](https://img.shields.io/badge/Platform-WeChat_Mini_Program-green.svg)](https://mp.weixin.qq.com/)
[![Backend](https://img.shields.io/badge/Backend-Spring_Boot-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Database](https://img.shields.io/badge/Database-MySQL-blue.svg)](https://www.mysql.com/)

---

## 🌟 项目简介 (Project Overview)
本项目是一款专为校园环境设计的**学生考勤与作业评价系统**。通过微信小程序实现便捷的移动端签到与作业提交，后端采用 Spring Boot 框架保证系统的高可用性与数据安全。

This project is a **Student Attendance and Homework Evaluation System** designed for campus environments. It provides convenient mobile check-ins and homework submissions via a WeChat Mini-Program, with a robust Spring Boot backend for high availability and data security.

---

## 🚀 核心功能 (Core Features)

### 1. 考勤管理 (Attendance Management)
* **地理位置签到**：结合微信定位，防止代签。
* **实时统计**：教师端一键查看学生出勤率、迟到及缺勤情况。
* **Location-based Check-in**: Uses WeChat positioning to prevent proxy attendance.
* **Real-time Statistics**: Teachers can view attendance rates and late/absent lists at a glance.

### 2. 作业评价 (Homework Evaluation)
* **移动端提交**：学生可直接在小程序上传作业图片或文档。
* **多维度评分**：教师根据作业质量进行评分并给出评语。
* **Mobile Submission**: Students upload homework images or documents via the app.
* **Multi-dimensional Scoring**: Teachers provide grades and detailed feedback.

### 3. 数据分析 (Data Analysis)
* **可视化报表**：直观展示班级学情与考勤趋势。
* **Visual Reports**: Visualizes class learning progress and attendance trends.

---

## 🛠️ 技术栈 (Tech Stack)

* **前端 (Frontend)**: 微信小程序原生开发 (WeChat Mini Program SDK)
* **后端 (Backend)**: Java 8 / Spring Boot
* **数据库 (Database)**: MySQL
* **服务器 (Server)**: Apache Tomcat
* **持久层 (ORM)**: MyBatis / JPA

---

## 📂 项目结构 (Project Structure)
```text
.
├── miniprogram/          # 微信小程序源码 (Mini-Program Source Code)
├── server-backend/       # Spring Boot 后端项目 (Backend Project)
├── database/             # 数据库初始化脚本 (SQL Scripts)
└── README.md             # 项目说明文档
