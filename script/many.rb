#!/usr/bin/env ruby

#一般的思路
sum,i,j,k = 0,1,1,1

for i in [1,2,3,4]
    for j in [1,2,3,4]
        for k in [1,2,3,4]
            if i!=j and j!=k and i!=k
                printf("number %i: %i,%i,%i\n",sum +=1,i,j,k)
            end
        end
    end
end

#利用array自带的方法处理
[1,2,3,4].permutation(3).to_a.each {|number| p number}
