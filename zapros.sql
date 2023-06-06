Last login: Sun Jun  4 16:12:53 on ttys001
alexanderfilatov@MacBook-Pro-Alexander proekt % cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgB1+PlY+aDR4PThF3kBcLNCten4q5aZ+uOL320J3hopoqnXPzWdzez9JPa757hkQWI2QYxx1AdyefZSTwP9//htP7igJ7m/u3lNFc8l3zDFSOZ6pVELLmfTczJbuzhdGlDu/EGQiQXuhmMRIxPidcI5DUUSm3mtEJPsU3FSI4wQu5q5Sf2B4wCXx71C6K1fgUkhhjALVN2lCdf2HwGIaiKJWPVWYiw4aDfgqI3wN81eBn3mPcXCzW9JqZQuj2B/fJ506uBczFUWBYZdL2iH+VNMiR9RKH1cpLML2FnjjiuDsn4sG9k58qiPo0LLJERCH54lGgegRAMqulC1AbgSuflXFCnPQVpXe2oRtyP5XJ4Bw7vTrtVqlS2IzaMee4PLR2yNYsk+lJjEur7Yz7Tvf5wAX1iAoHt2W5kasJ7rblbIkkrlVtKdc1yIpNgaV0xwPa78Fgggwd5JR7NWExm4O18lOBJhnlTzp6+zKrM8gPChvWSkoEwrjJWJAzZtJQGEM= alexanderfilatov@MacBook-Pro-Alexander.local
alexanderfilatov@MacBook-Pro-Alexander proekt % ssh bd9b88b0-a261-4cc1-9c2b-4ecddef007b8@serverhub.praktikum-services.ru -p 4554

morty@6c2aeb13160b:~$ psql -U morty -d scooter_rent
Password for user morty: 
psql (11.18 (Debian 11.18-0+deb10u1))
Type "help" for help.

scooter_rent=# \dt
           List of relations
 Schema |     Name      | Type  | Owner 
--------+---------------+-------+-------
 public | Couriers      | table | root
 public | Orders        | table | root
 public | SequelizeMeta | table | root
(3 rows)

scooter_rent=# SELECT *  FROM "Orders";
scooter_rent=# SELECT *  FROM "Couriers";
scooter_rent=# SELECT c.login, COUNT(o.id) FROM "Orders" AS o INNER JOIN "Couriers" AS c ON o."courierId" = c.id WHERE o."inDelivery" = true GROUP BY c.id, c.login;
 login | count 
-------+-------
 jfkjd |     2
(1 row)

scooter_rent=# SELECT track, CASE WHEN "finished" = true THEN 2 WHEN "cancelled" = true THEN -1  WHEN "inDelivery" = true THEN 1 ELSE 0 END AS status FROM "Orders";
 track  | status 
--------+--------
 200366 |      0
  36980 |      0
 139058 |      1
 139058 |      1
(4 rows)

scooter_rent=# 

