function varout=ZOHmatrix(varin,timesin,timesout)

m=size(varin,2);
varout=zeros(length(timesout),m);
for i=1:length(timesout)
    varout(i,:)=varin(ZOHrow(timesin,timesout(i)),:);
end