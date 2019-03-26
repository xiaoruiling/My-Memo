#!/bin/sh\
# My first script\

# 单引号字符串的限制：
#    1.单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的
#    2.单引号字串中不能出现单引号（对单引号使用转义符后也不行）
# 双引号的用法：
#    1.双引号里可以有变量
#    2.双引号里可以出现转义字符
echo 'Hello world!'
you_name="xiaoruiling"
echo $you_name
echo ${you_name}

you_name="我们都是好孩子"
echo $you_name

# 拼接字符串
greeting="Hello, "$you_name" !"
greeting_1="Hello, ${you_name} !"
echo $greeting
echo $greeting_1
echo $greeting $greeting_1

#获取字符串长度
string="abcd"
echo "输出字符串长度："${#string}""

#提取字符串
string="worktile is a greate company"
echo ${string:1:1}
echo "输出i位后长度是n的字符是："${string:3:3}""

#文件包含
source ./function.sh
. ./function.sh

# real_path=`readlink -f $1`
# . $real_path

echo "Yes, it worked!" >> ./DidItWork.txt  

file="./test.swift"
if [ -f "$file" ]
then
  echo "exists"
else 
  echo "#if !DEBUG
    func debugPrint(_ items: Any..., separator: String = "", terminator: String = "\n") {}
#  endif" >> ./test.swift
fi
  

