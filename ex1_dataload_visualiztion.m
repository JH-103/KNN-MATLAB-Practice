clear; close all; clc;

%meas 1열: sepal length
%meas 2열: speal width
%meas 3열: petal length
%meas 4열: petal width
%species: 꽃 종류

load fisheriris;

%%특징 그려보기 (sepal lenght,width)
figure;
plot(meas(:,1),meas(:,2),'k.');
xlabel('Sepal Length');
ylabel('Sepal Width');

%%각 종을 숫자로 표현 1: setosa, 2:versicolor, 3:virginica 
spcs2num=[];
for k = 1:1:length(species)
    if strcmp(species(k), 'setosa') ==1
        spcs2num(k) = 1; % Setosa
    elseif strcmp(species(k), 'versicolor') == 1
        spcs2num(k) = 2; % Versicolor
    elseif strcmp(species(k), 'virginica') == 1
        spcs2num(k) = 3; % Virginica
    end
end




%% 종별로 다른색으로 그리기
idx1 = find(spcs2num==1);
idx2 = find(spcs2num==2);
idx3 = find(spcs2num==3);

figure;
plot(meas(idx1,1),meas(idx1,2),'r.'); hold on; %setosa는 빨간색
plot(meas(idx2,1),meas(idx2,2),'go'); hold on; %versicolor는 녹색 동그라미
plot(meas(idx3,1),meas(idx3,2),'bx'); hold on; %virginica는 파란색 x
xlabel('Sepal length');
ylabel('Sepal width');

figure;
plot(meas(idx1,3),meas(idx1,4),'r.'); hold on; %setosa는 빨간색
plot(meas(idx2,3),meas(idx2,4),'go'); hold on; %versicolor는 녹색 동그라미
plot(meas(idx3,3),meas(idx3,4),'bx'); hold on; %virginica는 파란색 x
xlabel('Petal length');
ylabel('Petal length');

%%학습 데이터 평가데이터 나누기
% 두개로 나누기 versicolor vs virginica
%1~50 : setosa, 51~100 : versicolor, 101~150 :virginica
%학습 데이터 . 71 ~100 : versicolor, 121~150: virginica total60
%평가 데이터. 51~70: versicolor, 101~120 : virginica total 40
tr_id = [71:1:100 121:1:150];
Training_data = meas(tr_id,:);
Training_label = spcs2num(tr_id,:);

ts_id = [51:1:70 101:1:120];
Test_data = meas(ts_id,:);
Test_label = spcs2num(ts_id,:);