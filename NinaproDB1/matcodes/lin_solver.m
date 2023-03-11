clc;
clear all;
close all;
A=[-2 -3 1;-6 -2 1;-15 -12 1];
B=[1;1;-1];
X = linsolve(A,B);
disp(X);