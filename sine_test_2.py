#!/usr/bin/python
# see README file
import multiprocessing as MP
import sine_module
def worker(task_queue, shared_data):
    for task in iter(task_queue.get, 'DIE'):
        tmp = sine_module.sine_add_2(shared_data,task)
        shared_data[task] = tmp[task]
task_queue = MP.Queue()
shared_data = MP.RawArray('d', [0.]*10);
process1 = MP.Process(target=worker, args=(task_queue, shared_data))
process2 = MP.Process(target=worker, args=(task_queue, shared_data))
process1.start()
process2.start()
for k in range(10): 
   task_queue.put(k)              
task_queue.put('DIE')
task_queue.put('DIE') 
process1.join() 
process2.join()
print shared_data[:]
