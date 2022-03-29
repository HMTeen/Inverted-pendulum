# Inverted-pendulum
 基于神经网络的一阶倒立摆控制

# 介绍

- 两个模型均采用传统LQR控制器控制一阶倒立摆，为了体会学习神经网络的数据拟合能力，使用BP、RBF神经网络代替LQR控制器，实现对一阶倒立摆的控制效果
- 模型来自万能的Github，个人部分：将神经网络代替LQR控制器，实现控制效果

## Modle1

Modle1基于Matlab的SimMechanics工具箱，建立一阶倒立摆的**物理**仿真模型，模拟真实倒立摆的受力情况

### Initial

- 运行“dlb_DataFile.m”文件，为仿真模型提供初始化参数设置

- 运行“dlb_fangzhen.slx”文件（已调参），采集LQR控制器对应的“4输入-1输出数据”
  - 4输入：位置、速度、角度、角速度
  - 1输出：加速度

### Process

- 将保存在工作区的数据以“.mat”的文件格式保存到“File”文件夹
- 运行“BP.m”代码，拟合训练BP神经网络，并生成可供Simulink调用的网络模块
- 替换原有的LQR控制器，再次运行文件，观看倒立摆的摆动幅度、稳定时间



# Modle2

Modle2基于**纯数学**模型，给定倒立摆的初始状态，公式分析了后续的运动状态，演示效果不如Modle1



### Initial

- 运行“main_lip1.m”文件，仿真，采集数据

### Process

- 同Molde1，不过没有File文件夹，可把数据直接保存在模型同级目录下

  

# Tips

- Modle1的倒立摆演示：原模型倒立摆杆头朝下，可以点击红色框框区域加以变动

![image-20220329100706434](https://gitee.com/HMTeenage/image/raw/master/Summary/image-20220329100706434.png)

- 个人Matlab版本：Matlab2020b（有可能出现版本不同无法运行的情况）

- Modle1更改摆杆初始角度

![image-20220329101315339](https://gitee.com/HMTeenage/image/raw/master/Summary/image-20220329101315339.png)

