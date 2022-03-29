clear;clc
A = [ 0 1 0 0;
      0 0 0 0;
      0 0 0 1;
      0 0 29.493 0];
B = [ 0 1 0 3]';
C = [ 1 0 0 0;
      0 0 1 0];
D = [0];

Q11 = 1000;   %代表小车位置的权重
Q22 = 0;       %小车速度的权重
Q33 = 200;   %代表摆杆角度的权重
Q44 = 0;   %摆杆角速度的权重
% 当Q11为100时，Q33取1，10或100对曲线影响不大，好像是代表摆杆角度权重的值不用取太大，
% 太大了对结果也没有更大的贡献，待验证

Q = [Q11 0   0   0;
     0   Q22 0   0;
     0   0   Q33 0;
     0   0   0   Q44];
R = 10;      %控制能量的限制

K = lqr(A,B,Q,R)
sim('lip_lqr1.slx',10);

PHI = C/(-A+B*K)*B

% t_q11_10 = Time;
% ang_q11_10 = Ang*180/pi;
% pos_q11_10 = Pos;

% t_q22_1000 = Time;
% ang_q22_1000 = Ang*180/pi;
% pos_q22_1000 = Pos;
 
% t_q33_1000 = Time;
% ang_q33_1000 = Ang*180/pi;
% pos_q33_1000 = Pos;

% t_q44_1000 = Time;
% ang_q44_1000 = Ang*180/pi;
% pos_q44_1000 = Pos;

figure(1)
set(gcf,'Units','centimeters','Position',[10 10 5*1.45 4*1.45]);%设置图片大小为 5*1.45cm× 4*1.45cm
plot(Time, Ang*180/pi, 'b');
xlabel('t(s)'); 
ylabel('\theta (°)' );
title('角度变化曲线(仿真)')
hold 
grid on; 

figure(2)
set(gcf,'Units','centimeters','Position',[20 10 5*1.45 4*1.45]);%设置图片大小为 5*1.45cm× 4*1.45cm
plot(Time, Pos, 'b');
xlabel('t(s)'); 
ylabel('x (m)');
title('位置变化曲线(仿真)')
hold on
grid on; 

% data_LQR_subsys2 = [GSF_pos, GSF_pos1, GSF_ang, GSF_ang1, GSF_acc];


% Ac = [(A-B*K)];
% 
% Bc = B;
% Cc = [C];
% Dc = [D];
% Cn = [1 0 0 0 ];
% 
% s = size(A,1);
% Z = [zeros(1,s) 1];
% 
% N = inv([A,B;Cn,0])*Z';
% Nx = N(1:s);
% Nu = N(1+s);
% Nbar = Nu + K*Nx;
% 
% Bcn = [Nbar*B];
% x0 = [0 0 10*pi/180 0];
% T = 0:0.01:10;
% U  = zeros(size(T));
% [Y,X] = lsim(Ac,Bcn,Cc,Dc,U,T,x0);
% xpos = Y(:,1);
% xangle = Y(:,2);
% 
% figure(20)
% plot(T,xpos,':');
% grid on
% title('位置变化曲线')
% xlabel('t (s)'); ylabel('x (m)')
% figure(10)
% plot(T,xangle*180/pi,'--')
% grid on
% title('角度变化曲线')
% xlabel('t (s)'); ylabel('\theta (°)')

