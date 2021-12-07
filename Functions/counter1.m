function f = counter1(b)

global w_l_app w_nl_app b_l_app b_nl_app h_l_app h_nl_app a_l_app a_nl_app u_l_app u_nl_app o_l_app o_nl_app
global w_l_index w_nl_index b_l_index b_nl_index h_l_index h_nl_index a_l_index a_nl_index u_l_index u_nl_index o_l_index o_nl_index

w_l_adm=exp(w_l_index+b(1))/(1+exp(w_l_index+b(1)))*w_l_app;
w_nl_adm=exp(w_nl_index+b(1))/(1+exp(w_nl_index+b(1)))*w_nl_app;

b_l_adm=exp(b_l_index+b(1))/(1+exp(b_l_index+b(1)))*b_l_app;
b_nl_adm=exp(b_nl_index+b(1))/(1+exp(b_nl_index+b(1)))*b_nl_app;

h_l_adm=exp(h_l_index+b(1))/(1+exp(h_l_index+b(1)))*h_l_app;
h_nl_adm=exp(h_nl_index+b(1))/(1+exp(h_nl_index+b(1)))*h_nl_app;

a_l_adm=exp(a_l_index+b(1))/(1+exp(a_l_index+b(1)))*a_l_app;
a_nl_adm=exp(a_nl_index+b(1))/(1+exp(a_nl_index+b(1)))*a_nl_app;

u_l_adm=exp(u_l_index+b(1))/(1+exp(u_l_index+b(1)))*u_l_app;
u_nl_adm=exp(u_nl_index+b(1))/(1+exp(u_nl_index+b(1)))*u_nl_app;

o_l_adm=exp(o_l_index+b(1))/(1+exp(o_l_index+b(1)))*o_l_app;
o_nl_adm=exp(o_nl_index+b(1))/(1+exp(o_nl_index+b(1)))*o_nl_app;

total_admits=w_l_adm+w_nl_adm+b_l_adm+b_nl_adm+h_l_adm+h_nl_adm+a_l_adm+a_nl_adm+u_l_adm+u_nl_adm+o_l_adm+o_nl_adm;

f=(total_admits-5665)^2; %5665 = total number of domestic admits for Classes of 2015-2017

end

