function [y, dy, d2y] = deBoor_Cox2(x, t, k, i)

N = max(size(t))-1;
n = max(size(x))-1;

if ( k == 0 )
    if ( i < j )
        if ( (t(i+1,1) <= x) && (t(i+2,1) > x) )
            y = 1;
            dy = 0;
            d2y = 0;
        else
            y = 0;
            dy = 0;
            d2y = 0;
        end
    elseif ( i == j )
        if ( (t(j,1) <= x) && (t(j+1,1) >= x) )
            y = 1;
            dy = 0;
            d2y = 0;
        else
            y = 0;
            dy = 0;
            d2y = 0;
        end
    else
        y = 0;
        dy = 0;
        d2y = 0;
    end
else
    if ( t(i,1)<t(i+k+1,1) && (t(i+k,1)~=t(i,1)) )
        y = (x-t(i,1))*deBoor_Cox(x, t, k-1, i)/(t(i+k,1)-t(i,1))...
            + (t(i+k+1)-x)*deBoor_Cox(x, t, k-1, i+1)/(t(i+k+1,1)-t(i+1,1));
        
        dy = k*( deBoor_Cox(x, t, k-1, i)/(t(i+k,1)-t(i,1)) ...
                     - deBoor_Cox(x, t, k-1, i+1)/(t(i+k+1,1)-t(i+1,1)) );
        
        if ( (t(i+k-1,1)~=t(i+1,1)) && (t(i+k+1,1)~=t(i+2,1)) )
        temp2 = (k-1)*( deBoor_Cox(x, t, k-2, i+1)/(t(i+k-1,1)-t(i+1,1)) ...
                    - deBoor_Cox(x, t, k-2, i+2)/(t(i+k+1,1)-t(i+2,1)) );
        else temp2 = 0;
        end
        
        if ( (t(i+k-1,1)~=t(i,1)) && (t(i+k,1)~=t(i+1,1)) )
        temp1 = (k-1)*( deBoor_Cox(x, t, k-2, i)/(t(i+k-1,1)-t(i,1)) ...
                        - deBoor_Cox(x, t, k-2, i+1)/(t(i+k,1)-t(i+1,1)) );
        else temp1 = 0;
        end
         
        d2y = k*((t(i+k,1)~=t(i,1))*temp1/(t(i+k,1)-t(i,1))...
                 - (t(i+k+1,1)~=t(i+1,1))*temp2/(t(i+k+1,1)-t(i+1,1)));
        
    else
        y = 0;
        dy = 0;
        d2y = 0;
    end
end

end