% clc;

% load data.mat
input = [GSF_pos, GSF_pos1, GSF_ang, GSF_ang1]';    % 输入数据
output = GSF_acc';                                  % 输出数据
net=newff(minmax(input),[10,1],{'tansig' 'purelin','trainlm'});  %BP神经网络创建
net.trainParam.epochs = 3000;                       % 训练次数                 
[net,tr]=train(net,input,output);                   % 训练
trainout=sim(net,input);                             % 仿真输出
gensim(net,-1)                        % 将构建的神经网络进行封装，生成simulink控制元件


