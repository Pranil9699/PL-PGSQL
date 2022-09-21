select name from emp e1 where 3-1 = (select COUNT (DISTINCT salary) from emp e2 where e2.salary>e1.salary);
https://user-images.githubusercontent.com/99954777/185356323-005b4d59-0494-44f2-acab-f5abca23c5e9.jpg
