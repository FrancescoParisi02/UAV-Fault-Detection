function index=ZOHrow(times,t)

index=sum(times<=t);
if index==0
    index=1;
end