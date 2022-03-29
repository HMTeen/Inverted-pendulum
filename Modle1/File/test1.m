load data.mat

input = [out.GSF_pos, out.GSF_pos1, out.GSF_ang, out.GSF_ang1]';
output = out.GSF_acc';

net = newgrnn(input,output, 0.01);
y = sim(net, input);
gensim(net,-1) 


temp = y-output;
add = sum(temp);

% % 我们使用图像来看网络对非线性函数的拟合效果
% figure
% plot(input,y,'rd');
% hold on;
% plot(input,output,'b-.');
% 
% title('可视化的方法观察准确GRNN神经网络的拟合效果')
% xlabel('样本输入')
% ylabel('预测输出')
% 
% grid on 



% % 我们使用图像来看网络对非线性函数的拟合效果
% figure
% plot(input,y,'rd');
% hold on;
% plot(input,output,'b-.');
% 
% title('可视化的方法观察准确RBF神经网络的拟合效果')
% xlabel('x1')
% ylabel('y')
% 
% grid on 
