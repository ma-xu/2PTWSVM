function [ Result ] = crossvalidate( label,X,v )
    %交叉验证代码
    % author: maxu 13952522076
    % label : 样本标签
    % X     : 样本
    % v     : 折叠次数
    
    index = 1:length(label);
    
    number = length(label);
    
    fold =[0:v];
    fold = floor(number*fold/v);
    table = []; % 3列分别是  p; c; accuracy;
    times =0;
    for p =0.1:0.1:2
        p
        for c = 0.1:0.1:2
           
            
            %% 循环体里面的计算正确率
            AccuracyList = [];
            times = times+1;
            for i =1:v
                testX = []; testLabel = []; trainX = [];trainLabel = [];

                testX = X((fold(i)+1:fold(i+1)),:);
                testLabel = label(fold(i)+1:fold(i+1));

                trainX = X(1:fold(i),:);
                trainX = [trainX;X(fold(i+1)+1:number,:)];
                trainLabel = label(1:fold(i),:);
                trainLabel = [trainLabel;label(fold(i+1)+1:number,:)];

                %下面是验证的方法的代码
                AA = trainX(find(trainLabel(:,1)==1),:);
                BB = trainX(find(trainLabel(:,1)~=1),:);



                [ w1 ] = svc( AA,BB,p,c);
                [ w2 ] = svc( BB,AA,p,c);
                testLabel(testLabel~=1) = 0;
                [ Accuracy ] = accuracy( w1,w2,testX,testLabel);

                AccuracyList = [AccuracyList;Accuracy];
            end
            
            table(times,1) = p;
            table(times,2) = c;
            Accuracy_AVG = mean(AccuracyList);
            table(times,3) = Accuracy_AVG;
            
        end
    end  
   
    %% 得到结果
    Result.table = table;
    [value,row]=max(table(:,3));
    Result.best_Accuracy = value;
    Result.best_p = table(row,1);
    Result.best_c = table(row,2);
    

end

