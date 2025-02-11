## 通过 iStore 商店安装 
<img src=https://camo.githubusercontent.com/0a783d7ece59c727a1eef024855606c2b87be6acec14192e8103cf8c601d44eb/68747470733a2f2f63646e2e6a7364656c6976722e6e65742f67682f41554b393532372f4172652d752d6f6b406d61737465722f617070732f696e7374616c6c2e706e67>


## 通过命令行安装
> 类似这样操作 先下载run 在执行
```bash
wget -O xxx.run <run下载地址>
sh xxx.run
```

## run 文件名说明
- _aarch64.run 代表64位ARM的机型 比如 瑞芯微rk3568等、树莓派等
- _x86_64.run  代表64位通用型 比如工控机 电脑等

## 项目简介
【[ENGLISH](https://github.com/wukongdaily/RunFilesBuilder/blob/master/README_en.md)】

>> 这是一个工作流。同步各位大佬项目里最新编译的ipk文件 生成适用于iStoreOS/OpenWrt 用的run自解压包<br>
>> 本质上是利用makeslef,将ipk和shell文件打包成自解压程序。<br>
>> iStoreOS 可以在iStore商店手动安装<br>
>> ImmortalWrt 可下载后 使用 `sh xxx.run `来安装
> <img src="https://github.com/user-attachments/assets/3f5dabba-1efa-4e67-bf5b-86a27c114902" height=40>

## 实现原理和操作指南
[![操作步骤](https://img.shields.io/badge/YouTube-123456?logo=youtube&labelColor=ff0000)](https://youtu.be/o0TN8LV01i4)

## run 自解压包里包含什么
- run自解压包不是加密的 任何人都可以查看解压后的内容
- sh xx.run --target xx  该命令就是解压所有文件到xx文件夹 无任何秘密
- 这个run中包含了 若干个ipk
- 以及一个用于安装的脚本install.sh


