dim = 169; 
Kg = 3;

setpaths;
load('data/iso_mt');

un = [1:26];

for i = 1:length(isolet)

   [tr teva] = makesplits(isolet(i).y,f1,1,1,Kg);
   
   % Train set
   task(i).x = isolet(i).x(1:dim,tr);
   task(i).y = isolet(i).y(tr);
   
   [te va] = makesplits(isolet(i).y(teva),f2,1,1,Kg);

   task(i).xTe = isolet(i).x(1:dim,teva(te));
   task(i).yTe = isolet(i).y(teva(te));

   task(i).xv = isolet(i).x(1:dim,teva(va));
   task(i).yv = isolet(i).y(teva(va));

end

% save(sprintf('tasks_iso/task',date),'dim','Kg','task')
 
