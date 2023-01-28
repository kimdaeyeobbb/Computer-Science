SELECT 
user_id, 
CASE
WHEN register_device = 1 THEN 'Desktop'
WHEN register_device = 2 THEN 'SmarkPhone'
WHEN register_device = 3 THEN 'Application'
END AS device_name
FROM mst_users;