select name from emp e1 where 3-1 = (select COUNT (DISTINCT salary) from emp e2 where e2.salary>e1.salary);
