function [] = MoveArm(theta1,theta2,theta3,s)
th1_deg= theta1;
th2_deg= theta2;
th3_deg= theta3;

th1_pw=(round((800/90)*th1_deg)+700); %Shoulder Joint
th2_pw=(round((-850/90)*th2_deg)+650); %Elbow Joint
th3_pw=(round((900/90)*th3_deg)+1200); %Wrist Joint

ShoulderCom = sprintf('#1 P%i T1000', th1_pw);
ElbowCom = sprintf('#2 P%i T1000', th2_pw);
WristCom = sprintf('#3 P%i T1000', th3_pw);

fprintf(s, ShoulderCom);
fprintf(s, ElbowCom);
fprintf(s, WristCom);

end

