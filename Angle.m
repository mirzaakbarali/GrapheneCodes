function theta1= Angle(R2x, R2y)

% Calculating Angle
   if R2x>0 && R2y==0
        theta1 = 0;
    elseif R2x<0 && R2y==0
        theta1 = pi;
   elseif R2x ==0 && R2y >0
       theta1 = pi/2;
   elseif R2x==0 && R2y < 0
       theta1 = 3*pi/2;
    elseif R2x>0 && R2y>0
        theta1 = atan(R2y/R2x);
    elseif R2x<0 && R2y>0;
        theta1 = pi+atan(R2y/R2x);
    elseif R2x<0 && R2y<0
        theta1 = pi+atan(R2y/R2x);
   elseif R2x > 0 && R2y <0
       theta1 = 2*pi + atan(R2y/R2x);
   end
   