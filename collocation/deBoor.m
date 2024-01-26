% implementira de Boorov algoritam za izvrednjavanje
% po dijelovima polinomne funkcije v(x) = \sum_{j=0:d} alpha_j B_{j,k}(x)

% x ... toèka
% t ... èvorovi B-splajnova
% k ... stupanj B-splajnova
% alpha ... (d+1)-dimenzionalno polje parametara alpha_j

% v ... vrijednost funkcije v(x)

function [v] = deBoor(x, t, k, alpha)

d = max(size(alpha));
N = max(size(t))-1;
flag = 0;
%                 %% alpha_i^[0] = alpha_i
for i = 1:d
    Alpha(i,1) = alpha(i,1);
end

%                 %% za dani x >= t_k, nadi j t.d. je x \in [t_j, t_j+1>

for i = k:N-k
    if( (t(i,1) <= x) && (x <= t(i+1,1)) )
        j = i;
        flag = 1;
    end
end

if (flag)
for l = 2:k                                     %% za l = 1,...,k
    for i = j-k+l:j                              %% za i = j-k+l,...,j
        if ( (i < N+1) && (i+k+1-l < N+1) && (t(i+k+1-l,1)~=t(i,1)) && (t(i+k+1-l,1)~=t(i,1)))
            
            Alpha(i,l) = (x-t(i,1))*Alpha(i,l-1)/(t(i+k+1-l,1)-t(i,1)) ...                   
                         + (t(i+k+1-l,1)-x)*Alpha(i-1,l-1)/(t(i+k+1-l,1)-t(i,1));
        else
            Alpha(i,l) = 0;
        end
    end
    
end
end

%                 %% v(x) = alpha_j^[k]
if (flag)
    v = Alpha(j,k);
else
    v = 0;
end

end