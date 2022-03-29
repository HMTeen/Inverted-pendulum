% clc;

load data.mat
input = [out.GSF_pos, out.GSF_pos1, out.GSF_ang, out.GSF_ang1]';
output = out.GSF_acc';
net = newrb(input, output,0, 10,10, 25)        %神经网络创建                                           %训练
trainout =sim(net,input)                                     %经BP得到的结果
% gensim(net,-1)                      %将构建的神经网络进行封装，生成simulink控制元件

% 我们使用图像来看网络对非线性函数的拟合效果
figure
plot(input,trainout,'rd');
hold on;
plot(input,output);

title('可视化的方法观察准确RBF神经网络的拟合效果')
xlabel('样本输入')
ylabel('预测输出')

grid on 

% clc;clear;
% a = [0 1 2 3;0 2 4 6]
% b = [0 1 2 3]
% plot(a,b, 'b-')
