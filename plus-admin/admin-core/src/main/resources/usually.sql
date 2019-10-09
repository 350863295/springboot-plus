﻿SELECT cu.CODE,
       cd.value,
       cd.name,
       cd.type,
       cd.type_name,
       cd.remark,
       cd2.VALUE,
       cd2.NAME,
       cd2.TYPE,
       cd2.TYPE_NAME,
       cd2.REMARK
FROM core_user cu
       left join core_dict cd on cd.VALUE = cu.JOB_TYPE0
       left join core_dict cd2 on cd2.VALUE = cu.JOB_TYPE1
where cu.ID = 1;

-- 获取id为1 的用户的所属组织
SELECT cur.ORG_ID
FROM core_user_role cur
WHERE cur.USER_ID = 1;

-- 获取id 为1 的用户的角色，需要通过org进行过滤
SELECT ROLE_ID
FROM core_user_role
WHERE USER_ID = 1
  AND ORG_ID = 1;

-- 获取所有路由表（路由表不单单包含菜单，还包括任意的请求路由）
-- 建立一个以function为中心的权限体系
select menu.id,
       menu.PARENT_MENU_ID      PARENT_ID,
       menu.NAME                title,
       menu.CODE                name,
       menu.ICON,
       ifnull(menu.SEQ, 999999) seq,
       func.ACCESS_URL          path,
       role_menu.ROLE_ID
from core_menu menu
       left join core_function func on func.ID = menu.FUNCTION_ID
       left join core_role_menu role_menu on role_menu.MENU_ID = menu.id;


-- 分为系统，导航，菜单。系统是顶部菜单，导航就是父菜单，菜单是导航的子菜单
select cm.*, cd.NAME, cd.TYPE_NAME
from core_menu cm
       join core_dict cd on cd.VALUE = cm.TYPE;

