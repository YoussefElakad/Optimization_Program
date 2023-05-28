Set DV / A,B,C/;


Parameter
ProductionRate(DV)/
      A       200
      B       140
      C       160
      /
      
ResourcesUse(DV)/
      A       20
      B       10
      C       15
      /

profit(DV)/
      A       25
      B       30
      C       29
      /
      
maxCapacity(DV)/
       A    6000
       B    4000
       C    3500
       /

lowerBound (DV) /
       A    1000
       B    500
       C    750
       /;     
        
       
scalar MaxHr/40/;
scalar MaxRes/100000/;
Positive Variable x(DV);
Variable z;

Equation obj , hrConst, ReConst ,lowerBoundConst(DV),productConst(DV);

obj..z=e=sum (DV , x(DV)*profit(DV));
productConst(DV)..x(DV)=l=maxCapacity(DV);
hrConst..sum (DV , x(DV)*(1/ProductionRate(DV)))=l=MaxHr;
ReConst..sum (DV , x(DV)*(ResourcesUse(DV)))=l=MaxRes;
lowerBoundConst(DV)..x(DV)=G=lowerBound (DV); 

Model prodmix/all/

 solve prodmix using LP maximizing Z;
 Display x.l,z.l