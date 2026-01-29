-- ============================================================
-- 登录功能初始化脚本
-- 包含：Admin 用户、医生用户、角色关联
-- ============================================================

-- 1. 清理旧数据（可选，按需执行）
-- DELETE FROM sys_user_role WHERE user_id IN (SELECT id FROM sys_user WHERE username IN ('admin', 'doctor01'));
-- DELETE FROM sys_user WHERE username IN ('admin', 'doctor01');

-- 2. 插入/更新用户
-- 密码均为 123456，BCrypt 加密值为 $2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi
INSERT INTO sys_user (username, password, name, phone, email, status, create_time, update_time)
VALUES 
('admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', '系统管理员', '13800138000', 'admin@emr.com', 1, NOW(), NOW()),
('doctor01', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi', '张医生', '13900139000', 'zhang@emr.com', 1, NOW(), NOW())
ON CONFLICT (username) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    status = EXCLUDED.status,
    update_time = NOW();

-- 3. 确保角色存在
INSERT INTO sys_role (role_name, role_code, description, status, create_time, update_time)
VALUES 
('超级管理员', 'ADMIN', '拥有系统所有权限', 1, NOW(), NOW()),
('医生', 'DOCTOR', '临床医生角色', 1, NOW(), NOW())
ON CONFLICT (role_code) DO UPDATE SET
    role_name = EXCLUDED.role_name,
    update_time = NOW();

-- 4. 关联用户与角色
-- 先删除旧关联防止重复（因为 sys_user_role 没有 username 唯一索引，只有 id）
DELETE FROM sys_user_role WHERE user_id IN (SELECT id FROM sys_user WHERE username IN ('admin', 'doctor01'));

INSERT INTO sys_user_role (user_id, role_id)
SELECT u.id, r.id 
FROM sys_user u, sys_role r
WHERE u.username = 'admin' AND r.role_code = 'ADMIN';

INSERT INTO sys_user_role (user_id, role_id)
SELECT u.id, r.id 
FROM sys_user u, sys_role r
WHERE u.username = 'doctor01' AND r.role_code = 'DOCTOR';

-- 5. 初始化科室数据（sys_department 表）
INSERT INTO sys_department (dept_code, dept_name, dept_type, enabled, create_time, update_time)
VALUES 
('DEPT001', '内科', 'CLINIC', TRUE, NOW(), NOW())
ON CONFLICT (dept_code) DO UPDATE SET
    dept_name = EXCLUDED.dept_name,
    update_time = NOW();

-- 6. 初始化医生业务表数据（doctor 表）
INSERT INTO doctor (doctor_code, doctor_name, dept_code, user_username, enabled, create_time, update_time)
VALUES 
('DOC001', '张医生', 'DEPT001', 'doctor01', TRUE, NOW(), NOW())
ON CONFLICT (doctor_code) DO UPDATE SET
    doctor_name = EXCLUDED.doctor_name,
    user_username = EXCLUDED.user_username,
    update_time = NOW();
