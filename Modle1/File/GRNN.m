load data1.mat;
data1 = data1';
p_train=data1(1:4,1:500);
t_train=data1(1:4,501:625);
p_test=data1(5,1:500);
t_test=data1(5,501:625);
% % %������֤
% desired_spread=[];
% mse_max=10e20;
% desired_input=[];
% desired_output=[];
% result_perfp=[];
% indices=crossvalind('Kfold',length(p_train),4);
% h=waitbar(0,'����Ѱ�����Ż�����......')
% k=1;
% for i=1:4
%       perfp=[];
%       disp(['����Ϊ��',num2str(i),'�ν�����֤���'])
%       test=(indices==i);train=~test;
%       p_cv_train=p_train(train,:);
%       t_cv_train=t_train(train,:);
%       p_cv_test=p_train(test,:);
%       t_cv_test=t_train(test,:);
%       p_cv_train=p_cv_train';
%       t_cv_train=t_cv_train';
%       p_cv_test=p_cv_test';
%       t_cv_test=t_cv_test';
%   
% [p_cv_train,minp,maxp,t_cv_train,mint,maxt]=premnmx(p_cv_train,t_cv_train);
% p_cv_test=tramnmx(p_cv_test,minp,maxp);
% for spread=0.1:0.1:2;
%       net=newgrnn(p_cv_train,t_cv_train,spread);
%       waitbar(k/80,h);
%       disp(['��ǰspreadֵΪ',num2str(spread)]);
%       test_Out=sim(net,p_cv_test);
%       test_Out=postmnmx(test_Out,mint,maxt);
%       error=t_cv_test-test_Out;
%       disp(['��ǰ�����mseΪ',num2str(mse(error))])
%       perfp=[perfp mse(error)];
%       if mse(error)<mse_max
%             mse_max=mse(error);
%             desired_spread=spread;
%             desired_input=p_cv_train;
%             desired_output=t_cv_train;
%       end
%       k=k+1;
%   end
%   result_perf(i,:)=perfp;
% end;
% close(h)
% disp(['���spreadֵΪ',num2str(desired_spread)])
% disp(['��ʱ�������ֵΪ',num2str(desired_input)])
% disp(['��ʱ������ֵΪ',num2str(desired_output)])
%%������ѷ�������GRNN����
net=newgrnn(p_train,p_test);
y = sim(net, t_train(1,:))

p_test=p_test';
p_test=tramnmx(p_test,minp,maxp);
grnn_prediction_result=sim(net,p_test);
grnn_predictioin_result=postmnmx(grnn_prediction_result,mint,maxt);
grnn_error=t_test-grnn_prediction_result';
disp('GRNN��������������Ԥ������Ϊ')
abs(grnn_error)
save best desired_input desired_output p_test t_test grnn_error mint maxt