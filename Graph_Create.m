% -------------------------------------------------------------------------
%%%�����ܣ�����ͼ���ڵ㡢�ߣ���Ԫ��
%%%�������룺
%�ڵ����Chain_layer_Num
%%%���������
%Graph:��¼����ÿ��Ľڵ���
%Arc:��¼����ߵ�����
% -------------------------------------------------------------------------
function [Graph,Arc] = Graph_create(Chain_layer_Num)
%ͼ�ڵ�
Graph = cell(1,Chain_layer_Num);
node_sum=0;    %�ڵ�����
node_num=zeros(1,Chain_layer_Num);   %����ڵ����
Max_node_num=10*ones(1,Chain_layer_Num); %ÿһ�����ڵ����
Min_node_num_=4*ones(1,Chain_layer_Num); %ÿһ����С�ڵ����

for i=1:Chain_layer_Num
    node_num(i)=randi([Min_node_num(i),Max_node_num(i)]);    %��i����ʵ�ڵ����
    Graph{i}=((node_sum+1):(node_sum+node_num(i)));
    node_sum=node_sum+node_num(i);
end

%������
Arc_layer_Num=Chain_layer_Num-1;   %�߲���
Arc = cell(1,Arc_layer_Num);
for i=1:Arc_layer_Num
    Max_arc_num=length(Graph{i})*length(Graph{i+1});   %��i��������������Ϊȫ����ʱ��
    Min_arc_num=ceil(Max_arc_num/3);     %��i����С������ȡΪȫ���ӵ�1/3������ȡ����
    Arc_num(i)=randi([Min_arc_num,Max_arc_num],1);                  %��i�����ʵ����
    Connect_matrix=zeros(Arc_num(i),2);  %��i������Ӿ���(����*2����)
    for j=1:Arc_num(i)
        Connect_matrix(j,1)=randi([Graph{i}(1),Graph{i}(1)+length(Graph{i})-1]); %Node_choose_i_layer
        Connect_matrix(j,2)=randi([Graph{i+1}(1),Graph{i+1}(1)+length(Graph{i+1})-1],1);  %Node_choose_i+1_layer
    end
    Arc{i}=Connect_matrix;
end    
end




